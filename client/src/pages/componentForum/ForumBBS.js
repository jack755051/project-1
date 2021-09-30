import React ,{ useState, useReducer ,useEffect } from 'react'
import { withRouter ,useParams ,useHistory } from 'react-router-dom'
import heart from "../../images/heart.png"


import Comments from './Comments'
import axios from 'axios';
import { API_URL } from "../../unilits/config";

function ForumBBS(props){
    // console.log(props);
    // const inc = () =>setLike(prev => prev + 1);

    // const [isToggled, setToggled] = useState({
    //   likes:'',
    //   updated: false
    // });
    const [like ,setLike ]= useState("");
    
    const [error ,setError] = useState();
    const [content ,setContent ] = useState({
      id:'',
      articleType:'',
      articleTitle:'',
      articleContent:'' ,
      createdAt:'',
      account:'',
      readNumber:'',
    });

    useEffect(()=>{
      const contentAricle = async ()=>{
      try{
        const id = props.match.params.id
        let res = await axios.get(`http://localhost:3001/forumBBS/${id}`, { withCredentials: true });
        setContent(res.data.result[id-1]);
        }catch(e){
          console.log(e)
          setError(e)
        }
      }
      contentAricle();
     },[])

    //  useEffect(()=>{
    //   const likeAccount = async ()=>{
    //   try{
    //     let res = await axios.get("http://localhost:3001/comment/count");
    //     setContent(res.data.result);
    //     }catch(e){
    //       console.log(e)
    //       setError(e)
    //     }
    //   }
    //   likeAccount();
    //  },[])

    return (
        <>  
            <div className="text-black w-8/12 mx-auto mt-6">
                {/* 文章題目與分類細項 */}
                <div className="text-3xl font-bold mb-4 border-b-8 flex justify-between">
                  <span className="text-3xl font-bold" id="articleTitle">{content.articleTitle}</span >
                  <span className="text-base text-gray mr-8" id="userName">
                  <a 
                  href="#/" 
                  className="hover:text-red-500"
                  onClick={()=>{
                    props.history.push('/forum')
                  }}
                  >回到上頁</a>
                </span>  
                </div>
                


                <span className="text-gray">遊戲名稱 - <a href="#/" className="hover:text-red-500">{content.gameName}</a></span>
                <span className="text-gray mx-3">/</span>
                <span className="text-gray" id="userName">文章類型 - {content.articleType}
                </span>
                <span className="text-gray mx-3">/</span>
                <span className="text-gray" id="userName">文章作者 - <a href="#/" className="hover:text-red-500">{content.account}</a>
                </span>
                <span className="text-gray mx-3">/</span> 
                <span className="text-gray" id="userName">發文時間 - {content.createdAt}
                </span>

                {/* 文章主體 */}
                <div className="" id="article">
                    <div className="mt-8 w-5/6 pl-4 mx-auto pb-5 leading-9" id="articleContent">
                    {content.articleContent}
                    </div>
                    {/* 按鈕 */}
                    <div className="mt-2 w-5/6 pl-4 mx-auto flex justify-between mb-6" id="articleLi">
                        <div id="like bar" className="flex justify-between">
                          <button>
                            <svg xmlns="http://www.w3.org/2000/svg"   className="h-5 w-5" viewBox="0 0 20 20"   fill="currentColor">
                            <path fillRule="evenodd" d="M5.293 7.707a1 1 0 010-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 01-1.414 1.414L11 5.414V17a1 1 0 11-2 0V5.414L6.707 7.707a1 1 0 01-1.414 0z" clipRule="evenodd" />
                            </svg>
                          </button>

                          <span className="mt-1">{!like?"liked":"like"}</span>
                          <div className="watchNum flex ml-6 justify-between">
                              <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">

                              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                            <span className="ml-4 text-xl text-gray-700 ">{content.readNumber}</span>
                          </div>
                        </div>
                        
                        <button className="mr-6 flex hover:text-gray-400">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z" />
                            </svg>
                            <span className="ml-3 mt-1">評論</span>
                        </button>
                    </div>
                  <Comments
                      commentsUrl="http://localhost:3004/comments"
                      currentUserId="1"
                  />
                </div>
            </div>
        </>
        )
    
}


export default withRouter(ForumBBS)
