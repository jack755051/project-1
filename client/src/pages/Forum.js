import React, {useState,useEffect} from 'react'
import ForumList from './componentForum/ForumList'
import CreatGameRoomInput from './componentForum/CreatGameRoomInput'
import CreateGameRoomPopup from './componentForum/CreateGameRoomPopup'
import SearchBar from '../components/SearchBar'
import axios from 'axios'
// import ForumContent from './componentForum/ForumContent'


import {
    // Route,
    withRouter,
    NavLink,
    // Switch,
    // matchPath,
    // Link
  } from 'react-router-dom'

function Forum({match}){
    
    // console.log(props)

    const [error , setError] = useState(null)
    const [buttonPopup ,setButtonPopup] = useState(false);
    const [forumLists ,setForumLists] = useState([]);
    const [rawOne ,setRawData] = useState([]);
    const [page , setPage] = useState(1);
    const [totalPage ,setTotalPage] = useState(0);
    
    //前端:先取得正確格式，res.data -> res.data.result 驗證 東西是否壞掉
    //後端:取得總比數/計算總頁數/回復pagination給前端

    const getPages = () => {
      let pages = [];
      for(let i=1;i<=totalPage; i++){
        pages.push(
          <li 
              style={{
                display:"inline-block",
                margin:"2px",
                backgroundColor:page === i ? "rgb(254 114 28)" : "",
                borderColor:page === i ? "rgb(9 28 50)" : "rgb(9 28 50)",
                color:page === i ? "#fff" : "#363636",
                borderWidth: "1px",
                width: "28px",
                height: "28px",
                borderRadius:"3px",
                textAlign: "center",
              }}
              key={i}
              onClick={(e)=>{
                setPage(i);
              }}
          >
            {i}
          </li>
        );
      }
      return pages;
    }

    //用於search的原始資料
    useEffect(()=>{
          const getRawData = async ()=>{
      try{
        let rawOne = await axios.get("http://localhost:3001/forum/raw")
        setRawData(rawOne.data.rawResult)
        console.log(rawOne.data.rawResult)
        setError(null);
      }catch(e){
        // console.log(e)
        setError(e)
      }
    }
    getRawData();
    },[])


    useEffect(()=>{
      const getData = async ()=>{
        try{
          let res = await axios.get(`http://localhost:3001/forum/?page=${page}`);
            setForumLists(res.data.result)
            console.log(res.data.result)
            setError(null);
            setTotalPage(res.data.pagination.lastPage)
        }
        catch(e){
          console.log(e)
          setError(e)
        }
      }
      getData()
    },[page])


    return (
      <>
        <div className="w-9/12 mx-auto mb-6 ">
          <CreateGameRoomPopup trigger={buttonPopup} setTrigger={setButtonPopup}>
              <CreatGameRoomInput />
          </CreateGameRoomPopup>
              <div className="flex justify-between bg-no-repeat">
                <p className="my-4 text-4xl font-bold text-black">遊戲討論區</p>
              </div>
              <div className="flex justify-between px-6 py-4 bg-gray-500">
                <SearchBar/>
              <div>
                <button  
                  className="block w-32 h-12 text-lg bg-orange-400 rounded-md modal-open hover:bg-orange-600"
                  onClick={()=>setButtonPopup(true)}>創建討論區
                </button>
              </div>
        </div>
        {/* <ForumList forumLists={forumLists}/> */}
        <table className="border-collapse">
            <thead className="h-20 text-lg text-white">
                <tr className="my-6 bg-navy-900">
                    <th className="w-2/12 p-2">遊戲名稱</th>
                    <th className="w-5/12 p-2">文章標題</th>
                    <th className="w-1/12 p-2">發文者</th>
                    <th className="w-2/12 p-2">發文時間</th>
                    <th className="w-2/12 p-2">閱讀量/收藏量</th>
                </tr>
            </thead>
            {forumLists.map((forumList,i)=>{return(
            <tbody className="mx-2 text-center z-40">
            <tr className="border-b-2 border-gray-200 h-14 bg-navy-900 hover:bg-indigo-300 hover:text-black">
              <td className="p-2 xl:w-64 lg:w-56 md:w-48 sm:w-44">{forumList.gameName}</td>
              <td className="-2 xl:w-64 lg:w-56 md:w-48 sm:w-44 text-left px-6">
                  <NavLink to= {`/forumBBS/${forumList.id}`} 
                  className="block hover:text-white">
                    [&nbsp;{forumList.articleType.slice(-2)}&nbsp;]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{forumList.articleTitle}
                  </NavLink>
              </td>
              <td className="p-2 xl:w-64 lg:w-56 md:w-48 sm:w-44">
                <a href="#/" className="block hover:text-white">{forumList.account}</a>
              </td>
              
              <td className="p-2 xl:w-64 lg:w-56 md:w-48 sm:w-44">
                {forumList.createdAt}
              </td>
              
              <td className="p-2 xl:w-64 lg:w-56 md:w-48 sm:w-44">
                {forumList.collect} /{forumList.readNumber}
              </td>

          </tr>
          </tbody>


            )
            })}
            </table>
        <ul className="mt-3 flex justify-center">{getPages()}</ul>
      </div>
      </>
    )
}

export default Forum

