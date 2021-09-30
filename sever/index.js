const express = require('express');
require('dotenv').config();
const cors = require('cors');
const expressSession = require('express-session');
const path = require('path');

const app = express();

app.use(
    cors({
      origin: ['http://localhost:3000'],
      //為了跨源可以存取cookie
      //條件是origin不能為"*"(否則很危險)
      credentials: true,
    })
  );

//未知原因導致崩潰
app.use(expressSession({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: true,
  }))

//使用這個中間建材可以讀到
//重要兩個
app.use(express.urlencoded({extended:true}));
//使用這middleware才能解析json資料
app.use(express.json());

app.use(express.static(path.join(__dirname,"public")))
// app.use(express.static( .join(__dirname,"react")))

app.use((req, res, next)=>{
    let current = new Date();
    console.log(`有人來訪問囉${current.toISOString()}`);
    next();
})
app.use((req, res, next)=>{
    console.log("我是第二個中間");
    next();
})

// app.use(expressSession())

app.get('/',function(req, res, next){
    res.send("HOMEPAGE");
})
let authRouter = require("./router/auth");
app.use("/auth",authRouter);

let forumRouter = require("./router/forum");
app.use("/forum",forumRouter);


let BBSRouter = require("./router/forumBBS");
const { MulterError } = require('multer');
app.use("/forumBBS",BBSRouter);

app.use((req, res, next)=>{
    console.log("啊啊啊啊，沒有符合的路由");
    next();
})

app.use((req, res, next)=>{
    res.status(404).json({message:"NOT FOUND"});
})

app.use((err, req, res, next)=>{
    console.log("來自四個參數的錯誤處理",err)
    if(err instanceof MulterError){
        if(err.code === "LIMIT_FILE_SIZE"){
            return res.status(400).json({message:"檔案太大囉"})
        }
    }
    res.status(err.status).json({message:err.code});
})

const port = 3001;
app.listen(port,async function() {
    console.log(`running on port ${port}`)
})