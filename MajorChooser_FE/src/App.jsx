
import React from 'react';

import {BrowserRouter as Router, Routes, Route} from "react-router-dom";
import MajorChooser from './pages/MajorChooserPage';
import About from './pages/AboutPage';
import { Link } from "react-router-dom";
const App = () => {
  
  return (
    <div>
      <Router>

          <nav>
          <Link to="/">Home</Link>
          {" | "}
          <Link to="/about">About</Link>
        </nav>

          <Routes>
            <Route path='/' exact element={<MajorChooser />} />
            <Route path='/about' element={<About />} />
          </Routes>
      </Router>
      
      {/* <MajorChooser /> */}
    </div>
 
  );
};

export default App;

