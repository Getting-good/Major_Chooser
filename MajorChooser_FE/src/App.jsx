import React from 'react';

import {BrowserRouter as Router, Routes, Route} from "react-router-dom";
import MajorChooser from './pages/MajorChooserPage';
const App = () => {
  
  return (
    <div>
      <Router>
          <Routes>
            <Route path='/' exact element={<MajorChooser />} />
          </Routes>
      </Router>
      
      {/* <MajorChooser /> */}
    </div>
 
  );
};

export default App;

