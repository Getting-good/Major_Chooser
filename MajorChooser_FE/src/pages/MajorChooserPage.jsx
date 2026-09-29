import React, { useState, useEffect } from "react";// import useState from react for reselect/pickMaj/ansQuestion
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";//using font awesome library
import { faCheckCircle } from "@fortawesome/free-solid-svg-icons";//using font awesome library
import { motion } from "framer-motion";
import { getMajors,getQuestions,getWeights } from "../api/majorchooserApi";  //Adding API call to get majors from backend

/**
  * logic for Sorting majors list by descending order of affinity scores.
  * @note If affinities are equal when sorting, precedence goes to item1.
  * @function
  * @returns The major with the highest affinity score.
  */
const getHighestAffinityMajor = (majors) => {
  const sorted = [...majors].sort((a, b) => (a.affinity >= b.affinity ? -1 : 1));
  return sorted[0];
};


const MajorChooser = () => {
  // available Majors
  const [majors, setMajors] = useState([]);

  // questions state 
  const [questions, setQuestions] = useState([]);
  
  // weights state
  const [weights, setWeights] = useState([]);

  // Major currently selected by the user
  const [choseMaj, setChoseMaj] = useState(null);
  // Holds the index of the current question
  const [currentQuestion, setCurrentQuestion] = useState(0);


  // loading state to handle API calls
  const [loading, setLoading] = useState(true);
  //useEffect to load data from backend when component mounts
  useEffect(() => {
      loadData(); //API 호출 총 버튼, API를 호출하는 loadData 함수를 useEffect 안에서 호출하여 컴포넌트가 마운트될 때 데이터를 가져오도록 함(딱 한번만 호출되게끔)
  }, []); // [] means this useEffect will run only once, 리렌더링될때마다 계속 호출되는거 방지, 처음에만 호출되게끔

    /**
    * API call to load data from backend and set them to state.
    * @function
    */
  const loadData = async () => {
      try {
        const majorData = await getMajors();
        console.log("Loaded majors from backend:", majorData);
        setMajors(majorData);
        // console.log("majorData info", majorData.map((m) => m.name));

        const questionData = await getQuestions();
        console.log("Loaded questions from backend: ",questionData)
        setQuestions(questionData);
        // console.log("question id", questionData.map((q) => q.id));

        const weightsData = await getWeights();
        console.log("Loaded weights from backend: ",weightsData)
        setWeights(weightsData);
        
      } catch (error) {
        console.error(error);
        console.log("Failed to load data from backend. Please check the API connection.");
      } finally {   //loading state false로 바꿔서 로딩 끝났음을 알려줌
        console.log("API loading finished");
        setLoading(false);
      }
    };



    /**
    * Updates current affinity score depending on answer received for current question.
    * If user answered yes, affinities increase; responding no decreases affinities.
    * @function
    * @param {boolean} uinput - True if user answered yes; False for no.
    */
  const updateAffinities = (uinput, currentQ) => {
    const updatedMajors = majors.map((m) => {
      const weight = questions[currentQ]?.weights[m.id - 1] || 0;
      return {
        ...m,
        affinity: uinput ? m.affinity + weight : m.affinity - weight,
      };
    });
    setMajors(updatedMajors);
  };

    /**
   * Resets quiz state when 'Attempt Again' is clicked.
   * @function
   */
  const reSelect = () => {
    setMajors(majors.map((m) => ({ ...m, affinity: 10 })));
    setChoseMaj(null);
    setCurrentQuestion(0);
    // setAnswer(false);
  };

  /**
   * Sets the state for whichever major the user has selected from the map.
   * @function
   * @param {Object} majorItem - The currently selected major object.
   */
  const pickMaj = (majorItem) => {
    setChoseMaj(majorItem);
  };

  /**
   * Called when either button is selected by the user. 
   * @function
   * @param {boolean} uinput - True if user answered yes; False for no.
   */
  const answerQuestion = (uinput) => {
    // setAnswer(uinput);
    updateAffinities(uinput, currentQuestion);
    setCurrentQuestion(currentQuestion + 1);
  };

  // Rendering the content based on the state
  const renderContent = () => {
    if (questions.length > currentQuestion) {
      return (
        <div>
          <motion.div className="quest-box">
            <h2 className="quest-text"> <FontAwesomeIcon icon={faCheckCircle} className="question-icon" /> {questions[currentQuestion].text} </h2>
            <h3 className="quest-num"> ({currentQuestion + 1}/{questions.length}) </h3>
            <div className="ans-push">
              <button className="ans-but" onClick={() => answerQuestion(true)}> YES </button>
              <button className="ans-but" onClick={() => answerQuestion(false)}> NO </button>
            </div>
          </motion.div>
          {/* <div className="affinity-box">
            <h3>Affinity Scores</h3>
            <ul>
              {majors.map((m) => (
                <li key={m.id}> {m.name}: {m.affinity} </li>
              ))}
            </ul>
          </div> */}
        </div>
      );
      //when finished questions, do logic and set recommended major 
    } else {
      const recommendedMajor = getHighestAffinityMajor(majors);
      return (
        <motion.div className="rec-maj-box">
          <h2 className="rec-maj-name">Major Simulation Result:</h2>
          <h3 className="rec-maj-name">{recommendedMajor.name}</h3>
          <h4 className="rec-maj-college">{recommendedMajor.college}</h4>
          <p className="rec-maj-desc">{recommendedMajor.academics}</p>
          <button className="resetb" onClick={reSelect}> Attempt Again </button>
        </motion.div>
      );
    }
  };

  // Loading state to handle API calls
  if (loading) {
    return <div>Loading...</div>;
  }

  if (majors.length === 0) {
    return <div>No majors found.</div>;
  }

  if (questions.length === 0) {
    return <div>No questions found.</div>;
  }

  return (
    <div className="container">
      {renderContent()}
      <div className="ForTextPosi">
        <h2>Choose a major:</h2>
      </div>
      
      <div className="majs-boxes-container">
        <ul className="majs-list">
          {majors.map((majorItem) => ( //availableMajors 대신에 majors 사용
            <motion.li
              key={majorItem.id}
              onClick={() => pickMaj(majorItem)}
              className={`major-boxes ${choseMaj === majorItem ? "selected" : ""}`}
            >
              <span className="major-name">{majorItem.name}</span>
              {choseMaj === majorItem && (
                <FontAwesomeIcon icon={faCheckCircle} className="check-icon" />
              )}
            </motion.li>
          ))}
        </ul>
      </div>
      {choseMaj && (
        // click a major on a website
        <motion.div className="click-box">
          <div className="ForTextPosi">
            <h2 className="click-name">Selected Major:</h2>
            <h3 className="click-name">{choseMaj.name}</h3>
            <h4 className="click-name">Academics</h4>
            <p className="click-description">{choseMaj.description.academics}</p>
            <h4 className="click-name">Experience</h4>
            <p className="click-description">{choseMaj.description.experience}</p>
            <h4 className="click-name">Opportunities</h4>
            <p className="click-description">{choseMaj.description.opportunities}</p>
          </div>
        </motion.div>
      )}
    </div>
  );
};

export default MajorChooser;
