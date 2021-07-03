//引入express
const express = require('express');
//引入路由器
const adminRouter = require('./router/admin.js');
const appRouter = require('./router/app.js');
//引入body-parser
const bodyParser = require('body-parser');
//创建WEB服务器
const app = express();
app.listen(3030);

//使用body-parser中间件将post请求的数据解析为对象
app.use(
  bodyParser.urlencoded({
    extended: false,
  })
);

//托管静态资源
app.use(express.static('public'));

//将路由器挂载到WEB服务器
app.use('/newbee', adminRouter);
app.use('/newbee_app', appRouter);

//错误处理中间件
app.use((err, req, res, next) => {
  //err,拦截到的错误
  res.send({
    code: 500,
    msg: '服务器端错误',
  });
});
