const express = require('express');
const router = express.Router();
const connection = require('../unilits/db');
const moment = require ('moment');  
const { body, validationResult } = require('express-validator');
const path = require('path');
const multer = require('multer');
const bcrypt = require('bcrypt');


const registerRules = [
    body("email").isEmail().withMessage("EMAIL請填寫正確格式"),
    body("password").isLength({ min:6 }).withMessage("密碼至少6位"),
    body("confirmPassword").custom((value, { req } ) => {
        return value===req.body.password;
    }).withMessage("密碼驗證不一致"),
];

//通常是為了上傳，需要告訴她在哪裡
//通常儲存於硬碟當中
const storage = multer.diskStorage({
    // 設定儲存的目的地
    destination: function (req, file, cb) {
      // "public/uploads"
      cb(null, path.join(__dirname, "..", "public", "upload"));
    },
    // 檔案命名
    filename: function (req, file, cb) {
      console.log(file);
      const ext = file.originalname.split(".").pop()
      cb(null, `member-${Date.now()}.${ext}`);
    },
  });

const uploader = multer({
    storage:storage,
    //檔案驗證(極為重要)
    fileFilter: function(req, file ,cb){
        console.log(file.mimetype);
        if(
            file.mimetype !== "image/jpeg" && 
            file.mimetype !== "image/png" &&
            file.mimetype !== "image/jpg"
        ){
            cb(new Error("不接受的檔案型態"),false);
        }
        cb(null,true);
    },
    limit:{
        fileSize:1024*1024,
    }
});




//TODO1:建立路由
//app.post("path" , "middleware1(真正的處理函式)")
//app.post("path" , "middleware1","middleware2","middleware3",
// "middlewareN(真正的處理函式)")

//registerRule寫在中間，代表此middleware只給下面這個app.post使用
router.post(
    "/registration",
    //multer必須放在validateResult 的 middleware前面
    
    uploader.single("photo"),
    registerRules , //因為驗證規則需要用到解譯後的資料，故須先經過multer
    async function(req, res, next){
    const validateResult = validationResult(req);
    // console.log(validateResult);
    if(!validateResult.isEmpty()){
        let error = validateResult.array();
        console.log(error);

        return res
        .status(400)
        .json({field:error[0].param, message:error[0].msg});
    }
    
    //檢查帳號重複

    let member = await connection.query
        ("selec t * from member where account = ?",[req.body.account]
            );
        if(member.length>0){
            return next({
                code:'33011',
                status:400,
                message:"此帳號已註冊"
            })
        }

    //TODO2:確認資料get
    console.log(req.body);
    // console.log(req.file);
    let filename = req.file?"/uploads/"+req.file.filename:"";
    //TODO3:資料存到資料庫
    //TODO:密碼明文

    //TODO:格式驗證
    let create_time = moment().format("YYYY-MM-DD");
    // let hashPWD = await bcrypt.hash(req.body.password ,10)
    let result = await connection.queryAsync(
        "INSERT INTO member (account,email,password,phone,create_time,photo)VALUES (?);",
        //直接在裡面await
        [[req.body.account,req.body.email,await bcrypt.hash(req.body.password ,10),req.body.phone,create_time,filename]]
        );
    //必加
    res.json({});
})


router.post('/login',async(req,res,next) => {
    console.log(req.body)
    //確認有沒有帳號
    let member = await connection.queryAsync(
        "SELECT * FROM  member WHERE account = ?;",
        [req.body.account]
    );

    console.log(member);
    if(member.length === 0){
        return next({
            status:400,
            message:"找不到帳號"    
        });
    };   

    member = member[0];
    //密碼比對
    //密碼正確
    //密碼錯誤

    const result =  await bcrypt.compare(req.body.password , member.password);
    if (!result) {
        return next({
            status:400,
            message:"PWD iS WORNG"    
        });
    }

    let  returnMember = {
        id:member.id,
        email:member.email,
        valid: 1
    }
    req.session.member = returnMember ;


    res.json({returnMember});
})


module.exports = router;
