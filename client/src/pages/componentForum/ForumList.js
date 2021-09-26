import React from 'react'
// import ForumContent from './ForumContent'
// import {
//   withRouter,
// } from "react-router-dom";

// function ForumList(props){
//     const { forumLists } = props
//     console.log(props)
//     return (
//         <>
//         <table className="border-collapse">
//             <thead className="h-20 text-lg text-white">
//                 <tr className="my-6 bg-navy-900">
//                     <th className="w-2/12 p-2">遊戲名稱</th>
//                     <th className="w-5/12 p-2">文章標題</th>
//                     <th className="w-1/12 p-2">發文者</th>
//                     <th className="w-2/12 p-2">發文時間</th>
//                     <th className="w-2/12 p-2">閱讀量/收藏量</th>
//                 </tr>
//             </thead>
//             {forumLists.map((forumList,index)=>(
//                 // <ForumContent 
//                 //     key={index}
//                 //     gameName={forumList.gameName}
//                 //     articleTitle={forumList.articleTitle}
//                 //     articleType={forumList.articleType}
//                 //     userName={forumList.userName}
//                 //     createdAt={forumList.createdAt}
//                 //     readNumber={forumList.readNumber}
//                 //     collect={forumList.collect}
//                 //     />
//             <tbody className="mx-2 text-center z-40">
//             <tr className="border-b-2 border-gray-200 h-14 bg-navy-900 hover:bg-indigo-300 hover:text-black">
//               <td className="p-2 xl:w-64 lg:w-56 md:w-48 sm:w-44">{forumList.gameName}</td>
//               <td className="-2 xl:w-64 lg:w-56 md:w-48 sm:w-44 text-left px-6">
//                   <a 
//                   href="http://localhost:3000/forumBBS" 
//                   className="block hover:text-white">
//                     [&nbsp;{forumList.articleType.slice(-2)}&nbsp;]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{forumList.articleTitle}
//                   </a>
//               </td>
//               <td className="p-2 xl:w-64 lg:w-56 md:w-48 sm:w-44">
//                 <a href="#/" className="block hover:text-white">{forumList.userName}</a>
//               </td>
              
//               <td className="p-2 xl:w-64 lg:w-56 md:w-48 sm:w-44">
//                 {forumList.createdAt.slice(0,10)}
//               </td>
              
//               <td className="p-2 xl:w-64 lg:w-56 md:w-48 sm:w-44">
//                 {forumList.collect} /{forumList.readNumber}
//               </td>

//           </tr>
//           </tbody>


//             )
//             )}
//             </table>
//         </>
//     )
// }
// export default withRouter(ForumList)
