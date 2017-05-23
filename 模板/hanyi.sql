/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : hanyi

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-03-21 19:16:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `active`
-- ----------------------------
DROP TABLE IF EXISTS `active`;
CREATE TABLE `active` (
  `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//活动id',
  `act_name` varchar(64) NOT NULL COMMENT '//活动名字',
  `act_desc` text NOT NULL COMMENT '//活动描述',
  `start_time` varchar(64) NOT NULL DEFAULT '',
  `end_time` varchar(64) NOT NULL DEFAULT '',
  `is_show` enum('0','1') DEFAULT '0' COMMENT '//是否显示在首页推荐活动上',
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of active
-- ----------------------------
INSERT INTO `active` VALUES ('1', '秒杀活动', '活动准时开抢', '2017-02-17 00:00', '2017-02-18 00:00', '1');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT COMMENT '//会员id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '//管理员名字',
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(32) NOT NULL DEFAULT '' COMMENT '//注册邮箱',
  `add_time` varchar(32) NOT NULL DEFAULT '' COMMENT '//天假时间',
  `last_time` varchar(32) NOT NULL DEFAULT '' COMMENT '//上次登录时间',
  `is_true` enum('0','1') NOT NULL DEFAULT '0' COMMENT '//是否禁用（0没有禁用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('2', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin.qq.com', '1486879452', '', '0');
INSERT INTO `admin` VALUES ('3', 'admin123', '0192023a7bbd73250516f069df18b500', '55556971@qq.com', '1488116060', '', '0');

-- ----------------------------
-- Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `admin_id` mediumint(9) NOT NULL COMMENT '//管理员id',
  `role_id` mediumint(9) NOT NULL COMMENT '//角色id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('2', '1');
INSERT INTO `admin_role` VALUES ('3', '6');

-- ----------------------------
-- Table structure for `attribute`
-- ----------------------------
DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `attr_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//属性id',
  `attr_name` varchar(64) NOT NULL COMMENT '//属性名字',
  `attr_type` enum('0','1') NOT NULL DEFAULT '0' COMMENT '//1可选 0不可选',
  `attr_value` varchar(128) NOT NULL DEFAULT '' COMMENT '//属性可选值（多个用，分开）',
  `type_id` mediumint(8) unsigned NOT NULL COMMENT '//所在的类型',
  `cat_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '//分类的id',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attribute
-- ----------------------------
INSERT INTO `attribute` VALUES ('1', '颜色', '1', '红色,黑色,白色,灰色', '1', '0');
INSERT INTO `attribute` VALUES ('2', '内存', '1', '32g,64g,128g', '1', '0');
INSERT INTO `attribute` VALUES ('3', '操作系统', '1', 'win,ios,linux', '4', '0');

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brand_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//品牌id',
  `brand_name` varchar(64) NOT NULL COMMENT '//品牌名字',
  `brand_logo` varchar(128) NOT NULL DEFAULT '' COMMENT '//品牌logo',
  `brand_small_logo` varchar(128) NOT NULL DEFAULT '',
  `site_url` varchar(64) NOT NULL COMMENT '//官方网址',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '小米', '', '', 'www.xiaomi.com');
INSERT INTO `brand` VALUES ('2', '华为', 'brand/2017-01-25/58889a7d92bce.jpg', 'brand/2017-01-25/thumb_0_58889a7d92bce.jpg', 'xvgrg');
INSERT INTO `brand` VALUES ('3', '中兴国际', 'brand/2017-01-25/5888b8b536cb9.png', 'brand/2017-01-25/thumb_0_5888b8b536cb9.png', '1111');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//购物车id',
  `good_id` mediumint(8) unsigned NOT NULL COMMENT '//商品id',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '//会员id',
  `good_attr_id` varchar(64) NOT NULL DEFAULT '' COMMENT '//商品属性id',
  `good_number` mediumint(9) unsigned NOT NULL COMMENT '//商品数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cat_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//分类id',
  `cat_name` char(32) NOT NULL,
  `cat_logo` varchar(128) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL COMMENT '//上级分类的id',
  `sort_num` tinyint(3) unsigned NOT NULL COMMENT '//排序数字',
  `show_in_nav` enum('0','1') NOT NULL DEFAULT '0' COMMENT '//是否显示在导航栏',
  `is_true` enum('0','1') NOT NULL DEFAULT '1' COMMENT '//是否显示在分类列表',
  `cat_desc` text NOT NULL COMMENT '//分类描述',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '电器', 'cate/2017-02-15/thumb_0_58a403df74bf2.jpg', '0', '1', '1', '1', '电器真的很好');
INSERT INTO `category` VALUES ('3', '进口美食', 'cate/2017-02-15/thumb_0_58a40366bcf3d.jpg', '0', '1', '0', '1', '进口美食，放心食用');
INSERT INTO `category` VALUES ('15', '家用电器', 'cate/2017-02-05/thumb_0_5896d452954ec.jpg', '1', '1', '1', '1', '家用电器就是好');
INSERT INTO `category` VALUES ('16', '电视', '', '15', '0', '0', '1', '电视质量很好');
INSERT INTO `category` VALUES ('17', 'VCD', '', '15', '1', '0', '1', '还很好');
INSERT INTO `category` VALUES ('18', '护肤彩妆', 'cate/2017-02-15/thumb_0_58a40454cf062.jpg', '0', '1', '1', '1', '真的质量很好');
INSERT INTO `category` VALUES ('19', '男士化妆', '', '18', '1', '0', '1', '男人的换装品');
INSERT INTO `category` VALUES ('20', '女士化妆', '', '18', '0', '0', '1', '女人的化妆品');
INSERT INTO `category` VALUES ('21', '牛奶', '', '3', '0', '0', '1', '很好吃');
INSERT INTO `category` VALUES ('22', '零食', '', '3', '1', '1', '1', '进口美食放心 使用');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `good_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//商品id',
  `good_code` varchar(32) NOT NULL DEFAULT '' COMMENT '//商品编号',
  `good_desc` longtext NOT NULL COMMENT '//商品介绍',
  `good_name` varchar(128) NOT NULL DEFAULT '',
  `mar_price` int(10) unsigned NOT NULL COMMENT '//市场价格',
  `shop_price` int(10) unsigned NOT NULL,
  `logo` varchar(64) NOT NULL DEFAULT '' COMMENT '//商品图片',
  `mid_logo` varchar(64) NOT NULL DEFAULT '' COMMENT '//商品缩略图',
  `small_logo` varchar(64) NOT NULL DEFAULT '' COMMENT '//',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '//商品主分类id',
  `act_id` mediumint(8) NOT NULL COMMENT '//活动id',
  `type_id` mediumint(9) NOT NULL DEFAULT '0',
  `brand_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '//品牌',
  `is_on_sale` enum('0','1') NOT NULL DEFAULT '1' COMMENT '//是否上架',
  `is_now` enum('0','1') NOT NULL DEFAULT '1' COMMENT '//是否新品',
  `is_hot` enum('0','1') NOT NULL DEFAULT '1' COMMENT '//是否热卖',
  `is_best` enum('0','1') NOT NULL DEFAULT '1' COMMENT '//是否精品',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '//排序数字',
  `is_delete` enum('0','1') NOT NULL DEFAULT '1' COMMENT '//是否放入回收站',
  `act_price` int(10) NOT NULL COMMENT '//活动价格',
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('2', '', '&lt;p&gt;很好用的手机&lt;/p&gt;', '大米手机', '1200', '1000', 'Goods/2017-02-16/58a5cb4b0adc6.jpg', 'Goods/2017-02-16/mid_58a5cb4b0adc6.jpg', 'Goods/2017-02-16/small_58a5cb4b0adc6.jpg', '15', '1', '0', '1', '1', '1', '1', '1', '0', '1', '900');
INSERT INTO `goods` VALUES ('3', '', '&lt;p&gt;外观很美的手机&lt;/p&gt;', 'oppo9s', '3000', '2800', 'Goods/2017-02-24/58b018ce618b1.jpg', 'Goods/2017-02-24/mid_58b018ce618b1.jpg', 'Goods/2017-02-24/small_58b018ce618b1.jpg', '1', '0', '0', '0', '1', '1', '1', '1', '1', '1', '0');
INSERT INTO `goods` VALUES ('6', '', '&lt;p&gt;为发烧而生&lt;/p&gt;', '小米手机', '1999', '1899', 'Goods/2017-02-24/58afff94c4adb.jpg', 'Goods/2017-02-24/mid_58afff94c4adb.jpg', 'Goods/2017-02-24/small_58afff94c4adb.jpg', '1', '0', '0', '1', '1', '1', '1', '1', '0', '1', '0');
INSERT INTO `goods` VALUES ('9', '', '&lt;p&gt;很好的手机&lt;/p&gt;', '小米2s', '200', '150', 'Goods/2017-02-24/58b0004144962.jpg', 'Goods/2017-02-24/mid_58b0004144962.jpg', 'Goods/2017-02-24/small_58b0004144962.jpg', '1', '0', '1', '2', '1', '1', '1', '1', '0', '1', '0');
INSERT INTO `goods` VALUES ('10', '', '&lt;p&gt;手机很漂亮&lt;/p&gt;', '红米3', '900', '890', 'Goods/2017-02-24/58b001ea6e421.jpg', 'Goods/2017-02-24/mid_58b001ea6e421.jpg', 'Goods/2017-02-24/small_58b001ea6e421.jpg', '1', '0', '1', '1', '1', '1', '1', '1', '0', '0', '0');
INSERT INTO `goods` VALUES ('12', '', '&lt;p&gt;很好用&lt;/p&gt;', '芦荟胶', '111', '100', 'Goods/2017-02-24/58b00256037da.jpg', 'Goods/2017-02-24/mid_58b00256037da.jpg', 'Goods/2017-02-24/small_58b00256037da.jpg', '18', '0', '3', '0', '1', '1', '1', '1', '0', '0', '0');
INSERT INTO `goods` VALUES ('13', '', '&lt;p&gt;很好吃&lt;/p&gt;', '薯片', '111', '100', 'Goods/2017-02-24/58b003115d03b.jpg', 'Goods/2017-02-24/mid_58b003115d03b.jpg', 'Goods/2017-02-24/small_58b003115d03b.jpg', '3', '0', '2', '0', '1', '1', '1', '1', '0', '0', '0');
INSERT INTO `goods` VALUES ('14', '', '&lt;p&gt;放心使用，阿尔卑斯山奶源&lt;/p&gt;', '奶粉', '111', '100', 'Goods/2017-02-24/58b003776ae45.jpg', 'Goods/2017-02-24/mid_58b003776ae45.jpg', 'Goods/2017-02-24/small_58b003776ae45.jpg', '3', '0', '2', '0', '1', '1', '1', '1', '0', '0', '0');
INSERT INTO `goods` VALUES ('15', '', '', 'jgbhjb', '1411', '1400', 'Goods/2017-01-30/588ee5adafb76.jpg', 'Goods/2017-01-30/thumb_0_588ee5adafb76.jpg', 'Goods/2017-01-30/thumb_1_588ee5adafb76.jpg', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '0');
INSERT INTO `goods` VALUES ('16', '', '', 'BB霜', '1200', '1100', 'Goods/2017-02-24/58b004359b52c.jpg', 'Goods/2017-02-24/mid_58b004359b52c.jpg', 'Goods/2017-02-24/small_58b004359b52c.jpg', '18', '0', '3', '0', '1', '1', '1', '1', '0', '0', '0');
INSERT INTO `goods` VALUES ('17', '', '&lt;p&gt;很好用&lt;/p&gt;', 'CC', '1200', '1100', 'Goods/2017-02-24/58b004862f3ba.jpg', 'Goods/2017-02-24/mid_58b004862f3ba.jpg', 'Goods/2017-02-24/small_58b004862f3ba.jpg', '18', '0', '3', '0', '1', '1', '1', '1', '0', '0', '0');
INSERT INTO `goods` VALUES ('18', '', '&lt;p&gt;很好吃&lt;/p&gt;', '薯条', '1200', '1100', 'Goods/2017-02-24/58b003c74e1f3.jpg', 'Goods/2017-02-24/mid_58b003c74e1f3.jpg', 'Goods/2017-02-24/small_58b003c74e1f3.jpg', '3', '0', '2', '0', '1', '1', '1', '1', '0', '0', '0');
INSERT INTO `goods` VALUES ('19', '', '&lt;p&gt;很好&lt;/p&gt;', '小米笔记本', '10000', '5000', 'Goods/2017-02-24/58b004e169db9.jpg', 'Goods/2017-02-24/mid_58b004e169db9.jpg', 'Goods/2017-02-24/small_58b004e169db9.jpg', '1', '0', '0', '1', '1', '1', '1', '1', '0', '1', '0');
INSERT INTO `goods` VALUES ('20', '', '', '笔记本', '2000', '1500', 'Goods/2017-02-24/58b00511120e0.jpg', 'Goods/2017-02-24/mid_58b00511120e0.jpg', 'Goods/2017-02-24/small_58b00511120e0.jpg', '1', '0', '4', '2', '1', '1', '1', '1', '0', '1', '0');
INSERT INTO `goods` VALUES ('21', '', '', '神州', '2000', '1000', 'Goods/2017-02-24/58b0054845d17.jpg', 'Goods/2017-02-24/mid_58b0054845d17.jpg', 'Goods/2017-02-24/small_58b0054845d17.jpg', '1', '0', '0', '0', '1', '1', '1', '1', '0', '1', '0');
INSERT INTO `goods` VALUES ('24', '', '', '抽油烟机', '10000', '5000', 'Goods/2017-02-24/58b00293d64a1.jpg', 'Goods/2017-02-24/mid_58b00293d64a1.jpg', 'Goods/2017-02-24/small_58b00293d64a1.jpg', '1', '0', '0', '0', '1', '1', '1', '1', '0', '1', '0');
INSERT INTO `goods` VALUES ('25', '', '&lt;p&gt;好看的手机&lt;/p&gt;', '华为p9', '100', '98', 'Goods/2017-02-24/58b00151b719e.jpg', 'Goods/2017-02-24/mid_58b00151b719e.jpg', 'Goods/2017-02-24/small_58b00151b719e.jpg', '1', '0', '1', '2', '1', '1', '1', '1', '0', '0', '0');
INSERT INTO `goods` VALUES ('26', '', '', '芦荟胶', '1000', '998', 'Goods/2017-02-24/58afff2cb153f.jpg', 'Goods/2017-02-24/mid_58afff2cb153f.jpg', 'Goods/2017-02-24/small_58afff2cb153f.jpg', '18', '1', '1', '0', '1', '1', '1', '1', '0', '0', '200');
INSERT INTO `goods` VALUES ('27', '', '', '华硕电脑', '500', '490', 'Goods/2017-02-24/58affde23e1dd.jpg', 'Goods/2017-02-24/mid_58affde23e1dd.jpg', 'Goods/2017-02-24/small_58affde23e1dd.jpg', '1', '1', '1', '2', '1', '1', '1', '1', '0', '0', '300');
INSERT INTO `goods` VALUES ('28', '', '&lt;p&gt;很好的一款电脑&lt;/p&gt;', '神州笔记本', '4000', '3900', 'Goods/2017-02-15/58a4383cbc1a3.jpg', 'Goods/2017-02-15/thumb_0_58a4383cbc1a3.jpg', 'Goods/2017-02-15/thumb_1_58a4383cbc1a3.jpg', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '3500');

-- ----------------------------
-- Table structure for `goods_attr`
-- ----------------------------
DROP TABLE IF EXISTS `goods_attr`;
CREATE TABLE `goods_attr` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` mediumint(8) unsigned NOT NULL,
  `attr_id` mediumint(8) unsigned NOT NULL COMMENT '//属性id',
  `attr_value` varchar(64) NOT NULL DEFAULT '',
  `attr_pic` decimal(10,2) NOT NULL COMMENT '//商品属性价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_attr
-- ----------------------------
INSERT INTO `goods_attr` VALUES ('1', '26', '1', '红色', '50.00');
INSERT INTO `goods_attr` VALUES ('2', '26', '1', '白色', '200.00');
INSERT INTO `goods_attr` VALUES ('3', '26', '2', '128g', '400.00');
INSERT INTO `goods_attr` VALUES ('4', '26', '2', '64g', '300.00');
INSERT INTO `goods_attr` VALUES ('5', '27', '1', '白色', '20.00');
INSERT INTO `goods_attr` VALUES ('7', '27', '2', '128g', '300.00');
INSERT INTO `goods_attr` VALUES ('8', '27', '2', '64g', '200.00');
INSERT INTO `goods_attr` VALUES ('9', '26', '1', '黑色', '150.00');
INSERT INTO `goods_attr` VALUES ('10', '28', '1', '红色', '100.00');
INSERT INTO `goods_attr` VALUES ('11', '28', '1', '黑色', '0.00');
INSERT INTO `goods_attr` VALUES ('12', '28', '2', '128g', '100.00');
INSERT INTO `goods_attr` VALUES ('13', '9', '1', '红色', '160.00');
INSERT INTO `goods_attr` VALUES ('14', '9', '1', '黑色', '200.00');
INSERT INTO `goods_attr` VALUES ('15', '9', '2', '64g', '100.00');
INSERT INTO `goods_attr` VALUES ('16', '9', '2', '32g', '50.00');
INSERT INTO `goods_attr` VALUES ('17', '25', '1', '红色', '120.00');
INSERT INTO `goods_attr` VALUES ('18', '25', '1', '黑色', '100.00');
INSERT INTO `goods_attr` VALUES ('19', '25', '2', '32g', '20.00');
INSERT INTO `goods_attr` VALUES ('20', '25', '2', '64g', '100.00');
INSERT INTO `goods_attr` VALUES ('21', '10', '1', '白色', '50.00');
INSERT INTO `goods_attr` VALUES ('22', '10', '2', '64g', '100.00');
INSERT INTO `goods_attr` VALUES ('23', '27', '3', 'win', '20.00');

-- ----------------------------
-- Table structure for `goods_number`
-- ----------------------------
DROP TABLE IF EXISTS `goods_number`;
CREATE TABLE `goods_number` (
  `goods_id` mediumint(9) unsigned NOT NULL COMMENT '//商品id',
  `goods_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '//库存量',
  `attr_id_lst` varchar(64) DEFAULT NULL COMMENT '//商品属性，多个属性用字符串'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_number
-- ----------------------------
INSERT INTO `goods_number` VALUES ('2', '30', '');
INSERT INTO `goods_number` VALUES ('3', '30', '');
INSERT INTO `goods_number` VALUES ('6', '30', '');
INSERT INTO `goods_number` VALUES ('7', '12', '');
INSERT INTO `goods_number` VALUES ('10', '30', '');
INSERT INTO `goods_number` VALUES ('12', '30', null);
INSERT INTO `goods_number` VALUES ('13', '30', null);
INSERT INTO `goods_number` VALUES ('14', '30', null);
INSERT INTO `goods_number` VALUES ('15', '40', null);
INSERT INTO `goods_number` VALUES ('16', '30', null);
INSERT INTO `goods_number` VALUES ('17', '30', null);
INSERT INTO `goods_number` VALUES ('19', '30', null);
INSERT INTO `goods_number` VALUES ('20', '30', null);
INSERT INTO `goods_number` VALUES ('21', '30', null);
INSERT INTO `goods_number` VALUES ('18', '30', null);
INSERT INTO `goods_number` VALUES ('24', '30', null);
INSERT INTO `goods_number` VALUES ('25', '30', null);
INSERT INTO `goods_number` VALUES ('26', '30', null);
INSERT INTO `goods_number` VALUES ('28', '40', null);
INSERT INTO `goods_number` VALUES ('27', '30', '5,8,23');
INSERT INTO `goods_number` VALUES ('27', '29', '5,7,23');

-- ----------------------------
-- Table structure for `good_cat`
-- ----------------------------
DROP TABLE IF EXISTS `good_cat`;
CREATE TABLE `good_cat` (
  `good_id` mediumint(8) unsigned NOT NULL COMMENT '//商品id',
  `ct_id` smallint(5) unsigned NOT NULL COMMENT '//扩展分类',
  PRIMARY KEY (`good_id`,`ct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_cat
-- ----------------------------
INSERT INTO `good_cat` VALUES ('2', '16');
INSERT INTO `good_cat` VALUES ('3', '15');
INSERT INTO `good_cat` VALUES ('3', '16');
INSERT INTO `good_cat` VALUES ('6', '15');
INSERT INTO `good_cat` VALUES ('6', '17');
INSERT INTO `good_cat` VALUES ('9', '0');
INSERT INTO `good_cat` VALUES ('9', '15');
INSERT INTO `good_cat` VALUES ('10', '15');
INSERT INTO `good_cat` VALUES ('12', '20');
INSERT INTO `good_cat` VALUES ('13', '22');
INSERT INTO `good_cat` VALUES ('14', '21');
INSERT INTO `good_cat` VALUES ('16', '20');
INSERT INTO `good_cat` VALUES ('17', '20');
INSERT INTO `good_cat` VALUES ('18', '22');
INSERT INTO `good_cat` VALUES ('19', '15');
INSERT INTO `good_cat` VALUES ('19', '16');
INSERT INTO `good_cat` VALUES ('20', '15');
INSERT INTO `good_cat` VALUES ('21', '15');
INSERT INTO `good_cat` VALUES ('21', '16');
INSERT INTO `good_cat` VALUES ('24', '0');
INSERT INTO `good_cat` VALUES ('24', '15');
INSERT INTO `good_cat` VALUES ('25', '15');
INSERT INTO `good_cat` VALUES ('26', '19');
INSERT INTO `good_cat` VALUES ('27', '15');
INSERT INTO `good_cat` VALUES ('27', '16');
INSERT INTO `good_cat` VALUES ('28', '15');

-- ----------------------------
-- Table structure for `good_order`
-- ----------------------------
DROP TABLE IF EXISTS `good_order`;
CREATE TABLE `good_order` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//商品订单关联表id',
  `order_id` mediumint(8) unsigned NOT NULL COMMENT '//订单id',
  `good_id` mediumint(8) unsigned NOT NULL COMMENT '//商品id',
  `good_attr_id` varchar(64) NOT NULL DEFAULT '' COMMENT '//商品属性id',
  `good_num` mediumint(8) unsigned NOT NULL COMMENT '//商品购买数量',
  `price` varchar(16) NOT NULL DEFAULT '' COMMENT '//订单价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_order
-- ----------------------------
INSERT INTO `good_order` VALUES ('1', '6', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('2', '7', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('3', '8', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('4', '9', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('5', '10', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('6', '11', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('7', '12', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('8', '13', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('9', '14', '27', '5,8', '1', '490');
INSERT INTO `good_order` VALUES ('10', '15', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('11', '16', '27', '5,8', '1', '490');
INSERT INTO `good_order` VALUES ('12', '17', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('13', '18', '27', '5,8', '1', '490');
INSERT INTO `good_order` VALUES ('14', '19', '27', '5,8', '1', '490');
INSERT INTO `good_order` VALUES ('15', '20', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('16', '21', '27', '5,8', '1', '490');
INSERT INTO `good_order` VALUES ('17', '22', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('18', '23', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('19', '24', '27', '5,7', '1', '490');
INSERT INTO `good_order` VALUES ('20', '25', '27', '5,7,23', '2', '490');
INSERT INTO `good_order` VALUES ('21', '26', '27', '5,7,23', '1', '490');

-- ----------------------------
-- Table structure for `good_pic`
-- ----------------------------
DROP TABLE IF EXISTS `good_pic`;
CREATE TABLE `good_pic` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` mediumint(8) unsigned NOT NULL,
  `pic` varchar(128) NOT NULL,
  `mid_pic` varchar(128) NOT NULL,
  `sml_pic` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_pic
-- ----------------------------
INSERT INTO `good_pic` VALUES ('16', '9', 'Goods/2017-02-24/58b00041a137b.jpg', 'Goods/2017-02-24/thumb_0_58b00041a137b.jpg', 'Goods/2017-02-24/thumb_1_58b00041a137b.jpg');
INSERT INTO `good_pic` VALUES ('17', '9', 'Goods/2017-02-24/58b00041c59cf.jpg', 'Goods/2017-02-24/thumb_0_58b00041c59cf.jpg', 'Goods/2017-02-24/thumb_1_58b00041c59cf.jpg');
INSERT INTO `good_pic` VALUES ('18', '9', 'Goods/2017-02-24/58b00041e3610.jpg', 'Goods/2017-02-24/thumb_0_58b00041e3610.jpg', 'Goods/2017-02-24/thumb_1_58b00041e3610.jpg');
INSERT INTO `good_pic` VALUES ('19', '25', 'Goods/2017-02-24/58b0015229952.jpg', 'Goods/2017-02-24/thumb_0_58b0015229952.jpg', 'Goods/2017-02-24/thumb_1_58b0015229952.jpg');
INSERT INTO `good_pic` VALUES ('20', '25', 'Goods/2017-02-24/58b0015279be1.jpg', 'Goods/2017-02-24/thumb_0_58b0015279be1.jpg', 'Goods/2017-02-24/thumb_1_58b0015279be1.jpg');
INSERT INTO `good_pic` VALUES ('21', '10', 'Goods/2017-02-24/58b001eac55e8.jpg', 'Goods/2017-02-24/thumb_0_58b001eac55e8.jpg', 'Goods/2017-02-24/thumb_1_58b001eac55e8.jpg');
INSERT INTO `good_pic` VALUES ('22', '10', 'Goods/2017-02-24/58b001eaea8a8.jpg', 'Goods/2017-02-24/thumb_0_58b001eaea8a8.jpg', 'Goods/2017-02-24/thumb_1_58b001eaea8a8.jpg');
INSERT INTO `good_pic` VALUES ('23', '12', 'Goods/2017-02-24/58b0025698f46.jpg', 'Goods/2017-02-24/thumb_0_58b0025698f46.jpg', 'Goods/2017-02-24/thumb_1_58b0025698f46.jpg');
INSERT INTO `good_pic` VALUES ('24', '13', 'Goods/2017-02-24/58b00311a2655.jpg', 'Goods/2017-02-24/thumb_0_58b00311a2655.jpg', 'Goods/2017-02-24/thumb_1_58b00311a2655.jpg');
INSERT INTO `good_pic` VALUES ('25', '13', 'Goods/2017-02-24/58b00311ae6e1.jpg', 'Goods/2017-02-24/thumb_0_58b00311ae6e1.jpg', 'Goods/2017-02-24/thumb_1_58b00311ae6e1.jpg');
INSERT INTO `good_pic` VALUES ('26', '14', 'Goods/2017-02-24/58b00377ba40c.jpg', 'Goods/2017-02-24/thumb_0_58b00377ba40c.jpg', 'Goods/2017-02-24/thumb_1_58b00377ba40c.jpg');
INSERT INTO `good_pic` VALUES ('27', '14', 'Goods/2017-02-24/58b00377d655f.jpg', 'Goods/2017-02-24/thumb_0_58b00377d655f.jpg', 'Goods/2017-02-24/thumb_1_58b00377d655f.jpg');
INSERT INTO `good_pic` VALUES ('28', '18', 'Goods/2017-02-24/58b003c798c15.jpg', 'Goods/2017-02-24/thumb_0_58b003c798c15.jpg', 'Goods/2017-02-24/thumb_1_58b003c798c15.jpg');
INSERT INTO `good_pic` VALUES ('29', '16', 'Goods/2017-02-24/58b004360601c.jpg', 'Goods/2017-02-24/thumb_0_58b004360601c.jpg', 'Goods/2017-02-24/thumb_1_58b004360601c.jpg');
INSERT INTO `good_pic` VALUES ('30', '16', 'Goods/2017-02-24/58b004361dcf1.jpg', 'Goods/2017-02-24/thumb_0_58b004361dcf1.jpg', 'Goods/2017-02-24/thumb_1_58b004361dcf1.jpg');
INSERT INTO `good_pic` VALUES ('31', '17', 'Goods/2017-02-24/58b0048683183.jpg', 'Goods/2017-02-24/thumb_0_58b0048683183.jpg', 'Goods/2017-02-24/thumb_1_58b0048683183.jpg');
INSERT INTO `good_pic` VALUES ('32', '17', 'Goods/2017-02-24/58b004869a970.jpg', 'Goods/2017-02-24/thumb_0_58b004869a970.jpg', 'Goods/2017-02-24/thumb_1_58b004869a970.jpg');
INSERT INTO `good_pic` VALUES ('33', '19', 'Goods/2017-02-24/58b004e1ba966.jpg', 'Goods/2017-02-24/thumb_0_58b004e1ba966.jpg', 'Goods/2017-02-24/thumb_1_58b004e1ba966.jpg');
INSERT INTO `good_pic` VALUES ('34', '20', 'Goods/2017-02-24/58b0051164904.jpg', 'Goods/2017-02-24/thumb_0_58b0051164904.jpg', 'Goods/2017-02-24/thumb_1_58b0051164904.jpg');
INSERT INTO `good_pic` VALUES ('35', '27', 'Goods/2017-02-27/58b3052923efb.jpg', 'Goods/2017-02-27/thumb_0_58b3052923efb.jpg', 'Goods/2017-02-27/thumb_1_58b3052923efb.jpg');
INSERT INTO `good_pic` VALUES ('36', '27', 'Goods/2017-02-27/58b3052a3f498.jpg', 'Goods/2017-02-27/thumb_0_58b3052a3f498.jpg', 'Goods/2017-02-27/thumb_1_58b3052a3f498.jpg');
INSERT INTO `good_pic` VALUES ('37', '27', 'Goods/2017-02-27/58b3054810c41.jpg', 'Goods/2017-02-27/thumb_0_58b3054810c41.jpg', 'Goods/2017-02-27/thumb_1_58b3054810c41.jpg');
INSERT INTO `good_pic` VALUES ('38', '27', 'Goods/2017-02-27/58b305cb451d9.jpg', 'Goods/2017-02-27/thumb_0_58b305cb451d9.jpg', 'Goods/2017-02-27/thumb_1_58b305cb451d9.jpg');
INSERT INTO `good_pic` VALUES ('39', '27', 'Goods/2017-02-27/58b305cc2d7d1.jpg', 'Goods/2017-02-27/thumb_0_58b305cc2d7d1.jpg', 'Goods/2017-02-27/thumb_1_58b305cc2d7d1.jpg');

-- ----------------------------
-- Table structure for `jifen`
-- ----------------------------
DROP TABLE IF EXISTS `jifen`;
CREATE TABLE `jifen` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//主键',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `value` int(10) unsigned NOT NULL COMMENT '//积分值',
  `jifen_from` varchar(64) DEFAULT NULL COMMENT '//积分来源',
  `jifen_to` varchar(64) DEFAULT NULL COMMENT '//积分用途',
  `time` varchar(32) DEFAULT NULL COMMENT '//得到积分时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jifen
-- ----------------------------
INSERT INTO `jifen` VALUES ('1', '1', '399999510', null, null, null);

-- ----------------------------
-- Table structure for `lunbo`
-- ----------------------------
DROP TABLE IF EXISTS `lunbo`;
CREATE TABLE `lunbo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//id',
  `img_url` varchar(64) NOT NULL DEFAULT '' COMMENT '//图片路径',
  `sort` varchar(10) NOT NULL DEFAULT '' COMMENT '//排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lunbo
-- ----------------------------
INSERT INTO `lunbo` VALUES ('1', 'lunbo/2017-02-15/58a3ce186464a.jpg', '2');
INSERT INTO `lunbo` VALUES ('2', 'lunbo/2017-02-15/58a3ce186464a.jpg', '1');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '//用户名',
  `email` varchar(32) NOT NULL DEFAULT '' COMMENT '//邮箱',
  `pwd` char(32) NOT NULL COMMENT '//密码',
  `pic` varchar(128) NOT NULL DEFAULT '' COMMENT '//会员头像',
  `time` varchar(32) NOT NULL DEFAULT '',
  `code` char(4) NOT NULL COMMENT '//邮箱注册码',
  `lavel_id` int(4) NOT NULL DEFAULT '0' COMMENT '//会员等级',
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '//没有激活',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', 'root', '369569711@qq.com', '63a9f0ea7bb98050796b649e85481845', '', '1487406954', '3064', '0', '1');

-- ----------------------------
-- Table structure for `member_level`
-- ----------------------------
DROP TABLE IF EXISTS `member_level`;
CREATE TABLE `member_level` (
  `ml_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `level_name` varchar(32) NOT NULL COMMENT '//等级名称',
  `jifen_buttom` mediumint(8) unsigned NOT NULL COMMENT '//积分下限',
  `jifen_top` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`ml_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_level
-- ----------------------------
INSERT INTO `member_level` VALUES ('1', '青铜会员', '1', '5000');
INSERT INTO `member_level` VALUES ('2', '白银会员', '5001', '10000');
INSERT INTO `member_level` VALUES ('3', '黄金会员', '10001', '15000');
INSERT INTO `member_level` VALUES ('4', '钻石会员', '15001', '20000');

-- ----------------------------
-- Table structure for `member_price`
-- ----------------------------
DROP TABLE IF EXISTS `member_price`;
CREATE TABLE `member_price` (
  `price_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '//商品id',
  `level_id` mediumint(9) NOT NULL COMMENT '//会员等级id',
  `mem_price` varchar(32) NOT NULL COMMENT '//会员价格',
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_price
-- ----------------------------
INSERT INTO `member_price` VALUES ('29', '15', '1', '0');
INSERT INTO `member_price` VALUES ('30', '15', '2', '0');
INSERT INTO `member_price` VALUES ('31', '15', '3', '0');
INSERT INTO `member_price` VALUES ('32', '15', '4', '0');
INSERT INTO `member_price` VALUES ('173', '28', '1', '0');
INSERT INTO `member_price` VALUES ('174', '28', '2', '0');
INSERT INTO `member_price` VALUES ('175', '28', '3', '0');
INSERT INTO `member_price` VALUES ('176', '28', '4', '0');
INSERT INTO `member_price` VALUES ('185', '2', '1', '0');
INSERT INTO `member_price` VALUES ('186', '2', '2', '0');
INSERT INTO `member_price` VALUES ('187', '2', '3', '0');
INSERT INTO `member_price` VALUES ('188', '2', '4', '0');
INSERT INTO `member_price` VALUES ('193', '26', '1', '0');
INSERT INTO `member_price` VALUES ('194', '26', '2', '0');
INSERT INTO `member_price` VALUES ('195', '26', '3', '0');
INSERT INTO `member_price` VALUES ('196', '26', '4', '0');
INSERT INTO `member_price` VALUES ('201', '9', '1', '0');
INSERT INTO `member_price` VALUES ('202', '9', '2', '0');
INSERT INTO `member_price` VALUES ('203', '9', '3', '0');
INSERT INTO `member_price` VALUES ('204', '9', '4', '0');
INSERT INTO `member_price` VALUES ('205', '25', '1', '0');
INSERT INTO `member_price` VALUES ('206', '25', '2', '0');
INSERT INTO `member_price` VALUES ('207', '25', '3', '0');
INSERT INTO `member_price` VALUES ('208', '25', '4', '0');
INSERT INTO `member_price` VALUES ('209', '10', '1', '850');
INSERT INTO `member_price` VALUES ('210', '10', '2', '845');
INSERT INTO `member_price` VALUES ('211', '10', '3', '840');
INSERT INTO `member_price` VALUES ('212', '10', '4', '830');
INSERT INTO `member_price` VALUES ('213', '12', '1', '99');
INSERT INTO `member_price` VALUES ('214', '12', '2', '98');
INSERT INTO `member_price` VALUES ('215', '12', '3', '95');
INSERT INTO `member_price` VALUES ('216', '12', '4', '90');
INSERT INTO `member_price` VALUES ('217', '24', '1', '0');
INSERT INTO `member_price` VALUES ('218', '24', '2', '0');
INSERT INTO `member_price` VALUES ('219', '24', '3', '0');
INSERT INTO `member_price` VALUES ('220', '24', '4', '0');
INSERT INTO `member_price` VALUES ('221', '13', '1', '1111');
INSERT INTO `member_price` VALUES ('222', '13', '2', '1000');
INSERT INTO `member_price` VALUES ('223', '13', '3', '999');
INSERT INTO `member_price` VALUES ('224', '13', '4', '900');
INSERT INTO `member_price` VALUES ('225', '14', '1', '100');
INSERT INTO `member_price` VALUES ('226', '14', '2', '98');
INSERT INTO `member_price` VALUES ('227', '14', '3', '95');
INSERT INTO `member_price` VALUES ('228', '14', '4', '90');
INSERT INTO `member_price` VALUES ('229', '18', '1', '0');
INSERT INTO `member_price` VALUES ('230', '18', '2', '0');
INSERT INTO `member_price` VALUES ('231', '18', '3', '0');
INSERT INTO `member_price` VALUES ('232', '18', '4', '0');
INSERT INTO `member_price` VALUES ('233', '16', '1', '0');
INSERT INTO `member_price` VALUES ('234', '16', '2', '0');
INSERT INTO `member_price` VALUES ('235', '16', '3', '0');
INSERT INTO `member_price` VALUES ('236', '16', '4', '0');
INSERT INTO `member_price` VALUES ('237', '17', '1', '0');
INSERT INTO `member_price` VALUES ('238', '17', '2', '0');
INSERT INTO `member_price` VALUES ('239', '17', '3', '0');
INSERT INTO `member_price` VALUES ('240', '17', '4', '0');
INSERT INTO `member_price` VALUES ('241', '19', '1', '500');
INSERT INTO `member_price` VALUES ('242', '19', '2', '1000');
INSERT INTO `member_price` VALUES ('243', '19', '3', '220');
INSERT INTO `member_price` VALUES ('244', '19', '4', '10');
INSERT INTO `member_price` VALUES ('245', '20', '1', '0');
INSERT INTO `member_price` VALUES ('246', '20', '2', '0');
INSERT INTO `member_price` VALUES ('247', '20', '3', '0');
INSERT INTO `member_price` VALUES ('248', '20', '4', '0');
INSERT INTO `member_price` VALUES ('249', '21', '1', '0');
INSERT INTO `member_price` VALUES ('250', '21', '2', '0');
INSERT INTO `member_price` VALUES ('251', '21', '3', '0');
INSERT INTO `member_price` VALUES ('252', '21', '4', '0');
INSERT INTO `member_price` VALUES ('253', '6', '1', '0');
INSERT INTO `member_price` VALUES ('254', '6', '2', '0');
INSERT INTO `member_price` VALUES ('255', '6', '3', '0');
INSERT INTO `member_price` VALUES ('256', '6', '4', '0');
INSERT INTO `member_price` VALUES ('257', '3', '1', '0');
INSERT INTO `member_price` VALUES ('258', '3', '2', '0');
INSERT INTO `member_price` VALUES ('259', '3', '3', '0');
INSERT INTO `member_price` VALUES ('260', '3', '4', '0');
INSERT INTO `member_price` VALUES ('273', '27', '1', '0');
INSERT INTO `member_price` VALUES ('274', '27', '2', '0');
INSERT INTO `member_price` VALUES ('275', '27', '3', '0');
INSERT INTO `member_price` VALUES ('276', '27', '4', '0');

-- ----------------------------
-- Table structure for `nav`
-- ----------------------------
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//导航id',
  `nav_name` varchar(64) NOT NULL DEFAULT '' COMMENT '//导航名称',
  `nav_url` varchar(64) NOT NULL DEFAULT '',
  `is_show` enum('0','1') NOT NULL DEFAULT '1' COMMENT '//是否显示（1显示）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav
-- ----------------------------
INSERT INTO `nav` VALUES ('6', '首页', 'home/index/index', '1');
INSERT INTO `nav` VALUES ('7', '会员中心', '', '1');
INSERT INTO `nav` VALUES ('8', '购物车', 'home/cart/showlst', '1');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//订单id',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '//前台会员id',
  `add_time` varchar(64) NOT NULL DEFAULT '' COMMENT '//下单时间',
  `pay_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '//订单状态',
  `order_num` varchar(64) NOT NULL DEFAULT '' COMMENT '//订单号',
  `sh_name` varchar(32) NOT NULL DEFAULT '' COMMENT '//收货人姓名',
  `sh_area` varchar(32) NOT NULL DEFAULT '' COMMENT '//区',
  `sh_city` varchar(32) NOT NULL DEFAULT '' COMMENT '//市',
  `sh_province` varchar(32) NOT NULL DEFAULT '' COMMENT '//省',
  `sh_tel` varchar(32) NOT NULL DEFAULT '' COMMENT '//收获电话',
  `sh_address` varchar(128) NOT NULL DEFAULT '' COMMENT '//收获地址',
  `post_status` enum('2','1','0') NOT NULL DEFAULT '0' COMMENT '//0未发货 1 已发货 2 已收获',
  `total_price` varchar(64) NOT NULL DEFAULT '' COMMENT '//订单总价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '1', '1487665773', '0', '', 'dcbdfb', '', '', '', 'bb', 'xv zvbs', '0', '0');
INSERT INTO `orders` VALUES ('2', '1', '1487670582', '0', 'HY-1487670582', 'dyfsyj', '海淀区', '北京', '北京', '1111111111', '唐家岭', '0', '0');
INSERT INTO `orders` VALUES ('8', '1', '1487675266', '0', 'HY-1487675266', '邓亚飞', '昌平区', '北京', '北京', '1300000000', '唐家岭', '0', '0');
INSERT INTO `orders` VALUES ('9', '1', '1487676126', '0', 'HY-1487676126', 'dyfsyj', '哈哈', '唐山', '河北省', 'sfvacf', '是v腌臜', '0', '490');
INSERT INTO `orders` VALUES ('10', '1', '1487678503', '0', 'HY-1487678503', 'baobao', '新区', '天津', '天津', '18822222222', '唐家岭路', '0', '980');
INSERT INTO `orders` VALUES ('11', '1', '1487772410', '1', 'HY-1487772410', '小小', '海淀区', '北京市', '北京', '122223333', '唐家领路', '0', '490');
INSERT INTO `orders` VALUES ('12', '1', '1487938761', '1', 'HY-1487938761', 'dyfsyj', 'xx', '唐山市', '河北省', '1111111111', '小路口', '0', '490');
INSERT INTO `orders` VALUES ('14', '1', '1487951913', '0', 'HY-1487951913', '吧vv大码 ', 'vbd zxc ', 'dvv', 'vsd', '111112222', 'dddddd', '0', '490');
INSERT INTO `orders` VALUES ('15', '1', '1487952578', '0', 'HY-1487952578', 'bvsdbv', 'sdvsdvd', 'vsdvv', 'xcb sn.k', 'smvsmvvdv', 'dvxvsdvd', '0', '490');
INSERT INTO `orders` VALUES ('16', '1', '1487953553', '0', 'HY-1487953553', 'f df df f f ', 'ebdbdf', 'fbbfdb', 'svsv', '1233333333', 'fbdfbebb', '0', '490');
INSERT INTO `orders` VALUES ('17', '1', '1487982128', '0', 'HY-1487982128', 'dfbkv,xd b', 'brgb', 'sgvwsgg', 'gwgwg', '111122235565', 'bbbbbbbbbbb', '0', '490');
INSERT INTO `orders` VALUES ('18', '1', '1487982421', '0', 'HY-1487982421', 'gvbsbsgb', 'fsbsrbh', 'sbsgbsgsg', 'vbvbafvsb', '11111111111', 'fbnfdbhgrsg', '0', '490');
INSERT INTO `orders` VALUES ('19', '1', '1487982545', '0', 'HY-1487982545', 'gndbndbs', 'dndfb', 'cbdfb', 'vsgvsv', 'bdsbsbb', 'bdfgbdgvs', '0', '490');
INSERT INTO `orders` VALUES ('20', '1', '1487982796', '0', 'HY-1487982796', 'htrheth', 'fgtrhte', 'dtherghe', 'etgergreg', 'ergrregerg', 'tttttt', '0', '490');
INSERT INTO `orders` VALUES ('21', '1', '1487982881', '0', 'HY-1487982881', 'segegewg', 'wsgrw', 'gwrgwergf', 'hgrgg', '111111111111', 'rgrgrwg', '0', '490');
INSERT INTO `orders` VALUES ('22', '1', '1487982979', '0', 'HY-1487982979', 'gsgwggrs', 'sfgr', 'sgg', 'dfgsfg', '55522235544', 'gsfggggg', '0', '490');
INSERT INTO `orders` VALUES ('23', '1', '1487983785', '0', 'HY-1487983785', 'dfafeff', 'afaff', 'afeff', 'sfefqafq', 'faqfqfqfq', 'fffffffff', '0', '490');
INSERT INTO `orders` VALUES ('24', '1', '1488039681', '1', 'HY-1488039681', 'denfyafei', '高新区', '哈尔滨', '东北省', '130222222', '世纪大道', '0', '490');
INSERT INTO `orders` VALUES ('25', '1', '1488128675', '1', 'HY-1488128675', 'php5', '海淀区', '北京市', '北京', '13022222222', '唐家岭', '0', '980');
INSERT INTO `orders` VALUES ('26', '1', '1488280882', '1', 'HY-1488280882', '小张', '宝山', '上海', '上海', '13022222222', '水产路', '0', '490');

-- ----------------------------
-- Table structure for `privilege`
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT COMMENT '//id',
  `pri_name` varchar(32) NOT NULL DEFAULT '' COMMENT '//权限名称',
  `module_name` varchar(32) NOT NULL DEFAULT '',
  `controller_name` varchar(32) NOT NULL DEFAULT '',
  `action_name` varchar(32) NOT NULL DEFAULT '' COMMENT '//方法名',
  `parent_id` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', '商品管理', 'admin', 'index', 'index', '0');
INSERT INTO `privilege` VALUES ('2', '商品列表', 'admin', 'goods', 'showlst', '1');
INSERT INTO `privilege` VALUES ('3', '添加商品', 'admin', 'goods', 'addlst', '2');
INSERT INTO `privilege` VALUES ('4', '修改商品', 'admin', 'goods', 'editlst', '2');
INSERT INTO `privilege` VALUES ('5', '删除商品', 'admin', 'goods', 'del', '2');
INSERT INTO `privilege` VALUES ('6', '分类列表', 'admin', 'category', 'showlst', '1');
INSERT INTO `privilege` VALUES ('7', '添加分类', 'admin', 'category', 'addlst', '6');
INSERT INTO `privilege` VALUES ('8', '修改分类', 'admin', 'category', 'editlst', '6');
INSERT INTO `privilege` VALUES ('9', '删除分类', 'admin', 'category', 'del', '6');
INSERT INTO `privilege` VALUES ('13', '用户角色管理', '', '', '', '0');
INSERT INTO `privilege` VALUES ('14', '角色列表', 'admin', 'role', 'showlst', '13');
INSERT INTO `privilege` VALUES ('16', '网店管理', 'admin', '', '', '0');
INSERT INTO `privilege` VALUES ('17', '首页导航列表', 'admin', 'nav', 'showlst', '16');
INSERT INTO `privilege` VALUES ('18', '添加导航', 'admin', 'nav', 'addlst', '17');
INSERT INTO `privilege` VALUES ('19', '修改导航', 'admin', 'nav', 'editlst', '17');
INSERT INTO `privilege` VALUES ('20', '删除导航', 'admin', 'nav', 'del', '17');
INSERT INTO `privilege` VALUES ('21', '轮播列表', 'admin', 'lunbo', 'showlst', '16');
INSERT INTO `privilege` VALUES ('22', '修改轮播图', 'admin', 'lunbo', 'editlst', '21');
INSERT INTO `privilege` VALUES ('23', '删除轮播图', 'admin', 'lunbo', 'del', '21');
INSERT INTO `privilege` VALUES ('24', '添加轮播图', 'admin', 'lunbo', 'addlst', '21');
INSERT INTO `privilege` VALUES ('25', '管理员列表', 'admin', 'admin', 'showlst', '13');
INSERT INTO `privilege` VALUES ('26', '添加管理员', 'admin', 'admin', 'addlst', '25');
INSERT INTO `privilege` VALUES ('27', '修改管理员', 'admin', 'admin', 'editlst', '25');
INSERT INTO `privilege` VALUES ('28', '删除管理员', 'admin', 'admin', 'del', '25');
INSERT INTO `privilege` VALUES ('29', '添加角色', 'admin', 'role', 'addlst', '14');
INSERT INTO `privilege` VALUES ('30', '修改角色', 'admin', 'role', 'edit', '14');
INSERT INTO `privilege` VALUES ('31', '删除角色', 'admin', 'role', 'del', '14');
INSERT INTO `privilege` VALUES ('32', '权限列表', 'admin', 'privilege', 'showlst', '13');
INSERT INTO `privilege` VALUES ('33', '添加权限', 'admin', 'privilege', 'addlst', '32');
INSERT INTO `privilege` VALUES ('34', '修改权限', 'admin', 'privilege', 'editlst', '32');
INSERT INTO `privilege` VALUES ('35', '删除权限', 'admin', 'privilege', 'del', '32');
INSERT INTO `privilege` VALUES ('36', '订单列表', 'admin', 'orders', 'showlst', '1');
INSERT INTO `privilege` VALUES ('37', '类型列表', 'admin', 'type', 'showlst', '1');
INSERT INTO `privilege` VALUES ('38', '添加类型', 'admin', 'type', 'addlst', '37');
INSERT INTO `privilege` VALUES ('39', '修改类型', 'admin', 'type', 'editlst', '37');
INSERT INTO `privilege` VALUES ('40', '删除类型', 'admin', 'type', 'del', '37');
INSERT INTO `privilege` VALUES ('41', '品牌列表', 'admin', 'brand', 'showlst', '1');
INSERT INTO `privilege` VALUES ('42', '添加品牌', 'admin', 'brand', 'addlst', '41');
INSERT INTO `privilege` VALUES ('43', '修改品牌', 'admin', 'brand', 'editlst', '41');
INSERT INTO `privilege` VALUES ('44', '删除品牌', 'admin', 'brand', 'del', '41');
INSERT INTO `privilege` VALUES ('46', '后台登录', 'admin', 'index', 'index', '16');
INSERT INTO `privilege` VALUES ('47', '登录左边栏', 'admin', 'index', 'left', '46');
INSERT INTO `privilege` VALUES ('48', '登录上边栏', 'admin', 'index', 'top', '46');
INSERT INTO `privilege` VALUES ('49', '登录主框', 'admin', 'index', 'right', '46');
INSERT INTO `privilege` VALUES ('50', '网店活动', 'admin', 'active', 'showlst', '16');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT COMMENT '//角色id',
  `role_name` varchar(64) NOT NULL DEFAULT '' COMMENT '//角色名字',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员');
INSERT INTO `role` VALUES ('6', '商品管理员');
INSERT INTO `role` VALUES ('7', '分类管理员');

-- ----------------------------
-- Table structure for `role_pri`
-- ----------------------------
DROP TABLE IF EXISTS `role_pri`;
CREATE TABLE `role_pri` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` mediumint(9) NOT NULL COMMENT '//角色id',
  `pri_id` mediumint(9) NOT NULL COMMENT '//权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_pri
-- ----------------------------
INSERT INTO `role_pri` VALUES ('5', '1', '6');
INSERT INTO `role_pri` VALUES ('6', '1', '7');
INSERT INTO `role_pri` VALUES ('7', '1', '8');
INSERT INTO `role_pri` VALUES ('8', '1', '9');
INSERT INTO `role_pri` VALUES ('46', '6', '1');
INSERT INTO `role_pri` VALUES ('47', '6', '2');
INSERT INTO `role_pri` VALUES ('48', '6', '3');
INSERT INTO `role_pri` VALUES ('49', '6', '4');
INSERT INTO `role_pri` VALUES ('50', '6', '5');
INSERT INTO `role_pri` VALUES ('51', '6', '6');
INSERT INTO `role_pri` VALUES ('52', '6', '7');
INSERT INTO `role_pri` VALUES ('53', '6', '8');
INSERT INTO `role_pri` VALUES ('54', '6', '9');
INSERT INTO `role_pri` VALUES ('55', '6', '36');
INSERT INTO `role_pri` VALUES ('56', '6', '37');
INSERT INTO `role_pri` VALUES ('57', '6', '38');
INSERT INTO `role_pri` VALUES ('58', '6', '39');
INSERT INTO `role_pri` VALUES ('59', '6', '40');
INSERT INTO `role_pri` VALUES ('60', '6', '41');
INSERT INTO `role_pri` VALUES ('61', '6', '42');
INSERT INTO `role_pri` VALUES ('62', '6', '43');
INSERT INTO `role_pri` VALUES ('63', '6', '44');
INSERT INTO `role_pri` VALUES ('64', '6', '46');
INSERT INTO `role_pri` VALUES ('65', '6', '47');
INSERT INTO `role_pri` VALUES ('66', '6', '48');
INSERT INTO `role_pri` VALUES ('67', '6', '49');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//类型主键',
  `type_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '手机');
INSERT INTO `type` VALUES ('2', '食品');
INSERT INTO `type` VALUES ('3', '美肤品');
INSERT INTO `type` VALUES ('4', '电脑');
