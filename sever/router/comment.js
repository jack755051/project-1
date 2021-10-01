const express = require('express');
const router = express.Router();
const connection = require('../unilits/db');
const {loginCheckMiddleware} = require("../middleware/auth");

router.get('/getComments', async function(req, res, next) {
    // let getComments = await connection.queryAsync(
        // "SELECT comment.*,member.account,forum_article.id FROM comment JOIN member ON comment.user_id = member.id JOIN forum_article ON forum_article.id = comment.forum_article_id"

        // "SELECT comment.*, member.account,forum_article.articleTitle FROM member JOIN comment ON comment.user_id = member.id JOIN forum_article ON forum_article.id = comment.forum_article_id ORDER BY createTime  DESC"

        // "SELECT comment.*, member.account,forum_article.articleTitle FROM member JOIN comment ON comment.user_id = member.id JOIN forum_article ON forum_article.id = comment.forum_article_id ORDER BY createTime  DESC WHERE forum_article_id=?;",[]
       
    // ) 
    console.log("req.body",req.body)
    res.json({getComments});
})

router.get('/count',async function(req, res, next){
    let count = await connection.queryAsync("SELECT COUNT (*) AS total FROM user_like");

    res.json({count});
})

module.exports = router;
