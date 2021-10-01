import React,{ useState } from 'react'
import {Link,Switch,withRouter} from 'react-router-dom'
import axios from "axios";
import { API_URL } from "../unilits/config";


function Login () {
    const [account, setAccount] = useState("jack755051");
    const [password ,setPassword] = useState("race216"); 

    const handleSubmit = async(e) => {
        e.preventDefault();
        let result = await axios.post(`${API_URL}/auth/login`,{ 
            account,
            password,
        } ,{withCredentials: true })
        console.log(result); 
    }

    return (
        <>
        <form className="text-black container mx-auto" onSubmit={handleSubmit}>
          <div className="w-2/6 flex flex-col justify-center mx-auto">
            <h1 className="my-2 text-xl">Registration</h1>
            <label>帳號:</label>
            <input
              type="text"
              className="border-black border-2 rounded-md mb-2 px-3"
              id="account"
              name="account"
              value={account}
              onChange={(e)=>{setAccount(e.target.value)}}
            />
            <label>密碼:</label>
            <input
              type="password"
              className="border-black border-2 rounded-md mb-2 px-3"
              id="password"
              name="password"
              value={password}
              onChange={(e)=>{setPassword(e.target.value)}}
            />
            <button className="m-6 w-24 bg-yellow-300">Submit</button>
          </div>
        </form>
        </>
      );
}

export default withRouter (Login)
