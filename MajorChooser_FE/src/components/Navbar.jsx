import React, {useState} from 'react'
import * as FaIcons from "react-icons/fa";
import * as AiIcons from "react-icons/ai";
import * as IoIcons from "react-icons/io";
import { Link } from 'react-router-dom';
import '../App.css'
import { IconContext } from 'react-icons'

// import { SidebarData } from '../data/navbarData';

const SidebarData = [
    {
        title:'Homess',
        path: '/',
        icon: <AiIcons.AiFillHome />,
        cName: 'nav-text'
    },
    {
        title:'About',
        path: '/about',
        icon: <IoIcons.IoIosPaper />,
        cName: 'nav-text'
    },
    {
        title:'Updates',
        path: '/updates',
        icon: <FaIcons.FaCartPlus />,
        cName: 'nav-text'
    },
    {
        title:'Manage Questions',
        path: '/manageQuestion',
        icon: <FaIcons.FaCartPlus />,
        cName: 'nav-text'
    }

]

const Navbar =() => {
    const [sidebar, setSidebar] = useState(false)
    const showSidebar = () => setSidebar(!sidebar)
  
    return (
    <>
    <IconContext.Provider value={{color: '#fff'}} >
      <div className="navbar">
        <Link to="#" className='menu-bars'>
            <FaIcons.FaBars onClick={showSidebar}/>
        </Link>
        <span><h1 className="title">Major Chooser</h1></span>
      </div>  
      <nav className={sidebar ? 'nav-menu active': 'nav-menu'}>
        <ul className='nav-menu-items' onClick={showSidebar}>
            <li className="navbar-toggle">
                <Link to="#" className='menu-bars'>
                    <AiIcons.AiOutlineClose />
                </Link>
            </li>
            {SidebarData.map((item,index) => {
                return (
                    <li key={index} className={item.cName}>
                        <Link to={item.path}>
                            {item.icon}
                            <span>{item.title}</span>
                        </Link>
                    </li>
                )
            })}
        </ul>
        </nav>
        </IconContext.Provider>
    </>
  );
}

export default Navbar
