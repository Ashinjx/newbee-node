-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-07-03 17:58:22
-- 服务器版本： 10.4.17-MariaDB
-- PHP 版本： 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `newbee`
--
CREATE DATABASE IF NOT EXISTS `newbee` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `newbee`;

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL COMMENT 'ID',
  `account` varchar(32) NOT NULL COMMENT '登录名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `nickname` varchar(32) NOT NULL COMMENT '昵称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`aid`, `account`, `password`, `nickname`) VALUES
(1, 'admin', '123456', 'Ashin');

-- --------------------------------------------------------

--
-- 表的结构 `carousel`
--

DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `imageID` int(11) NOT NULL COMMENT '轮播图ID',
  `imageUrl` longtext NOT NULL COMMENT '轮播图链接',
  `jumpUrl` longtext NOT NULL DEFAULT '#' COMMENT '跳转链接',
  `sortValue` int(16) NOT NULL COMMENT '排序值',
  `createTime` datetime DEFAULT current_timestamp() COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `carousel`
--

INSERT INTO `carousel` (`imageID`, `imageUrl`, `jumpUrl`, `sortValue`, `createTime`) VALUES
(1, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner-mate40.png', '#', 200, '2021-07-02 09:13:47'),
(2, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner1.png', '#', 200, '2021-07-02 09:13:47'),
(3, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner2.png', '#', 200, '2021-07-02 09:13:47');

-- --------------------------------------------------------

--
-- 表的结构 `classify`
--

DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
  `classID` int(8) NOT NULL,
  `className` varchar(32) NOT NULL,
  `sortValue` int(16) NOT NULL,
  `createTime` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `classify`
--

INSERT INTO `classify` (`classID`, `className`, `sortValue`, `createTime`) VALUES
(3, '电脑', 201, '2021-06-02 16:00:17'),
(4, '配件', 200, '2021-06-02 16:00:17'),
(14, '手表', 200, '2021-06-03 15:31:00'),
(15, '平板', 200, '2021-06-03 15:36:13'),
(22, '生活', 200, '2021-06-03 16:33:33'),
(24, '手机', 200, '2021-06-04 15:54:45'),
(31, '美妆', 200, '2021-06-04 16:56:35'),
(32, '奢侈', 100, '2021-06-04 16:56:42'),
(33, '鞋类', 300, '2021-06-10 15:39:59'),
(34, '服饰', 200, '2021-06-12 17:00:57'),
(35, '护肤', 200, '2021-06-12 17:02:44');

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodID` int(16) NOT NULL COMMENT '商品ID',
  `classID` int(8) NOT NULL COMMENT '分类ID',
  `name` varchar(64) NOT NULL COMMENT '商品名',
  `intr` varchar(128) DEFAULT '暂无' COMMENT '简介',
  `price` decimal(7,2) NOT NULL COMMENT '价格',
  `salePrice` decimal(7,2) NOT NULL COMMENT '售价',
  `stock` int(16) NOT NULL COMMENT '库存',
  `tag` varchar(32) DEFAULT NULL COMMENT '标签',
  `onSale` tinyint(1) DEFAULT NULL COMMENT '是否上架',
  `imageUrl` longtext NOT NULL COMMENT '主图'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`goodID`, `classID`, `name`, `intr`, `price`, `salePrice`, `stock`, `tag`, `onSale`, `imageUrl`) VALUES
(1, 35, '无印良品 MUJI 基础润肤化妆水', '滋润型 400ml', '100.00', '100.00', 500, '', 0, 'https://www.hualigs.cn/image/60c4d5d65dc3c.jpg'),
(2, 35, '无印良品 MUJI 柔和洁面泡沫', '120g', '70.00', '70.00', 500, '', 0, 'https://www.hualigs.cn/image/60c4e76a2a917.jpg'),
(6, 34, '无印良品 MUJI 男式', '无侧缝法兰绒 睡衣 海军蓝 L', '199.00', '199.00', 500, 'null', 0, 'https://www.hualigs.cn/image/60c4e7fcef030.jpg'),
(8, 33, 'Nike Air Jordan1 Mid', '酒红脚趾 黑红中邦篮球鞋', '845.00', '845.00', 500, 'null', 0, 'https://www.hualigs.cn/image/60c4f35faaf35.jpg'),
(9, 33, 'Nike AIR JORDAN 1', 'MID AJ1 女子运动鞋休闲中帮复古BQ6472', '969.00', '969.00', 500, '', 0, 'https://www.hualigs.cn/image/60c4f2e1d43cb.jpg'),
(10, 33, 'Nike AIR JORDAN 1', 'ZOOM AIR CMFT AJ1女子运动鞋', '1199.00', '1199.00', 300, '', 0, 'https://www.hualigs.cn/image/60c4ef1090997.jpg'),
(11, 32, 'Hermes爱马仕大地男士香水', '持久淡香 75ml', '740.00', '740.00', 1000, '', 0, 'https://www.hualigs.cn/image/60c4ee4e383d3.jpg'),
(12, 32, 'Armani/阿玛尼寄情男士', '经典香水持久清新活力自然 50ml', '580.00', '580.00', 1000, '', 0, 'https://www.hualigs.cn/image/60c4edca0afa7.jpg'),
(13, 24, '华为 HUAWEI P30 Pro', '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB 128GB赤茶橘全网通版双4G手机', '4999.00', '4999.00', 1000, '', 0, 'https://www.hualigs.cn/image/60c4ecd5bcf50.jpg'),
(14, 24, '华为 HUAWEI P30 Pro', '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB 128GB珠光贝母全网通版双4G手机', '5488.00', '5488.00', 1000, '', 0, 'https://www.hualigs.cn/image/60c4ec9d2fc27.jpg'),
(15, 24, 'Apple iPhone 11 (A2223) 256GB', '紫色 移动联通电信4G手机 双卡双待', '5999.00', '5999.00', 1000, '', 0, 'https://www.hualigs.cn/image/60c4ebeb7fd58.jpg'),
(16, 24, 'Apple iPhone 11 (A2223) 128GB', '白色 移动联通电信4G手机 双卡双待', '5999.00', '5999.00', 1000, '', 0, 'https://www.hualigs.cn/image/60c4ebd6b04fd.jpg'),
(17, 3, 'Apple 2019款 MacBook Air 13.3', 'Retina屏 八代i5 8G 128G SSD 深空灰 笔记本电脑 轻薄本 MVFH2CH/A', '8499.00', '8499.00', 1000, '', 0, 'https://www.hualigs.cn/image/60c4eb5fdc66c.jpg'),
(19, 31, '迪奥（Dior）烈艳蓝金唇膏-哑光999# 3.5g 传奇红', '雾面质地 显色持久 显白 正红色 李佳琦推荐）', '315.00', '315.00', 200, '', 0, 'https://www.hualigs.cn/image/60c4ea6866797.jpg'),
(20, 31, '海囤全球 魅可（MAC)经典唇膏 子弹头口红3g', 'Chili 秀智色/小辣椒色', '155.00', '155.00', 500, '', 0, 'https://www.hualigs.cn/image/60c4ea41c1251.jpg'),
(21, 4, 'Apple AirPods 配充电盒', '苹果蓝牙耳机\n', '1246.00', '1246.00', 1000, '', 0, 'https://www.hualigs.cn/image/60c4e9e1357b4.jpg'),
(22, 4, '10164 Beats X 蓝牙无线', '入耳式耳机 带麦可通话 -桀骜黑红（十周年版） MRQA2PA/A', '799.00', '799.00', 12345, '', 0, 'https://www.hualigs.cn/image/60c4e99ebc7a4.jpg'),
(23, 4, 'Beats Powerbeats Pro', '完全无线高性能耳机 真无线蓝牙运动耳机 象牙白', '1888.00', '1888.00', 1000, '', 0, 'https://www.hualigs.cn/image/60c4e96bade8a.jpg'),
(24, 22, '无印良品（MUJI） 聚丙烯化妆盒 1/2', '半透明约150x220x86mm', '30.00', '30.00', 199, '', 0, 'https://www.hualigs.cn/image/60c4e91494d28.jpg'),
(25, 22, '无印良品 MUJI 便携式香薰机', '新蜂精选', '200.00', '200.00', 1200, '', 0, 'https://www.hualigs.cn/image/60c4e8f09c150.jpg'),
(26, 34, '无印良品 MUJI 女式', '粗棉线条纹长袖T恤 白色*横条 L', '75.00', '75.00', 400, '', 0, 'https://www.hualigs.cn/image/60c4e873b6d21.jpg'),
(27, 24, 'HUAWEI Mate 40 Pro 全网通5G手机 8GB+512GB（黄色）', '5nm麒麟9000旗舰芯片 | 超感光徕卡电影影象', '6488.00', '6488.00', 200, '卓越非凡', 0, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/mate40-white.png'),
(28, 24, '华为 HUAWEI P40 冰霜银 全网通5G手机', '麒麟990 5G SoC芯片 5000万超感知徕卡三摄 30倍数字变焦 6GB+128GB', '4299.00', '4299.00', 1000, '超感知影像', 0, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p40-silver.png'),
(29, 24, 'HUAWEI Mate 40 Pro 全网通5G手机 8GB+512GB（秘银色）', '5nm麒麟9000旗舰芯片 | 超感光徕卡电影影象', '6488.00', '6488.00', 299, '卓越非凡', 0, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/mate40-silver.png'),
(30, 24, 'HUAWEI Mate 30 Pro', '超曲面OLED环幕屏 8GB+128GB 全网通4G版（翡冷翠）', '5399.00', '5399.00', 200, '重构想象', 0, 'http://backend-api-01.newbee.ltd/goods-img/mate30p3.png'),
(31, 24, ' Apple iPhone XR (A2108) 128GB ', '黑色 移动联通电信4G手机 双卡双待', '5099.00', '5099.00', 999, NULL, 0, 'http://backend-api-01.newbee.ltd/goods-img/23ac3107-6309-40c8-bd28-164eb1186b62.jpg'),
(32, 3, 'Apple 2019款 Macbook Pro 13.3', '【带触控栏】八代i5 8G 256G RP645显卡 银色 苹果笔记本电脑 MUHR2CH/A', '10699.00', '10699.00', 999, NULL, 0, 'http://backend-api-01.newbee.ltd/goods-img/465936e0-40ad-4968-b868-4bea20c7beec.jpg'),
(33, 31, '纪梵希高定香榭天鹅绒唇膏306#', '(小羊皮口红 法式红 雾面哑光 持久锁色）新老包装随机发货', '355.00', '355.00', 500, '雾面哑光 持久锁色', 0, 'http://backend-api-01.newbee.ltd/goods-img/04949c0e-87df-445b-96dd-29e7fc69f734.jpg'),
(34, 4, '索尼 WH-1000XM3 头戴式耳机', '高解析度无线蓝牙降噪（触控面板 智能降噪 长久续航）黑色', '2599.00', '2599.00', 200, '智能降噪 长久续航', 0, 'http://backend-api-01.newbee.ltd/goods-img/0dc503b2-90a2-4971-9723-c085a1844b76.jpg'),
(35, 31, 'MAC 雾面丝绒哑光子弹头口红', '磨砂系列 3g 316 devoted to chili 泫雅色', '165.00', '165.00', 200, '雾面丝绒哑光', 0, 'http://backend-api-01.newbee.ltd/goods-img/1930d79b-88bd-4c5c-8510-0697c9ad2578.jpg'),
(36, 22, '无印良品 MUJI 塑料浴室座椅', '原色', '85.00', '85.00', 199, '无印良品', 0, 'http://backend-api-01.newbee.ltd/goods-img/15395057-94e9-4545-a8ee-8aee025f40c5.jpg'),
(37, 22, 'MUJI 羽毛 靠垫', '白色', '65.00', '65.00', 888, '悠享惬意', 0, 'http://backend-api-01.newbee.ltd/goods-img/0f701215-b782-40c7-8bbd-97b51be56461.jpg'),
(38, 34, '无印良品 女式粗棉线条纹长袖T恤', '黑*横条 L', '70.00', '70.00', 70, '无印良品', 0, 'http://backend-api-01.newbee.ltd/goods-img/5488564b-8335-4b0c-a5a4-52f3f03ee728.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `groom`
--

DROP TABLE IF EXISTS `groom`;
CREATE TABLE `groom` (
  `groomID` int(16) NOT NULL COMMENT '推荐ID',
  `goodID` int(16) NOT NULL COMMENT '商品ID',
  `goodName` varchar(64) NOT NULL COMMENT '商品名称',
  `jumpUrl` longtext NOT NULL COMMENT '跳转链接',
  `sortValue` int(16) NOT NULL COMMENT '排序值',
  `createTime` datetime DEFAULT current_timestamp() COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `groom`
--

INSERT INTO `groom` (`groomID`, `goodID`, `goodName`, `jumpUrl`, `sortValue`, `createTime`) VALUES
(29, 21, 'Apple AirPods 配充电盒', '#', 300, '2021-07-03 09:59:33'),
(30, 30, 'HUAWEI Mate 30 Pro', '#', 250, '2021-07-03 09:59:33'),
(31, 29, 'HUAWEI Mate 40 Pro 全网通5G手机 8GB+258GB (秘银色)', '#', 200, '2021-07-03 09:59:33'),
(32, 17, 'Apple 2019款 MacBook Air 13.3 ', '#', 200, '2021-07-03 09:59:33'),
(39, 33, '纪梵希高定香榭天鹅绒唇膏306#', '#', 500, '2021-07-03 10:17:27'),
(40, 34, '索尼 WH-1000XM3 头戴式耳机', '#', 450, '2021-07-03 10:17:27'),
(43, 35, 'MAC 雾面丝绒哑光子弹头口红', '#', 200, '2021-07-03 10:56:04'),
(44, 36, '无印良品 MUJI 塑料浴室座椅', '#', 200, '2021-07-03 10:56:28'),
(45, 37, 'MUJI 羽毛 靠垫', '#', 200, '2021-07-03 10:56:38'),
(46, 38, '无印良品 女式粗棉线条纹长袖T恤', '#', 200, '2021-07-03 10:56:45');

-- --------------------------------------------------------

--
-- 表的结构 `hotSale`
--

DROP TABLE IF EXISTS `hotSale`;
CREATE TABLE `hotSale` (
  `hotID` int(16) NOT NULL COMMENT '热卖ID',
  `goodID` int(16) NOT NULL COMMENT '商品ID',
  `goodName` varchar(64) NOT NULL COMMENT '商品名称',
  `jumpUrl` longtext NOT NULL COMMENT '跳转链接',
  `sortValue` int(16) NOT NULL COMMENT '排序值',
  `createTime` datetime DEFAULT current_timestamp() COMMENT '添加事件'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `hotSale`
--

INSERT INTO `hotSale` (`hotID`, `goodID`, `goodName`, `jumpUrl`, `sortValue`, `createTime`) VALUES
(1, 28, '华为 HUAWEI P40 冰霜银 全网通5G手机', '#', 300, '2021-07-03 00:50:10'),
(2, 30, 'HUAWEI Mate 30 Pro', '#', 200, '2021-07-03 00:56:58'),
(3, 31, 'Apple iphone XR (A2108) 128G', '#', 200, '2021-07-03 00:56:58'),
(4, 32, 'Apple 2019款 Macbook Pro 13.3', '#', 200, '2021-07-03 00:57:32');

-- --------------------------------------------------------

--
-- 表的结构 `newGood`
--

DROP TABLE IF EXISTS `newGood`;
CREATE TABLE `newGood` (
  `newID` int(16) NOT NULL COMMENT '新品ID',
  `goodID` int(16) NOT NULL COMMENT '商品ID',
  `goodName` varchar(64) NOT NULL COMMENT '商品名称',
  `jumpUrl` longtext NOT NULL COMMENT '跳转链接',
  `sortValue` int(16) NOT NULL COMMENT '排序值',
  `createTime` datetime DEFAULT current_timestamp() COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `newGood`
--

INSERT INTO `newGood` (`newID`, `goodID`, `goodName`, `jumpUrl`, `sortValue`, `createTime`) VALUES
(2, 29, 'HUAWEI Mate 40 Pro 全网通5G手机 8GB+512GB（秘银色）', '#', 300, '2021-07-02 20:43:24'),
(3, 27, 'HUAWEI Mate 40 Pro 全网通 5G手机 8G+512G (黄色)', '#', 200, '2021-07-02 20:43:24'),
(4, 28, ' 华为 HUAWEI P40 冰霜银 全网通5G手机 ', '#', 200, '2021-07-02 20:44:31'),
(5, 16, 'Apple iPhone 11 (A2223)', '#', 200, '2021-07-02 20:45:07');

-- --------------------------------------------------------

--
-- 表的结构 `orderDetail`
--

DROP TABLE IF EXISTS `orderDetail`;
CREATE TABLE `orderDetail` (
  `did` int(64) NOT NULL,
  `orderID` int(64) NOT NULL,
  `goodID` int(16) NOT NULL,
  `count` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `orderDetail`
--

INSERT INTO `orderDetail` (`did`, `orderID`, `goodID`, `count`) VALUES
(1, 10, 14, 1),
(2, 10, 12, 1),
(3, 9, 15, 1),
(4, 8, 22, 1),
(5, 8, 23, 1),
(6, 7, 19, 1),
(7, 6, 17, 1),
(8, 5, 10, 1),
(9, 5, 9, 1),
(10, 4, 6, 1),
(11, 3, 19, 1),
(12, 2, 21, 1),
(13, 2, 15, 1),
(14, 1, 20, 1);

-- --------------------------------------------------------

--
-- 表的结构 `orderInfo`
--

DROP TABLE IF EXISTS `orderInfo`;
CREATE TABLE `orderInfo` (
  `orderID` int(64) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `orderStatus` int(8) NOT NULL,
  `payType` int(8) NOT NULL,
  `createTime` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `orderInfo`
--

INSERT INTO `orderInfo` (`orderID`, `price`, `orderStatus`, `payType`, `createTime`) VALUES
(1, '155.00', 0, 1, '2021-06-12 02:00:12'),
(2, '7245.00', 1, 2, '2021-06-12 21:25:49'),
(3, '315.00', 2, 1, '2021-06-12 21:25:49'),
(4, '199.00', 3, 2, '2021-06-12 21:25:49'),
(5, '2168.00', 4, 1, '2021-06-12 21:25:49'),
(6, '8499.00', 0, 2, '2021-06-12 21:25:49'),
(7, '315.00', 1, 1, '2021-06-12 21:25:49'),
(8, '2687.00', 2, 2, '2021-06-12 21:25:49'),
(9, '5999.00', 3, 1, '2021-06-12 21:25:49'),
(10, '6068.00', 4, 1, '2021-06-12 22:04:39');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(16) NOT NULL,
  `nickname` varchar(32) NOT NULL,
  `account` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `isLogout` tinyint(1) NOT NULL,
  `regTime` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`uid`, `nickname`, `account`, `status`, `isLogout`, `regTime`) VALUES
(1, 'ashin', 'ashin', 0, 0, '2021-06-08 23:25:11'),
(2, 'cobin', 'cobin', 0, 0, '2021-06-08 23:50:17'),
(3, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(4, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(5, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(6, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(7, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(8, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(9, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(10, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(11, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(12, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(13, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(14, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(15, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(16, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(17, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(18, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(19, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(20, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(21, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(22, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(23, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(24, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(25, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:52'),
(26, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(27, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(28, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(29, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(30, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(31, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(32, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(33, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(34, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(35, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(36, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(37, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(38, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(39, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(40, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(41, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(42, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(43, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(44, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(45, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(46, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(47, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(48, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(49, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(50, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(51, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(52, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(53, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(54, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(55, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(56, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(57, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(58, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(59, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(60, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(61, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(62, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(63, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(64, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(65, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(66, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(67, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(68, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(69, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(70, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(71, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(72, 'ashin', 'ashin', 0, 0, '2021-06-08 23:56:53'),
(73, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(74, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(75, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(76, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(77, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(78, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(79, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(80, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(81, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(82, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(83, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(84, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(85, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(86, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(87, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(88, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(89, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(90, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(91, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(92, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(93, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(94, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(95, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(96, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(97, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(98, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(99, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(100, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(101, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(102, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(103, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(104, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(105, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(106, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(107, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(108, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(109, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(110, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(111, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(112, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(113, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(114, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(115, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(116, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(117, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(118, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(119, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(120, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(121, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(122, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(123, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(124, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:25'),
(125, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(126, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(127, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(128, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(129, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(130, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(131, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(132, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(133, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(134, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(135, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(136, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(137, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(138, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(139, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(140, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(141, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(142, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(143, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(144, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(145, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(146, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(147, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(148, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(149, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(150, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(151, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(152, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(153, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(154, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(155, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(156, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(157, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(158, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(159, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(160, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(161, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(162, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(163, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(164, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(165, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(166, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(167, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(168, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(169, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(170, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(171, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(172, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(173, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(174, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(175, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(176, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(177, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(178, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(179, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(180, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(181, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(182, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(183, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(184, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(185, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(186, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(187, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(188, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(189, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(190, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(191, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(192, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(193, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(194, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(195, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(196, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(197, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(198, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(199, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(200, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(201, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(202, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(203, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(204, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(205, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(206, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(207, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(208, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(209, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(210, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(211, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(212, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(213, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(214, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(215, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(216, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(217, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(218, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(219, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(220, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(221, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(222, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(223, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(224, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(225, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(226, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(227, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(228, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(229, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(230, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(231, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(232, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(233, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(234, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(235, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(236, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(237, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(238, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(239, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(240, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(241, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(242, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(243, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(244, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(245, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(246, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(247, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(248, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(249, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(250, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(251, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(252, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(253, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(254, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(255, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(256, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(257, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(258, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(259, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(260, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(261, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(262, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(263, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(264, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(265, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(266, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(267, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(268, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(269, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(270, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(271, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(272, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(273, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(274, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(275, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(276, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(277, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(278, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(279, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(280, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(281, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(282, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(283, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(284, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(285, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(286, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(287, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(288, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(289, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:26'),
(290, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:27'),
(291, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:27'),
(292, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:27'),
(293, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:27'),
(294, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:27'),
(295, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:27'),
(296, 'ashin', 'ashin', 0, 0, '2021-06-08 23:57:27');

--
-- 转储表的索引
--

--
-- 表的索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`);

--
-- 表的索引 `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`imageID`);

--
-- 表的索引 `classify`
--
ALTER TABLE `classify`
  ADD PRIMARY KEY (`classID`),
  ADD UNIQUE KEY `className` (`className`);

--
-- 表的索引 `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`goodID`),
  ADD KEY `classID` (`classID`);

--
-- 表的索引 `groom`
--
ALTER TABLE `groom`
  ADD PRIMARY KEY (`groomID`),
  ADD KEY `goodID` (`goodID`);

--
-- 表的索引 `hotSale`
--
ALTER TABLE `hotSale`
  ADD PRIMARY KEY (`hotID`),
  ADD KEY `goodID` (`goodID`);

--
-- 表的索引 `newGood`
--
ALTER TABLE `newGood`
  ADD PRIMARY KEY (`newID`),
  ADD KEY `goodID` (`goodID`);

--
-- 表的索引 `orderDetail`
--
ALTER TABLE `orderDetail`
  ADD PRIMARY KEY (`did`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `goodID` (`goodID`);

--
-- 表的索引 `orderInfo`
--
ALTER TABLE `orderInfo`
  ADD PRIMARY KEY (`orderID`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `carousel`
--
ALTER TABLE `carousel`
  MODIFY `imageID` int(11) NOT NULL AUTO_INCREMENT COMMENT '轮播图ID', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `classify`
--
ALTER TABLE `classify`
  MODIFY `classID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- 使用表AUTO_INCREMENT `goods`
--
ALTER TABLE `goods`
  MODIFY `goodID` int(16) NOT NULL AUTO_INCREMENT COMMENT '商品ID', AUTO_INCREMENT=39;

--
-- 使用表AUTO_INCREMENT `groom`
--
ALTER TABLE `groom`
  MODIFY `groomID` int(16) NOT NULL AUTO_INCREMENT COMMENT '推荐ID', AUTO_INCREMENT=47;

--
-- 使用表AUTO_INCREMENT `hotSale`
--
ALTER TABLE `hotSale`
  MODIFY `hotID` int(16) NOT NULL AUTO_INCREMENT COMMENT '热卖ID', AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `newGood`
--
ALTER TABLE `newGood`
  MODIFY `newID` int(16) NOT NULL AUTO_INCREMENT COMMENT '新品ID', AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `orderDetail`
--
ALTER TABLE `orderDetail`
  MODIFY `did` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `orderInfo`
--
ALTER TABLE `orderInfo`
  MODIFY `orderID` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- 限制导出的表
--

--
-- 限制表 `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`classID`) REFERENCES `classify` (`classID`);

--
-- 限制表 `groom`
--
ALTER TABLE `groom`
  ADD CONSTRAINT `groom_ibfk_1` FOREIGN KEY (`goodID`) REFERENCES `goods` (`goodID`);

--
-- 限制表 `hotSale`
--
ALTER TABLE `hotSale`
  ADD CONSTRAINT `hotsale_ibfk_1` FOREIGN KEY (`goodID`) REFERENCES `goods` (`goodID`);

--
-- 限制表 `newGood`
--
ALTER TABLE `newGood`
  ADD CONSTRAINT `newgood_ibfk_1` FOREIGN KEY (`goodID`) REFERENCES `goods` (`goodID`);

--
-- 限制表 `orderDetail`
--
ALTER TABLE `orderDetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orderInfo` (`orderID`),
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`goodID`) REFERENCES `goods` (`goodID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
