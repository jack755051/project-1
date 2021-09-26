import React,{ useEffect } from 'react';
import Bg6 from '../images/bg6.jpg';
import axios from 'axios';



function Home(props) {
    const { auth } = props

    useEffect(()=>{
        axios.get('http://localhost:3001/')
    })

    return (
    <>
        <div className="">
        {/* <h2>{auth ? '會員已登入' : '未登入'}</h2> */}
        <div className="w-screen h-screen bg-cover bg-no-repeat" style={{backgroundImage:`url(${Bg6})`}}>
            <div className="title-aera z-50 mx-32 py-36 text-black font-bold">
                <p className="text-xl mb-6">優秀的</p>
                <p className="text-5xl mb-6">桌遊專賣店</p>
                <p className="text-2xl">提供桌遊購買平台與討論空間</p>
            </div>
            <nav className="w-full mx-auto bg-gray-700">
                <div className="title-bar flex justify-between w-2/6 mx-auto h-24">
                    <div className="w-24 text-xl border-b-8 p-2 border-transparent hover:text-yellow-300 transition duration-500 ease-in-out font-bold hover:border-b-8 text-center self-center hover:border-yellow-300"><a href="#/">策略</a></div>
                    <div className="w-24 text-xl border-b-8 p-2 border-transparent hover:text-yellow-300 transition duration-500 ease-in-out font-bold hover:border-b-8 text-center self-center hover:border-yellow-300"><a href="#/">益智</a></div>
                    <div className="w-24 text-xl border-b-8 p-2 border-transparent hover:text-yellow-300 transition duration-500 ease-in-out font-bold hover:border-b-8 text-center self-center hover:border-yellow-300"><a href="#/">棋盤</a></div>
                </div>



                    {/* <li className="w-24 text-center text-xl flow-root hover:text-yellow-300 transition duration-500 ease-in-out font-bold hover:border-b-8 "><a href="#/">棋盤</a></li> */}

            </nav>
        </div>
        <div>
        </div>
        </div>
    </>
    )
}


export default Home

