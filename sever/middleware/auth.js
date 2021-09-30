module.exports = {
  //非登入狀態無法讀取頁面內容
  loginCheckMiddleware: function (req, res, next){
    if (!req.session.member) {
      //若session裡沒有member ->還沒登入
        return next({ 
          status: 401, 
          message: '請登入會員' 
        });
      }else{
        //若session裡有member ->已登入
        next()
      }

  }
}