//引入express
const express = require('express');
//创建路由器对象
const r = express.Router();
//引入mysql连接池模块
const pool = require('../pool.js');
//引入jsonwebtoken模块
let jwt = require('jsonwebtoken');

//管理员板块
//管理员登录
r.post('/login', (req, res, next) => {
  let obj = req.body;
  pool.query('select * from admin where account=? and password=?', [obj.account, obj.password], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length != 0) {
      let token = jwt.sign(
        {
          aid: result[0].aid,
          account: result[0].account,
          nickname: result[0].nickname,
          password: result[0].password,
        },
        'abc'
      );
      res.send({
        token,
        code: 200,
        msg: '登录成功',
      });
    } else {
      res.send({
        code: 201,
        msg: '登录失败,uname或upwd错误',
      });
    }
  });
});

//修改管理员用户名/昵称
r.put('/editAdmin', (req, res, next) => {
  var obj = req.body;
  var sql = 'update admin set account=?,nickname=? where aid=?';
  pool.query(sql, [obj.account, obj.nickname, obj.aid], (err, result) => {
    if (err) {
      throw err;
      // next(err);
      // return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: '201',
        msg: '修改成功',
      });
    } else {
      res.send({
        code: '202',
        msg: '修改失败',
      });
    }
  });
});

//修改管理员密码
r.put('/editPassword', (req, res, next) => {
  var obj = req.body;
  var sql = 'update admin set password=? where aid=?';
  pool.query(sql, [obj.password, obj.aid], (err, result) => {
    if (err) {
      // throw err;
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: '201',
        msg: '修改成功',
      });
    } else {
      res.send({
        code: '202',
        msg: '修改失败',
      });
    }
  });
});

//分类板块
//获取分类
r.get('/getClassify', (req, res, next) => {
  pool.query('select * from classify order by classID DESC', (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length != 0) {
      res.send({
        result,
      });
    } else {
      res.send({
        code: 201,
        msg: '查询失败',
      });
    }
  });
});

//添加分类
r.post('/addClassify', (req, res, next) => {
  var obj = req.body;
  pool.query('select * from classify where className=?', [obj.className], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length != 0) {
      res.send({
        code: '200',
        msg: '查询成功',
      });
    } else {
      var sql = 'INSERT INTO classify (className, sortValue) VALUES (?,?)';
      pool.query(sql, [obj.className, obj.sortValue], (err, result) => {
        if (err) {
          next(err);
          return;
        }
        if (result.affectedRows > 0) {
          res.send({
            code: '201',
            msg: '添加成功',
          });
        } else {
          res.send({
            code: '202',
            msg: '添加失败',
          });
        }
      });
    }
  });
});

//修改分类
r.put('/editClassify', (req, res, next) => {
  var obj = req.body;
  var sql = 'update classify set className=?,sortValue=? where classID=?';
  pool.query(sql, [obj.className, obj.sortValue, obj.classID], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: '201',
        msg: '修改成功',
      });
    } else {
      res.send({
        code: '202',
        msg: '修改失败',
      });
    }
  });
});

//删除分类
r.delete('/deleteClassify/:classID', (req, res, next) => {
  let classID = req.params.classID;
  var sql = 'delete from classify where classID in (' + classID + ')';
  pool.query(sql, (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: 1,
        msg: '删除成功',
      });
    } else {
      res.send({
        code: 0,
        msg: '删除失败',
      });
    }
  });
});

//首页配置共用
r.get('/getGood/options', (req, res, next) => {
  pool.query('select goodID,name from goods', (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length != 0) {
      res.send({
        result,
        code: 200,
        msg: '查询成功',
      });
    } else {
      res.send({
        code: 201,
        msg: '查询失败',
      });
    }
  });
});

//轮播图板块
//获取轮播图
r.get('/getCarousel', (req, res, next) => {
  pool.query('select * from carousel ORDER BY sortValue DESC', (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length != 0) {
      res.send({
        result,
        code: 200,
        msg: '查询成功',
      });
    } else {
      res.send({
        code: 201,
        msg: '查询失败',
      });
    }
  });
});

//添加轮播图
r.post('/addCarousel', (req, res, next) => {
  var obj = req.body;
  var sql = 'INSERT INTO carousel (imageUrl,jumpUrl,sortValue) VALUES (?,?,?)';
  pool.query(sql, [obj.imageUrl, obj.jumpUrl, obj.sortValue], (err, result) => {
    if (err) {
      // next(err);
      // return;
      throw err;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: '201',
        msg: '添加成功',
      });
    } else {
      res.send({
        code: '202',
        msg: '添加失败',
      });
    }
  });
});

