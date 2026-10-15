import React, { useState, useEffect } from "react";
import { getMajors,getQuestions, createQuestions, updateQuestions, deleteQuestions } from "../api/majorchooserApi";

const ManageQuestion = () => {
  const [questions, setQuestions] = useState([]);
  const [majors, setMajors] = useState([]);
  const [expanded, setExpanded] = useState({}); // For toggle 

  useEffect(() => {
  loadData();
  }, []);
  
  const loadData = async () => {
    try {
      const questionData = await getQuestions();
      const majorData = await getMajors();

      setQuestions(questionData);
      setMajors(majorData);

      console.log("Loaded questions:", questionData);
      console.log("Loaded majors:", majorData);
    } catch (error) {
      console.error("Failed to load data:", error);
    }
  };

 

  // updated question text
  const updatedQuestionText = async (id, newText) => {
  try {
    const updatedQuestion = await updateQuestions(id, {
      text: newText,
    });

    setQuestions((prev) =>
      prev.map((q) =>
        q.id === id ? updatedQuestion : q
      )
    );
  } catch (error) {
    console.error(error);
  }
};

  // update weight for each question
  const updatedWeight = (id, index, newValue) => {
    setQuestions((prev) => {
      const updatedWeights = [...prev[id].weights];
      updatedWeights[index] = Number(newValue);
      return {
        ...prev,
        [id]: { ...prev[id], weights: updatedWeights },
      };
    });
  };

  const toggleWeights = (id) => {
    setExpanded((prev) => ({ ...prev, [id]: !prev[id] }));
  };

  const addQuestion = async () => {
  try {
    const newQuestion = await createQuestions({
      text: "New Question",
    });

    setQuestions((prev) => [...prev, newQuestion]);
  } catch (error) {
    console.error(error);
  }
};

  // delete quesetion + reindex
  const delQuestion = (id) => {
   try {
    deleteQuestions(id);
    setQuestions((prev) => prev.filter(question => question.id !== id));
   } catch (error) {
    console.error(error);
   }
  };

  return (
    <div style={{ maxWidth: "700px", margin: "20px auto", fontFamily: "Arial, sans-serif" }}>
      <h2 style={{ textAlign: "center" }}>Question Manager</h2>
      <div style={{ textAlign: "center", marginBottom: "15px" }}>
        <button
          onClick={addQuestion}
          style={{
            padding: "8px 16px",
            backgroundColor: "#4CAF50",
            color: "white",
            border: "none",
            borderRadius: "5px",
            cursor: "pointer",
          }}
        >
          ➕ Add Question
        </button>
      </div>
      <ul style={{ listStyle: "none", padding: 0 }}>
        {Object.values(questions).map((q) => (
          <li
            key={q.id}
            style={{
              border: "1px solid #ddd",
              borderRadius: "8px",
              padding: "15px",
              marginBottom: "10px",
              backgroundColor: "#f9f9f9",
            }}
          >
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
              <input
                style={{ flex: 1, padding: "8px", marginRight: "10px", borderRadius: "5px", border: "1px solid #ccc" }}
                value={q.text}
                onChange={(e) => updatedQuestionText(q.id, e.target.value)}
              />
              <button
                onClick={() => toggleWeights(q.id)}
                style={{
                  padding: "5px 10px",
                  marginRight: "5px",
                  border: "none",
                  borderRadius: "5px",
                  cursor: "pointer",
                  backgroundColor: "#2196F3",
                  color: "white",
                }}
              >
                {expanded[q.id] ? "Hide Weights" : "Show Weights"}
              </button>
              <button
                onClick={() => delQuestion(q.id)}
                style={{
                  padding: "5px 10px",
                  border: "none",
                  borderRadius: "5px",
                  cursor: "pointer",
                  backgroundColor: "#f44336",
                  color: "white",
                }}
              >
                ❌ Delete
              </button>
            </div>
            {expanded[q.id] && (
              <ul style={{ marginTop: "10px", paddingLeft: "20px" }}>
                {q.weights.map((w, index) => (
                  <li key={index} style={{ marginBottom: "5px", display: "flex", alignItems: "center" }}>
                    <span style={{ width: "150px", fontSize: "0.9em" }}>{availableMajors[index].name}:</span>
                    <input
                      type="number"
                      value={w}
                      style={{
                        width: "40px",
                        padding: "2px 4px",
                        fontSize: "0.8em",
                        borderRadius: "3px",
                        border: "1px solid #ccc",
                        textAlign: "center",
                      }}
                      onChange={(e) => updatedWeight(q.id, index, Number(e.target.value))}
                    />
                  </li>
                ))}
              </ul>

            )}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ManageQuestion;
