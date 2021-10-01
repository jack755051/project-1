import React, { useState, useEffect } from "react";
import axios from "axios";
import { API_URL } from "../unilits/config";

function Registration() {
  const [account, setAccount] = useState("jack755051");
  const [email, setEmail] = useState("jack755051@gmail.com");
  const [password ,setPassword] = useState("race216"); 
  const [confirmPassword ,setConfirmPassword] = useState("race216"); 
  const [phone, setPhone] = useState("0926068808");
  const [photo, setPhoto] = useState();

  const handleSubmit = async(e) => {
    e.preventDefault();
    try{
      //auth/register
      //auth/login
      //使用這個版本
      //Content-Type:multipart / form-data
      //Express需要用第三方middleware 處理
      let formData = new FormData();
      formData.append("account",account);
      formData.append("password",password);
      formData.append("email",email);
      formData.append("phone",phone);
      formData.append("confirmPassword",confirmPassword);
      formData.append("photo",photo);
      let response =  await axios.post(`${API_URL}/auth/registration` , formData);

      console.log(response);

      //無須上傳檔案的版本
      //Content-Type:application / json
      //express 用 urlencded / json就可以解決了
      // let response =  await axios.post(`${API_URL}/auth/registration` , {
      //   account, 
      //   password,
      //   email,
      //   phone,
      //   confirmPassword
      // });
      // console.log(response)
    }catch(e){
      console.error(e.response);
    }
  };

  return (
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
          type="text"
          className="border-black border-2 rounded-md mb-2 px-3"
          id="password"
          name="password"
          value={password}
          onChange={(e)=>{setPassword(e.target.value)}}
        />
        <label>確認密碼:</label>
        <input
          type="text"
          className="border-black border-2 rounded-md mb-2 px-3"
          id="confirmPassword"
          name="confirmPassword"
          value={confirmPassword}
          onChange={(e)=>{setConfirmPassword(e.target.value)}}
        />
        <label>信箱:</label>
        <input
          type="text"
          className="border-black border-2 rounded-md mb-2 px-3"
          id="email"
          name="email"
          value={email}
          onChange={(e)=>{setEmail(e.target.value)}}
        />
        <label>手機:</label>
        <input
          type="text"
          className="border-black border-2 rounded-md mb-2 px-3"
          id="phone"
          name="phone"
          value={phone}
          onChange={(e)=>{setPhone(e.target.value)}}
        />
        <label>圖片:</label>
        <input
          type="file"
          className="border-black border-2 rounded-md mb-2"
          id="photo"
          name="photo"
          onChange={(e)=>{setPhoto(e.target.files[0])}}
        />
        <button className="m-6 w-24 bg-yellow-300">Submit</button>
      </div>
    </form>
  );
}

export default Registration;
