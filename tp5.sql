/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : tp5

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-02-25 13:30:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_name` (`admin_name`) USING BTREE,
  UNIQUE KEY `index_admin_password` (`admin_password`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('2', 'admin', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `admin_user` VALUES ('3', 'root', '63a9f0ea7bb98050796b649e85481845');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('3', '管理员管理', '1', '3');
INSERT INTO `auth_group` VALUES ('2', '商品管理员', '1', '2,4,5');

-- ----------------------------
-- Table structure for auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES ('1', '1');
INSERT INTO `auth_group_access` VALUES ('2', '2');
INSERT INTO `auth_group_access` VALUES ('3', '3');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('3', 'index/users/admin_list', '管理员管理', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('2', 'index/goods/product_category_add', '分类的添加', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('4', 'index/index/index', '首页', '1', '1', '');
INSERT INTO `auth_rule` VALUES ('5', 'index/index/welcome', '欢迎页', '1', '1', '');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品自增id',
  `goodsname` varchar(255) DEFAULT NULL COMMENT '商品的名字',
  `tid` int(11) DEFAULT NULL COMMENT '分类id',
  `tpid` int(255) DEFAULT NULL COMMENT '分类路径',
  `unit` char(255) DEFAULT NULL COMMENT '商品的单位',
  `attributes` enum('7','6','5','4','3','2','1') DEFAULT NULL COMMENT '商品的属性,1、推荐 2、新上 3、热卖 4、促销 5、包邮 6、限时卖 7、不参与会员折扣',
  `imagepath` varchar(255) DEFAULT NULL COMMENT '商品图片id',
  `number` int(11) DEFAULT NULL COMMENT '商品编号',
  `barcode` int(255) DEFAULT NULL COMMENT '条形码',
  `curprice` int(11) DEFAULT NULL COMMENT '现价',
  `oriprice` int(11) DEFAULT NULL COMMENT '市场价',
  `cosprice` int(11) DEFAULT NULL COMMENT '成本价',
  `inventory` int(255) DEFAULT NULL COMMENT '库存量',
  `restrict` int(255) DEFAULT NULL COMMENT '限制购买量',
  `already` int(255) DEFAULT NULL COMMENT '已经购买量',
  `freight` int(255) DEFAULT NULL COMMENT '运费',
  `status` enum('1','0') DEFAULT NULL COMMENT '是否上架,0为上架,1为下架,默认0上架',
  `reorder` int(255) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('3', '芭蒂娜2015欧洲站秋季新品 拼接长袖印花秋装a字连衣裙 修身显瘦', '25', '20', '件', '1', '162,160,161,159', '0', '529', '529', '529', '529', '529', '529', '529', '529', '0', '22', '<ul id=\"\" style=\"padding: 0px; width: 1150px;\" class=\" list-paddingleft-2\"><li><p>品牌：&nbsp;芬迪/FENDI</p></li><li><p>货号：&nbsp;6534105100</p></li><li><p>主要材质：&nbsp;涤纶</p></li><li><p>裙长：&nbsp;短裙</p></li><li><p>裙摆：&nbsp;不对称</p></li><li><p>领型：&nbsp;圆领</p></li><li><p>袖型：&nbsp;短袖</p></li><li><p>款式：&nbsp;吊带</p></li><li><p>版型：&nbsp;修身型</p></li><li><p>上市时间：&nbsp;2016年</p></li></ul><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;\"><img class=\"lazy\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2ZBiAepXXXXaaXXXXXXXXXXXX-854153843.jpg\" align=\"absmiddle\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2ZBiAepXXXXaaXXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i4/854153843/TB22U1fepXXXXbjXpXXXXXXXXXX-854153843.jpg\" align=\"absmiddle\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i4/854153843/TB22U1fepXXXXbjXpXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/></p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;\"><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i1/854153843/TB28YeGepXXXXXfXXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i1/854153843/TB28YeGepXXXXXfXXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i3/854153843/TB2uqpzeVXXXXcXXXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i3/854153843/TB2uqpzeVXXXXcXXXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i1/854153843/TB2OcqAepXXXXX4XXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i1/854153843/TB2OcqAepXXXXX4XXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i3/854153843/TB2i6ufepXXXXbmXpXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i3/854153843/TB2i6ufepXXXXbmXpXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/></p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;\">&nbsp;</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;\"><a target=\"_blank\" style=\"outline: 0px; color: rgb(50, 50, 50); padding: 0px; margin: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;\"><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i1/854153843/TB2_ZmsepXXXXcbXXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i1/854153843/TB2_ZmsepXXXXcbXXXXXXXXXXXX-854153843.jpg\" style=\"border: none; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/></a><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i3/854153843/TB2HrSDepXXXXXTXXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i3/854153843/TB2HrSDepXXXXXTXXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i4/854153843/TB2FbSoepXXXXcZXXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i4/854153843/TB2FbSoepXXXXcZXXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2Q.1yepXXXXanXXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2Q.1yepXXXXanXXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2diKtepXXXXbYXXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2diKtepXXXXbYXXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2t_qaepXXXXcfXpXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2t_qaepXXXXcfXpXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB22ayCepXXXXX.XXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB22ayCepXXXXX.XXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/></p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;\"><a target=\"_blank\" style=\"outline: 0px; color: rgb(50, 50, 50); padding: 0px; margin: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;\"><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2z.CAepXXXXbfXXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2z.CAepXXXXbfXXXXXXXXXXXX-854153843.jpg\" style=\"border: none; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/></a></p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;\"><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i3/854153843/TB2q5mjepXXXXajXpXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i3/854153843/TB2q5mjepXXXXajXpXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i1/854153843/TB2nTSsepXXXXbVXXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i1/854153843/TB2nTSsepXXXXbVXXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i4/854153843/TB2ws5sepXXXXbTXXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i4/854153843/TB2ws5sepXXXXbTXXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i1/854153843/TB2sjStepXXXXarXXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i1/854153843/TB2sjStepXXXXarXXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2H45mepXXXXcSXXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2H45mepXXXXcSXXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2gvygepXXXXbmXpXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i2/854153843/TB2gvygepXXXXbmXpXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i4/854153843/TB21_uuepXXXXbBXXXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i4/854153843/TB21_uuepXXXXbBXXXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i1/854153843/TB24xeiepXXXXaLXpXXXXXXXXXX-854153843.jpg\" src=\"http://malliccdn.baidu.com/https%3A//img.alicdn.com/imgextra/i1/854153843/TB24xeiepXXXXaLXpXXXXXXXXXX-854153843.jpg\" style=\"border: 0px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/></p><p><br/></p>');
INSERT INTO `goods` VALUES ('4', '名典屋2015秋装新款时尚蕾丝网眼拼接风衣中长款外套E151OF030', '25', '20', '件', '1', '176,177,178,175', '0', '640', '640', '640', '640', '640', '640', '640', '640', '0', '2', '<p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-family: MHei, &#39;Noto Serif&#39;, &#39;Noto Sans T Chinese&#39;, &#39;Noto Sans S Chinese&#39;, 微软雅黑, &#39;Microsoft YaHei&#39;, Helvetica, Arial, Verdana, sans-serif; font-size: 12px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 18px; white-space: normal; background-color: rgb(254, 254, 254);\"><img class=\"lazy\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.65_652522_14651_0.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.65_652522_14651_0.jpg\" style=\"border: 0px; font-size: 14.444445px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; line-height: 23.333334px; display: inline;\"/></p><table cellpadding=\"0\" cellspacing=\"0\" height=\"900\" width=\"790\"><tbody style=\"padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; font-size: 14.4444446563721px; vertical-align: baseline;\"><tr style=\"padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; font-size: 14.4444446563721px; vertical-align: baseline;\" class=\"firstRow\"><td width=\"400\" style=\"text-align: center; vertical-align: middle; margin: 0px auto;\"><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.75_747770_14651_1.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.75_747770_14651_1.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/></td><td valign=\"top\" width=\"24\" style=\"vertical-align: middle; margin: 0px auto;\"><br/></td><td valign=\"top\" width=\"366\" style=\"vertical-align: middle; margin: 0px auto;\">&nbsp;产品编号：E151OF030产品名称：时尚长外套产品颜色：白色、黑色专柜价格：￥1280时尚元素：优雅的蕾丝与个性的网眼混搭打造出时尚摩登的视觉效果。简约的中长款版型十分气质抢眼。服装适中 &nbsp;适合春秋产品面料：&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;100%聚酯纤维&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;里料：65%锦纶、35%粘纤&nbsp;洗涤方式：&nbsp; &nbsp; &nbsp;&nbsp;将不同色系的衣物分开轻柔洗涤，请勿浸泡。建议送到专业的洗衣店效果更佳。面料特性：此面料光泽柔和自然、手感柔软、富有弹性、吸湿性，穿着 舒适美观&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td></tr></tbody></table><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-family: MHei, &#39;Noto Serif&#39;, &#39;Noto Sans T Chinese&#39;, &#39;Noto Sans S Chinese&#39;, 微软雅黑, &#39;Microsoft YaHei&#39;, Helvetica, Arial, Verdana, sans-serif; font-size: 12px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 18px; white-space: normal; background-color: rgb(254, 254, 254);\">&nbsp;</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-family: MHei, &#39;Noto Serif&#39;, &#39;Noto Sans T Chinese&#39;, &#39;Noto Sans S Chinese&#39;, 微软雅黑, &#39;Microsoft YaHei&#39;, Helvetica, Arial, Verdana, sans-serif; font-size: 14.444445px; vertical-align: baseline; color: rgb(51, 51, 51); white-space: normal; line-height: 23.333334px; background-color: rgb(254, 254, 254);\"><img class=\"lazy\" align=\"absMiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.65_653848_14651_2.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.65_653848_14651_2.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; orphans: 2; widows: 2; display: inline;\"/></p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-family: MHei, &#39;Noto Serif&#39;, &#39;Noto Sans T Chinese&#39;, &#39;Noto Sans S Chinese&#39;, 微软雅黑, &#39;Microsoft YaHei&#39;, Helvetica, Arial, Verdana, sans-serif; font-size: 12px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 18px; white-space: normal; background-color: rgb(254, 254, 254);\">&nbsp;</p><table bgcolor=\"#666666\" cellpadding=\"0\" cellspacing=\"1\" height=\"135\" width=\"750\"><tbody style=\"padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; font-size: 14.4444446563721px; vertical-align: baseline;\"><tr style=\"padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; font-size: 14.4444446563721px; vertical-align: baseline;\" class=\"firstRow\"><td align=\"middle\" bgcolor=\"#cccccc\" height=\"22\" width=\"73\" style=\"vertical-align: middle; margin: 0px auto;\">尺码</td><td align=\"middle\" bgcolor=\"#cccccc\" width=\"124\" style=\"vertical-align: middle; margin: 0px auto;\">参考尺寸</td><td align=\"middle\" bgcolor=\"#cccccc\" width=\"79\" style=\"vertical-align: middle; margin: 0px auto;\">衣长</td><td align=\"middle\" bgcolor=\"#cccccc\" width=\"92\" style=\"vertical-align: middle; margin: 0px auto;\">肩宽</td><td align=\"middle\" bgcolor=\"#cccccc\" width=\"92\" style=\"vertical-align: middle; margin: 0px auto;\">胸围</td><td align=\"middle\" bgcolor=\"#cccccc\" width=\"92\" style=\"vertical-align: middle; margin: 0px auto;\">袖长</td><td align=\"middle\" bgcolor=\"#cccccc\" width=\"92\" style=\"vertical-align: middle; margin: 0px auto;\">袖口</td><td align=\"middle\" bgcolor=\"#cccccc\" width=\"97\" style=\"vertical-align: middle; margin: 0px auto;\">备注</td></tr><tr style=\"padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; font-size: 14.4444446563721px; vertical-align: baseline;\"><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">S</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">155/80A</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">77.5</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">35.5</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">90</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">46</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">24.8/25.8</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; font-size: 14.4444446563721px; vertical-align: baseline;\"><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">M</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">160/84A</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">79.5</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">36.5</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">94</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">47</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">26/27</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; font-size: 14.4444446563721px; vertical-align: baseline;\"><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">L</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">165/88A</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">81.5</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">37.5</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">98</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">48</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">27.2/28.2</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; font-size: 14.4444446563721px; vertical-align: baseline;\"><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">XL</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">170/92A</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">83.5</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">38.5</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">102</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">49</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\">28.4/29.4</td><td align=\"middle\" bgcolor=\"#ffffff\" style=\"vertical-align: middle; margin: 0px auto;\"><br/></td></tr></tbody></table><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; font-size: 14.444445px; vertical-align: baseline; line-height: 23.333334px;\">&nbsp;</p><table cellpadding=\"0\" cellspacing=\"0\" width=\"790\"><tbody style=\"padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;\"><tr style=\"padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;\" class=\"firstRow\"><td width=\"50\" style=\"vertical-align: middle; margin: 0px auto; color: rgb(189, 0, 7);\">温馨<br/>提示</td><td style=\"vertical-align: middle; margin: 0px auto;\">*<span style=\"padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; color: rgb(189, 0, 7);\">尺寸单位：CM</span>，请根据自身身体尺寸选码，模特效果仅供参考。<br/>*因个人显示器显示差异，图片与实物可能会有细微色差；因手工测量方式不同，若有2-3cm误差皆属合理范围。</td></tr></tbody></table><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;\">&nbsp;</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; font-size: 14.444445px; vertical-align: baseline; line-height: 23.333334px;\"><img class=\"lazy\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.65_654940_14651_3.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.65_654940_14651_3.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.75_747227_14651_4.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.75_747227_14651_4.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.77_769913_14651_5.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.77_769913_14651_5.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.75_750413_14651_6.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.75_750413_14651_6.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.77_774131_14651_7.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.77_774131_14651_7.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.75_747979_14651_8.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.75_747979_14651_8.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.77_770370_14651_9.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.77_770370_14651_9.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.73_732406_14651_10.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.73_732406_14651_10.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.77_765532_14651_11.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.77_765532_14651_11.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.74_740485_14651_12.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.74_740485_14651_12.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.77_769586_14651_13.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.77_769586_14651_13.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.76_757403_14651_14.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.76_757403_14651_14.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646535.02_24559_14651_15.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646535.02_24559_14651_15.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.8_797564_14651_16.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.8_797564_14651_16.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.67_671161_14651_17.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.67_671161_14651_17.jpg\" style=\"border: 0px; font-size: 14.444445px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; line-height: 1.5; display: inline;\"/></p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; font-size: 14.444445px; vertical-align: baseline; line-height: 23.333334px;\"><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.75_753316_14651_18.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.75_753316_14651_18.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.75_749006_14651_19.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.75_749006_14651_19.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.77_772220_14651_20.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.77_772220_14651_20.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.78_781642_14651_21.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.78_781642_14651_21.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.68_682838_14651_22.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.68_682838_14651_22.jpg\" style=\"border: 0px; font-size: 14.444445px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; line-height: 23.333334px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.7_702559_14651_23.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.7_702559_14651_23.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.7_697991_14651_24.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.7_697991_14651_24.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/><img class=\"lazy\" align=\"absmiddle\" data-original=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.7_700791_14651_25.jpg\" src=\"https://gss0.baidu.com/80M_cCml_AoJksuboYuT_XF5eBk7hKzk-cq/bos_1463646534.7_700791_14651_25.jpg\" style=\"border: 0px; font-size: 14.4444446563721px; padding: 0px; margin: 0px auto; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: bottom; max-width: 790px; display: inline;\"/></p><p><br/></p>');

-- ----------------------------
-- Table structure for goods_files
-- ----------------------------
DROP TABLE IF EXISTS `goods_files`;
CREATE TABLE `goods_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) DEFAULT NULL COMMENT '文件路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_files
-- ----------------------------
INSERT INTO `goods_files` VALUES ('133', '/static/files/2016-05-21/14638097209622.png');
INSERT INTO `goods_files` VALUES ('134', '/static/files/2016-05-21/14638097201175.png');
INSERT INTO `goods_files` VALUES ('139', '/static/files/2016-05-22/14639150905420.png');
INSERT INTO `goods_files` VALUES ('140', '/static/files/2016-05-22/14639150902407.png');
INSERT INTO `goods_files` VALUES ('143', '/static/files/2016-05-22/14639151147182.png');
INSERT INTO `goods_files` VALUES ('144', '/static/files/2016-05-22/14639151148792.png');
INSERT INTO `goods_files` VALUES ('145', '/static/files/2016-05-22/14639187345637.png');
INSERT INTO `goods_files` VALUES ('146', '/static/files/2016-05-22/14639187341378.png');
INSERT INTO `goods_files` VALUES ('147', '/static/files/2016-05-22/14639187347790.png');
INSERT INTO `goods_files` VALUES ('148', '/static/files/2016-06-04/14650218922772.png');
INSERT INTO `goods_files` VALUES ('149', '/static/files/2016-06-04/14650218942648.png');
INSERT INTO `goods_files` VALUES ('150', '/static/files/2016-06-04/14650218959492.png');
INSERT INTO `goods_files` VALUES ('151', '/static/files/2016-06-04/14650218963224.png');
INSERT INTO `goods_files` VALUES ('152', '/static/files/2016-06-04/14650219841455.png');
INSERT INTO `goods_files` VALUES ('153', '/static/files/2016-06-04/14650219847163.png');
INSERT INTO `goods_files` VALUES ('154', '/static/files/2016-06-04/14650219841815.png');
INSERT INTO `goods_files` VALUES ('155', '/static/files/2016-06-04/14650220395622.png');
INSERT INTO `goods_files` VALUES ('156', '/static/files/2016-06-04/14650220399035.png');
INSERT INTO `goods_files` VALUES ('157', '/static/files/2016-06-04/14650220396109.png');
INSERT INTO `goods_files` VALUES ('158', '/static/files/2016-06-04/14650220395965.png');
INSERT INTO `goods_files` VALUES ('159', '/static/files/2016-06-04/14650221149057.png');
INSERT INTO `goods_files` VALUES ('160', '/static/files/2016-06-04/14650221146537.png');
INSERT INTO `goods_files` VALUES ('161', '/static/files/2016-06-04/14650221143013.png');
INSERT INTO `goods_files` VALUES ('162', '/static/files/2016-06-04/14650221149739.png');
INSERT INTO `goods_files` VALUES ('171', '/static/files/2016-06-04/14650226409275.png');
INSERT INTO `goods_files` VALUES ('172', '/static/files/2016-06-04/14650226408105.png');
INSERT INTO `goods_files` VALUES ('173', '/static/files/2016-06-04/14650226403585.png');
INSERT INTO `goods_files` VALUES ('174', '/static/files/2016-06-04/14650226406634.png');
INSERT INTO `goods_files` VALUES ('175', '/static/files/2016-06-04/14650227042915.png');
INSERT INTO `goods_files` VALUES ('176', '/static/files/2016-06-04/14650227042746.png');
INSERT INTO `goods_files` VALUES ('177', '/static/files/2016-06-04/14650227043707.png');
INSERT INTO `goods_files` VALUES ('178', '/static/files/2016-06-04/14650227058684.png');

