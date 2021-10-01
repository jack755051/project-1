const express = require('express');
const router = express.Router();
const connection = require('../unilits/db');
const { loginCheckMiddleware } = require('../middleware/auth');

router.get("/:id?",loginCheckMiddleware,async(req, res, next)=>{
    // let result = await connection.queryAsync("SELECT * FROM forum_article")
    // let result = await connection.queryAsync("SELECT forum_article.*, member.account FROM forum_article JOIN member ON forum_article.user_id = member.id")
    let result = await connection.queryAsync("SELECT forum_article.*, member.account FROM  forum_article JOIN member ON forum_article.user_id = member.id")
    
    if(result.length > 0)
     {
        const aaa = req.params.id
        const bbb = aaa-1
        let newReadNumber = result[bbb].readNumber+1;

        await connection.queryAsync("Update forum_article SET readNumber=? WHERE id=?",[newReadNumber ,aaa]);

        console.log( "第幾個", aaa ,"req2",newReadNumber);
    }

    // console.log("result",result, "req.body.id",aaa);
    res.json({result});
})

// router.get('/comments', async function(req, res, next) {
//     let getComments = await connection.queryAsync("SELECT comment.*,member.account,forum_article.id FROM comment JOIN member ON comment.user_id = member.id JOIN forum_article ON forum_article.id = comment.forum_article_id")

//     res.json({getComments});
// })


module.exports = router;