//修改轮播图
r.put('/editCarousel', (req, res, next) => {
  var obj = req.body;
  var sql = 'update carousel set imageUrl=?,jumpUrl=?,sortValue=? where imageID=?';
  pool.query(sql, [obj.imageUrl, obj.jumpUrl, obj.sortValue, obj.imageID], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: '201',
        msg: '修改成功',
      });
    } else {
      res.send({
        code: '202',
        msg: '修改失败',
      });
    }
  });
});

//删除轮播图
r.delete('/deleteCarousel/:imageID', (req, res, next) => {
  let imageID = req.params.imageID;
  var sql = 'delete from carousel where imageID in (' + imageID + ')';
  pool.query(sql, (err, result) => {
    if (err) {
      // throw err;
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: 1,
        msg: '删除成功',
      });
    } else {
      res.send({
        code: 0,
        msg: '删除失败',
      });
    }
  });
});

//热销商品板块
//获取热销商品
r.get('/getHotSale', (req, res, next) => {
  pool.query('select hotID,goodName,jumpUrl,sortValue,goodID,createTime from hotSale ORDER BY sortValue DESC', (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length != 0) {
      res.send({
        result,
        code: 200,
        msg: '查询成功',
      });
    } else {
      res.send({
        code: 201,
        msg: '查询失败',
      });
    }
  });
});

//新增热销商品
r.post('/addHotSale', (req, res, next) => {
  var obj = req.body;
  pool.query(`select name from goods where goodID=?`, [obj.goodID], (err, result) => {
    obj.goodName = result[0].name;
    var sql = 'INSERT INTO hotSale (goodID,goodName,jumpUrl,sortValue) VALUES (?,?,?,?)';
    pool.query(sql, [obj.goodID, obj.goodName, obj.jumpUrl, obj.sortValue], (err, result) => {
      if (err) {
        // next(err);
        // return;
        throw err;
      }
      if (result.affectedRows > 0) {
        res.send({
          code: '201',
          msg: '添加成功',
        });
      } else {
        res.send({
          code: '202',
          msg: '添加失败',
        });
      }
    });
  });
});

//修改热销商品
r.put('/editHotSale', (req, res, next) => {
  var obj = req.body;
  pool.query(`select name from goods where goodID=?`, [obj.goodID], (err, result) => {
    obj.goodName = result[0].name;
    var sql = 'update hotSale set goodID=?,goodName=?,jumpUrl=?,sortValue=? where hotID=?';
    pool.query(sql, [obj.goodID, obj.goodName, obj.jumpUrl, obj.sortValue, obj.hotID], (err, result) => {
      if (err) {
        next(err);
        return;
      }
      if (result.affectedRows > 0) {
        res.send({
          code: '201',
          msg: '修改成功',
        });
      } else {
        res.send({
          code: '202',
          msg: '修改失败',
        });
      }
    });
  });
});

//删除热销商品
r.delete('/deleteHotSale/:hotID', (req, res, next) => {
  let hotID = req.params.hotID;
  var sql = 'delete from hotSale where hotID in (' + hotID + ')';
  pool.query(sql, (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: 1,
        msg: '删除成功',
      });
    } else {
      res.send({
        code: 0,
        msg: '删除失败',
      });
    }
  });
});

//为你推荐模块
//获取为你推荐商品
r.get('/getGroom', (req, res, next) => {
  pool.query('select groomID,goodName,jumpUrl,sortValue,goodID,createTime from groom ORDER BY sortValue DESC', (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length != 0) {
      res.send({
        result,
        code: 200,
        msg: '查询成功',
      });
    } else {
      res.send({
        code: 201,
        msg: '查询失败',
      });
    }
  });
});

//新增为你推荐商品
r.post('/addGroom', (req, res, next) => {
  var obj = req.body;
  pool.query(`select name from goods where goodID=?`, [obj.goodID], (err, result) => {
    obj.goodName = result[0].name;
    var sql = 'INSERT INTO groom (goodID,goodName,jumpUrl,sortValue) VALUES (?,?,?,?)';
    pool.query(sql, [obj.goodID, obj.goodName, obj.jumpUrl, obj.sortValue], (err, result) => {
      if (err) {
        next(err);
        return;
        // throw err;
      }
      if (result.affectedRows > 0) {
        res.send({
          code: '201',
          msg: '添加成功',
        });
      } else {
        res.send({
          code: '202',
          msg: '添加失败',
        });
      }
    });
  });
});

