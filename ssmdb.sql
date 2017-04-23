-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 03 月 09 日 18:10
-- 服务器版本: 5.6.12-log
-- PHP 版本: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `ssmdb`
--
CREATE DATABASE IF NOT EXISTS `ssmdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ssmdb`;

-- --------------------------------------------------------

--
-- 表的结构 `tb_menu`
--

CREATE TABLE IF NOT EXISTS `tb_menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_PRICE` decimal(10,2) DEFAULT NULL,
  `MENU_DES` varchar(1000) DEFAULT NULL,
  `MENU_COST` decimal(10,2) DEFAULT NULL,
  `IS_DELETE` varchar(255) DEFAULT NULL,
  `PIC_URL` varchar(1000) DEFAULT NULL,
  `PIC_URL_S` varchar(1000) DEFAULT NULL,
  `TYPE` int(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `tb_menu`
--

INSERT INTO `tb_menu` (`ID`, `MENU_NAME`, `MENU_PRICE`, `MENU_DES`, `MENU_COST`, `IS_DELETE`, `PIC_URL`, `PIC_URL_S`, `TYPE`) VALUES
(7, '水煮肉片', '99.00', '肉味香辣，软嫩，易嚼。吃时肉嫩菜鲜 ，汤红油亮，麻辣味浓，最宜下饭，为家常美食之一。特色是“麻、辣、鲜、香”。', '45.00', '0', 'D:/upload/1457357887776.jpg', 'D:/upload/1457357887786.jpg', 1),
(8, '清蒸龙虾', '269.00', '蛋白质含量高、氨基酸丰富 龙 虾 的蛋白质含量高于大多数的淡水和海水鱼虾，其氨基酸组成优于肉类，含有人体所必需的而体内又不能合成或合成量不足的8种必需氨基酸。', '150.00', '0', 'D:/upload/1456046443427.jpg', 'D:/upload/1456046443437.jpg', 5),
(9, '椰汁炖官燕', '488.00', '现代医学发现，燕窝可促进免疫功能，有延缓人体衰老，延年益寿的功效。', '200.00', '0', 'D:/upload/1456046283092.jpg', 'D:/upload/1456046283102.jpg', 6),
(10, '牛蒡淮山排骨汤', '89.00', '牛蒡鲜淮山排骨汤，牛蒡和淮山的功效是众所周知的，生津清火，补肾益气、养心滋精。', '30.00', '0', 'D:/upload/1457358139711.jpg', 'D:/upload/1457358139721.jpg', 7);

-- --------------------------------------------------------

--
-- 表的结构 `tb_menuconf`
--

CREATE TABLE IF NOT EXISTS `tb_menuconf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) DEFAULT NULL,
  `ICON` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=107 ;

--
-- 转存表中的数据 `tb_menuconf`
--

INSERT INTO `tb_menuconf` (`ID`, `PID`, `ICON`, `URL`, `NAME`) VALUES
(100, 0, 'icon-dashboard', 'chart.jsp', '数据统计'),
(102, 0, 'icon-desktop', 'menuManage.jsp', '菜单管理'),
(103, 0, 'icon-picture', 'typeManage.jsp', '座位管理'),
(104, 0, 'icon-edit', 'accountManage.jsp', '账号管理'),
(105, 0, 'icon-folder-open-alt', 'historyOrder.jsp', '历史菜单'),
(106, 0, ' icon-off', 'logout', '退出登录');

-- --------------------------------------------------------

--
-- 表的结构 `tb_message`
--

CREATE TABLE IF NOT EXISTS `tb_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_ID` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `IS_DELETE` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `tb_message`
--

INSERT INTO `tb_message` (`ID`, `TABLE_ID`, `CREATE_TIME`, `IS_DELETE`) VALUES
(1, 2, '2016-02-21 09:18:44', 1),
(2, 1, '2016-02-25 23:01:20', 0),
(3, 1, '2016-02-25 23:02:07', 0),
(4, 1, '2016-02-25 23:02:17', 0),
(5, 1, '2016-04-14 22:13:27', 0);

-- --------------------------------------------------------

--
-- 表的结构 `tb_order`
--

CREATE TABLE IF NOT EXISTS `tb_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_ID` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `ORDER_TIME` datetime DEFAULT NULL,
  `CLIENT_TEL` varchar(255) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '1' COMMENT '0 订单过期 1正常 2结算订单',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1047 ;

--
-- 转存表中的数据 `tb_order`
--

INSERT INTO `tb_order` (`ID`, `TABLE_ID`, `CREATE_TIME`, `ORDER_TIME`, `CLIENT_TEL`, `STATUS`) VALUES
(1, 1, '2016-01-08 15:40:06', '2016-01-13 15:20:02', '13600136000', 0),
(2, 2, '2016-01-08 15:40:09', '2016-01-14 10:00:00', '13600136000', 2),
(1000, 3, '2016-01-01 09:53:29', '2016-01-19 09:53:40', '10086', 2),
(1001, 4, '2016-01-08 15:40:31', '2011-01-15 11:20:00', '13600136000', 0),
(1002, 4, '2016-02-12 19:46:03', '2016-02-12 19:45:00', 'admin', 0),
(1003, 2, '2016-02-12 19:51:32', '2016-02-12 19:50:00', 'admin', 0),
(1004, 1, '2016-02-12 19:53:59', '2016-02-14 21:00:00', 'admin', 0),
(1005, 1, '2016-02-12 20:02:46', '2016-02-12 20:30:00', 'admin', 2),
(1006, 3, '2016-02-13 14:39:30', '2016-02-13 19:39:00', 'admin', 0),
(1007, 3, '2016-02-13 14:41:46', '2016-02-14 19:30:00', '10000', 0),
(1008, 1, '2016-02-13 15:07:40', '2016-02-13 15:07:00', '10000', 0),
(1009, 3, '2016-02-24 10:49:16', '2016-02-27 10:49:20', NULL, 0),
(1010, 3, '2016-02-21 20:47:38', '2016-02-21 20:47:41', NULL, 0),
(1011, 3, '2016-02-21 20:53:09', '2016-02-21 20:53:12', NULL, 0),
(1012, 3, '2016-02-21 20:56:08', '2016-02-21 20:56:12', NULL, 0),
(1013, 3, '2016-02-21 20:57:29', '2016-02-21 20:57:32', NULL, 0),
(1014, 3, '2016-02-21 20:59:30', '2016-02-21 20:59:34', NULL, 0),
(1015, 3, '2016-02-21 21:00:16', '2016-02-21 21:00:20', NULL, 0),
(1016, 3, '2016-02-21 22:32:20', '2016-02-21 22:32:24', NULL, 0),
(1017, 3, '2016-02-22 22:04:50', '2016-02-22 22:05:02', NULL, 0),
(1018, 3, '2016-02-22 22:19:47', '2016-02-22 22:19:59', NULL, 0),
(1019, 3, '2016-02-22 22:25:39', '2016-02-22 22:25:50', NULL, 0),
(1020, 3, '2016-02-22 22:29:18', '2016-02-22 22:29:30', NULL, 0),
(1021, 3, '2016-02-22 22:34:35', '2016-02-22 22:34:47', NULL, 0),
(1022, 3, '2016-02-22 22:35:42', '2016-02-22 22:35:54', NULL, 0),
(1023, 3, '2016-02-22 22:37:06', '2016-02-22 22:37:18', NULL, 0),
(1024, 3, '2016-02-23 20:20:28', '2016-02-23 20:20:37', NULL, 0),
(1025, 3, '2016-02-23 20:23:19', '2016-02-23 20:23:29', NULL, 0),
(1026, 3, '2016-02-23 20:26:20', '2016-02-23 20:26:30', NULL, 0),
(1027, 3, '2016-02-23 20:33:27', '2016-02-23 20:33:37', NULL, 0),
(1028, 3, '2016-02-23 20:34:06', '2016-02-23 20:34:16', NULL, 0),
(1029, 3, '2016-02-23 20:35:25', '2016-02-23 20:35:35', NULL, 0),
(1030, 3, '2016-02-23 20:36:30', '2016-02-23 20:36:40', NULL, 0),
(1031, 3, '2016-02-23 22:56:52', '2016-02-23 22:57:02', NULL, 0),
(1032, 3, '2016-02-24 21:39:27', '2016-02-24 21:39:43', NULL, 0),
(1033, 1, '2016-02-24 22:14:41', '2016-02-24 22:14:57', NULL, 0),
(1034, 1, '2016-02-24 22:24:54', '2016-02-24 22:25:10', NULL, 0),
(1035, 1, '2016-02-24 22:26:18', '2016-02-24 22:26:34', NULL, 0),
(1036, 1, '2016-02-24 22:28:40', '2016-02-24 22:28:56', NULL, 0),
(1037, 1, '2016-03-07 21:36:35', '2016-03-07 21:38:00', 'admin', 0),
(1038, 4, '2016-03-07 21:43:07', '2016-03-07 21:45:00', 'admin', 0),
(1039, 1, '2016-03-08 20:10:24', '2016-03-08 20:11:24', NULL, 0),
(1040, 1, '2016-04-14 21:26:48', '2016-04-14 21:28:00', 'admin', 0),
(1041, 3, '2016-04-14 21:57:52', '2016-04-15 22:00:00', 'admin', 2),
(1042, 4, '2016-04-14 21:58:31', '2016-05-10 17:00:00', 'admin', 1),
(1043, 1, '2016-04-14 22:13:05', '2016-04-14 22:13:10', NULL, 0),
(1044, 1, '2016-04-14 22:39:21', '2016-04-14 22:39:27', NULL, 0),
(1045, 1, '2016-04-17 11:41:38', '2016-04-17 11:43:00', 'admin', 0),
(1046, 1, '2016-04-17 11:43:34', '2016-04-17 11:43:50', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tb_order_detail`
--

CREATE TABLE IF NOT EXISTS `tb_order_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MENU_ID` int(11) DEFAULT NULL,
  `ORDER_ID` int(11) DEFAULT NULL,
  `SCORE` double(255,0) DEFAULT '10',
  `REMARK` varchar(500) DEFAULT '',
  `COUNT` int(11) DEFAULT NULL,
  `IS_COOK` int(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- 转存表中的数据 `tb_order_detail`
--

INSERT INTO `tb_order_detail` (`ID`, `MENU_ID`, `ORDER_ID`, `SCORE`, `REMARK`, `COUNT`, `IS_COOK`) VALUES
(1, 8, 1, 9, ' ', 2, 1),
(2, 7, 1, 8, ' ', 3, 1),
(3, 9, 1005, 10, ' ', 1, 1),
(4, 8, 1005, 10, ' ', 2, 0),
(5, 7, 1005, 10, ' ', 1, 0),
(6, 9, 1006, 10, ' ', 1, 0),
(7, 8, 1007, 10, ' ', 1, 0),
(8, 7, 1007, 10, ' ', 1, 0),
(9, 9, 1007, 10, ' ', 1, 0),
(10, 8, 1013, 10, 'rrr', 1, 0),
(11, 7, 1014, 10, ' ', 1, 0),
(12, 8, 1014, 10, ' ', 2, 0),
(13, 8, 1015, 10, ' ', 1, 0),
(14, 9, 1015, 10, ' ', 1, 0),
(15, 7, 1016, 10, ' ', 2, 0),
(16, 9, 1016, 10, ' ', 1, 0),
(17, 7, 1017, 10, ' ', 1, 0),
(18, 9, 1017, 10, ' ', 1, 0),
(19, 8, 1017, 10, ' ', 1, 0),
(20, 8, 1018, 10, ' ', 1, 0),
(21, 9, 1018, 10, ' ', 1, 0),
(22, 7, 1018, 10, ' ', 2, 0),
(23, 9, 1019, 8, ' ', 1, 0),
(24, 7, 1019, 8, ' ', 1, 0),
(25, 8, 1019, 10, ' ', 1, 0),
(26, 9, 1020, 10, ' ', 1, 0),
(27, 9, 1021, 10, 'tttt', 1, 0),
(28, 8, 1021, 10, 'yyyyyy', 1, 0),
(29, 8, 1022, 10, ' ', 2, 0),
(30, 9, 1022, 10, ' ', 1, 0),
(31, 9, 1023, 10, ' ', 1, 0),
(32, 8, 1023, 10, ' ', 1, 0),
(33, 9, 1024, 10, ' ', 1, 0),
(34, 8, 1024, 10, ' ', 1, 0),
(35, 9, 1025, 10, 'tttt', 1, 0),
(36, 8, 1025, 10, 'uuuuuu', 1, 0),
(37, 9, 1026, 10, ' ', 1, 0),
(38, 7, 1026, 10, ' ', 1, 0),
(39, 8, 1026, 10, ' ', 1, 0),
(40, 7, 1027, 10, 'yyyyy', 1, 0),
(41, 9, 1027, 10, 'rrrrrr', 1, 0),
(42, 8, 1027, 10, 'gggggg', 2, 0),
(43, 7, 1028, 10, NULL, 1, 0),
(44, 9, 1028, 10, NULL, 1, 0),
(45, 8, 1028, 10, NULL, 1, 0),
(46, 9, 1029, 10, ' ', 1, 0),
(47, 8, 1029, 10, ' ', 2, 0),
(48, 8, 1030, 7, 'iiiiii', 1, 0),
(49, 7, 1030, 10, 'ttt', 1, 0),
(50, 9, 1030, 10, 'yyyy', 1, 0),
(51, 7, 1031, 10, ' ', 1, 0),
(52, 9, 1031, 10, ' ', 1, 0),
(53, 9, 1032, 10, ' ', 1, 0),
(54, 8, 1032, 10, ' ', 1, 0),
(55, 9, 1033, 10, ' ', 1, 0),
(56, 9, 1034, 10, ' ', 1, 0),
(57, 8, 1034, 10, ' ', 1, 0),
(58, 7, 1035, 10, ' ', 1, 0),
(59, 9, 1036, 10, ' ', 1, 0),
(60, 8, 1037, 10, NULL, 1, 0),
(61, 9, 1037, 10, NULL, 1, 0),
(62, 7, 1037, 10, NULL, 2, 0),
(63, 10, 1038, 10, NULL, 2, 0),
(64, 10, 1039, 8, '少盐', 1, 0),
(65, 8, 1039, 10, ' ', 1, 0),
(66, 10, 1040, 10, NULL, 1, 0),
(67, 8, 1040, 10, NULL, 1, 0),
(68, 9, 1040, 10, NULL, 2, 0),
(69, 7, 1040, 10, NULL, 2, 0),
(70, 8, 1041, 10, NULL, 1, 0),
(71, 10, 1041, 10, NULL, 1, 0),
(72, 7, 1041, 10, NULL, 2, 0),
(73, 10, 1042, 10, NULL, 1, 0),
(74, 8, 1042, 10, NULL, 1, 0),
(75, 7, 1042, 10, NULL, 2, 0),
(76, 7, 1043, 8, ' ', 1, 0),
(77, 10, 1043, 10, '少盐', 2, 0),
(78, 9, 1043, 10, ' ', 1, 0),
(79, 10, 1044, 8, ' ', 1, 0),
(80, 9, 1044, 10, '少盐', 1, 0),
(81, 8, 1044, 10, ' ', 2, 0),
(82, 8, 1045, 10, NULL, 1, 0),
(83, 10, 1045, 10, NULL, 2, 0),
(84, 7, 1045, 10, NULL, 1, 0),
(85, 7, 1046, 8, ' ', 1, 0);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `tb_order_detail_v`
--
CREATE TABLE IF NOT EXISTS `tb_order_detail_v` (
`ID` int(11)
,`MENU_ID` int(11)
,`MENU_NAME` varchar(255)
,`PRICE` decimal(10,2)
,`CREATE_TIME` datetime
,`ORDER_TIME` datetime
,`TABLE_NAME` varchar(255)
,`ORDER_ID` int(11)
,`SCORE` double(255,0)
,`REMARK` varchar(500)
,`COUNT` int(11)
,`IS_COOK` int(255)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `tb_order_v`
--
CREATE TABLE IF NOT EXISTS `tb_order_v` (
`ID` int(11)
,`TOTALPRICE` decimal(42,2)
,`TOTALCOST` decimal(42,2)
,`ORDER_TIME` datetime
,`CREATE_TIME` datetime
,`STATUS` int(11)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `tb_order_v2`
--
CREATE TABLE IF NOT EXISTS `tb_order_v2` (
`ID` int(11)
,`TABLE_NAME` varchar(255)
,`CREATE_TIME` datetime
,`ORDER_TIME` datetime
,`CLIENT_TEL` varchar(255)
,`STATUS` int(11)
,`USER_NAME` varchar(255)
,`TOTAL` decimal(42,2)
);
-- --------------------------------------------------------

--
-- 表的结构 `tb_table`
--

CREATE TABLE IF NOT EXISTS `tb_table` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_DES` varchar(500) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL COMMENT '可坐人数',
  `TABLE_NAME` varchar(255) DEFAULT NULL,
  `TYPE` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `tb_table`
--

INSERT INTO `tb_table` (`ID`, `TABLE_DES`, `COUNT`, `TABLE_NAME`, `TYPE`) VALUES
(1, '一楼A区', 3, 'A06', '大厅桌子'),
(2, '三楼C区', 12, 'C13', '包房'),
(3, '一楼A区', 5, 'A04', '大厅桌子'),
(4, '二楼D区', 2, 'D01', '大厅桌子');

-- --------------------------------------------------------

--
-- 表的结构 `tb_test`
--

CREATE TABLE IF NOT EXISTS `tb_test` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `tb_test`
--

INSERT INTO `tb_test` (`ID`, `NAME`, `DATE`) VALUES
(1, '名字测试', '2010-11-21 00:00:00'),
(2, '0000', '2015-12-30 15:23:23'),
(3, '0000', '2015-12-30 15:37:46'),
(4, '787', '2015-12-30 15:38:12'),
(5, '787', '2015-12-30 15:39:05'),
(6, '787', '2015-12-30 15:43:32'),
(7, '787', '2015-12-30 15:46:27'),
(8, '787', '2015-12-30 15:53:31'),
(9, '787', '2015-12-30 16:00:15'),
(11, '787', '2015-12-30 16:14:31'),
(12, '787', '2015-12-30 16:15:52'),
(13, '787', '2015-12-30 16:22:24'),
(14, '787', '2015-12-30 16:24:53'),
(15, '787', '2015-12-30 16:30:47'),
(16, '787', '2015-12-30 17:19:13'),
(17, '787', '2015-12-30 17:19:13'),
(18, '787', '2015-12-31 11:21:01'),
(19, '787', '2015-12-31 11:28:43'),
(20, '787', '2015-12-31 11:32:26'),
(21, '787', '2015-12-31 11:47:26'),
(22, '787', '2015-12-31 11:59:29'),
(23, '787', '2015-12-31 12:02:39'),
(24, '787', '2015-12-31 12:04:10'),
(25, '787', '2015-12-31 12:06:11'),
(26, '787', '2015-12-31 12:13:32'),
(27, '787', '2015-12-31 12:22:49'),
(28, '787', '2015-12-31 12:26:02'),
(29, '787', '2015-12-31 12:27:22'),
(30, '787', '2015-12-31 14:49:50');

-- --------------------------------------------------------

--
-- 表的结构 `tb_typeconf`
--

CREATE TABLE IF NOT EXISTS `tb_typeconf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `tb_typeconf`
--

INSERT INTO `tb_typeconf` (`ID`, `TYPE_NAME`) VALUES
(1, '特色菜'),
(2, '饮料'),
(3, '冷菜'),
(4, '热菜'),
(5, '河海湖鲜'),
(6, '燕鲍翅参'),
(7, '汤炖品'),
(8, '时蔬'),
(9, '甜品');

-- --------------------------------------------------------

--
-- 表的结构 `tb_user`
--

CREATE TABLE IF NOT EXISTS `tb_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) DEFAULT NULL,
  `ACCOUNT` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `FLAG` int(11) DEFAULT NULL COMMENT '账号类型标志位',
  `TEL` varchar(255) DEFAULT NULL,
  `IS_DELETE` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `tb_user`
--

INSERT INTO `tb_user` (`ID`, `USERNAME`, `ACCOUNT`, `PASSWORD`, `FLAG`, `TEL`, `IS_DELETE`) VALUES
(3, '超级管理员', 'admin', '21232F297A57A5A743894A0E4A801FC3', 0, '13800138000', 0),
(4, '787', '10', '202CB962AC59075B964B07152D234B70', 1, '13500135000', 0),
(5, '测试', '123abc', '202CB962AC59075B964B07152D234B70', 3, '13567834126', 0),
(6, '787', '100', NULL, 1, '13500135001', 0),
(7, '222', '123111', '21232F297A57A5A743894A0E4A801FC3', 2, '10001', 0),
(8, '侧his', '567', '202CB962AC59075B964B07152D234B70', 0, '10086', 0),
(9, '手机测试', '10000', '827CCB0EEA8A706C4C34A16891F84E7B', 4, '10000', 0),
(10, '张小明', '13300000000', '670B14728AD9902AECBA32E22FA4F6BD', 3, '13300000000', 0),
(11, '李四', '13200000000', '670B14728AD9902AECBA32E22FA4F6BD', 2, '13200000000', 0);

-- --------------------------------------------------------

--
-- 视图结构 `tb_order_detail_v`
--
DROP TABLE IF EXISTS `tb_order_detail_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `tb_order_detail_v` AS select `tb_order_detail`.`ID` AS `ID`,`tb_order_detail`.`MENU_ID` AS `MENU_ID`,(select `tb_menu`.`MENU_NAME` from `tb_menu` where (`tb_menu`.`ID` = `tb_order_detail`.`MENU_ID`)) AS `MENU_NAME`,(select `tb_menu`.`MENU_PRICE` from `tb_menu` where (`tb_menu`.`ID` = `tb_order_detail`.`MENU_ID`)) AS `PRICE`,(select `tb_order`.`CREATE_TIME` from `tb_order` where (`tb_order`.`ID` = `tb_order_detail`.`ORDER_ID`)) AS `CREATE_TIME`,(select `tb_order`.`ORDER_TIME` from `tb_order` where (`tb_order`.`ID` = `tb_order_detail`.`ORDER_ID`)) AS `ORDER_TIME`,(select `tb_table`.`TABLE_NAME` from `tb_table` where (`tb_table`.`ID` = (select `tb_order`.`TABLE_ID` from `tb_order` where (`tb_order`.`ID` = `tb_order_detail`.`ORDER_ID`)))) AS `TABLE_NAME`,`tb_order_detail`.`ORDER_ID` AS `ORDER_ID`,`tb_order_detail`.`SCORE` AS `SCORE`,`tb_order_detail`.`REMARK` AS `REMARK`,`tb_order_detail`.`COUNT` AS `COUNT`,`tb_order_detail`.`IS_COOK` AS `IS_COOK` from `tb_order_detail`;

-- --------------------------------------------------------

--
-- 视图结构 `tb_order_v`
--
DROP TABLE IF EXISTS `tb_order_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tb_order_v` AS select `t`.`ID` AS `ID`,ifnull((select sum((`d`.`COUNT` * (select `m`.`MENU_PRICE` from `tb_menu` `m` where (`m`.`ID` = `d`.`MENU_ID`)))) from `tb_order_detail` `d` where (`d`.`ORDER_ID` = `t`.`ID`)),0) AS `TOTALPRICE`,ifnull((select sum((`d`.`COUNT` * (select `m`.`MENU_COST` from `tb_menu` `m` where (`m`.`ID` = `d`.`MENU_ID`)))) from `tb_order_detail` `d` where (`d`.`ORDER_ID` = `t`.`ID`)),0) AS `TOTALCOST`,`t`.`ORDER_TIME` AS `ORDER_TIME`,`t`.`CREATE_TIME` AS `CREATE_TIME`,`t`.`STATUS` AS `STATUS` from `tb_order` `t` where (`t`.`STATUS` <> 1);

-- --------------------------------------------------------

--
-- 视图结构 `tb_order_v2`
--
DROP TABLE IF EXISTS `tb_order_v2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `tb_order_v2` AS select `t`.`ID` AS `ID`,(select `tb_table`.`TABLE_NAME` from `tb_table` where (`tb_table`.`ID` = `t`.`TABLE_ID`)) AS `TABLE_NAME`,`t`.`CREATE_TIME` AS `CREATE_TIME`,`t`.`ORDER_TIME` AS `ORDER_TIME`,`t`.`CLIENT_TEL` AS `CLIENT_TEL`,`t`.`STATUS` AS `STATUS`,(select `tb_user`.`USERNAME` from `tb_user` where (`tb_user`.`TEL` = `t`.`CLIENT_TEL`)) AS `USER_NAME`,(select sum(((select `tb_menu`.`MENU_PRICE` from `tb_menu` where (`tb_menu`.`ID` = `b`.`MENU_ID`)) * `b`.`COUNT`)) from `tb_order_detail` `b` where (`b`.`ORDER_ID` = `t`.`ID`) group by `b`.`ORDER_ID`) AS `TOTAL` from `tb_order` `t`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