-- ----------------------------
-- Table structure for goods_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `level` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES ('17', '服装服饰', '0', '0,17', '1');
INSERT INTO `goods_type` VALUES ('18', '鞋靴箱包', '0', '0,18', '1');
INSERT INTO `goods_type` VALUES ('19', '美妆珠宝', '0', '0,19', '1');
INSERT INTO `goods_type` VALUES ('20', '女装', '17', '0,17,20', '2');
INSERT INTO `goods_type` VALUES ('21', '男装', '17', '0,17,21', '2');
INSERT INTO `goods_type` VALUES ('22', '内衣裤袜', '17', '0,17,22', '2');
INSERT INTO `goods_type` VALUES ('23', '女鞋', '18', '0,18,23', '2');
INSERT INTO `goods_type` VALUES ('24', '珠宝', '19', '0,19,24', '2');
INSERT INTO `goods_type` VALUES ('25', '大衣风衣', '20', '0,17,20,25', '3');
INSERT INTO `goods_type` VALUES ('26', '羽绒服', '20', '0,17,20,26', '3');
INSERT INTO `goods_type` VALUES ('27', '毛衣', '20', '0,17,20,27', '3');
INSERT INTO `goods_type` VALUES ('28', '西装', '21', '0,17,21,28', '3');
INSERT INTO `goods_type` VALUES ('29', '潮流袜', '22', '0,17,22,29', '3');
INSERT INTO `goods_type` VALUES ('30', '品牌裤子', '0', '0,30', '1');
INSERT INTO `goods_type` VALUES ('31', '西裤', '30', '0,30,31', '2');
INSERT INTO `goods_type` VALUES ('32', '中式西裤', '31', '0,30,31,32', '3');