//修改为你推荐商品
r.put('/editGroom', (req, res, next) => {
  var obj = req.body;
  pool.query(`select name from goods where goodID=?`, [obj.goodID], (err, result) => {
    obj.goodName = result[0].name;
    var sql = 'update groom set goodID=?,goodName=?,jumpUrl=?,sortValue=? where groomID=?';
    pool.query(sql, [obj.goodID, obj.goodName, obj.jumpUrl, obj.sortValue, obj.groomID], (err, result) => {
      if (err) {
        next(err);
        return;
      }
      if (result.affectedRows > 0) {
        res.send({
          code: '201',
          msg: '修改成功',
        });
      } else {
        res.send({
          code: '202',
          msg: '修改失败',
        });
      }
    });
  });
});

//删除为你推荐商品
r.delete('/deleteGroom/:groomID', (req, res, next) => {
  let groomID = req.params.groomID;
  var sql = 'delete from groom where groomID in (' + groomID + ')';
  pool.query(sql, (err, result) => {
    if (err) {
      throw err;
      // next(err);
      // return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: 1,
        msg: '删除成功',
      });
    } else {
      res.send({
        code: 0,
        msg: '删除失败',
      });
    }
  });
});

//新品上线模块
//获取新品上线商品
r.get('/getNewGood', (req, res, next) => {
  pool.query('select newID,goodName,jumpUrl,sortValue,goodID,createTime from newGood ORDER BY sortValue DESC', (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length != 0) {
      res.send({
        result,
        code: 200,
        msg: '查询成功',
      });
    } else {
      res.send({
        code: 201,
        msg: '查询失败',
      });
    }
  });
});

//新增新品上线商品
r.post('/addNewGood', (req, res, next) => {
  var obj = req.body;
  pool.query(`select name from goods where goodID=?`, [obj.goodID], (err, result) => {
    obj.goodName = result[0].name;
    var sql = 'INSERT INTO newGood (goodID,goodName,jumpUrl,sortValue) VALUES (?,?,?,?)';
    pool.query(sql, [obj.goodID, obj.goodName, obj.jumpUrl, obj.sortValue], (err, result) => {
      if (err) {
        // next(err);
        // return;
        throw err;
      }
      if (result.affectedRows > 0) {
        res.send({
          code: '201',
          msg: '添加成功',
        });
      } else {
        res.send({
          code: '202',
          msg: '添加失败',
        });
      }
    });
  });
});

//修改新品上线商品
r.put('/editNewGood', (req, res, next) => {
  var obj = req.body;
  pool.query(`select name from goods where goodID=?`, [obj.goodID], (err, result) => {
    obj.goodName = result[0].name;
    var sql = 'update newGood set goodID=?,goodName=?,jumpUrl=?,sortValue=? where newID=?';
    pool.query(sql, [obj.goodID, obj.goodName, obj.jumpUrl, obj.sortValue, obj.newID], (err, result) => {
      if (err) {
        next(err);
        return;
      }
      if (result.affectedRows > 0) {
        res.send({
          code: '201',
          msg: '修改成功',
        });
      } else {
        res.send({
          code: '202',
          msg: '修改失败',
        });
      }
    });
  });
});

//删除新品上线商品
r.delete('/deleteNewGood/:newID', (req, res, next) => {
  let newID = req.params.newID;
  var sql = 'delete from newGood where newID in (' + newID + ')';
  pool.query(sql, (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: 1,
        msg: '删除成功',
      });
    } else {
      res.send({
        code: 0,
        msg: '删除失败',
      });
    }
  });
});

//商品板块
//获取商品
r.get('/getGoods', (req, res, next) => {
  pool.query('select * from goods order by goodID desc', (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length != 0) {
      res.send({
        result,
      });
    } else {
      res.send({
        code: 201,
        msg: '查询失败',
      });
    }
  });
});

//查询单个商品
r.get('/getGoods/:goodID', (req, res, next) => {
  let goodID = req.params.goodID;
  pool.query('select * from goods where goodID=?', [goodID], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length != 0) {
      res.send({
        code: 200,
        msg: '查询成功',
        result,
      });
    } else {
      res.send({
        code: 201,
        msg: '查询失败',
      });
    }
  });
});

//修改上架状态
r.put('/editOnsale', (req, res, next) => {
  var obj = req.body;
  var sql = 'update goods set onSale=? where goodID=?';
  pool.query(sql, [obj.onSale, obj.goodID], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: '201',
        msg: '修改成功',
      });
    } else {
      res.send({
        code: '202',
        msg: '修改失败',
      });
    }
  });
});

//添加商品
r.post('/addGood', (req, res, next) => {
  var obj = req.body;
  var sql = 'INSERT INTO goods (classID,name,intr,price,salePrice,stock,tag,onSale,imageURL) VALUES (?,?,?,?,?,?,?,?,?)';
  pool.query(sql, [obj.classID, obj.name, obj.intr, obj.price, obj.salePrice, obj.stock, obj.tag, obj.onSale, obj.imageURL], (err, result) => {
    if (err) {
      // next(err);
      // return;
      throw err;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: '201',
        msg: '添加成功',
      });
    } else {
      res.send({
        code: '202',
        msg: '添加失败',
      });
    }
  });
});

