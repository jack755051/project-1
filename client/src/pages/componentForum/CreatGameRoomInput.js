import React,{useState,useEffect} from 'react';
import axios from 'axios';
// import {API_URL} from '../../unilits/config';
import moment from 'moment';


function CreatGameRoomInput() {
    const [gameName,setGameName] = useState("");
    const[articleTitle ,setArticleTitle]= useState("");
    const[articleType ,setArticleType]= useState("");
    // const[userName ,setUserName]= useState("");
    const [articleContent,setArticleContent] = useState("");
    const createdAt = moment().format("YYYY-MM-DD")  


    
    const submitForum = () =>{
        axios.post("http://localhost:3001/forum/insert",
        {
            gameName:gameName,
            articleTitle:articleTitle,
            articleType:articleType,
            articleContent:articleContent,
            createdAt:createdAt,
        });
    }


    return (
        <>
            <div className="z-40 text-black">
                <p className="mb-5 text-3xl text-black">創立遊戲室</p>
                <form className="">
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="aritcle">
                            文章名稱
                        </label>
                        <input 
                            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="aritcle" 
                            type="text" 
                            placeholder="Aritcle" 
                            onChange={(e) => {setArticleTitle(e.target.value)}}
                            />
                    </div>
                    <div class="relative mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="aritcle">
                            討論類型
                        </label>
                        <select class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500" 
                        id="grid-state"
                        onChange={(e) => {setArticleType(e.target.value)}}
                        >
                            <option value="請選擇">請選擇...</option>
                            <option value="遊戲問題">遊戲問題</option>
                            <option value="遊戲攻略">遊戲攻略</option>
                            <option value="遊戲分享">遊戲分享</option>
                            <option value="遊戲討論">遊戲討論</option>
                        </select>
                        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 pt-7 text-gray-700">
                            <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
                        </div>
                    </div>
                    <div class="relative mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="aritcle">
                            遊戲名稱
                        </label>
                        <select 
                        class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-red-700 focus:border-8" 
                        id="grid-state" 
                        onChange={(e) => {setGameName(e.target.value)}}>
                            <option value="">請選擇...</option>
                            <option value="卡卡頌2.0">卡卡頌2.0</option>
                            <option value="四季物語">四季物語</option>
                            <option value="矮人礦坑">矮人礦坑</option>
                            <option value="矮人十兄弟">矮人十兄弟</option>
                            <option value="UNO">UNO</option>
                            <option value="大富翁">大富翁</option>
                        </select>
                        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-gray-700 pt-7">
                            <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
                        </div>
                    </div>

                    <div class="relative mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="aritcle">
                            文章內容
                        </label>
                        <textarea 
                        class="block h-28 text-white resize-none border rounded-md w-full border-8 bg-gray-400"
                        onChange={(e) => {setArticleContent(e.target.value)}}
                        ></textarea>
                    </div>

                    <button
                        type="submit"
                        data-modal-toggle="example"
                        data-modal-action="open"
                        class="bg-orange-400 font-semibold text-white p-2 w-32 rounded-full hover:bg-red-400 focus:outline-none focus:ring shadow-lg hover:shadow-none transition-all duration-300 m-2"
                        onClick={submitForum}
                    >
                        創建討論區
                    </button>


                </form>
            </div>
        </>
    )
        
}

export default CreatGameRoomInput
