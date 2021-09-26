// import React,{ } from 'react';
// import {
//   BrowserRouter as Router,
//   Switch,
//   Route,
//   Link,
//   withRouter,
// } from "react-router-dom";



// function ForumContent(props){
//     const{ gameName,articleTitle,articleType,userName,collect,readNumber,createdAt}=props

    

//     let createTime = createdAt.slice(0,10);
//     let articletype = articleType.slice(-2);

//     return (
//         <>
//             <tbody className="mx-2 text-center z-40">
//             <tr className="border-b-2 border-gray-200 h-14 bg-navy-900 hover:bg-indigo-300 hover:text-black">
//               <td className="p-2 xl:w-64 lg:w-56 md:w-48 sm:w-44">{gameName}</td>
//               <td className="-2 xl:w-64 lg:w-56 md:w-48 sm:w-44 text-left px-6">
//                   <a 
//                   href="http://localhost:3000/forumBBS" 
//                   className="block hover:text-white">
//                     [&nbsp;{articletype}&nbsp;]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{articleTitle}
//                   </a>
//               </td>
//               <td className="p-2 xl:w-64 lg:w-56 md:w-48 sm:w-44">
//                 <a href="#/" className="block hover:text-white">{userName}</a>
//               </td>
              
//               <td className="p-2 xl:w-64 lg:w-56 md:w-48 sm:w-44">
//                 {createTime}
//               </td>
              
//               <td className="p-2 xl:w-64 lg:w-56 md:w-48 sm:w-44">
//                 {collect} /{readNumber}
//               </td>

//           </tr>
//           </tbody>
//         </>
//     )
// }


// export default withRouter(ForumContent)
