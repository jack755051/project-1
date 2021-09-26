import React ,{ useState, useReducer ,useEffect } from 'react'
import { withRouter ,useParams } from 'react-router-dom'

import Comments from './Comments'
import axios from 'axios';
import { API_URL } from "../../unilits/config";

const contents = [
{
  id:'1',
  aritcleConent: '最近2077要上了此前玩過steam一款小品Cloudpunk描述的也是賽博龐克文化有常見的機器人/人類鬥爭 半人半機器的賽博格爭辯等等~這款出現大量的日本文化我寫了一篇心得在steam版 #1VhMkvna (Steam)例如大樓有日本漢字招牌 小吃也一堆清酒壽司等等仔細想想好像超多賽博龐克系列的作品都有日本文化的元素像這款遊戲也是致敬1982的銀翼殺手~銀翼殺手也有大量的日本文化~然後以前念書的時候常會提到這個年代剛好是戰後日本經濟力復甦 正要轉型西進衝到最高點時 90年代末日本經濟開始泡沫化不過這些文化交會的場面都為2000年全球化吹響了前奏~不曉得大家對賽博龐克中的日本文化元素認知如何?',
}]

const HANDLE_LIKE = Symbol("HANDLE_LIKE");
const HANDLE_DISLIKE = Symbol("HANDLE_DISLIKE");
const initialState = {
  likes: 100,
  dislikes: 12,
  active: null
};

const reducer = (state, action) => {
  const { likes, dislikes, active } = state;


  switch (action.type) {
    case HANDLE_LIKE:
      return {
        ...state,
        likes: state.likes + 1,
        dislikes: active === "dislike" ? dislikes - 1 : dislikes,
        active: "like"
      };
    case HANDLE_DISLIKE:
      return {
        ...state,
        likes: active === "like" ? likes - 1 : likes,
        active: "dislike",
        dislikes: dislikes + 1
      };
    default:
      return state;
  }
};

function ForumBBS(props){
    console.log(props);
    const [state, dispatch] = useReducer(reducer, initialState);
    const { likes, dislikes, active } = state;
    const [error ,setError] = useState();

    
    const [content , setContent ] = useState({
      id:'',
      aritcleContent:''
    });


    useEffect(()=>{
      // const id =  props.match.params.id
      const id =  props.location.pathname
      const newContent = contents.find((v)=>{
          return v.id === id
      })
      if(newContent) setContent(newContent)

    },[props.location.pathname])


    return (
        <>  
            <div className="text-black w-8/12 mx-auto">
                {/* 文章題目與分類細項 */}
                <h3 className="text-3xl font-bold mb-4 border-b-8 py-4" id="articleTitle">關於CyberPunk2077</h3>  
                <span className="text-gray">遊戲名稱 - CyberPunk2077</span>
                <span className="text-gray mx-3">/</span>
                <span className="text-gray" id="userName">文章類型 - <a href="#/" className="hover:text-red-500">遊戲新聞</a>
                </span>
                <span className="text-gray mx-3">/</span>
                <span className="text-gray" id="userName">文章作者 - <a href="#/" className="hover:text-red-500">Luck77</a>
                </span>
                <span className="text-gray mx-3">/</span>

                {/* 文章主體 */}
                <div className="" id="article">
                    <div className="mt-8 w-5/6 pl-4 mx-auto pb-5 leading-9" id="articleContent">
                    {content.aritcleContent}
                    </div>
                    {/* 按鈕 */}
                    <div className="mt-2 w-5/6 pl-4 mx-auto flex justify-between mb-6" id="articleLi">
                        <div className="flex" id="likeBar">
                            <button 
                                className="flex mr-10" id="like"
                                onClick={() =>
                                    active !== "like" ? dispatch({ type: HANDLE_LIKE }) : null
                                }
                                >
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 hover:text-red-400" viewBox="0 0 20 20" fill="currentColor">
                                <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
                                </svg>
                                <span className="ml-3 mt-1">{likes}</span>
                            </button>
                            <button className="flex mr-10" id="dislike"
                            onClick={() =>
                                active !== "dislike" ? dispatch({ type: HANDLE_DISLIKE }) : null
                              }
                                >
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 hover:text-green-600" viewBox="0 0 20 20" fill="currentColor">
                                <path d="M18 9.5a1.5 1.5 0 11-3 0v-6a1.5 1.5 0 013 0v6zM14 9.667v-5.43a2 2 0 00-1.105-1.79l-.05-.025A4 4 0 0011.055 2H5.64a2 2 0 00-1.962 1.608l-1.2 6A2 2 0 004.44 12H8v4a2 2 0 002 2 1 1 0 001-1v-.667a4 4 0 01.8-2.4l1.4-1.866a4 4 0 00.8-2.4z" />
                                </svg>
                                <span className="ml-3 mt-1">{dislikes}</span>
                            </button>
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


export default withRouter (ForumBBS)

