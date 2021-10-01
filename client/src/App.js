// 使用套件
import {
  BrowserRouter as 
  Router,
  Route,
  Link,
  Switch,
} from 'react-router-dom'
// import React, { useState,useEffect } from 'react'
// import "./App.css";

//頁面
import NotFoundPage from './pages/NotFoundPage'
import Forum from './pages/Forum'
import ForumBBS from './pages/componentForum/ForumBBS'
import Home from './pages/Home'
import Login from './pages/Login'
import Registration from './pages/Registration'

// 組合用元件
import MyNavbar from './components/MyNavbar'
import MyFooter from './components/MyFooter'
import MyMainContent from './components/MyMainContent'

import ScrollToTop from './components/ScrollToTop'


function App() {

  return (
    <Router>
      <>
        <MyNavbar/>
        <MyMainContent>
          {/* <ScrollToTop> */}
            <Switch>
              <Route path="/registration">
                <Registration/>
              </Route>
              <Route path="/forumBBS/:id?">
                <ForumBBS/>
              </Route>
              <Route path="/forum">
                <Forum />
              </Route>
              <Route path="/login">
                <Login/>
              </Route> 
              <Route exact path="/">
                <Home/>
              </Route>
              <Route path="*">
                <NotFoundPage />
              </Route>
            </Switch>
          {/* </ScrollToTop> */}
        </MyMainContent>
        <MyFooter />
      </>
    </Router>
  );
}

export default App;

