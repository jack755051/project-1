const express = require('express');
const router = express.Router();
const connection = require('../unilits/db');

// 原本使用 "/forum/insert"、"/forum/get"  但以封裝進/forum，故可以改成/get
router.get('/get',async function(req, res, next){
    let page = req.query.page || 1;
    const perPage = 6;
    //todo1:count total number
    let count = await connection.queryAsync("SELECT COUNT (*) AS total FROM forum_article");
    console.log(count);
    const total = count[0].total;
    const lastPage = Math.ceil(total / perPage);
    console.log(total,lastPage);

    let offset = (page - 1) * perPage;
    //todo2:let every page get their data

    let result = await connection.queryAsync("SELECT * FROM forum_article   LIMIT ? OFFSET ?",
    [perPage,offset]);

    let pagination  = {
        total,
        perPage,
        lastPage,
        page,
    }
    
    res.json({pagination,result});
})

router.post("/insert", async function(req, res, next){
    // let current = new Date(+new Date()+8*3600*1000);
    // let createdAt = current.toLocaleString().slice(0,19).replace("T","")
    let createdAt = moment().format("YYYY-MM-DD"); 

    let result = await connection.queryAsync(
        "INSERT INTO forum_article (gameName, articleTitle,articleContent,articleType,createdAt)VALUES (?);",
        [[req.body.gameName,req.body.articleTitle,req.body.articleContent,req.body.articleType,createdAt]]
        );
    res.json({})
})


module.exports = router;
