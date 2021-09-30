const express = require('express');
const router = express.Router();
const connection = require('../unilits/db');
const {loginCheckMiddleware} = require("../middleware/auth");

router.get('/comments', async function(req, res, next) {
    let getComments = await connection.queryAsync("SELECT comment.*,member.account,forum_article.id FROM comment JOIN member ON comment.user_id = member.id JOIN forum_article ON forum_article.id = comment.forum_article_id")

    res.json({getComments});
})

router.get('/count',async function(req, res, next){
    let count = await connection.queryAsync("SELECT COUNT (*) AS total FROM user_like");

    res.json({count});
})

module.exports = router;
