const express = require('express');
const connection = require('./unilits/db');
const bodyParser =  require('body-parser');
const cors = require('cors');
const moment = require ('moment');
const bcrypt = require('bcrypt');

const app = express();
app.use(cors());
//使用這個中間建材可以讀到
//重要兩個
app.use(bodyParser.urlencoded({extended:true}));
//使用這middleware才能解析json資料
app.use(express.json());

app.use((req, res, next)=>{
    let current = new Date();
    console.log(`有人來訪問囉${current.toISOString()}`);
    next();
})
app.use((req, res, next)=>{
    console.log("我是第二個中間");
    next();
})

app.get('/',function(req, res, next){
    res.send("HOMEPAGE");
})

// app.get('/forum/get',(req, res, next)=>{
//     let sqlSelect = "SELECT * FROM forum_article";
//     connection.query(sqlSelect ,(err,result)=>{
//         res.send(result);
//     })
// })
// app.get('/forum/get',async function(req, res, next){
//     let page = req.query.page || 1;
//     const perPage = 6;
//     //todo1:count total number
//     let count = await connection.queryAsync("SELECT COUNT (*) AS total FROM forum_article");
//     console.log(count);
//     const total = count[0].total;
//     const lastPage = Math.ceil(total / perPage);
//     console.log(total,lastPage);

//     let offset = (page - 1) * perPage;
//     //todo2:let every page get their data

//     let result = await connection.queryAsync("SELECT * FROM forum_article   LIMIT ? OFFSET ?",
//     [perPage,offset]);

//     let pagination  = {
//         total,
//         perPage,
//         lastPage,
//         page,
//     }
    
//     res.json({pagination,result});
// })


// app.post("/forum/insert", async function(req, res, next){
//     // let current = new Date(+new Date()+8*3600*1000);
//     // let createdAt = current.toLocaleString().slice(0,19).replace("T","")
//     let createdAt = moment().format("YYYY-MM-DD"); 

//     let result = await connection.queryAsync(
//         "INSERT INTO forum_article (gameName, articleTitle,articleContent,articleType,createdAt)VALUES (?);",
//         [[req.body.gameName,req.body.articleTitle,req.body.articleContent,req.body.articleType,createdAt]]
//         );
//     res.json({})
// })

let forumRouter = require("./router/forum");
app.use("/forum",forumRouter);

let authRouter = require("./router/auth");
app.use("/auth",authRouter);


app.use((req, res, next)=>{
    console.log("啊啊啊啊，沒有符合的路由");
    next();
})

app.use((req, res, next)=>{
    res.status(404).json({message:"NOT FOUND"});
})

app.use((err, req, res, next)=>{
    console.log(err)
    res.status(err.status).json({message:err.code});
})

app.listen(3001,async function() {
    console.log("running on port 3001")
})