//修改商品
r.put('/editGood', (req, res, next) => {
  var obj = req.body;
  var sql = 'update goods set classID=?,name=?,intr=?,price=?,salePrice=?,stock=?,tag=?,onSale=?,imageURL=? where goodID=?';
  pool.query(sql, [obj.classID, obj.name, obj.intr, obj.price, obj.salePrice, obj.stock, obj.tag, obj.onSale, obj.imageURL, obj.goodID], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: '201',
        msg: '修改成功',
      });
    } else {
      res.send({
        code: '202',
        msg: '修改失败',
      });
    }
  });
});

//用户板块
//获取用户列表
r.get('/getUsers', (req, res, next) => {
  pool.query('select * from users order by regTime desc', (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length != 0) {
      res.send({
        result,
      });
    } else {
      res.send({
        code: 201,
        msg: '查询失败',
      });
    }
  });
});

//禁用用户
r.put('/banUser', (req, res, next) => {
  var obj = req.body;
  var sql = 'update users set status=1 where uid in (' + obj.uid + ')';
  pool.query(sql, (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: '201',
        msg: '修改成功',
      });
    } else {
      res.send({
        code: '202',
        msg: '修改失败',
      });
    }
  });
});

//解除禁用
r.put('/relieveUser', (req, res, next) => {
  var obj = req.body;
  var sql = 'update users set status=0 where uid in (' + obj.uid + ')';
  pool.query(sql, (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: '201',
        msg: '修改成功',
      });
    } else {
      res.send({
        code: '202',
        msg: '修改失败',
      });
    }
  });
});

//订单板块
//获取订单列表
r.get('/getOrder', (req, res, next) => {
  pool.query('select * from orderInfo order by createTime desc', (err, result) => {
    if (err) {
      throw err;
      // next(err);
      // return;
    }
    if (result.length != 0) {
      res.send({
        result,
        code: 200,
        msg: '查询成功',
      });
    } else {
      res.send({
        code: 201,
        msg: '查询失败',
      });
    }
  });
});

//获取单个订单信息
r.get('/getOrder/:orderID', (req, res, next) => {
  let orderID = req.params.orderID;
  pool.query('select orderID,orderStatus,createTime from orderInfo where orderID=?', [orderID], (err, result) => {
    if (err) {
      throw err;
      // next(err);
      // return;
    }
    if (result.length != 0) {
      res.send({
        result,
        code: 200,
        msg: '查询成功',
      });
    } else {
      res.send({
        code: 201,
        msg: '查询失败',
      });
    }
  });
});

//获取单个订单信息
r.get('/getOrderDetail/:orderID', (req, res, next) => {
  let orderID = req.params.orderID;
  pool.query(
    'SELECT `orderDetail`.`count`, `goods`.`goodID`,`goods`.`name`,`goods`.`price`,`goods`.`imageUrl` FROM `orderDetail` LEFT JOIN `goods` ON `orderDetail`.`goodID` = `goods`.`goodID` WHERE `orderDetail`.`orderID` = ?',
    [orderID],
    (err, result) => {
      if (err) {
        throw err;
        // next(err);
        // return;
      }
      if (result.length != 0) {
        res.send({
          result,
          code: 200,
          msg: '查询成功',
        });
      } else {
        res.send({
          code: 201,
          msg: '查询失败',
        });
      }
    }
  );
});

//配货
r.put('/setStatus1', (req, res, next) => {
  var obj = req.body;
  var sql = 'update orderInfo set orderStatus=2 where orderID in (' + obj.orderID + ')';
  pool.query(sql, (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: '201',
        msg: '修改成功',
      });
    } else {
      res.send({
        code: '202',
        msg: '修改失败',
      });
    }
  });
});

//出库
r.put('/setStatus2', (req, res, next) => {
  var obj = req.body;
  var sql = 'update orderInfo set orderStatus=3 where orderID in (' + obj.orderID + ')';
  pool.query(sql, (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: '201',
        msg: '修改成功',
      });
    } else {
      res.send({
        code: '202',
        msg: '修改失败',
      });
    }
  });
});

//关闭订单
r.put('/setStatus3', (req, res, next) => {
  var obj = req.body;
  var sql = 'update orderInfo set orderStatus=(-3) where orderID in (' + obj.orderID + ')';
  pool.query(sql, (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows > 0) {
      res.send({
        code: '201',
        msg: '修改成功',
      });
    } else {
      res.send({
        code: '202',
        msg: '修改失败',
      });
    }
  });
});

//导出路由器对象,
module.exports = r;
