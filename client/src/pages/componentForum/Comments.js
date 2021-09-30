import React,{ useState ,useEffect } from 'react'
import axios from 'axios';

function Comments({commentsUrl,currentUserId}){
   // 評論
    const [commentLists, setCommentLists] = useState([]);
    const [error , setError] = useState(null)

    //Post API
    const submitReview =()=>{

    }

    //Get API
    useEffect(()=>{
      const getData = async ()=>{
        try{
          let res = await axios.get();
          setCommentLists(res.data.result)
            setError(null);
        }
        catch(e){
          console.log(e)
          setError(e)
        }
      }
      getData()
    },[])
    

    return (
      <div className="comments mt-2 w-5/6 mx-auto px-4">
        <h3 className="text-3xl mb-4">Comments</h3>
        {/* <div className="ml-4">說點甚麼</div> */}
        {/* <CommentForm submitLabel="Write" handleSubmit={addComment} /> */}
            <div className="mb-6 flex flex-col w-full">
                <textarea className="commient-form-textaera resize-none w-full bg-gray-500 h-32 my-4 mx-5 rounded-lg focus:ring-4 focus:ring-orange-500 focus:outline-none text-white focus:shadow-2xl" 
                // value={text}
                // onChange={(e) => setText(e.target.value)}
                />
                <div className="flex justify-end">
                    <button className="comment-form-button w-24 h-12 rounded-lg flex justify-center items-center text-white bg-orange-600 disabled:opacity-30 text-xl" 
                    onClick={submitReview}
                    >
                    write
                    </button>
                </div>
            </div>

        <div className="comments-container">
        {commentLists.map((commentList,i)=>{return(
        <div className="flex justify-between mb-4">
            <div className="w-1/6 whitespace-nowrap flex mr-28">
                {/* <div className="flex-shrink-0 h-10 w-10 mx-6 my-auto">
                    <img className="h-10 w-10 rounded-full" src= 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixid=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60' alt="" />
                </div> */}
                <div className="flex items-center">
                    <div className="">
                        <div className="">jack755051</div>
                        <div className="text-xs">2017222</div>
                    </div>
                </div>
            </div>
            <div className="px-6 w-5/6 whitespace-nowrap">哈哈哈</div>
          </div>
      )})}
      </div>

    </div>
    )
}

export default Comments

