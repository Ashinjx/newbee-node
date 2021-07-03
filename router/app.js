//引入express
const express = require('express');
//创建路由器对象
const r = express.Router();
//引入mysql连接池模块
const pool = require('../pool.js');
//引入jsonwebtoken模块
let jwt = require('jsonwebtoken');

//主页
//轮播图
r.get('/getCarousel', (req, res, next) => {
  pool.query('select imageUrl,jumpUrl from carousel ORDER BY createTime DESC,sortValue DESC LIMIT 0,3', (err, result) => {
    if (err) {
      throw err;
      // next(err);
      // return;
    }
    if (result.length != 0) {
      res.send({
        result,
        ok: 1,
        msg: '查询成功',
      });
    } else {
      res.send({
        ok: -1,
        msg: '查询失败',
      });
    }
  });
});

//新品上线
r.get('/getNewGood', (req, res, next) => {
  pool.query(
    'SELECT `newGood`.`goodID`, `goods`.`imageUrl`, `goods`.`name`, `goods`.`price` FROM `newGood` LEFT JOIN `goods` ON `newGood`.`goodID` = `goods`.`goodID` ORDER BY `newGood`.`sortValue` DESC,`newGood`.`createTime` DESC LIMIT 0,4',
    (err, result) => {
      if (err) {
        throw err;
      }
      if (result.length != 0) {
        res.send({
          result,
          ok: 1,
          msg: '查询成功',
        });
      } else {
        res.send({
          ok: -1,
          msg: '查询失败',
        });
      }
    }
  );
});

// 热门商品
r.get('/getHotSale', (req, res, next) => {
  pool.query(
    'SELECT `hotSale`.`goodID`, `goods`.`imageUrl`, `goods`.`name`, `goods`.`price` FROM `hotSale` LEFT JOIN `goods` ON `hotSale`.`goodID` = `goods`.`goodID` ORDER BY `hotSale`.`sortValue` DESC,`hotSale`.`createTime` DESC LIMIT 0,4',
    (err, result) => {
      if (err) {
        throw err;
      }
      if (result.length != 0) {
        res.send({
          result,
          ok: 1,
          msg: '查询成功',
        });
      } else {
        res.send({
          ok: -1,
          msg: '查询失败',
        });
      }
    }
  );
});

// 最新推荐
r.get('/getGroom', (req, res, next) => {
  pool.query(
    'SELECT `groom`.`goodID`, `goods`.`imageUrl`, `goods`.`name`, `goods`.`price` FROM `groom` LEFT JOIN `goods` ON `groom`.`goodID` = `goods`.`goodID` ORDER BY `groom`.`sortValue` DESC,`groom`.`createTime` DESC LIMIT 0,10',
    (err, result) => {
      if (err) {
        throw err;
      }
      if (result.length != 0) {
        res.send({
          result,
          ok: 1,
          msg: '查询成功',
        });
      } else {
        res.send({
          ok: -1,
          msg: '查询失败',
        });
      }
    }
  );
});

//导出路由器对象,
module.exports = r;