-- ----------------------------
-- Table structure for web_users
-- ----------------------------
DROP TABLE IF EXISTS `web_users`;
CREATE TABLE `web_users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `userpass` varchar(40) NOT NULL,
  `useremail` varchar(35) NOT NULL,
  `telephone` varchar(25) NOT NULL,
  `photo` varchar(255) DEFAULT '/static/index/images/1.png',
  `age` int(11) DEFAULT NULL,
  `sex` varchar(25) DEFAULT NULL,
  `tall` varchar(25) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `weight` int(5) DEFAULT NULL,
  `userinfo` varchar(255) DEFAULT NULL,
  `cardimg` varchar(255) DEFAULT NULL,
  `statetype` int(5) DEFAULT '1',
  `valide_type` int(5) DEFAULT '0',
  `state` int(5) DEFAULT NULL,
  `view_num` int(5) DEFAULT '0',
  `create_date` datetime NOT NULL,
  `QQ` int(25) DEFAULT NULL,
  `weixin` varchar(25) DEFAULT NULL,
  `weibo` varchar(255) DEFAULT NULL,
  `graduate` varchar(255) DEFAULT NULL,
  `baseinfo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_users
-- ----------------------------
INSERT INTO `web_users` VALUES ('1', 'test', '123456', '1q23@qq.com', '13013456789', '/static/index/images/1.png', null, null, null, null, null, null, null, null, '1', '0', null, '0', '0000-00-00 00:00:00', null, null, null, null, null);
INSERT INTO `web_users` VALUES ('2', '123456', 'e10adc3949ba59abbe56e057f', '123@qq.com', '13067894567', '/static/index/images/1.png', null, null, null, null, null, null, null, null, '1', '0', null, '0', '0000-00-00 00:00:00', null, null, null, null, null);
INSERT INTO `web_users` VALUES ('3', 'yhq', 'b6bdc8dcddeacece09d569714', 'yhq@q.com', '13014583456', '/static/index/images/1.png', null, null, null, null, null, null, null, null, '1', '0', null, '0', '0000-00-00 00:00:00', null, null, null, null, null);
INSERT INTO `web_users` VALUES ('4', 'yhq1', 'b6bdc8dcddeacece09d5697145d373d9', 'uyhq@qq.com', '13544448890', '/static/index/images/1.png', null, null, null, null, null, null, null, null, '1', '0', null, '0', '2017-10-09 22:59:22', null, null, null, null, null);
INSERT INTO `web_users` VALUES ('5', 'fairy', 'e10adc3949ba59abbe56e057f20f883e', 'fairy@qq.com', '13014598179', '/static/index/images/1.png', null, null, null, null, null, null, null, null, '1', '0', null, '0', '2017-10-09 22:49:30', null, null, null, null, null);
INSERT INTO `web_users` VALUES ('7', 'yhq123', 'e10adc3949ba59abbe56e057f20f883e', '123@123.com', '13012345678', '/static/uploads/20180115/d2f65bf6e2816c0df34d47885f567e0a.jpg', '21', '0', '444', '4444', '2018-01-25', '4444', null, null, '1', '0', null, '0', '2017-11-12 21:31:30', '555', '6666', '666', '博士', 'dddd');
