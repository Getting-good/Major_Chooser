
import React from 'react';

import {BrowserRouter as Router, Routes, Route} from "react-router-dom";
import MajorChooser from './pages/MajorChooserPage';
import About from './pages/AboutPage';
import Updates from './pages/UpdatesPage';

import ManageQuestion from './pages/ManageQuestionPage';
import { Link } from "react-router-dom";
const App = () => {
  
  return (
    <div>
      <Router>
        
          <Routes>
            <Route path='/' exact element={<MajorChooser />} />
            <Route path='/about' element={<About />} />
            <Route path='/updates' element={<Updates />} />
            <Route path='/manageQuestion' element={<ManageQuestion />} />
          </Routes>
      </Router>
    </div>
 
  );
};

export default App;

