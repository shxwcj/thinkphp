/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : test3

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-01-02 12:40:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oc_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `oc_admin_access`;
CREATE TABLE `oc_admin_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `group` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户组',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='后台管理员与用户组对应关系表';

-- ----------------------------
-- Records of oc_admin_access
-- ----------------------------
INSERT INTO `oc_admin_access` VALUES ('1', '1', '1', '1438651748', '1438651748', '0', '1');
INSERT INTO `oc_admin_access` VALUES ('8', '10', '6', '1487679252', '0', '0', '1');

-- ----------------------------
-- Table structure for oc_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `oc_admin_config`;
CREATE TABLE `oc_admin_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL COMMENT '免运费',
  `value` varchar(12) NOT NULL DEFAULT '0' COMMENT '运费',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oc_admin_config
-- ----------------------------
INSERT INTO `oc_admin_config` VALUES ('1', 'freecharge', '0');
INSERT INTO `oc_admin_config` VALUES ('2', 'withdrawrate', '25');
INSERT INTO `oc_admin_config` VALUES ('3', 'minwithdraw', '35');
INSERT INTO `oc_admin_config` VALUES ('4', 'maxwithdraw', '65');

-- ----------------------------
-- Table structure for oc_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `oc_admin_group`;
CREATE TABLE `oc_admin_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级部门ID',
  `title` varchar(31) NOT NULL DEFAULT '' COMMENT '部门名称',
  `icon` varchar(31) NOT NULL DEFAULT '' COMMENT '图标',
  `menu_auth` text NOT NULL COMMENT '权限列表',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='部门信息表';

-- ----------------------------
-- Records of oc_admin_group
-- ----------------------------
INSERT INTO `oc_admin_group` VALUES ('1', '0', '超级管理员', '', '', '1426881003', '1427552428', '0', '1');
INSERT INTO `oc_admin_group` VALUES ('6', '0', '财务组', '', '[{\"name\":\"系统设置\",\"act\":\"system\",\"list\":[{\"name\":\"管理员列表\",\"url\":\"admin/system/admin_user\",\"status\":0},{\"name\":\"管理员添加\",\"url\":\"admin/system/admin_user_add\",\"status\":0},{\"name\":\"管理员编辑\",\"url\":\"admin/system/admin_user_edit\",\"status\":0},{\"name\":\"管理员删除\",\"url\":\"admin/system/admin_user_delete\",\"status\":0},{\"name\":\"管理员设置\",\"url\":\"admin/system/admin_user_setstatus\",\"status\":0},{\"name\":\"用户组列表\",\"url\":\"admin/system/admin_group\",\"status\":0},{\"name\":\"用户组添加\",\"url\":\"admin/system/admin_group_add\",\"status\":0},{\"name\":\"用户组编辑\",\"url\":\"admin/system/admin_group_edit\",\"status\":0},{\"name\":\"用户组删除\",\"url\":\"admin/system/admin_group_delete\",\"status\":0},{\"name\":\"用户组设置\",\"url\":\"admin/system/admin_group_setstatus\",\"status\":0}]},{\"name\":\"商品管理\",\"act\":\"goods\",\"list\":[{\"name\":\"商品列表\",\"url\":\"admin/goods/index\",\"status\":true},{\"name\":\"商品添加\",\"url\":\"admin/goods/goods_add\",\"status\":true},{\"name\":\"商品编辑\",\"url\":\"admin/goods/goods_edit\",\"status\":true},{\"name\":\"商品分类\",\"url\":\"admin/goods/cate_list\",\"status\":true},{\"name\":\"分类添加\",\"url\":\"admin/goods/cate_add\",\"status\":true},{\"name\":\"分类编辑\",\"url\":\"admin/goods/cate_edit\",\"status\":true},{\"name\":\"分类删除\",\"url\":\"admin/goods/cate_delete\",\"status\":true},{\"name\":\"状态设置\",\"url\":\"admin/goods/cate_setstatus\",\"status\":true},{\"name\":\"商品推介\",\"url\":\"admin/goods/recommend_list\",\"status\":true},{\"name\":\"推介添加\",\"url\":\"admin/goods/recommend_add\",\"status\":true},{\"name\":\"推介编辑\",\"url\":\"admin/goods/recommend_edit\",\"status\":true},{\"name\":\"推介删除\",\"url\":\"admin/goods/recommend_delete\",\"status\":true},{\"name\":\"单位列表\",\"url\":\"admin/goods/unit_list\",\"status\":true},{\"name\":\"单位添加\",\"url\":\"admin/goods/unit_add\",\"status\":true},{\"name\":\"单位编辑\",\"url\":\"admin/goods/unit_edit\",\"status\":true},{\"name\":\"单位删除\",\"url\":\"admin/goods/unit_delete\",\"status\":true},{\"name\":\"设置状态\",\"url\":\"admin/goods/unit_setstatus\",\"status\":true}]},{\"name\":\"CMS管理\",\"act\":\"cms\",\"list\":[{\"name\":\"文章列表\",\"url\":\"admin/cms/index\",\"status\":true},{\"name\":\"文章添加\",\"url\":\"admin/cms/article_add\",\"status\":true},{\"name\":\"文章编辑\",\"url\":\"admin/cms/article_edit\",\"status\":true},{\"name\":\"批量删除\",\"url\":\"admin/cms/article_delete\",\"status\":true},{\"name\":\"单个删除\",\"url\":\"admin/cms/article_delete_one\",\"status\":true},{\"name\":\"分类列表\",\"url\":\"admin/cms/cate_list\",\"status\":true},{\"name\":\"分类添加\",\"url\":\"admin/cms/cate_add\",\"status\":true},{\"name\":\"分类编辑\",\"url\":\"admin/cms/cate_edit\",\"status\":true},{\"name\":\"分类删除\",\"url\":\"admin/cms/cate_delete\",\"status\":true},{\"name\":\"分类设置\",\"url\":\"admin/cms/cate_setstatus\",\"status\":true}]},{\"name\":\"订单管理\",\"act\":\"order\",\"list\":[{\"name\":\"订单列表\",\"url\":\"admin/order/index\",\"status\":0}]}]', '1487679135', '0', '0', '1');

-- ----------------------------
-- Table structure for oc_admin_upload
-- ----------------------------
DROP TABLE IF EXISTS `oc_admin_upload`;
CREATE TABLE `oc_admin_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'UID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `ext` char(4) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件sha1编码',
  `location` varchar(15) NOT NULL DEFAULT '' COMMENT '文件存储位置',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=570 DEFAULT CHARSET=utf8 COMMENT='文件上传表';

-- ----------------------------
-- Records of oc_admin_upload
-- ----------------------------
INSERT INTO `oc_admin_upload` VALUES ('539', '0', '9a8963ed4fbf12b6aaac0a791a0228d7.png', '/uploads/20170113\\9a8963ed4fbf12b6aaac0a791a0228d7.jpg', 'http://oetqv9f47.bkt.clouddn.com/9a8963ed4fbf12b6aaac0a791a0228d7.png', 'jpg', '0', '567e4d926b5e22d1943d3aec80b30443', 'e852f8dd18adfe302b6c980416304f50', 'Qiniu', '0', '1484288760', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('542', '0', '7fcc2851960c69f512c52251336dce1e.png', '/uploads/20170113\\7fcc2851960c69f512c52251336dce1e.jpg', 'http://oetqv9f47.bkt.clouddn.com/7fcc2851960c69f512c52251336dce1e.png', 'jpg', '0', '3f39210b015974b9058f343c4112bb65', 'd57e75367b6756beaf1bf66960979fc6', 'Qiniu', '0', '1484288787', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('530', '0', 'd140bb2a1468f8982b43955b82414aab.png', '/uploads/20161226\\d140bb2a1468f8982b43955b82414aab.jpg', 'http://oetqv9f47.bkt.clouddn.com/d140bb2a1468f8982b43955b82414aab.png', 'jpg', '0', '5d93be94165eef09208436b1c707f887', '0e99110b121ff0232051fd4b8580a492', 'Qiniu', '0', '1482734474', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('525', '0', 'cea743458b03a551804a1827a6e0a7ad.png', '/uploads/20161220\\cea743458b03a551804a1827a6e0a7ad.jpg', 'http://oetqv9f47.bkt.clouddn.com/cea743458b03a551804a1827a6e0a7ad.png', 'jpg', '0', 'efeb04ccef37da80ff618c5e511aaf03', '04237e3aa3a2765e9cfe7ebabd1f3d9b', 'Qiniu', '0', '1482225924', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('526', '0', '735361695d8ed0ca38eb8469c22b581f.png', '/uploads/20161220\\735361695d8ed0ca38eb8469c22b581f.jpg', 'http://oetqv9f47.bkt.clouddn.com/735361695d8ed0ca38eb8469c22b581f.png', 'jpg', '0', '9671114825510124bd2dbf0266d96037', '58d54e6d038e7bb47ff28c0caa869725', 'Qiniu', '0', '1482225963', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('531', '0', '3e92833e79ec0c9a01291ad17e7f18e5.png', '/uploads/20170113\\3e92833e79ec0c9a01291ad17e7f18e5.jpg', 'http://oetqv9f47.bkt.clouddn.com/3e92833e79ec0c9a01291ad17e7f18e5.png', 'jpg', '0', '159ef192105f5f8c9444c5f21cea4d2d', '27dc3f2b30b1b145df9195036512ff09', 'Qiniu', '0', '1484273961', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('500', '0', '9dbb0f9b32d95bd6c278d0c517fc3c39.png', '/uploads/20161209\\9dbb0f9b32d95bd6c278d0c517fc3c39.jpg', 'http://oetqv9f47.bkt.clouddn.com/9dbb0f9b32d95bd6c278d0c517fc3c39.png', 'jpg', '0', 'e3aca1d30353d4ce2a584db1e470edaf', 'da8405a1c9c84d6bb6684aef789020b7', 'Qiniu', '0', '1481273127', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('532', '0', 'b357beb2915e68d24b17c600975720ee.png', '/uploads/20170113\\b357beb2915e68d24b17c600975720ee.jpg', 'http://oetqv9f47.bkt.clouddn.com/b357beb2915e68d24b17c600975720ee.png', 'jpg', '0', '989761dd98dbdb855abddf1b7c974ee1', 'c325ccd80c2d54a5cfc89ef176da124f', 'Qiniu', '0', '1484278994', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('533', '0', 'f6db40702a5c6a88d95c13a693f9e324.png', '/uploads/20170113\\f6db40702a5c6a88d95c13a693f9e324.jpg', 'http://oetqv9f47.bkt.clouddn.com/f6db40702a5c6a88d95c13a693f9e324.png', 'jpg', '0', '37d6e377eea1a99cd871fee30e89416c', '29b8ddff9292f51c94f1e28d394db00c', 'Qiniu', '0', '1484279005', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('534', '0', '241be83478f4e50ec76a268dde6de75d.png', '/uploads/20170113\\241be83478f4e50ec76a268dde6de75d.jpg', 'http://oetqv9f47.bkt.clouddn.com/241be83478f4e50ec76a268dde6de75d.png', 'jpg', '0', '567e4d926b5e22d1943d3aec80b30443', 'e852f8dd18adfe302b6c980416304f50', 'Qiniu', '0', '1484279015', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('536', '0', '312a5f9a0430632bf4577d4991d29a02.png', '/uploads/20170113\\312a5f9a0430632bf4577d4991d29a02.jpg', 'http://oetqv9f47.bkt.clouddn.com/312a5f9a0430632bf4577d4991d29a02.png', 'jpg', '0', '44f0d7cf904214f65218b56416e2dad6', 'c018f6c9c7dde527b5f94934c57029c1', 'Qiniu', '0', '1484279045', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('537', '0', '697f7b0cf1b8e3ee13c6792ce5439288.png', '/uploads/20170113\\697f7b0cf1b8e3ee13c6792ce5439288.jpg', 'http://oetqv9f47.bkt.clouddn.com/697f7b0cf1b8e3ee13c6792ce5439288.png', 'jpg', '0', '53579fe38f9992219e5fc6f36f7ba003', '2fec826c4f2fd2bb95c758ca7b41eda7', 'Qiniu', '0', '1484279086', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('538', '0', '266fb40863a74ca1e1523f9ef8792a9d.png', '/uploads/20170113\\266fb40863a74ca1e1523f9ef8792a9d.jpg', 'http://oetqv9f47.bkt.clouddn.com/266fb40863a74ca1e1523f9ef8792a9d.png', 'jpg', '0', '3f39210b015974b9058f343c4112bb65', 'd57e75367b6756beaf1bf66960979fc6', 'Qiniu', '0', '1484279110', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('412', '0', '681085817bf9a55e381968d717d5e471.png', '/uploads/20161111\\681085817bf9a55e381968d717d5e471.jpg', 'http://oetqv9f47.bkt.clouddn.com/681085817bf9a55e381968d717d5e471.png', 'jpg', '0', '743eb28bc08d46020514e0acae06a702', '2b711ba8fad3222e114c941a3278276e', 'Qiniu', '0', '1478845637', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('413', '0', '2fbe0f1987cfd657fecc27ab945fa778.png', '/uploads/20161111\\2fbe0f1987cfd657fecc27ab945fa778.jpg', 'http://oetqv9f47.bkt.clouddn.com/2fbe0f1987cfd657fecc27ab945fa778.png', 'jpg', '0', 'efeb04ccef37da80ff618c5e511aaf03', '04237e3aa3a2765e9cfe7ebabd1f3d9b', 'Qiniu', '0', '1478845647', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('414', '0', '74175c6de5ad1b1bf4a4aa6d8bfa2ac3.png', '/uploads/20161111\\74175c6de5ad1b1bf4a4aa6d8bfa2ac3.jpg', 'http://oetqv9f47.bkt.clouddn.com/74175c6de5ad1b1bf4a4aa6d8bfa2ac3.png', 'jpg', '0', '9671114825510124bd2dbf0266d96037', '58d54e6d038e7bb47ff28c0caa869725', 'Qiniu', '0', '1478845661', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('546', '0', '974378fded43b43a2b20482830cf46d5.png', '/uploads/20170113\\974378fded43b43a2b20482830cf46d5.jpg', 'http://oetqv9f47.bkt.clouddn.com/974378fded43b43a2b20482830cf46d5.png', 'jpg', '0', '92664bdf2fec7515205b2f6a07c4212b', 'dd3958dc515e906fe4339ba751d58874', 'Qiniu', '0', '1484289129', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('541', '0', '93cf33bff9040dc0d13411c863002635.png', '/uploads/20170113\\93cf33bff9040dc0d13411c863002635.jpg', 'http://oetqv9f47.bkt.clouddn.com/93cf33bff9040dc0d13411c863002635.png', 'jpg', '0', '44f0d7cf904214f65218b56416e2dad6', 'c018f6c9c7dde527b5f94934c57029c1', 'Qiniu', '0', '1484288787', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('540', '0', 'c44cf530c2fe028b4cec5243894a0be4.png', '/uploads/20170113\\c44cf530c2fe028b4cec5243894a0be4.jpg', 'http://oetqv9f47.bkt.clouddn.com/c44cf530c2fe028b4cec5243894a0be4.png', 'jpg', '0', '37d6e377eea1a99cd871fee30e89416c', '29b8ddff9292f51c94f1e28d394db00c', 'Qiniu', '0', '1484288786', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('475', '0', '3f4c5ee3ea60ba1da5d1c7aa4e83e9ca.png', '/uploads/20161118\\3f4c5ee3ea60ba1da5d1c7aa4e83e9ca.jpg', 'http://oetqv9f47.bkt.clouddn.com/3f4c5ee3ea60ba1da5d1c7aa4e83e9ca.png', 'jpg', '0', '1f702800c0d5a5621ef45aee1b7f87ab', '20f1d5b5e180b8a2abaa736f69160955', 'Qiniu', '0', '1479454320', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('544', '0', '0bf18f1e26eed3dda93bac679e131fcc.png', '/uploads/20170113\\0bf18f1e26eed3dda93bac679e131fcc.jpg', 'http://oetqv9f47.bkt.clouddn.com/0bf18f1e26eed3dda93bac679e131fcc.png', 'jpg', '0', '92664bdf2fec7515205b2f6a07c4212b', 'dd3958dc515e906fe4339ba751d58874', 'Qiniu', '0', '1484288884', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('503', '0', '65e5223b2fb83101b17c49f677df67e8.png', '/uploads/20161209\\65e5223b2fb83101b17c49f677df67e8.jpg', 'http://oetqv9f47.bkt.clouddn.com/65e5223b2fb83101b17c49f677df67e8.png', 'jpg', '0', '838cfe2ed9175b0b4b421ffded729455', '24f760e6a147b43289bc605d85cda3c6', 'Qiniu', '0', '1481273139', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('433', '0', 'f6d5b63844989b592f04455a97a5c730.png', '/uploads/20161111\\f6d5b63844989b592f04455a97a5c730.jpg', 'http://oetqv9f47.bkt.clouddn.com/f6d5b63844989b592f04455a97a5c730.png', 'jpg', '0', '6d7c37e9f98b010afad41637534c494c', '1a0d1f0b617d948cd7b65a09277e7f22', 'Qiniu', '0', '1478854085', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('434', '0', '8ff9f2986a8b0d872d81ed02512efa96.png', '/uploads/20161111\\8ff9f2986a8b0d872d81ed02512efa96.jpg', 'http://oetqv9f47.bkt.clouddn.com/8ff9f2986a8b0d872d81ed02512efa96.png', 'jpg', '0', 'f9427efec8066843f8c4178fa0fd8291', 'bad9743bf761d9995c36fa6db5e7aec1', 'Qiniu', '0', '1478854088', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('435', '0', '5dc36e3107403c6cb77001aeee909a9d.png', '/uploads/20161111\\5dc36e3107403c6cb77001aeee909a9d.jpg', 'http://oetqv9f47.bkt.clouddn.com/5dc36e3107403c6cb77001aeee909a9d.png', 'jpg', '0', '822c1e3f524a530168168ee37f6fe282', '6e2e534a200f56a86e4c99b068f6bf8c', 'Qiniu', '0', '1478854090', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('436', '0', 'd826843a79460fbe2e59c33619b967b1.png', '/uploads/20161111\\d826843a79460fbe2e59c33619b967b1.jpg', 'http://oetqv9f47.bkt.clouddn.com/d826843a79460fbe2e59c33619b967b1.png', 'jpg', '0', 'c6804f70041eb2ed758ca092f266488a', '2efb93399c5ad76b0b3fdd5d149acdad', 'Qiniu', '0', '1478854095', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('437', '0', 'e61cb7ce3f0d9473259aa00136b2d3a4.png', '/uploads/20161111\\e61cb7ce3f0d9473259aa00136b2d3a4.jpg', 'http://oetqv9f47.bkt.clouddn.com/e61cb7ce3f0d9473259aa00136b2d3a4.png', 'jpg', '0', 'c6804f70041eb2ed758ca092f266488a', '2efb93399c5ad76b0b3fdd5d149acdad', 'Qiniu', '0', '1478854096', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('438', '0', 'bf6438fed4eaafd025ede0ed0287fa0e.png', '/uploads/20161111\\bf6438fed4eaafd025ede0ed0287fa0e.jpg', 'http://oetqv9f47.bkt.clouddn.com/bf6438fed4eaafd025ede0ed0287fa0e.png', 'jpg', '0', '07338f1a621831ea2ff05d64c0283c8e', '26fe64819430cd905b08c12e17007b00', 'Qiniu', '0', '1478854097', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('543', '0', '0834d86f344f149e7dec662694e9b252.png', '/uploads/20170113\\0834d86f344f149e7dec662694e9b252.jpg', 'http://oetqv9f47.bkt.clouddn.com/0834d86f344f149e7dec662694e9b252.png', 'jpg', '0', '989761dd98dbdb855abddf1b7c974ee1', 'c325ccd80c2d54a5cfc89ef176da124f', 'Qiniu', '0', '1484288829', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('440', '0', '910b9f36d3e5994e93c4c3d0328aee02.png', '/uploads/20161115\\910b9f36d3e5994e93c4c3d0328aee02.jpg', 'http://oetqv9f47.bkt.clouddn.com/910b9f36d3e5994e93c4c3d0328aee02.png', 'jpg', '0', 'efeb04ccef37da80ff618c5e511aaf03', '04237e3aa3a2765e9cfe7ebabd1f3d9b', 'Qiniu', '0', '1479198809', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('441', '0', '16b060125d2a1d4bca0645512c07e18e.png', '/uploads/20161116\\16b060125d2a1d4bca0645512c07e18e.jpg', 'http://oetqv9f47.bkt.clouddn.com/16b060125d2a1d4bca0645512c07e18e.png', 'jpg', '0', 'fc3cd79f38b6a653ece56ba084eeab0a', '11b7561a44fa2f6a4c0f3e0350a7b194', 'Qiniu', '0', '1479267191', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('442', '0', '4c769a0d06d6f40d80f2b4988479cc14.png', '/uploads/20161116\\4c769a0d06d6f40d80f2b4988479cc14.jpg', 'http://oetqv9f47.bkt.clouddn.com/4c769a0d06d6f40d80f2b4988479cc14.png', 'jpg', '0', '63d5a2fbecaebbe9d5c9e55f2b734254', 'f783a4bfd24cf3346d6f6e54872cce90', 'Qiniu', '0', '1479267191', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('443', '0', '3c8fc7a16b3a8f4cb340260ad501339d.png', '/uploads/20161116\\3c8fc7a16b3a8f4cb340260ad501339d.jpg', 'http://oetqv9f47.bkt.clouddn.com/3c8fc7a16b3a8f4cb340260ad501339d.png', 'jpg', '0', '1bb5f63b835fe4ed59ec13b6e2e508e8', '24ed200210e0c605165f8d6e04ed962c', 'Qiniu', '0', '1479267191', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('444', '0', '77cbe2184f04283cb40b137baa62b95c.png', '/uploads/20161116\\77cbe2184f04283cb40b137baa62b95c.jpg', 'http://oetqv9f47.bkt.clouddn.com/77cbe2184f04283cb40b137baa62b95c.png', 'jpg', '0', 'f9bcf26eccf7e8970f7dd7044d216f8d', '6d08c10f5d461e1e9ff1963a42fcea7c', 'Qiniu', '0', '1479267191', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('449', '0', '91bd953aeb9d0d2ec23a1a702e52fb13.png', '/uploads/20161116\\91bd953aeb9d0d2ec23a1a702e52fb13.jpg', 'http://oetqv9f47.bkt.clouddn.com/91bd953aeb9d0d2ec23a1a702e52fb13.png', 'jpg', '0', '5681303960bb84255770f97ad71e915b', '988dc4596632961c52406cd25923ad5c', 'Qiniu', '0', '1479277947', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('448', '0', '4ba8816becdc1262a340eb58a4b9a81a.png', '/uploads/20161116\\4ba8816becdc1262a340eb58a4b9a81a.jpg', 'http://oetqv9f47.bkt.clouddn.com/4ba8816becdc1262a340eb58a4b9a81a.png', 'jpg', '0', 'd305490e45d599e59698e5c72fc681a6', '666c2b3dd169b61bb885216c1ea4499f', 'Qiniu', '0', '1479277817', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('450', '0', 'a01f2298e22d1ee11946367a32a3ac5c.png', '/uploads/20161116\\a01f2298e22d1ee11946367a32a3ac5c.jpg', 'http://oetqv9f47.bkt.clouddn.com/a01f2298e22d1ee11946367a32a3ac5c.png', 'jpg', '0', '1bb5f63b835fe4ed59ec13b6e2e508e8', '24ed200210e0c605165f8d6e04ed962c', 'Qiniu', '0', '1479281543', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('451', '0', 'ce6e32e885008d9598608b4f20e8180a.png', '/uploads/20161116\\ce6e32e885008d9598608b4f20e8180a.jpg', 'http://oetqv9f47.bkt.clouddn.com/ce6e32e885008d9598608b4f20e8180a.png', 'jpg', '0', '1bb5f63b835fe4ed59ec13b6e2e508e8', '24ed200210e0c605165f8d6e04ed962c', 'Qiniu', '0', '1479281599', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('452', '0', 'e84b89a0c247046bf7d00987d026ecdc.png', '/uploads/20161116\\e84b89a0c247046bf7d00987d026ecdc.jpg', 'http://oetqv9f47.bkt.clouddn.com/e84b89a0c247046bf7d00987d026ecdc.png', 'jpg', '0', '1bb5f63b835fe4ed59ec13b6e2e508e8', '24ed200210e0c605165f8d6e04ed962c', 'Qiniu', '0', '1479281963', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('453', '0', 'ce0160eed136e0481074b28c2494d950.png', '/uploads/20161116\\ce0160eed136e0481074b28c2494d950.jpg', 'http://oetqv9f47.bkt.clouddn.com/ce0160eed136e0481074b28c2494d950.png', 'jpg', '0', '1bb5f63b835fe4ed59ec13b6e2e508e8', '24ed200210e0c605165f8d6e04ed962c', 'Qiniu', '0', '1479282004', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('454', '0', '19b2518abc33018e67cb5eaa647fc3ca.png', '/uploads/20161116\\19b2518abc33018e67cb5eaa647fc3ca.jpg', 'http://oetqv9f47.bkt.clouddn.com/19b2518abc33018e67cb5eaa647fc3ca.png', 'jpg', '0', '1bb5f63b835fe4ed59ec13b6e2e508e8', '24ed200210e0c605165f8d6e04ed962c', 'Qiniu', '0', '1479282073', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('455', '0', 'e21d2af3d0e67637d163daee81d82af2.png', '/uploads/20161116\\e21d2af3d0e67637d163daee81d82af2.jpg', 'http://oetqv9f47.bkt.clouddn.com/e21d2af3d0e67637d163daee81d82af2.png', 'jpg', '0', '63d5a2fbecaebbe9d5c9e55f2b734254', 'f783a4bfd24cf3346d6f6e54872cce90', 'Qiniu', '0', '1479282233', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('456', '0', '37fb3688b4680174734d8d9a4b1843c3.png', '/uploads/20161116\\37fb3688b4680174734d8d9a4b1843c3.jpg', 'http://oetqv9f47.bkt.clouddn.com/37fb3688b4680174734d8d9a4b1843c3.png', 'jpg', '0', 'f9bcf26eccf7e8970f7dd7044d216f8d', '6d08c10f5d461e1e9ff1963a42fcea7c', 'Qiniu', '0', '1479282795', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('461', '0', 'a27ab0f84f3d266c66ffee380e62ee4d.png', '/uploads/20161118\\a27ab0f84f3d266c66ffee380e62ee4d.jpg', 'http://oetqv9f47.bkt.clouddn.com/a27ab0f84f3d266c66ffee380e62ee4d.png', 'jpg', '0', 'efeb04ccef37da80ff618c5e511aaf03', '04237e3aa3a2765e9cfe7ebabd1f3d9b', 'Qiniu', '0', '1479453387', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('462', '0', 'f50d63c495d16571188eb70b7effc038.png', '/uploads/20161118\\f50d63c495d16571188eb70b7effc038.jpg', 'http://oetqv9f47.bkt.clouddn.com/f50d63c495d16571188eb70b7effc038.png', 'jpg', '0', '9671114825510124bd2dbf0266d96037', '58d54e6d038e7bb47ff28c0caa869725', 'Qiniu', '0', '1479453398', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('463', '0', '97a6f58ffbe51842edc9341b6234c8a3.png', '/uploads/20161118\\97a6f58ffbe51842edc9341b6234c8a3.jpg', 'http://oetqv9f47.bkt.clouddn.com/97a6f58ffbe51842edc9341b6234c8a3.png', 'jpg', '0', 'cd1cba7af87ac15fe0328cef1542e555', '7aea0e5fb1805dbcce1b9f9e2a99a5f9', 'Qiniu', '0', '1479453409', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('464', '0', '3c9815c4bb4207b346fd0b1e9cdc205d.png', '/uploads/20161118\\3c9815c4bb4207b346fd0b1e9cdc205d.jpg', 'http://oetqv9f47.bkt.clouddn.com/3c9815c4bb4207b346fd0b1e9cdc205d.png', 'jpg', '0', 'b043c8ef79edf4be929f5c5adaa21370', '1e7c892aa5a763f89fb699fcb6e25f27', 'Qiniu', '0', '1479453627', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('465', '0', 'c54917f1113611c7bea6b595aa0e4311.png', '/uploads/20161118\\c54917f1113611c7bea6b595aa0e4311.jpg', 'http://oetqv9f47.bkt.clouddn.com/c54917f1113611c7bea6b595aa0e4311.png', 'jpg', '0', '14a60e94b55fe47f7b3ef5298cfd131e', '51ad9063b80376d41cced0dd6c5dece9', 'Qiniu', '0', '1479453645', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('466', '0', '050127f3b95540357eac3023e2e33224.png', '/uploads/20161118\\050127f3b95540357eac3023e2e33224.jpg', 'http://oetqv9f47.bkt.clouddn.com/050127f3b95540357eac3023e2e33224.png', 'jpg', '0', '6c8d2792ecc8add8b008726c8b3e7b30', '147111973a562b5335a45975faccf6f3', 'Qiniu', '0', '1479453657', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('467', '0', 'ee8138f5a495025470e8b41a52410186.png', '/uploads/20161118\\ee8138f5a495025470e8b41a52410186.jpg', 'http://oetqv9f47.bkt.clouddn.com/ee8138f5a495025470e8b41a52410186.png', 'jpg', '0', '8d13c9739fcbbcc08966e813cf21845e', '39cab8d43d7232adedd2bfce9dbc9d0c', 'Qiniu', '0', '1479453671', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('468', '0', 'bce5bdd7f5ae850a05d300c9e17b1712.png', '/uploads/20161118\\bce5bdd7f5ae850a05d300c9e17b1712.jpg', 'http://oetqv9f47.bkt.clouddn.com/bce5bdd7f5ae850a05d300c9e17b1712.png', 'jpg', '0', 'f5777fc63206262d8335af3a95ca90e1', '82f1307183b09d05ed36a5803eefeeb9', 'Qiniu', '0', '1479453682', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('469', '0', 'c543f912faf4b629e26c6faca2479e8b.png', '/uploads/20161118\\c543f912faf4b629e26c6faca2479e8b.jpg', 'http://oetqv9f47.bkt.clouddn.com/c543f912faf4b629e26c6faca2479e8b.png', 'jpg', '0', 'f5777fc63206262d8335af3a95ca90e1', '82f1307183b09d05ed36a5803eefeeb9', 'Qiniu', '0', '1479453750', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('470', '0', '00117ec512ab6635553bb2c9e6c6bfab.png', '/uploads/20161118\\00117ec512ab6635553bb2c9e6c6bfab.jpg', 'http://oetqv9f47.bkt.clouddn.com/00117ec512ab6635553bb2c9e6c6bfab.png', 'jpg', '0', '68c0b1fb7ecb47870136363850effe5f', '1ae6c165012dd742b71269b7f52d4e7c', 'Qiniu', '0', '1479453976', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('471', '0', 'de6a6cdbd52237a3306a437d51aba50b.png', '/uploads/20161118\\de6a6cdbd52237a3306a437d51aba50b.jpg', 'http://oetqv9f47.bkt.clouddn.com/de6a6cdbd52237a3306a437d51aba50b.png', 'jpg', '0', '1f702800c0d5a5621ef45aee1b7f87ab', '20f1d5b5e180b8a2abaa736f69160955', 'Qiniu', '0', '1479453989', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('472', '0', '68242d8ed9c8e3e388df19fba19e078f.png', '/uploads/20161118\\68242d8ed9c8e3e388df19fba19e078f.jpg', 'http://oetqv9f47.bkt.clouddn.com/68242d8ed9c8e3e388df19fba19e078f.png', 'jpg', '0', '73014984394c8fb452bae59ec2730c5d', '1198032b32d62b28dd0b1049a73e1563', 'Qiniu', '0', '1479454003', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('473', '0', 'd27f90670ec17c7655013bb0fc35a2cc.png', '/uploads/20161118\\d27f90670ec17c7655013bb0fc35a2cc.jpg', 'http://oetqv9f47.bkt.clouddn.com/d27f90670ec17c7655013bb0fc35a2cc.png', 'jpg', '0', '05894e3e65a89ad2946722f6149fce1e', '7cf290b6d4b54fd16420bf2b6cf1abf0', 'Qiniu', '0', '1479454020', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('474', '0', '8614ad78aa65f083df9600bef0c3f75f.png', '/uploads/20161118\\8614ad78aa65f083df9600bef0c3f75f.jpg', 'http://oetqv9f47.bkt.clouddn.com/8614ad78aa65f083df9600bef0c3f75f.png', 'jpg', '0', '9b9add0b3fa4f2290ea0792a7febb3a0', 'cfc26fe7954c8c3d9fc077baca4948aa', 'Qiniu', '0', '1479454032', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('545', '0', '656dc1d0ab952bfe12c8d9fe72e5c0eb.png', '/uploads/20170113\\656dc1d0ab952bfe12c8d9fe72e5c0eb.jpg', 'http://oetqv9f47.bkt.clouddn.com/656dc1d0ab952bfe12c8d9fe72e5c0eb.png', 'jpg', '0', '82ad7e8ed5bd7e7ed97f06957ba1f074', 'f68700a30267d6c65f027b3a1f56403c', 'Qiniu', '0', '1484288925', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('492', '0', '60ad8944f0b885bd2dfee1386e5793b2.png', '/uploads/20161209\\60ad8944f0b885bd2dfee1386e5793b2.jpg', 'http://oetqv9f47.bkt.clouddn.com/60ad8944f0b885bd2dfee1386e5793b2.png', 'jpg', '0', 'fc3cd79f38b6a653ece56ba084eeab0a', '11b7561a44fa2f6a4c0f3e0350a7b194', 'Qiniu', '0', '1481268560', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('493', '0', '23ca2af4ed9fcc90181394eb6ad5ea79.png', '/uploads/20161209\\23ca2af4ed9fcc90181394eb6ad5ea79.jpg', 'http://oetqv9f47.bkt.clouddn.com/23ca2af4ed9fcc90181394eb6ad5ea79.png', 'jpg', '0', 'c0ae3a59c862eb987cb1874fae6fc1cc', 'd0153fc883b17de302de639d0c15c169', 'Qiniu', '0', '1481268561', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('494', '0', '0e45ce4ad3f49a9e8dc94afc098e339d.png', '/uploads/20161209\\0e45ce4ad3f49a9e8dc94afc098e339d.jpg', 'http://oetqv9f47.bkt.clouddn.com/0e45ce4ad3f49a9e8dc94afc098e339d.png', 'jpg', '0', '63d5a2fbecaebbe9d5c9e55f2b734254', 'f783a4bfd24cf3346d6f6e54872cce90', 'Qiniu', '0', '1481268561', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('495', '0', 'a5cbf72bcd709fa71d1a1d76d4209a7c.png', '/uploads/20161209\\a5cbf72bcd709fa71d1a1d76d4209a7c.jpg', 'http://oetqv9f47.bkt.clouddn.com/a5cbf72bcd709fa71d1a1d76d4209a7c.png', 'jpg', '0', '1bb5f63b835fe4ed59ec13b6e2e508e8', '24ed200210e0c605165f8d6e04ed962c', 'Qiniu', '0', '1481268561', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('496', '0', '18ef4ab0abab161d017dbeb7529a622e.png', '/uploads/20161209\\18ef4ab0abab161d017dbeb7529a622e.jpg', 'http://oetqv9f47.bkt.clouddn.com/18ef4ab0abab161d017dbeb7529a622e.png', 'jpg', '0', 'f5b85d4cd18063e2bddf987a0fb45065', '4f3a3f8c558d3010b36a226ae4728fd3', 'Qiniu', '0', '1481268562', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('497', '0', '08d5fea238b74c83db6c19ab70ceb242.png', '/uploads/20161209\\08d5fea238b74c83db6c19ab70ceb242.jpg', 'http://oetqv9f47.bkt.clouddn.com/08d5fea238b74c83db6c19ab70ceb242.png', 'jpg', '0', 'f9bcf26eccf7e8970f7dd7044d216f8d', '6d08c10f5d461e1e9ff1963a42fcea7c', 'Qiniu', '0', '1481268562', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('498', '0', '8d8b6aa1b0957bbb83acb60dec8a7ee4.png', '/uploads/20161209\\8d8b6aa1b0957bbb83acb60dec8a7ee4.jpg', 'http://oetqv9f47.bkt.clouddn.com/8d8b6aa1b0957bbb83acb60dec8a7ee4.png', 'jpg', '0', '4bfed2c12b1bd566add513f22d325d37', '2ce4b172d1b933e99f307474ce9c4e33', 'Qiniu', '0', '1481268562', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('501', '0', '3a746b3af5aee0cd72ea43af20164e50.png', '/uploads/20161209\\3a746b3af5aee0cd72ea43af20164e50.jpg', 'http://oetqv9f47.bkt.clouddn.com/3a746b3af5aee0cd72ea43af20164e50.png', 'jpg', '0', 'e3aca1d30353d4ce2a584db1e470edaf', 'da8405a1c9c84d6bb6684aef789020b7', 'Qiniu', '0', '1481273128', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('502', '0', '037f626510a1a8d19b639339f63d6fe4.png', '/uploads/20161209\\037f626510a1a8d19b639339f63d6fe4.jpg', 'http://oetqv9f47.bkt.clouddn.com/037f626510a1a8d19b639339f63d6fe4.png', 'jpg', '0', 'e3aca1d30353d4ce2a584db1e470edaf', 'da8405a1c9c84d6bb6684aef789020b7', 'Qiniu', '0', '1481273128', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('515', '0', '7046e94e4d4359f0e98f0164632f14ba.png', '/uploads/20161220\\7046e94e4d4359f0e98f0164632f14ba.jpg', 'http://oetqv9f47.bkt.clouddn.com/7046e94e4d4359f0e98f0164632f14ba.png', 'jpg', '0', '9671114825510124bd2dbf0266d96037', '58d54e6d038e7bb47ff28c0caa869725', 'Qiniu', '0', '1482202552', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('516', '0', '583cece7bf37b15c276ef6145f45e4ce.png', '/uploads/20161220\\583cece7bf37b15c276ef6145f45e4ce.jpg', 'http://oetqv9f47.bkt.clouddn.com/583cece7bf37b15c276ef6145f45e4ce.png', 'jpg', '0', 'cd1cba7af87ac15fe0328cef1542e555', '7aea0e5fb1805dbcce1b9f9e2a99a5f9', 'Qiniu', '0', '1482202654', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('517', '0', '22fe01fb9a572c43b87a2d8f0e7d9c44.png', '/uploads/20161220\\22fe01fb9a572c43b87a2d8f0e7d9c44.jpg', 'http://oetqv9f47.bkt.clouddn.com/22fe01fb9a572c43b87a2d8f0e7d9c44.png', 'jpg', '0', '743eb28bc08d46020514e0acae06a702', '2b711ba8fad3222e114c941a3278276e', 'Qiniu', '0', '1482202726', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('518', '0', '6c0b23dce583f53958ffc804e2f49ca4.png', '/uploads/20161220\\6c0b23dce583f53958ffc804e2f49ca4.jpg', 'http://oetqv9f47.bkt.clouddn.com/6c0b23dce583f53958ffc804e2f49ca4.png', 'jpg', '0', 'cd1cba7af87ac15fe0328cef1542e555', '7aea0e5fb1805dbcce1b9f9e2a99a5f9', 'Qiniu', '0', '1482202869', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('519', '0', '3792b4cc96252f432089c85718a0783b.png', '/uploads/20161220\\3792b4cc96252f432089c85718a0783b.jpg', 'http://oetqv9f47.bkt.clouddn.com/3792b4cc96252f432089c85718a0783b.png', 'jpg', '0', '9671114825510124bd2dbf0266d96037', '58d54e6d038e7bb47ff28c0caa869725', 'Qiniu', '0', '1482202892', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('520', '0', '87f8d58db7fd87c12c0379ec5d74ced7.png', '/uploads/20161220\\87f8d58db7fd87c12c0379ec5d74ced7.jpg', 'http://oetqv9f47.bkt.clouddn.com/87f8d58db7fd87c12c0379ec5d74ced7.png', 'jpg', '0', 'cd1cba7af87ac15fe0328cef1542e555', '7aea0e5fb1805dbcce1b9f9e2a99a5f9', 'Qiniu', '0', '1482206220', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('521', '0', 'a1216054b3e7470b92cddaec3f06a808.png', '/uploads/20161220\\a1216054b3e7470b92cddaec3f06a808.jpg', 'http://oetqv9f47.bkt.clouddn.com/a1216054b3e7470b92cddaec3f06a808.png', 'jpg', '0', 'efeb04ccef37da80ff618c5e511aaf03', '04237e3aa3a2765e9cfe7ebabd1f3d9b', 'Qiniu', '0', '1482225145', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('522', '0', 'd210d71c7a006b0365ef86ad71a5b2a1.png', '/uploads/20161220\\d210d71c7a006b0365ef86ad71a5b2a1.jpg', 'http://oetqv9f47.bkt.clouddn.com/d210d71c7a006b0365ef86ad71a5b2a1.png', 'jpg', '0', 'efeb04ccef37da80ff618c5e511aaf03', '04237e3aa3a2765e9cfe7ebabd1f3d9b', 'Qiniu', '0', '1482225241', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('523', '0', 'bb8adcce59e56eec295df6b1ea2439e4.png', '/uploads/20161220\\bb8adcce59e56eec295df6b1ea2439e4.jpg', 'http://oetqv9f47.bkt.clouddn.com/bb8adcce59e56eec295df6b1ea2439e4.png', 'jpg', '0', '9671114825510124bd2dbf0266d96037', '58d54e6d038e7bb47ff28c0caa869725', 'Qiniu', '0', '1482225700', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('524', '0', '35d33dc67cce2d04fd7e04b880112cf2.png', '/uploads/20161220\\35d33dc67cce2d04fd7e04b880112cf2.jpg', 'http://oetqv9f47.bkt.clouddn.com/35d33dc67cce2d04fd7e04b880112cf2.png', 'jpg', '0', 'efeb04ccef37da80ff618c5e511aaf03', '04237e3aa3a2765e9cfe7ebabd1f3d9b', 'Qiniu', '0', '1482225867', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('548', '0', '5068c1fddc257c558559e90567642b25.png', '/uploads/20170204\\5068c1fddc257c558559e90567642b25.jpg', 'http://oetqv9f47.bkt.clouddn.com/5068c1fddc257c558559e90567642b25.png', 'jpg', '0', '743eb28bc08d46020514e0acae06a702', '2b711ba8fad3222e114c941a3278276e', 'Qiniu', '0', '1486196925', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('549', '0', '7232a046bee799320f0d23db98a81dfb.png', '/uploads/20170204\\7232a046bee799320f0d23db98a81dfb.jpg', 'http://oetqv9f47.bkt.clouddn.com/7232a046bee799320f0d23db98a81dfb.png', 'jpg', '0', '743eb28bc08d46020514e0acae06a702', '2b711ba8fad3222e114c941a3278276e', 'Qiniu', '0', '1486200816', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('550', '0', '0ee6ae84ab8a07f42caff8e9f8e3e24c.png', '/uploads/20170204\\0ee6ae84ab8a07f42caff8e9f8e3e24c.jpg', 'http://oetqv9f47.bkt.clouddn.com/0ee6ae84ab8a07f42caff8e9f8e3e24c.png', 'jpg', '0', '2ad9e075a50237f98c514ba5944d104d', '2f2a352401cbd0b3fd715a6cb5273078', 'Qiniu', '0', '1486200817', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('551', '0', '30c7f3d895a2acbfecf00ca86dc9c295.png', '/uploads/20170204\\30c7f3d895a2acbfecf00ca86dc9c295.jpg', 'http://oetqv9f47.bkt.clouddn.com/30c7f3d895a2acbfecf00ca86dc9c295.png', 'jpg', '0', '9671114825510124bd2dbf0266d96037', '58d54e6d038e7bb47ff28c0caa869725', 'Qiniu', '0', '1486200817', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('552', '0', '4a335b51fd9782714c4f27275a8c8c15.png', '/uploads/20170204\\4a335b51fd9782714c4f27275a8c8c15.jpg', 'http://oetqv9f47.bkt.clouddn.com/4a335b51fd9782714c4f27275a8c8c15.png', 'jpg', '0', 'cd1cba7af87ac15fe0328cef1542e555', '7aea0e5fb1805dbcce1b9f9e2a99a5f9', 'Qiniu', '0', '1486200818', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('553', '0', '08cd79ff522766de8f321f6c614aacd2.png', '/uploads/20181221\\08cd79ff522766de8f321f6c614aacd2.jpg', 'http://oetqv9f47.bkt.clouddn.com/4a335b51fd9782714c4f27275a8c8c15.png', 'jpg', '0', '12cd0fa6e57c5c390ba1547644da62f7', 'e55642ce84e5b3e35f6409a0be9b683c', 'Qiniu', '0', '1545380757', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('559', '0', '19d846327fe3dd06c15790ebdb86208b.png', '/uploads/20181224\\19d846327fe3dd06c15790ebdb86208b.jpg', 'http://oetqv9f47.bkt.clouddn.com/19d846327fe3dd06c15790ebdb86208b.png', 'jpg', '0', 'f7682b1cd0605cac7771fe9997674c7b', 'eabe09729e14a8434398b884fff6485b', 'Qiniu', '0', '1545643684', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('556', '0', '1499fbd5bb3e7cadcb71e0e2a907682a.png', '/uploads/20181224\\1499fbd5bb3e7cadcb71e0e2a907682a.jpg', 'http://oetqv9f47.bkt.clouddn.com/1499fbd5bb3e7cadcb71e0e2a907682a.png', 'jpg', '0', '868e7c4e16aa512597f915fdd901b957', '92199e22c640fdc786c92b37f8243e88', 'Qiniu', '0', '1545643409', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('557', '0', '20000fe8fb38e29ed04eef3866bbbd1d.png', '/uploads/20181224\\20000fe8fb38e29ed04eef3866bbbd1d.jpg', 'http://oetqv9f47.bkt.clouddn.com/20000fe8fb38e29ed04eef3866bbbd1d.png', 'jpg', '0', '1379e9f9cfb5f9e2f45941150f2d50c5', '224258c0dbdac269741b328a8f28a9c7', 'Qiniu', '0', '1545643479', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('558', '0', '049c85705ac7ca885b46430e54b3421a.png', '/uploads/20181224\\049c85705ac7ca885b46430e54b3421a.jpg', 'http://oetqv9f47.bkt.clouddn.com/049c85705ac7ca885b46430e54b3421a.png', 'jpg', '0', 'fa30c3f57874437a4638077e630666a7', 'e2009389d4719d90d76264b08cad6081', 'Qiniu', '0', '1545643552', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('560', '0', '18d39230cdb5161511db53fc5879d6cc.png', '/uploads/20181224\\18d39230cdb5161511db53fc5879d6cc.jpg', 'http://oetqv9f47.bkt.clouddn.com/18d39230cdb5161511db53fc5879d6cc.png', 'jpg', '0', '27c7b80ed7275953ec14b99d7862211e', '140378a3536636a6d98a70c99b1e559a', 'Qiniu', '0', '1545643736', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('561', '0', '16267dddb7f7b7e07730b6d6a8dabfaf.png', '/uploads/20181225\\16267dddb7f7b7e07730b6d6a8dabfaf.jpg', 'http://oetqv9f47.bkt.clouddn.com/16267dddb7f7b7e07730b6d6a8dabfaf.png', 'jpg', '0', 'cd5e16dbd9718543b34efde26070cfe6', '0e5be6bb7152e2663950f2c77d5c4061', 'Qiniu', '0', '1545706411', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('563', '0', 'b8b769a0d445c8befe8c22d24b8b8541.png', '/uploads/20181225\\b8b769a0d445c8befe8c22d24b8b8541.jpg', 'http://oetqv9f47.bkt.clouddn.com/b8b769a0d445c8befe8c22d24b8b8541.png', 'jpg', '0', 'cde523947444dbcefec82a218a8c19b4', '1d08faa66b93d7e3bc183b0bdc48926e', 'Qiniu', '0', '1545706748', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('564', '0', 'ec9be21296b1c8b3ac6689b664b2af6d.png', '/uploads/20181225\\ec9be21296b1c8b3ac6689b664b2af6d.jpg', 'http://oetqv9f47.bkt.clouddn.com/ec9be21296b1c8b3ac6689b664b2af6d.png', 'jpg', '0', '3f2219ffdb5970e2ec6034531d66b84b', '7fd5d2a0f43e090123a51e41bda605a0', 'Qiniu', '0', '1545707338', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('565', '0', 'ad90ce5a9d6845801370f2c3cbab726d.png', '/uploads/20181225\\ad90ce5a9d6845801370f2c3cbab726d.jpg', 'http://oetqv9f47.bkt.clouddn.com/ad90ce5a9d6845801370f2c3cbab726d.png', 'jpg', '0', '3f2219ffdb5970e2ec6034531d66b84b', '7fd5d2a0f43e090123a51e41bda605a0', 'Qiniu', '0', '1545707348', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('566', '0', 'dd1682c3b3e1240a97a2a69337073ba1.png', '/uploads/20181225\\dd1682c3b3e1240a97a2a69337073ba1.jpg', 'http://oetqv9f47.bkt.clouddn.com/dd1682c3b3e1240a97a2a69337073ba1.png', 'jpg', '0', 'ba6b420343f865fafdfc7b6313f277b3', '28b5bda917e79fbd5667f21e4913c539', 'Qiniu', '0', '1545707357', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('567', '0', '16ee08f81cf09f6e46330154512ee595.png', '/uploads/20181225\\16ee08f81cf09f6e46330154512ee595.jpg', 'http://oetqv9f47.bkt.clouddn.com/16ee08f81cf09f6e46330154512ee595.png', 'jpg', '0', '5475dd18fc00430441ecb327c4679450', 'b7297decadfea655234db83668c702db', 'Qiniu', '0', '1545707367', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('568', '0', '7c1d30e4410f21f126310f879bc6d4fc.png', '/uploads/20181225\\7c1d30e4410f21f126310f879bc6d4fc.jpg', 'http://oetqv9f47.bkt.clouddn.com/7c1d30e4410f21f126310f879bc6d4fc.png', 'jpg', '0', '57fb12e66f1b5f39ca7e7ae04cb8f231', '441306794a1a14ab82a0cbdedf02c760', 'Qiniu', '0', '1545707379', '0', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('569', '0', '563a22b4e7c40c90280cd75b2b543d30.png', '/uploads/20181226\\563a22b4e7c40c90280cd75b2b543d30.jpg', 'http://oetqv9f47.bkt.clouddn.com/563a22b4e7c40c90280cd75b2b543d30.png', 'jpg', '0', '868e7c4e16aa512597f915fdd901b957', '92199e22c640fdc786c92b37f8243e88', 'Qiniu', '0', '1545827152', '0', '0', '1');

-- ----------------------------
-- Table structure for oc_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `oc_admin_user`;
CREATE TABLE `oc_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UID',
  `user_type` int(11) NOT NULL DEFAULT '1' COMMENT '用户类型',
  `nickname` varchar(63) NOT NULL DEFAULT '' COMMENT '昵称',
  `username` varchar(31) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(63) NOT NULL DEFAULT '' COMMENT '邮箱',
  `email_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮箱验证',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `mobile_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮箱验证',
  `avatar` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '头像',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_type` varchar(15) NOT NULL DEFAULT '' COMMENT '注册方式',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `store_ids` varchar(255) DEFAULT '' COMMENT '仓库ID集合',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户账号表';

-- ----------------------------
-- Records of oc_admin_user
-- ----------------------------
INSERT INTO `oc_admin_user` VALUES ('1', '1', '超级管理员', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '0', '', '0', '0', '0', '0.00', '0', '', '1438651748', '1438651748', '1', '0');
INSERT INTO `oc_admin_user` VALUES ('10', '1', '张三', 'zhangsan', '25d55ad283aa400af464c76d713c07ad', '', '0', '13213125500', '1', '0', '0', '0.00', '0', '', '1487679252', '0', '1', '');

-- ----------------------------
-- Table structure for oc_app_ads
-- ----------------------------
DROP TABLE IF EXISTS `oc_app_ads`;
CREATE TABLE `oc_app_ads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '幻灯ID',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `content` char(80) NOT NULL DEFAULT '' COMMENT '关联内容',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品id',
  `cover` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '图片id',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '点击链接',
  `group_id` int(11) NOT NULL DEFAULT '1' COMMENT '1：版头轮播，2：推介Banner',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='App广告表';

-- ----------------------------
-- Records of oc_app_ads
-- ----------------------------
INSERT INTO `oc_app_ads` VALUES ('11', '', '', '1', '547', '', '1', '0', '0', '0', '1');
INSERT INTO `oc_app_ads` VALUES ('12', '', '', '1', '548', '', '1', '0', '0', '0', '1');
INSERT INTO `oc_app_ads` VALUES ('13', '', '', '1', '549', '', '1', '0', '0', '0', '1');
INSERT INTO `oc_app_ads` VALUES ('14', '', '', '1', '550', '', '1', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for oc_area
-- ----------------------------
DROP TABLE IF EXISTS `oc_area`;
CREATE TABLE `oc_area` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=910007 DEFAULT CHARSET=utf8 COMMENT='中国省市区乡镇数据表';

-- ----------------------------
-- Records of oc_area
-- ----------------------------
INSERT INTO `oc_area` VALUES ('110000', '北京市', '1', '0');
INSERT INTO `oc_area` VALUES ('120000', '天津市', '1', '0');
INSERT INTO `oc_area` VALUES ('130000', '河北省', '1', '0');
INSERT INTO `oc_area` VALUES ('140000', '山西省', '1', '0');
INSERT INTO `oc_area` VALUES ('150000', '内蒙古', '1', '0');
INSERT INTO `oc_area` VALUES ('210000', '辽宁省', '1', '0');
INSERT INTO `oc_area` VALUES ('220000', '吉林省', '1', '0');
INSERT INTO `oc_area` VALUES ('230000', '黑龙江', '1', '0');
INSERT INTO `oc_area` VALUES ('310000', '上海市', '1', '0');
INSERT INTO `oc_area` VALUES ('320000', '江苏省', '1', '0');
INSERT INTO `oc_area` VALUES ('330000', '浙江省', '1', '0');
INSERT INTO `oc_area` VALUES ('340000', '安徽省', '1', '0');
INSERT INTO `oc_area` VALUES ('350000', '福建省', '1', '0');
INSERT INTO `oc_area` VALUES ('360000', '江西省', '1', '0');
INSERT INTO `oc_area` VALUES ('370000', '山东省', '1', '0');
INSERT INTO `oc_area` VALUES ('410000', '河南省', '1', '0');
INSERT INTO `oc_area` VALUES ('420000', '湖北省', '1', '0');
INSERT INTO `oc_area` VALUES ('430000', '湖南省', '1', '0');
INSERT INTO `oc_area` VALUES ('440000', '广东省', '1', '0');
INSERT INTO `oc_area` VALUES ('450000', '广西省', '1', '0');
INSERT INTO `oc_area` VALUES ('460000', '海南省', '1', '0');
INSERT INTO `oc_area` VALUES ('500000', '重庆市', '1', '0');
INSERT INTO `oc_area` VALUES ('510000', '四川省', '1', '0');
INSERT INTO `oc_area` VALUES ('520000', '贵州省', '1', '0');
INSERT INTO `oc_area` VALUES ('530000', '云南省', '1', '0');
INSERT INTO `oc_area` VALUES ('540000', '西　藏', '1', '0');
INSERT INTO `oc_area` VALUES ('610000', '陕西省', '1', '0');
INSERT INTO `oc_area` VALUES ('620000', '甘肃省', '1', '0');
INSERT INTO `oc_area` VALUES ('630000', '青海省', '1', '0');
INSERT INTO `oc_area` VALUES ('640000', '宁　夏', '1', '0');
INSERT INTO `oc_area` VALUES ('650000', '新　疆', '1', '0');
INSERT INTO `oc_area` VALUES ('710000', '台湾省', '1', '0');
INSERT INTO `oc_area` VALUES ('810000', '香　港', '1', '0');
INSERT INTO `oc_area` VALUES ('820000', '澳　门', '1', '0');
INSERT INTO `oc_area` VALUES ('110100', '北京市', '2', '110000');
INSERT INTO `oc_area` VALUES ('110200', '县', '2', '110000');
INSERT INTO `oc_area` VALUES ('120100', '市辖区', '2', '120000');
INSERT INTO `oc_area` VALUES ('120200', '县', '2', '120000');
INSERT INTO `oc_area` VALUES ('130100', '石家庄市', '2', '130000');
INSERT INTO `oc_area` VALUES ('130200', '唐山市', '2', '130000');
INSERT INTO `oc_area` VALUES ('130300', '秦皇岛市', '2', '130000');
INSERT INTO `oc_area` VALUES ('130400', '邯郸市', '2', '130000');
INSERT INTO `oc_area` VALUES ('130500', '邢台市', '2', '130000');
INSERT INTO `oc_area` VALUES ('130600', '保定市', '2', '130000');
INSERT INTO `oc_area` VALUES ('130700', '张家口市', '2', '130000');
INSERT INTO `oc_area` VALUES ('130800', '承德市', '2', '130000');
INSERT INTO `oc_area` VALUES ('130900', '沧州市', '2', '130000');
INSERT INTO `oc_area` VALUES ('131000', '廊坊市', '2', '130000');
INSERT INTO `oc_area` VALUES ('131100', '衡水市', '2', '130000');
INSERT INTO `oc_area` VALUES ('140100', '太原市', '2', '140000');
INSERT INTO `oc_area` VALUES ('140200', '大同市', '2', '140000');
INSERT INTO `oc_area` VALUES ('140300', '阳泉市', '2', '140000');
INSERT INTO `oc_area` VALUES ('140400', '长治市', '2', '140000');
INSERT INTO `oc_area` VALUES ('140500', '晋城市', '2', '140000');
INSERT INTO `oc_area` VALUES ('140600', '朔州市', '2', '140000');
INSERT INTO `oc_area` VALUES ('140700', '晋中市', '2', '140000');
INSERT INTO `oc_area` VALUES ('140800', '运城市', '2', '140000');
INSERT INTO `oc_area` VALUES ('140900', '忻州市', '2', '140000');
INSERT INTO `oc_area` VALUES ('141000', '临汾市', '2', '140000');
INSERT INTO `oc_area` VALUES ('141100', '吕梁市', '2', '140000');
INSERT INTO `oc_area` VALUES ('150100', '呼和浩特市', '2', '150000');
INSERT INTO `oc_area` VALUES ('150200', '包头市', '2', '150000');
INSERT INTO `oc_area` VALUES ('150300', '乌海市', '2', '150000');
INSERT INTO `oc_area` VALUES ('150400', '赤峰市', '2', '150000');
INSERT INTO `oc_area` VALUES ('150500', '通辽市', '2', '150000');
INSERT INTO `oc_area` VALUES ('150600', '鄂尔多斯市', '2', '150000');
INSERT INTO `oc_area` VALUES ('150700', '呼伦贝尔市', '2', '150000');
INSERT INTO `oc_area` VALUES ('150800', '巴彦淖尔市', '2', '150000');
INSERT INTO `oc_area` VALUES ('150900', '乌兰察布市', '2', '150000');
INSERT INTO `oc_area` VALUES ('152200', '兴安盟', '2', '150000');
INSERT INTO `oc_area` VALUES ('152500', '锡林郭勒盟', '2', '150000');
INSERT INTO `oc_area` VALUES ('152900', '阿拉善盟', '2', '150000');
INSERT INTO `oc_area` VALUES ('210100', '沈阳市', '2', '210000');
INSERT INTO `oc_area` VALUES ('210200', '大连市', '2', '210000');
INSERT INTO `oc_area` VALUES ('210300', '鞍山市', '2', '210000');
INSERT INTO `oc_area` VALUES ('210400', '抚顺市', '2', '210000');
INSERT INTO `oc_area` VALUES ('210500', '本溪市', '2', '210000');
INSERT INTO `oc_area` VALUES ('210600', '丹东市', '2', '210000');
INSERT INTO `oc_area` VALUES ('210700', '锦州市', '2', '210000');
INSERT INTO `oc_area` VALUES ('210800', '营口市', '2', '210000');
INSERT INTO `oc_area` VALUES ('210900', '阜新市', '2', '210000');
INSERT INTO `oc_area` VALUES ('211000', '辽阳市', '2', '210000');
INSERT INTO `oc_area` VALUES ('211100', '盘锦市', '2', '210000');
INSERT INTO `oc_area` VALUES ('211200', '铁岭市', '2', '210000');
INSERT INTO `oc_area` VALUES ('211300', '朝阳市', '2', '210000');
INSERT INTO `oc_area` VALUES ('211400', '葫芦岛市', '2', '210000');
INSERT INTO `oc_area` VALUES ('220100', '长春市', '2', '220000');
INSERT INTO `oc_area` VALUES ('220200', '吉林市', '2', '220000');
INSERT INTO `oc_area` VALUES ('220300', '四平市', '2', '220000');
INSERT INTO `oc_area` VALUES ('220400', '辽源市', '2', '220000');
INSERT INTO `oc_area` VALUES ('220500', '通化市', '2', '220000');
INSERT INTO `oc_area` VALUES ('220600', '白山市', '2', '220000');
INSERT INTO `oc_area` VALUES ('220700', '松原市', '2', '220000');
INSERT INTO `oc_area` VALUES ('220800', '白城市', '2', '220000');
INSERT INTO `oc_area` VALUES ('222400', '延边朝鲜族自治州', '2', '220000');
INSERT INTO `oc_area` VALUES ('230100', '哈尔滨市', '2', '230000');
INSERT INTO `oc_area` VALUES ('230200', '齐齐哈尔市', '2', '230000');
INSERT INTO `oc_area` VALUES ('230300', '鸡西市', '2', '230000');
INSERT INTO `oc_area` VALUES ('230400', '鹤岗市', '2', '230000');
INSERT INTO `oc_area` VALUES ('230500', '双鸭山市', '2', '230000');
INSERT INTO `oc_area` VALUES ('230600', '大庆市', '2', '230000');
INSERT INTO `oc_area` VALUES ('230700', '伊春市', '2', '230000');
INSERT INTO `oc_area` VALUES ('230800', '佳木斯市', '2', '230000');
INSERT INTO `oc_area` VALUES ('230900', '七台河市', '2', '230000');
INSERT INTO `oc_area` VALUES ('231000', '牡丹江市', '2', '230000');
INSERT INTO `oc_area` VALUES ('231100', '黑河市', '2', '230000');
INSERT INTO `oc_area` VALUES ('231200', '绥化市', '2', '230000');
INSERT INTO `oc_area` VALUES ('232700', '大兴安岭地区', '2', '230000');
INSERT INTO `oc_area` VALUES ('310100', '市辖区', '2', '310000');
INSERT INTO `oc_area` VALUES ('310200', '县', '2', '310000');
INSERT INTO `oc_area` VALUES ('320100', '南京市', '2', '320000');
INSERT INTO `oc_area` VALUES ('320200', '无锡市', '2', '320000');
INSERT INTO `oc_area` VALUES ('320300', '徐州市', '2', '320000');
INSERT INTO `oc_area` VALUES ('320400', '常州市', '2', '320000');
INSERT INTO `oc_area` VALUES ('320500', '苏州市', '2', '320000');
INSERT INTO `oc_area` VALUES ('320600', '南通市', '2', '320000');
INSERT INTO `oc_area` VALUES ('320700', '连云港市', '2', '320000');
INSERT INTO `oc_area` VALUES ('320800', '淮安市', '2', '320000');
INSERT INTO `oc_area` VALUES ('320900', '盐城市', '2', '320000');
INSERT INTO `oc_area` VALUES ('321000', '扬州市', '2', '320000');
INSERT INTO `oc_area` VALUES ('321100', '镇江市', '2', '320000');
INSERT INTO `oc_area` VALUES ('321200', '泰州市', '2', '320000');
INSERT INTO `oc_area` VALUES ('321300', '宿迁市', '2', '320000');
INSERT INTO `oc_area` VALUES ('330100', '杭州市', '2', '330000');
INSERT INTO `oc_area` VALUES ('330200', '宁波市', '2', '330000');
INSERT INTO `oc_area` VALUES ('330300', '温州市', '2', '330000');
INSERT INTO `oc_area` VALUES ('330400', '嘉兴市', '2', '330000');
INSERT INTO `oc_area` VALUES ('330500', '湖州市', '2', '330000');
INSERT INTO `oc_area` VALUES ('330600', '绍兴市', '2', '330000');
INSERT INTO `oc_area` VALUES ('330700', '金华市', '2', '330000');
INSERT INTO `oc_area` VALUES ('330800', '衢州市', '2', '330000');
INSERT INTO `oc_area` VALUES ('330900', '舟山市', '2', '330000');
INSERT INTO `oc_area` VALUES ('331000', '台州市', '2', '330000');
INSERT INTO `oc_area` VALUES ('331100', '丽水市', '2', '330000');
INSERT INTO `oc_area` VALUES ('340100', '合肥市', '2', '340000');
INSERT INTO `oc_area` VALUES ('340200', '芜湖市', '2', '340000');
INSERT INTO `oc_area` VALUES ('340300', '蚌埠市', '2', '340000');
INSERT INTO `oc_area` VALUES ('340400', '淮南市', '2', '340000');
INSERT INTO `oc_area` VALUES ('340500', '马鞍山市', '2', '340000');
INSERT INTO `oc_area` VALUES ('340600', '淮北市', '2', '340000');
INSERT INTO `oc_area` VALUES ('340700', '铜陵市', '2', '340000');
INSERT INTO `oc_area` VALUES ('340800', '安庆市', '2', '340000');
INSERT INTO `oc_area` VALUES ('341000', '黄山市', '2', '340000');
INSERT INTO `oc_area` VALUES ('341100', '滁州市', '2', '340000');
INSERT INTO `oc_area` VALUES ('341200', '阜阳市', '2', '340000');
INSERT INTO `oc_area` VALUES ('341300', '宿州市', '2', '340000');
INSERT INTO `oc_area` VALUES ('341500', '六安市', '2', '340000');
INSERT INTO `oc_area` VALUES ('341600', '亳州市', '2', '340000');
INSERT INTO `oc_area` VALUES ('341700', '池州市', '2', '340000');
INSERT INTO `oc_area` VALUES ('341800', '宣城市', '2', '340000');
INSERT INTO `oc_area` VALUES ('350100', '福州市', '2', '350000');
INSERT INTO `oc_area` VALUES ('350200', '厦门市', '2', '350000');
INSERT INTO `oc_area` VALUES ('350300', '莆田市', '2', '350000');
INSERT INTO `oc_area` VALUES ('350400', '三明市', '2', '350000');
INSERT INTO `oc_area` VALUES ('350500', '泉州市', '2', '350000');
INSERT INTO `oc_area` VALUES ('350600', '漳州市', '2', '350000');
INSERT INTO `oc_area` VALUES ('350700', '南平市', '2', '350000');
INSERT INTO `oc_area` VALUES ('350800', '龙岩市', '2', '350000');
INSERT INTO `oc_area` VALUES ('350900', '宁德市', '2', '350000');
INSERT INTO `oc_area` VALUES ('360100', '南昌市', '2', '360000');
INSERT INTO `oc_area` VALUES ('360200', '景德镇市', '2', '360000');
INSERT INTO `oc_area` VALUES ('360300', '萍乡市', '2', '360000');
INSERT INTO `oc_area` VALUES ('360400', '九江市', '2', '360000');
INSERT INTO `oc_area` VALUES ('360500', '新余市', '2', '360000');
INSERT INTO `oc_area` VALUES ('360600', '鹰潭市', '2', '360000');
INSERT INTO `oc_area` VALUES ('360700', '赣州市', '2', '360000');
INSERT INTO `oc_area` VALUES ('360800', '吉安市', '2', '360000');
INSERT INTO `oc_area` VALUES ('360900', '宜春市', '2', '360000');
INSERT INTO `oc_area` VALUES ('361000', '抚州市', '2', '360000');
INSERT INTO `oc_area` VALUES ('361100', '上饶市', '2', '360000');
INSERT INTO `oc_area` VALUES ('370100', '济南市', '2', '370000');
INSERT INTO `oc_area` VALUES ('370200', '青岛市', '2', '370000');
INSERT INTO `oc_area` VALUES ('370300', '淄博市', '2', '370000');
INSERT INTO `oc_area` VALUES ('370400', '枣庄市', '2', '370000');
INSERT INTO `oc_area` VALUES ('370500', '东营市', '2', '370000');
INSERT INTO `oc_area` VALUES ('370600', '烟台市', '2', '370000');
INSERT INTO `oc_area` VALUES ('370700', '潍坊市', '2', '370000');
INSERT INTO `oc_area` VALUES ('370800', '济宁市', '2', '370000');
INSERT INTO `oc_area` VALUES ('370900', '泰安市', '2', '370000');
INSERT INTO `oc_area` VALUES ('371000', '威海市', '2', '370000');
INSERT INTO `oc_area` VALUES ('371100', '日照市', '2', '370000');
INSERT INTO `oc_area` VALUES ('371200', '莱芜市', '2', '370000');
INSERT INTO `oc_area` VALUES ('371300', '临沂市', '2', '370000');
INSERT INTO `oc_area` VALUES ('371400', '德州市', '2', '370000');
INSERT INTO `oc_area` VALUES ('371500', '聊城市', '2', '370000');
INSERT INTO `oc_area` VALUES ('371600', '滨州市', '2', '370000');
INSERT INTO `oc_area` VALUES ('371700', '菏泽市', '2', '370000');
INSERT INTO `oc_area` VALUES ('410100', '郑州市', '2', '410000');
INSERT INTO `oc_area` VALUES ('410200', '开封市', '2', '410000');
INSERT INTO `oc_area` VALUES ('410300', '洛阳市', '2', '410000');
INSERT INTO `oc_area` VALUES ('410400', '平顶山市', '2', '410000');
INSERT INTO `oc_area` VALUES ('410500', '安阳市', '2', '410000');
INSERT INTO `oc_area` VALUES ('410600', '鹤壁市', '2', '410000');
INSERT INTO `oc_area` VALUES ('410700', '新乡市', '2', '410000');
INSERT INTO `oc_area` VALUES ('410800', '焦作市', '2', '410000');
INSERT INTO `oc_area` VALUES ('410900', '濮阳市', '2', '410000');
INSERT INTO `oc_area` VALUES ('411000', '许昌市', '2', '410000');
INSERT INTO `oc_area` VALUES ('411100', '漯河市', '2', '410000');
INSERT INTO `oc_area` VALUES ('411200', '三门峡市', '2', '410000');
INSERT INTO `oc_area` VALUES ('411300', '南阳市', '2', '410000');
INSERT INTO `oc_area` VALUES ('411400', '商丘市', '2', '410000');
INSERT INTO `oc_area` VALUES ('411500', '信阳市', '2', '410000');
INSERT INTO `oc_area` VALUES ('411600', '周口市', '2', '410000');
INSERT INTO `oc_area` VALUES ('411700', '驻马店市', '2', '410000');
INSERT INTO `oc_area` VALUES ('420100', '武汉市', '2', '420000');
INSERT INTO `oc_area` VALUES ('420200', '黄石市', '2', '420000');
INSERT INTO `oc_area` VALUES ('420300', '十堰市', '2', '420000');
INSERT INTO `oc_area` VALUES ('420500', '宜昌市', '2', '420000');
INSERT INTO `oc_area` VALUES ('420600', '襄樊市', '2', '420000');
INSERT INTO `oc_area` VALUES ('420700', '鄂州市', '2', '420000');
INSERT INTO `oc_area` VALUES ('420800', '荆门市', '2', '420000');
INSERT INTO `oc_area` VALUES ('420900', '孝感市', '2', '420000');
INSERT INTO `oc_area` VALUES ('421000', '荆州市', '2', '420000');
INSERT INTO `oc_area` VALUES ('421100', '黄冈市', '2', '420000');
INSERT INTO `oc_area` VALUES ('421200', '咸宁市', '2', '420000');
INSERT INTO `oc_area` VALUES ('421300', '随州市', '2', '420000');
INSERT INTO `oc_area` VALUES ('422800', '恩施土家族苗族自治州', '2', '420000');
INSERT INTO `oc_area` VALUES ('429000', '省直辖行政单位', '2', '420000');
INSERT INTO `oc_area` VALUES ('430100', '长沙市', '2', '430000');
INSERT INTO `oc_area` VALUES ('430200', '株洲市', '2', '430000');
INSERT INTO `oc_area` VALUES ('430300', '湘潭市', '2', '430000');
INSERT INTO `oc_area` VALUES ('430400', '衡阳市', '2', '430000');
INSERT INTO `oc_area` VALUES ('430500', '邵阳市', '2', '430000');
INSERT INTO `oc_area` VALUES ('430600', '岳阳市', '2', '430000');
INSERT INTO `oc_area` VALUES ('430700', '常德市', '2', '430000');
INSERT INTO `oc_area` VALUES ('430800', '张家界市', '2', '430000');
INSERT INTO `oc_area` VALUES ('430900', '益阳市', '2', '430000');
INSERT INTO `oc_area` VALUES ('431000', '郴州市', '2', '430000');
INSERT INTO `oc_area` VALUES ('431100', '永州市', '2', '430000');
INSERT INTO `oc_area` VALUES ('431200', '怀化市', '2', '430000');
INSERT INTO `oc_area` VALUES ('431300', '娄底市', '2', '430000');
INSERT INTO `oc_area` VALUES ('433100', '湘西土家族苗族自治州', '2', '430000');
INSERT INTO `oc_area` VALUES ('440100', '广州市', '2', '440000');
INSERT INTO `oc_area` VALUES ('440200', '韶关市', '2', '440000');
INSERT INTO `oc_area` VALUES ('440300', '深圳市', '2', '440000');
INSERT INTO `oc_area` VALUES ('440400', '珠海市', '2', '440000');
INSERT INTO `oc_area` VALUES ('440500', '汕头市', '2', '440000');
INSERT INTO `oc_area` VALUES ('440600', '佛山市', '2', '440000');
INSERT INTO `oc_area` VALUES ('440700', '江门市', '2', '440000');
INSERT INTO `oc_area` VALUES ('440800', '湛江市', '2', '440000');
INSERT INTO `oc_area` VALUES ('440900', '茂名市', '2', '440000');
INSERT INTO `oc_area` VALUES ('441200', '肇庆市', '2', '440000');
INSERT INTO `oc_area` VALUES ('441300', '惠州市', '2', '440000');
INSERT INTO `oc_area` VALUES ('441400', '梅州市', '2', '440000');
INSERT INTO `oc_area` VALUES ('441500', '汕尾市', '2', '440000');
INSERT INTO `oc_area` VALUES ('441600', '河源市', '2', '440000');
INSERT INTO `oc_area` VALUES ('441700', '阳江市', '2', '440000');
INSERT INTO `oc_area` VALUES ('441800', '清远市', '2', '440000');
INSERT INTO `oc_area` VALUES ('441900', '东莞市', '2', '440000');
INSERT INTO `oc_area` VALUES ('442000', '中山市', '2', '440000');
INSERT INTO `oc_area` VALUES ('445100', '潮州市', '2', '440000');
INSERT INTO `oc_area` VALUES ('445200', '揭阳市', '2', '440000');
INSERT INTO `oc_area` VALUES ('445300', '云浮市', '2', '440000');
INSERT INTO `oc_area` VALUES ('450100', '南宁市', '2', '450000');
INSERT INTO `oc_area` VALUES ('450200', '柳州市', '2', '450000');
INSERT INTO `oc_area` VALUES ('450300', '桂林市', '2', '450000');
INSERT INTO `oc_area` VALUES ('450400', '梧州市', '2', '450000');
INSERT INTO `oc_area` VALUES ('450500', '北海市', '2', '450000');
INSERT INTO `oc_area` VALUES ('450600', '防城港市', '2', '450000');
INSERT INTO `oc_area` VALUES ('450700', '钦州市', '2', '450000');
INSERT INTO `oc_area` VALUES ('450800', '贵港市', '2', '450000');
INSERT INTO `oc_area` VALUES ('450900', '玉林市', '2', '450000');
INSERT INTO `oc_area` VALUES ('451000', '百色市', '2', '450000');
INSERT INTO `oc_area` VALUES ('451100', '贺州市', '2', '450000');
INSERT INTO `oc_area` VALUES ('451200', '河池市', '2', '450000');
INSERT INTO `oc_area` VALUES ('451300', '来宾市', '2', '450000');
INSERT INTO `oc_area` VALUES ('451400', '崇左市', '2', '450000');
INSERT INTO `oc_area` VALUES ('460100', '海口市', '2', '460000');
INSERT INTO `oc_area` VALUES ('460200', '三亚市', '2', '460000');
INSERT INTO `oc_area` VALUES ('469000', '省直辖县级行政单位', '2', '460000');
INSERT INTO `oc_area` VALUES ('500100', '市辖区', '2', '500000');
INSERT INTO `oc_area` VALUES ('500200', '县', '2', '500000');
INSERT INTO `oc_area` VALUES ('500300', '市', '2', '500000');
INSERT INTO `oc_area` VALUES ('510100', '成都市', '2', '510000');
INSERT INTO `oc_area` VALUES ('510300', '自贡市', '2', '510000');
INSERT INTO `oc_area` VALUES ('510400', '攀枝花市', '2', '510000');
INSERT INTO `oc_area` VALUES ('510500', '泸州市', '2', '510000');
INSERT INTO `oc_area` VALUES ('510600', '德阳市', '2', '510000');
INSERT INTO `oc_area` VALUES ('510700', '绵阳市', '2', '510000');
INSERT INTO `oc_area` VALUES ('510800', '广元市', '2', '510000');
INSERT INTO `oc_area` VALUES ('510900', '遂宁市', '2', '510000');
INSERT INTO `oc_area` VALUES ('511000', '内江市', '2', '510000');
INSERT INTO `oc_area` VALUES ('511100', '乐山市', '2', '510000');
INSERT INTO `oc_area` VALUES ('511300', '南充市', '2', '510000');
INSERT INTO `oc_area` VALUES ('511400', '眉山市', '2', '510000');
INSERT INTO `oc_area` VALUES ('511500', '宜宾市', '2', '510000');
INSERT INTO `oc_area` VALUES ('511600', '广安市', '2', '510000');
INSERT INTO `oc_area` VALUES ('511700', '达州市', '2', '510000');
INSERT INTO `oc_area` VALUES ('511800', '雅安市', '2', '510000');
INSERT INTO `oc_area` VALUES ('511900', '巴中市', '2', '510000');
INSERT INTO `oc_area` VALUES ('512000', '资阳市', '2', '510000');
INSERT INTO `oc_area` VALUES ('513200', '阿坝藏族羌族自治州', '2', '510000');
INSERT INTO `oc_area` VALUES ('513300', '甘孜藏族自治州', '2', '510000');
INSERT INTO `oc_area` VALUES ('513400', '凉山彝族自治州', '2', '510000');
INSERT INTO `oc_area` VALUES ('520100', '贵阳市', '2', '520000');
INSERT INTO `oc_area` VALUES ('520200', '六盘水市', '2', '520000');
INSERT INTO `oc_area` VALUES ('520300', '遵义市', '2', '520000');
INSERT INTO `oc_area` VALUES ('520400', '安顺市', '2', '520000');
INSERT INTO `oc_area` VALUES ('522200', '铜仁地区', '2', '520000');
INSERT INTO `oc_area` VALUES ('522300', '黔西南布依族苗族自治州', '2', '520000');
INSERT INTO `oc_area` VALUES ('522400', '毕节地区', '2', '520000');
INSERT INTO `oc_area` VALUES ('522600', '黔东南苗族侗族自治州', '2', '520000');
INSERT INTO `oc_area` VALUES ('522700', '黔南布依族苗族自治州', '2', '520000');
INSERT INTO `oc_area` VALUES ('530100', '昆明市', '2', '530000');
INSERT INTO `oc_area` VALUES ('530300', '曲靖市', '2', '530000');
INSERT INTO `oc_area` VALUES ('530400', '玉溪市', '2', '530000');
INSERT INTO `oc_area` VALUES ('530500', '保山市', '2', '530000');
INSERT INTO `oc_area` VALUES ('530600', '昭通市', '2', '530000');
INSERT INTO `oc_area` VALUES ('530700', '丽江市', '2', '530000');
INSERT INTO `oc_area` VALUES ('530800', '思茅市', '2', '530000');
INSERT INTO `oc_area` VALUES ('530900', '临沧市', '2', '530000');
INSERT INTO `oc_area` VALUES ('532300', '楚雄彝族自治州', '2', '530000');
INSERT INTO `oc_area` VALUES ('532500', '红河哈尼族彝族自治州', '2', '530000');
INSERT INTO `oc_area` VALUES ('532600', '文山壮族苗族自治州', '2', '530000');
INSERT INTO `oc_area` VALUES ('532800', '西双版纳傣族自治州', '2', '530000');
INSERT INTO `oc_area` VALUES ('532900', '大理白族自治州', '2', '530000');
INSERT INTO `oc_area` VALUES ('533100', '德宏傣族景颇族自治州', '2', '530000');
INSERT INTO `oc_area` VALUES ('533300', '怒江傈僳族自治州', '2', '530000');
INSERT INTO `oc_area` VALUES ('533400', '迪庆藏族自治州', '2', '530000');
INSERT INTO `oc_area` VALUES ('540100', '拉萨市', '2', '540000');
INSERT INTO `oc_area` VALUES ('542100', '昌都地区', '2', '540000');
INSERT INTO `oc_area` VALUES ('542200', '山南地区', '2', '540000');
INSERT INTO `oc_area` VALUES ('542300', '日喀则地区', '2', '540000');
INSERT INTO `oc_area` VALUES ('542400', '那曲地区', '2', '540000');
INSERT INTO `oc_area` VALUES ('542500', '阿里地区', '2', '540000');
INSERT INTO `oc_area` VALUES ('542600', '林芝地区', '2', '540000');
INSERT INTO `oc_area` VALUES ('610100', '西安市', '2', '610000');
INSERT INTO `oc_area` VALUES ('610200', '铜川市', '2', '610000');
INSERT INTO `oc_area` VALUES ('610300', '宝鸡市', '2', '610000');
INSERT INTO `oc_area` VALUES ('610400', '咸阳市', '2', '610000');
INSERT INTO `oc_area` VALUES ('610500', '渭南市', '2', '610000');
INSERT INTO `oc_area` VALUES ('610600', '延安市', '2', '610000');
INSERT INTO `oc_area` VALUES ('610700', '汉中市', '2', '610000');
INSERT INTO `oc_area` VALUES ('610800', '榆林市', '2', '610000');
INSERT INTO `oc_area` VALUES ('610900', '安康市', '2', '610000');
INSERT INTO `oc_area` VALUES ('611000', '商洛市', '2', '610000');
INSERT INTO `oc_area` VALUES ('620100', '兰州市', '2', '620000');
INSERT INTO `oc_area` VALUES ('620200', '嘉峪关市', '2', '620000');
INSERT INTO `oc_area` VALUES ('620300', '金昌市', '2', '620000');
INSERT INTO `oc_area` VALUES ('620400', '白银市', '2', '620000');
INSERT INTO `oc_area` VALUES ('620500', '天水市', '2', '620000');
INSERT INTO `oc_area` VALUES ('620600', '武威市', '2', '620000');
INSERT INTO `oc_area` VALUES ('620700', '张掖市', '2', '620000');
INSERT INTO `oc_area` VALUES ('620800', '平凉市', '2', '620000');
INSERT INTO `oc_area` VALUES ('620900', '酒泉市', '2', '620000');
INSERT INTO `oc_area` VALUES ('621000', '庆阳市', '2', '620000');
INSERT INTO `oc_area` VALUES ('621100', '定西市', '2', '620000');
INSERT INTO `oc_area` VALUES ('621200', '陇南市', '2', '620000');
INSERT INTO `oc_area` VALUES ('622900', '临夏回族自治州', '2', '620000');
INSERT INTO `oc_area` VALUES ('623000', '甘南藏族自治州', '2', '620000');
INSERT INTO `oc_area` VALUES ('630100', '西宁市', '2', '630000');
INSERT INTO `oc_area` VALUES ('632100', '海东地区', '2', '630000');
INSERT INTO `oc_area` VALUES ('632200', '海北藏族自治州', '2', '630000');
INSERT INTO `oc_area` VALUES ('632300', '黄南藏族自治州', '2', '630000');
INSERT INTO `oc_area` VALUES ('632500', '海南藏族自治州', '2', '630000');
INSERT INTO `oc_area` VALUES ('632600', '果洛藏族自治州', '2', '630000');
INSERT INTO `oc_area` VALUES ('632700', '玉树藏族自治州', '2', '630000');
INSERT INTO `oc_area` VALUES ('632800', '海西蒙古族藏族自治州', '2', '630000');
INSERT INTO `oc_area` VALUES ('640100', '银川市', '2', '640000');
INSERT INTO `oc_area` VALUES ('640200', '石嘴山市', '2', '640000');
INSERT INTO `oc_area` VALUES ('640300', '吴忠市', '2', '640000');
INSERT INTO `oc_area` VALUES ('640400', '固原市', '2', '640000');
INSERT INTO `oc_area` VALUES ('640500', '中卫市', '2', '640000');
INSERT INTO `oc_area` VALUES ('650100', '乌鲁木齐市', '2', '650000');
INSERT INTO `oc_area` VALUES ('650200', '克拉玛依市', '2', '650000');
INSERT INTO `oc_area` VALUES ('652100', '吐鲁番地区', '2', '650000');
INSERT INTO `oc_area` VALUES ('652200', '哈密地区', '2', '650000');
INSERT INTO `oc_area` VALUES ('652300', '昌吉回族自治州', '2', '650000');
INSERT INTO `oc_area` VALUES ('652700', '博尔塔拉蒙古自治州', '2', '650000');
INSERT INTO `oc_area` VALUES ('652800', '巴音郭楞蒙古自治州', '2', '650000');
INSERT INTO `oc_area` VALUES ('652900', '阿克苏地区', '2', '650000');
INSERT INTO `oc_area` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '2', '650000');
INSERT INTO `oc_area` VALUES ('653100', '喀什地区', '2', '650000');
INSERT INTO `oc_area` VALUES ('653200', '和田地区', '2', '650000');
INSERT INTO `oc_area` VALUES ('654000', '伊犁哈萨克自治州', '2', '650000');
INSERT INTO `oc_area` VALUES ('654200', '塔城地区', '2', '650000');
INSERT INTO `oc_area` VALUES ('654300', '阿勒泰地区', '2', '650000');
INSERT INTO `oc_area` VALUES ('659000', '省直辖行政单位', '2', '650000');
INSERT INTO `oc_area` VALUES ('110101', '东城区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110102', '西城区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110103', '崇文区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110104', '宣武区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110105', '朝阳区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110106', '丰台区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110107', '石景山区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110108', '海淀区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110109', '门头沟区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110111', '房山区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110112', '通州区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110113', '顺义区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110114', '昌平区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110115', '大兴区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110116', '怀柔区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110117', '平谷区', '3', '110100');
INSERT INTO `oc_area` VALUES ('110228', '密云县', '3', '110200');
INSERT INTO `oc_area` VALUES ('110229', '延庆县', '3', '110200');
INSERT INTO `oc_area` VALUES ('120101', '和平区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120102', '河东区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120103', '河西区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120104', '南开区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120105', '河北区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120106', '红桥区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120107', '塘沽区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120108', '汉沽区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120109', '大港区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120110', '东丽区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120111', '西青区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120112', '津南区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120113', '北辰区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120114', '武清区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120115', '宝坻区', '3', '120100');
INSERT INTO `oc_area` VALUES ('120221', '宁河县', '3', '120200');
INSERT INTO `oc_area` VALUES ('120223', '静海县', '3', '120200');
INSERT INTO `oc_area` VALUES ('120225', '蓟　县', '3', '120200');
INSERT INTO `oc_area` VALUES ('130101', '市辖区', '3', '130100');
INSERT INTO `oc_area` VALUES ('130102', '长安区', '3', '130100');
INSERT INTO `oc_area` VALUES ('130103', '桥东区', '3', '130100');
INSERT INTO `oc_area` VALUES ('130104', '桥西区', '3', '130100');
INSERT INTO `oc_area` VALUES ('130105', '新华区', '3', '130100');
INSERT INTO `oc_area` VALUES ('130107', '井陉矿区', '3', '130100');
INSERT INTO `oc_area` VALUES ('130108', '裕华区', '3', '130100');
INSERT INTO `oc_area` VALUES ('130121', '井陉县', '3', '130100');
INSERT INTO `oc_area` VALUES ('130123', '正定县', '3', '130100');
INSERT INTO `oc_area` VALUES ('130124', '栾城县', '3', '130100');
INSERT INTO `oc_area` VALUES ('130125', '行唐县', '3', '130100');
INSERT INTO `oc_area` VALUES ('130126', '灵寿县', '3', '130100');
INSERT INTO `oc_area` VALUES ('130127', '高邑县', '3', '130100');
INSERT INTO `oc_area` VALUES ('130128', '深泽县', '3', '130100');
INSERT INTO `oc_area` VALUES ('130129', '赞皇县', '3', '130100');
INSERT INTO `oc_area` VALUES ('130130', '无极县', '3', '130100');
INSERT INTO `oc_area` VALUES ('130131', '平山县', '3', '130100');
INSERT INTO `oc_area` VALUES ('130132', '元氏县', '3', '130100');
INSERT INTO `oc_area` VALUES ('130133', '赵　县', '3', '130100');
INSERT INTO `oc_area` VALUES ('130181', '辛集市', '3', '130100');
INSERT INTO `oc_area` VALUES ('130182', '藁城市', '3', '130100');
INSERT INTO `oc_area` VALUES ('130183', '晋州市', '3', '130100');
INSERT INTO `oc_area` VALUES ('130184', '新乐市', '3', '130100');
INSERT INTO `oc_area` VALUES ('130185', '鹿泉市', '3', '130100');
INSERT INTO `oc_area` VALUES ('130201', '市辖区', '3', '130200');
INSERT INTO `oc_area` VALUES ('130202', '路南区', '3', '130200');
INSERT INTO `oc_area` VALUES ('130203', '路北区', '3', '130200');
INSERT INTO `oc_area` VALUES ('130204', '古冶区', '3', '130200');
INSERT INTO `oc_area` VALUES ('130205', '开平区', '3', '130200');
INSERT INTO `oc_area` VALUES ('130207', '丰南区', '3', '130200');
INSERT INTO `oc_area` VALUES ('130208', '丰润区', '3', '130200');
INSERT INTO `oc_area` VALUES ('130223', '滦　县', '3', '130200');
INSERT INTO `oc_area` VALUES ('130224', '滦南县', '3', '130200');
INSERT INTO `oc_area` VALUES ('130225', '乐亭县', '3', '130200');
INSERT INTO `oc_area` VALUES ('130227', '迁西县', '3', '130200');
INSERT INTO `oc_area` VALUES ('130229', '玉田县', '3', '130200');
INSERT INTO `oc_area` VALUES ('130230', '唐海县', '3', '130200');
INSERT INTO `oc_area` VALUES ('130281', '遵化市', '3', '130200');
INSERT INTO `oc_area` VALUES ('130283', '迁安市', '3', '130200');
INSERT INTO `oc_area` VALUES ('130301', '市辖区', '3', '130300');
INSERT INTO `oc_area` VALUES ('130302', '海港区', '3', '130300');
INSERT INTO `oc_area` VALUES ('130303', '山海关区', '3', '130300');
INSERT INTO `oc_area` VALUES ('130304', '北戴河区', '3', '130300');
INSERT INTO `oc_area` VALUES ('130321', '青龙满族自治县', '3', '130300');
INSERT INTO `oc_area` VALUES ('130322', '昌黎县', '3', '130300');
INSERT INTO `oc_area` VALUES ('130323', '抚宁县', '3', '130300');
INSERT INTO `oc_area` VALUES ('130324', '卢龙县', '3', '130300');
INSERT INTO `oc_area` VALUES ('130401', '市辖区', '3', '130400');
INSERT INTO `oc_area` VALUES ('130402', '邯山区', '3', '130400');
INSERT INTO `oc_area` VALUES ('130403', '丛台区', '3', '130400');
INSERT INTO `oc_area` VALUES ('130404', '复兴区', '3', '130400');
INSERT INTO `oc_area` VALUES ('130406', '峰峰矿区', '3', '130400');
INSERT INTO `oc_area` VALUES ('130421', '邯郸县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130423', '临漳县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130424', '成安县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130425', '大名县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130426', '涉　县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130427', '磁　县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130428', '肥乡县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130429', '永年县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130430', '邱　县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130431', '鸡泽县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130432', '广平县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130433', '馆陶县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130434', '魏　县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130435', '曲周县', '3', '130400');
INSERT INTO `oc_area` VALUES ('130481', '武安市', '3', '130400');
INSERT INTO `oc_area` VALUES ('130501', '市辖区', '3', '130500');
INSERT INTO `oc_area` VALUES ('130502', '桥东区', '3', '130500');
INSERT INTO `oc_area` VALUES ('130503', '桥西区', '3', '130500');
INSERT INTO `oc_area` VALUES ('130521', '邢台县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130522', '临城县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130523', '内丘县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130524', '柏乡县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130525', '隆尧县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130526', '任　县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130527', '南和县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130528', '宁晋县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130529', '巨鹿县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130530', '新河县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130531', '广宗县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130532', '平乡县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130533', '威　县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130534', '清河县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130535', '临西县', '3', '130500');
INSERT INTO `oc_area` VALUES ('130581', '南宫市', '3', '130500');
INSERT INTO `oc_area` VALUES ('130582', '沙河市', '3', '130500');
INSERT INTO `oc_area` VALUES ('130601', '市辖区', '3', '130600');
INSERT INTO `oc_area` VALUES ('130602', '新市区', '3', '130600');
INSERT INTO `oc_area` VALUES ('130603', '北市区', '3', '130600');
INSERT INTO `oc_area` VALUES ('130604', '南市区', '3', '130600');
INSERT INTO `oc_area` VALUES ('130621', '满城县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130622', '清苑县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130623', '涞水县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130624', '阜平县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130625', '徐水县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130626', '定兴县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130627', '唐　县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130628', '高阳县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130629', '容城县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130630', '涞源县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130631', '望都县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130632', '安新县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130633', '易　县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130634', '曲阳县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130635', '蠡　县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130636', '顺平县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130637', '博野县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130638', '雄　县', '3', '130600');
INSERT INTO `oc_area` VALUES ('130681', '涿州市', '3', '130600');
INSERT INTO `oc_area` VALUES ('130682', '定州市', '3', '130600');
INSERT INTO `oc_area` VALUES ('130683', '安国市', '3', '130600');
INSERT INTO `oc_area` VALUES ('130684', '高碑店市', '3', '130600');
INSERT INTO `oc_area` VALUES ('130701', '市辖区', '3', '130700');
INSERT INTO `oc_area` VALUES ('130702', '桥东区', '3', '130700');
INSERT INTO `oc_area` VALUES ('130703', '桥西区', '3', '130700');
INSERT INTO `oc_area` VALUES ('130705', '宣化区', '3', '130700');
INSERT INTO `oc_area` VALUES ('130706', '下花园区', '3', '130700');
INSERT INTO `oc_area` VALUES ('130721', '宣化县', '3', '130700');
INSERT INTO `oc_area` VALUES ('130722', '张北县', '3', '130700');
INSERT INTO `oc_area` VALUES ('130723', '康保县', '3', '130700');
INSERT INTO `oc_area` VALUES ('130724', '沽源县', '3', '130700');
INSERT INTO `oc_area` VALUES ('130725', '尚义县', '3', '130700');
INSERT INTO `oc_area` VALUES ('130726', '蔚　县', '3', '130700');
INSERT INTO `oc_area` VALUES ('130727', '阳原县', '3', '130700');
INSERT INTO `oc_area` VALUES ('130728', '怀安县', '3', '130700');
INSERT INTO `oc_area` VALUES ('130729', '万全县', '3', '130700');
INSERT INTO `oc_area` VALUES ('130730', '怀来县', '3', '130700');
INSERT INTO `oc_area` VALUES ('130731', '涿鹿县', '3', '130700');
INSERT INTO `oc_area` VALUES ('130732', '赤城县', '3', '130700');
INSERT INTO `oc_area` VALUES ('130733', '崇礼县', '3', '130700');
INSERT INTO `oc_area` VALUES ('130801', '市辖区', '3', '130800');
INSERT INTO `oc_area` VALUES ('130802', '双桥区', '3', '130800');
INSERT INTO `oc_area` VALUES ('130803', '双滦区', '3', '130800');
INSERT INTO `oc_area` VALUES ('130804', '鹰手营子矿区', '3', '130800');
INSERT INTO `oc_area` VALUES ('130821', '承德县', '3', '130800');
INSERT INTO `oc_area` VALUES ('130822', '兴隆县', '3', '130800');
INSERT INTO `oc_area` VALUES ('130823', '平泉县', '3', '130800');
INSERT INTO `oc_area` VALUES ('130824', '滦平县', '3', '130800');
INSERT INTO `oc_area` VALUES ('130825', '隆化县', '3', '130800');
INSERT INTO `oc_area` VALUES ('130826', '丰宁满族自治县', '3', '130800');
INSERT INTO `oc_area` VALUES ('130827', '宽城满族自治县', '3', '130800');
INSERT INTO `oc_area` VALUES ('130828', '围场满族蒙古族自治县', '3', '130800');
INSERT INTO `oc_area` VALUES ('130901', '市辖区', '3', '130900');
INSERT INTO `oc_area` VALUES ('130902', '新华区', '3', '130900');
INSERT INTO `oc_area` VALUES ('130903', '运河区', '3', '130900');
INSERT INTO `oc_area` VALUES ('130921', '沧　县', '3', '130900');
INSERT INTO `oc_area` VALUES ('130922', '青　县', '3', '130900');
INSERT INTO `oc_area` VALUES ('130923', '东光县', '3', '130900');
INSERT INTO `oc_area` VALUES ('130924', '海兴县', '3', '130900');
INSERT INTO `oc_area` VALUES ('130925', '盐山县', '3', '130900');
INSERT INTO `oc_area` VALUES ('130926', '肃宁县', '3', '130900');
INSERT INTO `oc_area` VALUES ('130927', '南皮县', '3', '130900');
INSERT INTO `oc_area` VALUES ('130928', '吴桥县', '3', '130900');
INSERT INTO `oc_area` VALUES ('130929', '献　县', '3', '130900');
INSERT INTO `oc_area` VALUES ('130930', '孟村回族自治县', '3', '130900');
INSERT INTO `oc_area` VALUES ('130981', '泊头市', '3', '130900');
INSERT INTO `oc_area` VALUES ('130982', '任丘市', '3', '130900');
INSERT INTO `oc_area` VALUES ('130983', '黄骅市', '3', '130900');
INSERT INTO `oc_area` VALUES ('130984', '河间市', '3', '130900');
INSERT INTO `oc_area` VALUES ('131001', '市辖区', '3', '131000');
INSERT INTO `oc_area` VALUES ('131002', '安次区', '3', '131000');
INSERT INTO `oc_area` VALUES ('131003', '广阳区', '3', '131000');
INSERT INTO `oc_area` VALUES ('131022', '固安县', '3', '131000');
INSERT INTO `oc_area` VALUES ('131023', '永清县', '3', '131000');
INSERT INTO `oc_area` VALUES ('131024', '香河县', '3', '131000');
INSERT INTO `oc_area` VALUES ('131025', '大城县', '3', '131000');
INSERT INTO `oc_area` VALUES ('131026', '文安县', '3', '131000');
INSERT INTO `oc_area` VALUES ('131028', '大厂回族自治县', '3', '131000');
INSERT INTO `oc_area` VALUES ('131081', '霸州市', '3', '131000');
INSERT INTO `oc_area` VALUES ('131082', '三河市', '3', '131000');
INSERT INTO `oc_area` VALUES ('131101', '市辖区', '3', '131100');
INSERT INTO `oc_area` VALUES ('131102', '桃城区', '3', '131100');
INSERT INTO `oc_area` VALUES ('131121', '枣强县', '3', '131100');
INSERT INTO `oc_area` VALUES ('131122', '武邑县', '3', '131100');
INSERT INTO `oc_area` VALUES ('131123', '武强县', '3', '131100');
INSERT INTO `oc_area` VALUES ('131124', '饶阳县', '3', '131100');
INSERT INTO `oc_area` VALUES ('131125', '安平县', '3', '131100');
INSERT INTO `oc_area` VALUES ('131126', '故城县', '3', '131100');
INSERT INTO `oc_area` VALUES ('131127', '景　县', '3', '131100');
INSERT INTO `oc_area` VALUES ('131128', '阜城县', '3', '131100');
INSERT INTO `oc_area` VALUES ('131181', '冀州市', '3', '131100');
INSERT INTO `oc_area` VALUES ('131182', '深州市', '3', '131100');
INSERT INTO `oc_area` VALUES ('140101', '市辖区', '3', '140100');
INSERT INTO `oc_area` VALUES ('140105', '小店区', '3', '140100');
INSERT INTO `oc_area` VALUES ('140106', '迎泽区', '3', '140100');
INSERT INTO `oc_area` VALUES ('140107', '杏花岭区', '3', '140100');
INSERT INTO `oc_area` VALUES ('140108', '尖草坪区', '3', '140100');
INSERT INTO `oc_area` VALUES ('140109', '万柏林区', '3', '140100');
INSERT INTO `oc_area` VALUES ('140110', '晋源区', '3', '140100');
INSERT INTO `oc_area` VALUES ('140121', '清徐县', '3', '140100');
INSERT INTO `oc_area` VALUES ('140122', '阳曲县', '3', '140100');
INSERT INTO `oc_area` VALUES ('140123', '娄烦县', '3', '140100');
INSERT INTO `oc_area` VALUES ('140181', '古交市', '3', '140100');
INSERT INTO `oc_area` VALUES ('140201', '市辖区', '3', '140200');
INSERT INTO `oc_area` VALUES ('140202', '城　区', '3', '140200');
INSERT INTO `oc_area` VALUES ('140203', '矿　区', '3', '140200');
INSERT INTO `oc_area` VALUES ('140211', '南郊区', '3', '140200');
INSERT INTO `oc_area` VALUES ('140212', '新荣区', '3', '140200');
INSERT INTO `oc_area` VALUES ('140221', '阳高县', '3', '140200');
INSERT INTO `oc_area` VALUES ('140222', '天镇县', '3', '140200');
INSERT INTO `oc_area` VALUES ('140223', '广灵县', '3', '140200');
INSERT INTO `oc_area` VALUES ('140224', '灵丘县', '3', '140200');
INSERT INTO `oc_area` VALUES ('140225', '浑源县', '3', '140200');
INSERT INTO `oc_area` VALUES ('140226', '左云县', '3', '140200');
INSERT INTO `oc_area` VALUES ('140227', '大同县', '3', '140200');
INSERT INTO `oc_area` VALUES ('140301', '市辖区', '3', '140300');
INSERT INTO `oc_area` VALUES ('140302', '城　区', '3', '140300');
INSERT INTO `oc_area` VALUES ('140303', '矿　区', '3', '140300');
INSERT INTO `oc_area` VALUES ('140311', '郊　区', '3', '140300');
INSERT INTO `oc_area` VALUES ('140321', '平定县', '3', '140300');
INSERT INTO `oc_area` VALUES ('140322', '盂　县', '3', '140300');
INSERT INTO `oc_area` VALUES ('140401', '市辖区', '3', '140400');
INSERT INTO `oc_area` VALUES ('140402', '城　区', '3', '140400');
INSERT INTO `oc_area` VALUES ('140411', '郊　区', '3', '140400');
INSERT INTO `oc_area` VALUES ('140421', '长治县', '3', '140400');
INSERT INTO `oc_area` VALUES ('140423', '襄垣县', '3', '140400');
INSERT INTO `oc_area` VALUES ('140424', '屯留县', '3', '140400');
INSERT INTO `oc_area` VALUES ('140425', '平顺县', '3', '140400');
INSERT INTO `oc_area` VALUES ('140426', '黎城县', '3', '140400');
INSERT INTO `oc_area` VALUES ('140427', '壶关县', '3', '140400');
INSERT INTO `oc_area` VALUES ('140428', '长子县', '3', '140400');
INSERT INTO `oc_area` VALUES ('140429', '武乡县', '3', '140400');
INSERT INTO `oc_area` VALUES ('140430', '沁　县', '3', '140400');
INSERT INTO `oc_area` VALUES ('140431', '沁源县', '3', '140400');
INSERT INTO `oc_area` VALUES ('140481', '潞城市', '3', '140400');
INSERT INTO `oc_area` VALUES ('140501', '市辖区', '3', '140500');
INSERT INTO `oc_area` VALUES ('140502', '城　区', '3', '140500');
INSERT INTO `oc_area` VALUES ('140521', '沁水县', '3', '140500');
INSERT INTO `oc_area` VALUES ('140522', '阳城县', '3', '140500');
INSERT INTO `oc_area` VALUES ('140524', '陵川县', '3', '140500');
INSERT INTO `oc_area` VALUES ('140525', '泽州县', '3', '140500');
INSERT INTO `oc_area` VALUES ('140581', '高平市', '3', '140500');
INSERT INTO `oc_area` VALUES ('140601', '市辖区', '3', '140600');
INSERT INTO `oc_area` VALUES ('140602', '朔城区', '3', '140600');
INSERT INTO `oc_area` VALUES ('140603', '平鲁区', '3', '140600');
INSERT INTO `oc_area` VALUES ('140621', '山阴县', '3', '140600');
INSERT INTO `oc_area` VALUES ('140622', '应　县', '3', '140600');
INSERT INTO `oc_area` VALUES ('140623', '右玉县', '3', '140600');
INSERT INTO `oc_area` VALUES ('140624', '怀仁县', '3', '140600');
INSERT INTO `oc_area` VALUES ('140701', '市辖区', '3', '140700');
INSERT INTO `oc_area` VALUES ('140702', '榆次区', '3', '140700');
INSERT INTO `oc_area` VALUES ('140721', '榆社县', '3', '140700');
INSERT INTO `oc_area` VALUES ('140722', '左权县', '3', '140700');
INSERT INTO `oc_area` VALUES ('140723', '和顺县', '3', '140700');
INSERT INTO `oc_area` VALUES ('140724', '昔阳县', '3', '140700');
INSERT INTO `oc_area` VALUES ('140725', '寿阳县', '3', '140700');
INSERT INTO `oc_area` VALUES ('140726', '太谷县', '3', '140700');
INSERT INTO `oc_area` VALUES ('140727', '祁　县', '3', '140700');
INSERT INTO `oc_area` VALUES ('140728', '平遥县', '3', '140700');
INSERT INTO `oc_area` VALUES ('140729', '灵石县', '3', '140700');
INSERT INTO `oc_area` VALUES ('140781', '介休市', '3', '140700');
INSERT INTO `oc_area` VALUES ('140801', '市辖区', '3', '140800');
INSERT INTO `oc_area` VALUES ('140802', '盐湖区', '3', '140800');
INSERT INTO `oc_area` VALUES ('140821', '临猗县', '3', '140800');
INSERT INTO `oc_area` VALUES ('140822', '万荣县', '3', '140800');
INSERT INTO `oc_area` VALUES ('140823', '闻喜县', '3', '140800');
INSERT INTO `oc_area` VALUES ('140824', '稷山县', '3', '140800');
INSERT INTO `oc_area` VALUES ('140825', '新绛县', '3', '140800');
INSERT INTO `oc_area` VALUES ('140826', '绛　县', '3', '140800');
INSERT INTO `oc_area` VALUES ('140827', '垣曲县', '3', '140800');
INSERT INTO `oc_area` VALUES ('140828', '夏　县', '3', '140800');
INSERT INTO `oc_area` VALUES ('140829', '平陆县', '3', '140800');
INSERT INTO `oc_area` VALUES ('140830', '芮城县', '3', '140800');
INSERT INTO `oc_area` VALUES ('140881', '永济市', '3', '140800');
INSERT INTO `oc_area` VALUES ('140882', '河津市', '3', '140800');
INSERT INTO `oc_area` VALUES ('140901', '市辖区', '3', '140900');
INSERT INTO `oc_area` VALUES ('140902', '忻府区', '3', '140900');
INSERT INTO `oc_area` VALUES ('140921', '定襄县', '3', '140900');
INSERT INTO `oc_area` VALUES ('140922', '五台县', '3', '140900');
INSERT INTO `oc_area` VALUES ('140923', '代　县', '3', '140900');
INSERT INTO `oc_area` VALUES ('140924', '繁峙县', '3', '140900');
INSERT INTO `oc_area` VALUES ('140925', '宁武县', '3', '140900');
INSERT INTO `oc_area` VALUES ('140926', '静乐县', '3', '140900');
INSERT INTO `oc_area` VALUES ('140927', '神池县', '3', '140900');
INSERT INTO `oc_area` VALUES ('140928', '五寨县', '3', '140900');
INSERT INTO `oc_area` VALUES ('140929', '岢岚县', '3', '140900');
INSERT INTO `oc_area` VALUES ('140930', '河曲县', '3', '140900');
INSERT INTO `oc_area` VALUES ('140931', '保德县', '3', '140900');
INSERT INTO `oc_area` VALUES ('140932', '偏关县', '3', '140900');
INSERT INTO `oc_area` VALUES ('140981', '原平市', '3', '140900');
INSERT INTO `oc_area` VALUES ('141001', '市辖区', '3', '141000');
INSERT INTO `oc_area` VALUES ('141002', '尧都区', '3', '141000');
INSERT INTO `oc_area` VALUES ('141021', '曲沃县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141022', '翼城县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141023', '襄汾县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141024', '洪洞县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141025', '古　县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141026', '安泽县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141027', '浮山县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141028', '吉　县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141029', '乡宁县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141030', '大宁县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141031', '隰　县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141032', '永和县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141033', '蒲　县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141034', '汾西县', '3', '141000');
INSERT INTO `oc_area` VALUES ('141081', '侯马市', '3', '141000');
INSERT INTO `oc_area` VALUES ('141082', '霍州市', '3', '141000');
INSERT INTO `oc_area` VALUES ('141101', '市辖区', '3', '141100');
INSERT INTO `oc_area` VALUES ('141102', '离石区', '3', '141100');
INSERT INTO `oc_area` VALUES ('141121', '文水县', '3', '141100');
INSERT INTO `oc_area` VALUES ('141122', '交城县', '3', '141100');
INSERT INTO `oc_area` VALUES ('141123', '兴　县', '3', '141100');
INSERT INTO `oc_area` VALUES ('141124', '临　县', '3', '141100');
INSERT INTO `oc_area` VALUES ('141125', '柳林县', '3', '141100');
INSERT INTO `oc_area` VALUES ('141126', '石楼县', '3', '141100');
INSERT INTO `oc_area` VALUES ('141127', '岚　县', '3', '141100');
INSERT INTO `oc_area` VALUES ('141128', '方山县', '3', '141100');
INSERT INTO `oc_area` VALUES ('141129', '中阳县', '3', '141100');
INSERT INTO `oc_area` VALUES ('141130', '交口县', '3', '141100');
INSERT INTO `oc_area` VALUES ('141181', '孝义市', '3', '141100');
INSERT INTO `oc_area` VALUES ('141182', '汾阳市', '3', '141100');
INSERT INTO `oc_area` VALUES ('150101', '市辖区', '3', '150100');
INSERT INTO `oc_area` VALUES ('150102', '新城区', '3', '150100');
INSERT INTO `oc_area` VALUES ('150103', '回民区', '3', '150100');
INSERT INTO `oc_area` VALUES ('150104', '玉泉区', '3', '150100');
INSERT INTO `oc_area` VALUES ('150105', '赛罕区', '3', '150100');
INSERT INTO `oc_area` VALUES ('150121', '土默特左旗', '3', '150100');
INSERT INTO `oc_area` VALUES ('150122', '托克托县', '3', '150100');
INSERT INTO `oc_area` VALUES ('150123', '和林格尔县', '3', '150100');
INSERT INTO `oc_area` VALUES ('150124', '清水河县', '3', '150100');
INSERT INTO `oc_area` VALUES ('150125', '武川县', '3', '150100');
INSERT INTO `oc_area` VALUES ('150201', '市辖区', '3', '150200');
INSERT INTO `oc_area` VALUES ('150202', '东河区', '3', '150200');
INSERT INTO `oc_area` VALUES ('150203', '昆都仑区', '3', '150200');
INSERT INTO `oc_area` VALUES ('150204', '青山区', '3', '150200');
INSERT INTO `oc_area` VALUES ('150205', '石拐区', '3', '150200');
INSERT INTO `oc_area` VALUES ('150206', '白云矿区', '3', '150200');
INSERT INTO `oc_area` VALUES ('150207', '九原区', '3', '150200');
INSERT INTO `oc_area` VALUES ('150221', '土默特右旗', '3', '150200');
INSERT INTO `oc_area` VALUES ('150222', '固阳县', '3', '150200');
INSERT INTO `oc_area` VALUES ('150223', '达尔罕茂明安联合旗', '3', '150200');
INSERT INTO `oc_area` VALUES ('150301', '市辖区', '3', '150300');
INSERT INTO `oc_area` VALUES ('150302', '海勃湾区', '3', '150300');
INSERT INTO `oc_area` VALUES ('150303', '海南区', '3', '150300');
INSERT INTO `oc_area` VALUES ('150304', '乌达区', '3', '150300');
INSERT INTO `oc_area` VALUES ('150401', '市辖区', '3', '150400');
INSERT INTO `oc_area` VALUES ('150402', '红山区', '3', '150400');
INSERT INTO `oc_area` VALUES ('150403', '元宝山区', '3', '150400');
INSERT INTO `oc_area` VALUES ('150404', '松山区', '3', '150400');
INSERT INTO `oc_area` VALUES ('150421', '阿鲁科尔沁旗', '3', '150400');
INSERT INTO `oc_area` VALUES ('150422', '巴林左旗', '3', '150400');
INSERT INTO `oc_area` VALUES ('150423', '巴林右旗', '3', '150400');
INSERT INTO `oc_area` VALUES ('150424', '林西县', '3', '150400');
INSERT INTO `oc_area` VALUES ('150425', '克什克腾旗', '3', '150400');
INSERT INTO `oc_area` VALUES ('150426', '翁牛特旗', '3', '150400');
INSERT INTO `oc_area` VALUES ('150428', '喀喇沁旗', '3', '150400');
INSERT INTO `oc_area` VALUES ('150429', '宁城县', '3', '150400');
INSERT INTO `oc_area` VALUES ('150430', '敖汉旗', '3', '150400');
INSERT INTO `oc_area` VALUES ('150501', '市辖区', '3', '150500');
INSERT INTO `oc_area` VALUES ('150502', '科尔沁区', '3', '150500');
INSERT INTO `oc_area` VALUES ('150521', '科尔沁左翼中旗', '3', '150500');
INSERT INTO `oc_area` VALUES ('150522', '科尔沁左翼后旗', '3', '150500');
INSERT INTO `oc_area` VALUES ('150523', '开鲁县', '3', '150500');
INSERT INTO `oc_area` VALUES ('150524', '库伦旗', '3', '150500');
INSERT INTO `oc_area` VALUES ('150525', '奈曼旗', '3', '150500');
INSERT INTO `oc_area` VALUES ('150526', '扎鲁特旗', '3', '150500');
INSERT INTO `oc_area` VALUES ('150581', '霍林郭勒市', '3', '150500');
INSERT INTO `oc_area` VALUES ('150602', '东胜区', '3', '150600');
INSERT INTO `oc_area` VALUES ('150621', '达拉特旗', '3', '150600');
INSERT INTO `oc_area` VALUES ('150622', '准格尔旗', '3', '150600');
INSERT INTO `oc_area` VALUES ('150623', '鄂托克前旗', '3', '150600');
INSERT INTO `oc_area` VALUES ('150624', '鄂托克旗', '3', '150600');
INSERT INTO `oc_area` VALUES ('150625', '杭锦旗', '3', '150600');
INSERT INTO `oc_area` VALUES ('150626', '乌审旗', '3', '150600');
INSERT INTO `oc_area` VALUES ('150627', '伊金霍洛旗', '3', '150600');
INSERT INTO `oc_area` VALUES ('150701', '市辖区', '3', '150700');
INSERT INTO `oc_area` VALUES ('150702', '海拉尔区', '3', '150700');
INSERT INTO `oc_area` VALUES ('150721', '阿荣旗', '3', '150700');
INSERT INTO `oc_area` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '3', '150700');
INSERT INTO `oc_area` VALUES ('150723', '鄂伦春自治旗', '3', '150700');
INSERT INTO `oc_area` VALUES ('150724', '鄂温克族自治旗', '3', '150700');
INSERT INTO `oc_area` VALUES ('150725', '陈巴尔虎旗', '3', '150700');
INSERT INTO `oc_area` VALUES ('150726', '新巴尔虎左旗', '3', '150700');
INSERT INTO `oc_area` VALUES ('150727', '新巴尔虎右旗', '3', '150700');
INSERT INTO `oc_area` VALUES ('150781', '满洲里市', '3', '150700');
INSERT INTO `oc_area` VALUES ('150782', '牙克石市', '3', '150700');
INSERT INTO `oc_area` VALUES ('150783', '扎兰屯市', '3', '150700');
INSERT INTO `oc_area` VALUES ('150784', '额尔古纳市', '3', '150700');
INSERT INTO `oc_area` VALUES ('150785', '根河市', '3', '150700');
INSERT INTO `oc_area` VALUES ('150801', '市辖区', '3', '150800');
INSERT INTO `oc_area` VALUES ('150802', '临河区', '3', '150800');
INSERT INTO `oc_area` VALUES ('150821', '五原县', '3', '150800');
INSERT INTO `oc_area` VALUES ('150822', '磴口县', '3', '150800');
INSERT INTO `oc_area` VALUES ('150823', '乌拉特前旗', '3', '150800');
INSERT INTO `oc_area` VALUES ('150824', '乌拉特中旗', '3', '150800');
INSERT INTO `oc_area` VALUES ('150825', '乌拉特后旗', '3', '150800');
INSERT INTO `oc_area` VALUES ('150826', '杭锦后旗', '3', '150800');
INSERT INTO `oc_area` VALUES ('150901', '市辖区', '3', '150900');
INSERT INTO `oc_area` VALUES ('150902', '集宁区', '3', '150900');
INSERT INTO `oc_area` VALUES ('150921', '卓资县', '3', '150900');
INSERT INTO `oc_area` VALUES ('150922', '化德县', '3', '150900');
INSERT INTO `oc_area` VALUES ('150923', '商都县', '3', '150900');
INSERT INTO `oc_area` VALUES ('150924', '兴和县', '3', '150900');
INSERT INTO `oc_area` VALUES ('150925', '凉城县', '3', '150900');
INSERT INTO `oc_area` VALUES ('150926', '察哈尔右翼前旗', '3', '150900');
INSERT INTO `oc_area` VALUES ('150927', '察哈尔右翼中旗', '3', '150900');
INSERT INTO `oc_area` VALUES ('150928', '察哈尔右翼后旗', '3', '150900');
INSERT INTO `oc_area` VALUES ('150929', '四子王旗', '3', '150900');
INSERT INTO `oc_area` VALUES ('150981', '丰镇市', '3', '150900');
INSERT INTO `oc_area` VALUES ('152201', '乌兰浩特市', '3', '152200');
INSERT INTO `oc_area` VALUES ('152202', '阿尔山市', '3', '152200');
INSERT INTO `oc_area` VALUES ('152221', '科尔沁右翼前旗', '3', '152200');
INSERT INTO `oc_area` VALUES ('152222', '科尔沁右翼中旗', '3', '152200');
INSERT INTO `oc_area` VALUES ('152223', '扎赉特旗', '3', '152200');
INSERT INTO `oc_area` VALUES ('152224', '突泉县', '3', '152200');
INSERT INTO `oc_area` VALUES ('152501', '二连浩特市', '3', '152500');
INSERT INTO `oc_area` VALUES ('152502', '锡林浩特市', '3', '152500');
INSERT INTO `oc_area` VALUES ('152522', '阿巴嘎旗', '3', '152500');
INSERT INTO `oc_area` VALUES ('152523', '苏尼特左旗', '3', '152500');
INSERT INTO `oc_area` VALUES ('152524', '苏尼特右旗', '3', '152500');
INSERT INTO `oc_area` VALUES ('152525', '东乌珠穆沁旗', '3', '152500');
INSERT INTO `oc_area` VALUES ('152526', '西乌珠穆沁旗', '3', '152500');
INSERT INTO `oc_area` VALUES ('152527', '太仆寺旗', '3', '152500');
INSERT INTO `oc_area` VALUES ('152528', '镶黄旗', '3', '152500');
INSERT INTO `oc_area` VALUES ('152529', '正镶白旗', '3', '152500');
INSERT INTO `oc_area` VALUES ('152530', '正蓝旗', '3', '152500');
INSERT INTO `oc_area` VALUES ('152531', '多伦县', '3', '152500');
INSERT INTO `oc_area` VALUES ('152921', '阿拉善左旗', '3', '152900');
INSERT INTO `oc_area` VALUES ('152922', '阿拉善右旗', '3', '152900');
INSERT INTO `oc_area` VALUES ('152923', '额济纳旗', '3', '152900');
INSERT INTO `oc_area` VALUES ('210101', '市辖区', '3', '210100');
INSERT INTO `oc_area` VALUES ('210102', '和平区', '3', '210100');
INSERT INTO `oc_area` VALUES ('210103', '沈河区', '3', '210100');
INSERT INTO `oc_area` VALUES ('210104', '大东区', '3', '210100');
INSERT INTO `oc_area` VALUES ('210105', '皇姑区', '3', '210100');
INSERT INTO `oc_area` VALUES ('210106', '铁西区', '3', '210100');
INSERT INTO `oc_area` VALUES ('210111', '苏家屯区', '3', '210100');
INSERT INTO `oc_area` VALUES ('210112', '东陵区', '3', '210100');
INSERT INTO `oc_area` VALUES ('210113', '新城子区', '3', '210100');
INSERT INTO `oc_area` VALUES ('210114', '于洪区', '3', '210100');
INSERT INTO `oc_area` VALUES ('210122', '辽中县', '3', '210100');
INSERT INTO `oc_area` VALUES ('210123', '康平县', '3', '210100');
INSERT INTO `oc_area` VALUES ('210124', '法库县', '3', '210100');
INSERT INTO `oc_area` VALUES ('210181', '新民市', '3', '210100');
INSERT INTO `oc_area` VALUES ('210201', '市辖区', '3', '210200');
INSERT INTO `oc_area` VALUES ('210202', '中山区', '3', '210200');
INSERT INTO `oc_area` VALUES ('210203', '西岗区', '3', '210200');
INSERT INTO `oc_area` VALUES ('210204', '沙河口区', '3', '210200');
INSERT INTO `oc_area` VALUES ('210211', '甘井子区', '3', '210200');
INSERT INTO `oc_area` VALUES ('210212', '旅顺口区', '3', '210200');
INSERT INTO `oc_area` VALUES ('210213', '金州区', '3', '210200');
INSERT INTO `oc_area` VALUES ('210224', '长海县', '3', '210200');
INSERT INTO `oc_area` VALUES ('210281', '瓦房店市', '3', '210200');
INSERT INTO `oc_area` VALUES ('210282', '普兰店市', '3', '210200');
INSERT INTO `oc_area` VALUES ('210283', '庄河市', '3', '210200');
INSERT INTO `oc_area` VALUES ('210301', '市辖区', '3', '210300');
INSERT INTO `oc_area` VALUES ('210302', '铁东区', '3', '210300');
INSERT INTO `oc_area` VALUES ('210303', '铁西区', '3', '210300');
INSERT INTO `oc_area` VALUES ('210304', '立山区', '3', '210300');
INSERT INTO `oc_area` VALUES ('210311', '千山区', '3', '210300');
INSERT INTO `oc_area` VALUES ('210321', '台安县', '3', '210300');
INSERT INTO `oc_area` VALUES ('210323', '岫岩满族自治县', '3', '210300');
INSERT INTO `oc_area` VALUES ('210381', '海城市', '3', '210300');
INSERT INTO `oc_area` VALUES ('210401', '市辖区', '3', '210400');
INSERT INTO `oc_area` VALUES ('210402', '新抚区', '3', '210400');
INSERT INTO `oc_area` VALUES ('210403', '东洲区', '3', '210400');
INSERT INTO `oc_area` VALUES ('210404', '望花区', '3', '210400');
INSERT INTO `oc_area` VALUES ('210411', '顺城区', '3', '210400');
INSERT INTO `oc_area` VALUES ('210421', '抚顺县', '3', '210400');
INSERT INTO `oc_area` VALUES ('210422', '新宾满族自治县', '3', '210400');
INSERT INTO `oc_area` VALUES ('210423', '清原满族自治县', '3', '210400');
INSERT INTO `oc_area` VALUES ('210501', '市辖区', '3', '210500');
INSERT INTO `oc_area` VALUES ('210502', '平山区', '3', '210500');
INSERT INTO `oc_area` VALUES ('210503', '溪湖区', '3', '210500');
INSERT INTO `oc_area` VALUES ('210504', '明山区', '3', '210500');
INSERT INTO `oc_area` VALUES ('210505', '南芬区', '3', '210500');
INSERT INTO `oc_area` VALUES ('210521', '本溪满族自治县', '3', '210500');
INSERT INTO `oc_area` VALUES ('210522', '桓仁满族自治县', '3', '210500');
INSERT INTO `oc_area` VALUES ('210601', '市辖区', '3', '210600');
INSERT INTO `oc_area` VALUES ('210602', '元宝区', '3', '210600');
INSERT INTO `oc_area` VALUES ('210603', '振兴区', '3', '210600');
INSERT INTO `oc_area` VALUES ('210604', '振安区', '3', '210600');
INSERT INTO `oc_area` VALUES ('210624', '宽甸满族自治县', '3', '210600');
INSERT INTO `oc_area` VALUES ('210681', '东港市', '3', '210600');
INSERT INTO `oc_area` VALUES ('210682', '凤城市', '3', '210600');
INSERT INTO `oc_area` VALUES ('210701', '市辖区', '3', '210700');
INSERT INTO `oc_area` VALUES ('210702', '古塔区', '3', '210700');
INSERT INTO `oc_area` VALUES ('210703', '凌河区', '3', '210700');
INSERT INTO `oc_area` VALUES ('210711', '太和区', '3', '210700');
INSERT INTO `oc_area` VALUES ('210726', '黑山县', '3', '210700');
INSERT INTO `oc_area` VALUES ('210727', '义　县', '3', '210700');
INSERT INTO `oc_area` VALUES ('210781', '凌海市', '3', '210700');
INSERT INTO `oc_area` VALUES ('210782', '北宁市', '3', '210700');
INSERT INTO `oc_area` VALUES ('210801', '市辖区', '3', '210800');
INSERT INTO `oc_area` VALUES ('210802', '站前区', '3', '210800');
INSERT INTO `oc_area` VALUES ('210803', '西市区', '3', '210800');
INSERT INTO `oc_area` VALUES ('210804', '鲅鱼圈区', '3', '210800');
INSERT INTO `oc_area` VALUES ('210811', '老边区', '3', '210800');
INSERT INTO `oc_area` VALUES ('210881', '盖州市', '3', '210800');
INSERT INTO `oc_area` VALUES ('210882', '大石桥市', '3', '210800');
INSERT INTO `oc_area` VALUES ('210901', '市辖区', '3', '210900');
INSERT INTO `oc_area` VALUES ('210902', '海州区', '3', '210900');
INSERT INTO `oc_area` VALUES ('210903', '新邱区', '3', '210900');
INSERT INTO `oc_area` VALUES ('210904', '太平区', '3', '210900');
INSERT INTO `oc_area` VALUES ('210905', '清河门区', '3', '210900');
INSERT INTO `oc_area` VALUES ('210911', '细河区', '3', '210900');
INSERT INTO `oc_area` VALUES ('210921', '阜新蒙古族自治县', '3', '210900');
INSERT INTO `oc_area` VALUES ('210922', '彰武县', '3', '210900');
INSERT INTO `oc_area` VALUES ('211001', '市辖区', '3', '211000');
INSERT INTO `oc_area` VALUES ('211002', '白塔区', '3', '211000');
INSERT INTO `oc_area` VALUES ('211003', '文圣区', '3', '211000');
INSERT INTO `oc_area` VALUES ('211004', '宏伟区', '3', '211000');
INSERT INTO `oc_area` VALUES ('211005', '弓长岭区', '3', '211000');
INSERT INTO `oc_area` VALUES ('211011', '太子河区', '3', '211000');
INSERT INTO `oc_area` VALUES ('211021', '辽阳县', '3', '211000');
INSERT INTO `oc_area` VALUES ('211081', '灯塔市', '3', '211000');
INSERT INTO `oc_area` VALUES ('211101', '市辖区', '3', '211100');
INSERT INTO `oc_area` VALUES ('211102', '双台子区', '3', '211100');
INSERT INTO `oc_area` VALUES ('211103', '兴隆台区', '3', '211100');
INSERT INTO `oc_area` VALUES ('211121', '大洼县', '3', '211100');
INSERT INTO `oc_area` VALUES ('211122', '盘山县', '3', '211100');
INSERT INTO `oc_area` VALUES ('211201', '市辖区', '3', '211200');
INSERT INTO `oc_area` VALUES ('211202', '银州区', '3', '211200');
INSERT INTO `oc_area` VALUES ('211204', '清河区', '3', '211200');
INSERT INTO `oc_area` VALUES ('211221', '铁岭县', '3', '211200');
INSERT INTO `oc_area` VALUES ('211223', '西丰县', '3', '211200');
INSERT INTO `oc_area` VALUES ('211224', '昌图县', '3', '211200');
INSERT INTO `oc_area` VALUES ('211281', '调兵山市', '3', '211200');
INSERT INTO `oc_area` VALUES ('211282', '开原市', '3', '211200');
INSERT INTO `oc_area` VALUES ('211301', '市辖区', '3', '211300');
INSERT INTO `oc_area` VALUES ('211302', '双塔区', '3', '211300');
INSERT INTO `oc_area` VALUES ('211303', '龙城区', '3', '211300');
INSERT INTO `oc_area` VALUES ('211321', '朝阳县', '3', '211300');
INSERT INTO `oc_area` VALUES ('211322', '建平县', '3', '211300');
INSERT INTO `oc_area` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '3', '211300');
INSERT INTO `oc_area` VALUES ('211381', '北票市', '3', '211300');
INSERT INTO `oc_area` VALUES ('211382', '凌源市', '3', '211300');
INSERT INTO `oc_area` VALUES ('211401', '市辖区', '3', '211400');
INSERT INTO `oc_area` VALUES ('211402', '连山区', '3', '211400');
INSERT INTO `oc_area` VALUES ('211403', '龙港区', '3', '211400');
INSERT INTO `oc_area` VALUES ('211404', '南票区', '3', '211400');
INSERT INTO `oc_area` VALUES ('211421', '绥中县', '3', '211400');
INSERT INTO `oc_area` VALUES ('211422', '建昌县', '3', '211400');
INSERT INTO `oc_area` VALUES ('211481', '兴城市', '3', '211400');
INSERT INTO `oc_area` VALUES ('220101', '市辖区', '3', '220100');
INSERT INTO `oc_area` VALUES ('220102', '南关区', '3', '220100');
INSERT INTO `oc_area` VALUES ('220103', '宽城区', '3', '220100');
INSERT INTO `oc_area` VALUES ('220104', '朝阳区', '3', '220100');
INSERT INTO `oc_area` VALUES ('220105', '二道区', '3', '220100');
INSERT INTO `oc_area` VALUES ('220106', '绿园区', '3', '220100');
INSERT INTO `oc_area` VALUES ('220112', '双阳区', '3', '220100');
INSERT INTO `oc_area` VALUES ('220122', '农安县', '3', '220100');
INSERT INTO `oc_area` VALUES ('220181', '九台市', '3', '220100');
INSERT INTO `oc_area` VALUES ('220182', '榆树市', '3', '220100');
INSERT INTO `oc_area` VALUES ('220183', '德惠市', '3', '220100');
INSERT INTO `oc_area` VALUES ('220201', '市辖区', '3', '220200');
INSERT INTO `oc_area` VALUES ('220202', '昌邑区', '3', '220200');
INSERT INTO `oc_area` VALUES ('220203', '龙潭区', '3', '220200');
INSERT INTO `oc_area` VALUES ('220204', '船营区', '3', '220200');
INSERT INTO `oc_area` VALUES ('220211', '丰满区', '3', '220200');
INSERT INTO `oc_area` VALUES ('220221', '永吉县', '3', '220200');
INSERT INTO `oc_area` VALUES ('220281', '蛟河市', '3', '220200');
INSERT INTO `oc_area` VALUES ('220282', '桦甸市', '3', '220200');
INSERT INTO `oc_area` VALUES ('220283', '舒兰市', '3', '220200');
INSERT INTO `oc_area` VALUES ('220284', '磐石市', '3', '220200');
INSERT INTO `oc_area` VALUES ('220301', '市辖区', '3', '220300');
INSERT INTO `oc_area` VALUES ('220302', '铁西区', '3', '220300');
INSERT INTO `oc_area` VALUES ('220303', '铁东区', '3', '220300');
INSERT INTO `oc_area` VALUES ('220322', '梨树县', '3', '220300');
INSERT INTO `oc_area` VALUES ('220323', '伊通满族自治县', '3', '220300');
INSERT INTO `oc_area` VALUES ('220381', '公主岭市', '3', '220300');
INSERT INTO `oc_area` VALUES ('220382', '双辽市', '3', '220300');
INSERT INTO `oc_area` VALUES ('220401', '市辖区', '3', '220400');
INSERT INTO `oc_area` VALUES ('220402', '龙山区', '3', '220400');
INSERT INTO `oc_area` VALUES ('220403', '西安区', '3', '220400');
INSERT INTO `oc_area` VALUES ('220421', '东丰县', '3', '220400');
INSERT INTO `oc_area` VALUES ('220422', '东辽县', '3', '220400');
INSERT INTO `oc_area` VALUES ('220501', '市辖区', '3', '220500');
INSERT INTO `oc_area` VALUES ('220502', '东昌区', '3', '220500');
INSERT INTO `oc_area` VALUES ('220503', '二道江区', '3', '220500');
INSERT INTO `oc_area` VALUES ('220521', '通化县', '3', '220500');
INSERT INTO `oc_area` VALUES ('220523', '辉南县', '3', '220500');
INSERT INTO `oc_area` VALUES ('220524', '柳河县', '3', '220500');
INSERT INTO `oc_area` VALUES ('220581', '梅河口市', '3', '220500');
INSERT INTO `oc_area` VALUES ('220582', '集安市', '3', '220500');
INSERT INTO `oc_area` VALUES ('220601', '市辖区', '3', '220600');
INSERT INTO `oc_area` VALUES ('220602', '八道江区', '3', '220600');
INSERT INTO `oc_area` VALUES ('220621', '抚松县', '3', '220600');
INSERT INTO `oc_area` VALUES ('220622', '靖宇县', '3', '220600');
INSERT INTO `oc_area` VALUES ('220623', '长白朝鲜族自治县', '3', '220600');
INSERT INTO `oc_area` VALUES ('220625', '江源县', '3', '220600');
INSERT INTO `oc_area` VALUES ('220681', '临江市', '3', '220600');
INSERT INTO `oc_area` VALUES ('220701', '市辖区', '3', '220700');
INSERT INTO `oc_area` VALUES ('220702', '宁江区', '3', '220700');
INSERT INTO `oc_area` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '3', '220700');
INSERT INTO `oc_area` VALUES ('220722', '长岭县', '3', '220700');
INSERT INTO `oc_area` VALUES ('220723', '乾安县', '3', '220700');
INSERT INTO `oc_area` VALUES ('220724', '扶余县', '3', '220700');
INSERT INTO `oc_area` VALUES ('220801', '市辖区', '3', '220800');
INSERT INTO `oc_area` VALUES ('220802', '洮北区', '3', '220800');
INSERT INTO `oc_area` VALUES ('220821', '镇赉县', '3', '220800');
INSERT INTO `oc_area` VALUES ('220822', '通榆县', '3', '220800');
INSERT INTO `oc_area` VALUES ('220881', '洮南市', '3', '220800');
INSERT INTO `oc_area` VALUES ('220882', '大安市', '3', '220800');
INSERT INTO `oc_area` VALUES ('222401', '延吉市', '3', '222400');
INSERT INTO `oc_area` VALUES ('222402', '图们市', '3', '222400');
INSERT INTO `oc_area` VALUES ('222403', '敦化市', '3', '222400');
INSERT INTO `oc_area` VALUES ('222404', '珲春市', '3', '222400');
INSERT INTO `oc_area` VALUES ('222405', '龙井市', '3', '222400');
INSERT INTO `oc_area` VALUES ('222406', '和龙市', '3', '222400');
INSERT INTO `oc_area` VALUES ('222424', '汪清县', '3', '222400');
INSERT INTO `oc_area` VALUES ('222426', '安图县', '3', '222400');
INSERT INTO `oc_area` VALUES ('230101', '市辖区', '3', '230100');
INSERT INTO `oc_area` VALUES ('230102', '道里区', '3', '230100');
INSERT INTO `oc_area` VALUES ('230103', '南岗区', '3', '230100');
INSERT INTO `oc_area` VALUES ('230104', '道外区', '3', '230100');
INSERT INTO `oc_area` VALUES ('230106', '香坊区', '3', '230100');
INSERT INTO `oc_area` VALUES ('230107', '动力区', '3', '230100');
INSERT INTO `oc_area` VALUES ('230108', '平房区', '3', '230100');
INSERT INTO `oc_area` VALUES ('230109', '松北区', '3', '230100');
INSERT INTO `oc_area` VALUES ('230111', '呼兰区', '3', '230100');
INSERT INTO `oc_area` VALUES ('230123', '依兰县', '3', '230100');
INSERT INTO `oc_area` VALUES ('230124', '方正县', '3', '230100');
INSERT INTO `oc_area` VALUES ('230125', '宾　县', '3', '230100');
INSERT INTO `oc_area` VALUES ('230126', '巴彦县', '3', '230100');
INSERT INTO `oc_area` VALUES ('230127', '木兰县', '3', '230100');
INSERT INTO `oc_area` VALUES ('230128', '通河县', '3', '230100');
INSERT INTO `oc_area` VALUES ('230129', '延寿县', '3', '230100');
INSERT INTO `oc_area` VALUES ('230181', '阿城市', '3', '230100');
INSERT INTO `oc_area` VALUES ('230182', '双城市', '3', '230100');
INSERT INTO `oc_area` VALUES ('230183', '尚志市', '3', '230100');
INSERT INTO `oc_area` VALUES ('230184', '五常市', '3', '230100');
INSERT INTO `oc_area` VALUES ('230201', '市辖区', '3', '230200');
INSERT INTO `oc_area` VALUES ('230202', '龙沙区', '3', '230200');
INSERT INTO `oc_area` VALUES ('230203', '建华区', '3', '230200');
INSERT INTO `oc_area` VALUES ('230204', '铁锋区', '3', '230200');
INSERT INTO `oc_area` VALUES ('230205', '昂昂溪区', '3', '230200');
INSERT INTO `oc_area` VALUES ('230206', '富拉尔基区', '3', '230200');
INSERT INTO `oc_area` VALUES ('230207', '碾子山区', '3', '230200');
INSERT INTO `oc_area` VALUES ('230208', '梅里斯达斡尔族区', '3', '230200');
INSERT INTO `oc_area` VALUES ('230221', '龙江县', '3', '230200');
INSERT INTO `oc_area` VALUES ('230223', '依安县', '3', '230200');
INSERT INTO `oc_area` VALUES ('230224', '泰来县', '3', '230200');
INSERT INTO `oc_area` VALUES ('230225', '甘南县', '3', '230200');
INSERT INTO `oc_area` VALUES ('230227', '富裕县', '3', '230200');
INSERT INTO `oc_area` VALUES ('230229', '克山县', '3', '230200');
INSERT INTO `oc_area` VALUES ('230230', '克东县', '3', '230200');
INSERT INTO `oc_area` VALUES ('230231', '拜泉县', '3', '230200');
INSERT INTO `oc_area` VALUES ('230281', '讷河市', '3', '230200');
INSERT INTO `oc_area` VALUES ('230301', '市辖区', '3', '230300');
INSERT INTO `oc_area` VALUES ('230302', '鸡冠区', '3', '230300');
INSERT INTO `oc_area` VALUES ('230303', '恒山区', '3', '230300');
INSERT INTO `oc_area` VALUES ('230304', '滴道区', '3', '230300');
INSERT INTO `oc_area` VALUES ('230305', '梨树区', '3', '230300');
INSERT INTO `oc_area` VALUES ('230306', '城子河区', '3', '230300');
INSERT INTO `oc_area` VALUES ('230307', '麻山区', '3', '230300');
INSERT INTO `oc_area` VALUES ('230321', '鸡东县', '3', '230300');
INSERT INTO `oc_area` VALUES ('230381', '虎林市', '3', '230300');
INSERT INTO `oc_area` VALUES ('230382', '密山市', '3', '230300');
INSERT INTO `oc_area` VALUES ('230401', '市辖区', '3', '230400');
INSERT INTO `oc_area` VALUES ('230402', '向阳区', '3', '230400');
INSERT INTO `oc_area` VALUES ('230403', '工农区', '3', '230400');
INSERT INTO `oc_area` VALUES ('230404', '南山区', '3', '230400');
INSERT INTO `oc_area` VALUES ('230405', '兴安区', '3', '230400');
INSERT INTO `oc_area` VALUES ('230406', '东山区', '3', '230400');
INSERT INTO `oc_area` VALUES ('230407', '兴山区', '3', '230400');
INSERT INTO `oc_area` VALUES ('230421', '萝北县', '3', '230400');
INSERT INTO `oc_area` VALUES ('230422', '绥滨县', '3', '230400');
INSERT INTO `oc_area` VALUES ('230501', '市辖区', '3', '230500');
INSERT INTO `oc_area` VALUES ('230502', '尖山区', '3', '230500');
INSERT INTO `oc_area` VALUES ('230503', '岭东区', '3', '230500');
INSERT INTO `oc_area` VALUES ('230505', '四方台区', '3', '230500');
INSERT INTO `oc_area` VALUES ('230506', '宝山区', '3', '230500');
INSERT INTO `oc_area` VALUES ('230521', '集贤县', '3', '230500');
INSERT INTO `oc_area` VALUES ('230522', '友谊县', '3', '230500');
INSERT INTO `oc_area` VALUES ('230523', '宝清县', '3', '230500');
INSERT INTO `oc_area` VALUES ('230524', '饶河县', '3', '230500');
INSERT INTO `oc_area` VALUES ('230601', '市辖区', '3', '230600');
INSERT INTO `oc_area` VALUES ('230602', '萨尔图区', '3', '230600');
INSERT INTO `oc_area` VALUES ('230603', '龙凤区', '3', '230600');
INSERT INTO `oc_area` VALUES ('230604', '让胡路区', '3', '230600');
INSERT INTO `oc_area` VALUES ('230605', '红岗区', '3', '230600');
INSERT INTO `oc_area` VALUES ('230606', '大同区', '3', '230600');
INSERT INTO `oc_area` VALUES ('230621', '肇州县', '3', '230600');
INSERT INTO `oc_area` VALUES ('230622', '肇源县', '3', '230600');
INSERT INTO `oc_area` VALUES ('230623', '林甸县', '3', '230600');
INSERT INTO `oc_area` VALUES ('230624', '杜尔伯特蒙古族自治县', '3', '230600');
INSERT INTO `oc_area` VALUES ('230701', '市辖区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230702', '伊春区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230703', '南岔区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230704', '友好区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230705', '西林区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230706', '翠峦区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230707', '新青区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230708', '美溪区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230709', '金山屯区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230710', '五营区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230711', '乌马河区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230712', '汤旺河区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230713', '带岭区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230714', '乌伊岭区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230715', '红星区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230716', '上甘岭区', '3', '230700');
INSERT INTO `oc_area` VALUES ('230722', '嘉荫县', '3', '230700');
INSERT INTO `oc_area` VALUES ('230781', '铁力市', '3', '230700');
INSERT INTO `oc_area` VALUES ('230801', '市辖区', '3', '230800');
INSERT INTO `oc_area` VALUES ('230802', '永红区', '3', '230800');
INSERT INTO `oc_area` VALUES ('230803', '向阳区', '3', '230800');
INSERT INTO `oc_area` VALUES ('230804', '前进区', '3', '230800');
INSERT INTO `oc_area` VALUES ('230805', '东风区', '3', '230800');
INSERT INTO `oc_area` VALUES ('230811', '郊　区', '3', '230800');
INSERT INTO `oc_area` VALUES ('230822', '桦南县', '3', '230800');
INSERT INTO `oc_area` VALUES ('230826', '桦川县', '3', '230800');
INSERT INTO `oc_area` VALUES ('230828', '汤原县', '3', '230800');
INSERT INTO `oc_area` VALUES ('230833', '抚远县', '3', '230800');
INSERT INTO `oc_area` VALUES ('230881', '同江市', '3', '230800');
INSERT INTO `oc_area` VALUES ('230882', '富锦市', '3', '230800');
INSERT INTO `oc_area` VALUES ('230901', '市辖区', '3', '230900');
INSERT INTO `oc_area` VALUES ('230902', '新兴区', '3', '230900');
INSERT INTO `oc_area` VALUES ('230903', '桃山区', '3', '230900');
INSERT INTO `oc_area` VALUES ('230904', '茄子河区', '3', '230900');
INSERT INTO `oc_area` VALUES ('230921', '勃利县', '3', '230900');
INSERT INTO `oc_area` VALUES ('231001', '市辖区', '3', '231000');
INSERT INTO `oc_area` VALUES ('231002', '东安区', '3', '231000');
INSERT INTO `oc_area` VALUES ('231003', '阳明区', '3', '231000');
INSERT INTO `oc_area` VALUES ('231004', '爱民区', '3', '231000');
INSERT INTO `oc_area` VALUES ('231005', '西安区', '3', '231000');
INSERT INTO `oc_area` VALUES ('231024', '东宁县', '3', '231000');
INSERT INTO `oc_area` VALUES ('231025', '林口县', '3', '231000');
INSERT INTO `oc_area` VALUES ('231081', '绥芬河市', '3', '231000');
INSERT INTO `oc_area` VALUES ('231083', '海林市', '3', '231000');
INSERT INTO `oc_area` VALUES ('231084', '宁安市', '3', '231000');
INSERT INTO `oc_area` VALUES ('231085', '穆棱市', '3', '231000');
INSERT INTO `oc_area` VALUES ('231101', '市辖区', '3', '231100');
INSERT INTO `oc_area` VALUES ('231102', '爱辉区', '3', '231100');
INSERT INTO `oc_area` VALUES ('231121', '嫩江县', '3', '231100');
INSERT INTO `oc_area` VALUES ('231123', '逊克县', '3', '231100');
INSERT INTO `oc_area` VALUES ('231124', '孙吴县', '3', '231100');
INSERT INTO `oc_area` VALUES ('231181', '北安市', '3', '231100');
INSERT INTO `oc_area` VALUES ('231182', '五大连池市', '3', '231100');
INSERT INTO `oc_area` VALUES ('231201', '市辖区', '3', '231200');
INSERT INTO `oc_area` VALUES ('231202', '北林区', '3', '231200');
INSERT INTO `oc_area` VALUES ('231221', '望奎县', '3', '231200');
INSERT INTO `oc_area` VALUES ('231222', '兰西县', '3', '231200');
INSERT INTO `oc_area` VALUES ('231223', '青冈县', '3', '231200');
INSERT INTO `oc_area` VALUES ('231224', '庆安县', '3', '231200');
INSERT INTO `oc_area` VALUES ('231225', '明水县', '3', '231200');
INSERT INTO `oc_area` VALUES ('231226', '绥棱县', '3', '231200');
INSERT INTO `oc_area` VALUES ('231281', '安达市', '3', '231200');
INSERT INTO `oc_area` VALUES ('231282', '肇东市', '3', '231200');
INSERT INTO `oc_area` VALUES ('231283', '海伦市', '3', '231200');
INSERT INTO `oc_area` VALUES ('232721', '呼玛县', '3', '232700');
INSERT INTO `oc_area` VALUES ('232722', '塔河县', '3', '232700');
INSERT INTO `oc_area` VALUES ('232723', '漠河县', '3', '232700');
INSERT INTO `oc_area` VALUES ('310101', '黄浦区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310103', '卢湾区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310104', '徐汇区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310105', '长宁区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310106', '静安区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310107', '普陀区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310108', '闸北区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310109', '虹口区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310110', '杨浦区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310112', '闵行区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310113', '宝山区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310114', '嘉定区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310115', '浦东新区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310116', '金山区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310117', '松江区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310118', '青浦区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310119', '南汇区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310120', '奉贤区', '3', '310100');
INSERT INTO `oc_area` VALUES ('310230', '崇明县', '3', '310200');
INSERT INTO `oc_area` VALUES ('320101', '市辖区', '3', '320100');
INSERT INTO `oc_area` VALUES ('320102', '玄武区', '3', '320100');
INSERT INTO `oc_area` VALUES ('320103', '白下区', '3', '320100');
INSERT INTO `oc_area` VALUES ('320104', '秦淮区', '3', '320100');
INSERT INTO `oc_area` VALUES ('320105', '建邺区', '3', '320100');
INSERT INTO `oc_area` VALUES ('320106', '鼓楼区', '3', '320100');
INSERT INTO `oc_area` VALUES ('320107', '下关区', '3', '320100');
INSERT INTO `oc_area` VALUES ('320111', '浦口区', '3', '320100');
INSERT INTO `oc_area` VALUES ('320113', '栖霞区', '3', '320100');
INSERT INTO `oc_area` VALUES ('320114', '雨花台区', '3', '320100');
INSERT INTO `oc_area` VALUES ('320115', '江宁区', '3', '320100');
INSERT INTO `oc_area` VALUES ('320116', '六合区', '3', '320100');
INSERT INTO `oc_area` VALUES ('320124', '溧水县', '3', '320100');
INSERT INTO `oc_area` VALUES ('320125', '高淳县', '3', '320100');
INSERT INTO `oc_area` VALUES ('320201', '市辖区', '3', '320200');
INSERT INTO `oc_area` VALUES ('320202', '崇安区', '3', '320200');
INSERT INTO `oc_area` VALUES ('320203', '南长区', '3', '320200');
INSERT INTO `oc_area` VALUES ('320204', '北塘区', '3', '320200');
INSERT INTO `oc_area` VALUES ('320205', '锡山区', '3', '320200');
INSERT INTO `oc_area` VALUES ('320206', '惠山区', '3', '320200');
INSERT INTO `oc_area` VALUES ('320211', '滨湖区', '3', '320200');
INSERT INTO `oc_area` VALUES ('320281', '江阴市', '3', '320200');
INSERT INTO `oc_area` VALUES ('320282', '宜兴市', '3', '320200');
INSERT INTO `oc_area` VALUES ('320301', '市辖区', '3', '320300');
INSERT INTO `oc_area` VALUES ('320302', '鼓楼区', '3', '320300');
INSERT INTO `oc_area` VALUES ('320303', '云龙区', '3', '320300');
INSERT INTO `oc_area` VALUES ('320304', '九里区', '3', '320300');
INSERT INTO `oc_area` VALUES ('320305', '贾汪区', '3', '320300');
INSERT INTO `oc_area` VALUES ('320311', '泉山区', '3', '320300');
INSERT INTO `oc_area` VALUES ('320321', '丰　县', '3', '320300');
INSERT INTO `oc_area` VALUES ('320322', '沛　县', '3', '320300');
INSERT INTO `oc_area` VALUES ('320323', '铜山县', '3', '320300');
INSERT INTO `oc_area` VALUES ('320324', '睢宁县', '3', '320300');
INSERT INTO `oc_area` VALUES ('320381', '新沂市', '3', '320300');
INSERT INTO `oc_area` VALUES ('320382', '邳州市', '3', '320300');
INSERT INTO `oc_area` VALUES ('320401', '市辖区', '3', '320400');
INSERT INTO `oc_area` VALUES ('320402', '天宁区', '3', '320400');
INSERT INTO `oc_area` VALUES ('320404', '钟楼区', '3', '320400');
INSERT INTO `oc_area` VALUES ('320405', '戚墅堰区', '3', '320400');
INSERT INTO `oc_area` VALUES ('320411', '新北区', '3', '320400');
INSERT INTO `oc_area` VALUES ('320412', '武进区', '3', '320400');
INSERT INTO `oc_area` VALUES ('320481', '溧阳市', '3', '320400');
INSERT INTO `oc_area` VALUES ('320482', '金坛市', '3', '320400');
INSERT INTO `oc_area` VALUES ('320501', '市辖区', '3', '320500');
INSERT INTO `oc_area` VALUES ('320502', '沧浪区', '3', '320500');
INSERT INTO `oc_area` VALUES ('320503', '平江区', '3', '320500');
INSERT INTO `oc_area` VALUES ('320504', '金阊区', '3', '320500');
INSERT INTO `oc_area` VALUES ('320505', '虎丘区', '3', '320500');
INSERT INTO `oc_area` VALUES ('320506', '吴中区', '3', '320500');
INSERT INTO `oc_area` VALUES ('320507', '相城区', '3', '320500');
INSERT INTO `oc_area` VALUES ('320581', '常熟市', '3', '320500');
INSERT INTO `oc_area` VALUES ('320582', '张家港市', '3', '320500');
INSERT INTO `oc_area` VALUES ('320583', '昆山市', '3', '320500');
INSERT INTO `oc_area` VALUES ('320584', '吴江市', '3', '320500');
INSERT INTO `oc_area` VALUES ('320585', '太仓市', '3', '320500');
INSERT INTO `oc_area` VALUES ('320601', '市辖区', '3', '320600');
INSERT INTO `oc_area` VALUES ('320602', '崇川区', '3', '320600');
INSERT INTO `oc_area` VALUES ('320611', '港闸区', '3', '320600');
INSERT INTO `oc_area` VALUES ('320621', '海安县', '3', '320600');
INSERT INTO `oc_area` VALUES ('320623', '如东县', '3', '320600');
INSERT INTO `oc_area` VALUES ('320681', '启东市', '3', '320600');
INSERT INTO `oc_area` VALUES ('320682', '如皋市', '3', '320600');
INSERT INTO `oc_area` VALUES ('320683', '通州市', '3', '320600');
INSERT INTO `oc_area` VALUES ('320684', '海门市', '3', '320600');
INSERT INTO `oc_area` VALUES ('320701', '市辖区', '3', '320700');
INSERT INTO `oc_area` VALUES ('320703', '连云区', '3', '320700');
INSERT INTO `oc_area` VALUES ('320705', '新浦区', '3', '320700');
INSERT INTO `oc_area` VALUES ('320706', '海州区', '3', '320700');
INSERT INTO `oc_area` VALUES ('320721', '赣榆县', '3', '320700');
INSERT INTO `oc_area` VALUES ('320722', '东海县', '3', '320700');
INSERT INTO `oc_area` VALUES ('320723', '灌云县', '3', '320700');
INSERT INTO `oc_area` VALUES ('320724', '灌南县', '3', '320700');
INSERT INTO `oc_area` VALUES ('320801', '市辖区', '3', '320800');
INSERT INTO `oc_area` VALUES ('320802', '清河区', '3', '320800');
INSERT INTO `oc_area` VALUES ('320803', '楚州区', '3', '320800');
INSERT INTO `oc_area` VALUES ('320804', '淮阴区', '3', '320800');
INSERT INTO `oc_area` VALUES ('320811', '清浦区', '3', '320800');
INSERT INTO `oc_area` VALUES ('320826', '涟水县', '3', '320800');
INSERT INTO `oc_area` VALUES ('320829', '洪泽县', '3', '320800');
INSERT INTO `oc_area` VALUES ('320830', '盱眙县', '3', '320800');
INSERT INTO `oc_area` VALUES ('320831', '金湖县', '3', '320800');
INSERT INTO `oc_area` VALUES ('320901', '市辖区', '3', '320900');
INSERT INTO `oc_area` VALUES ('320902', '亭湖区', '3', '320900');
INSERT INTO `oc_area` VALUES ('320903', '盐都区', '3', '320900');
INSERT INTO `oc_area` VALUES ('320921', '响水县', '3', '320900');
INSERT INTO `oc_area` VALUES ('320922', '滨海县', '3', '320900');
INSERT INTO `oc_area` VALUES ('320923', '阜宁县', '3', '320900');
INSERT INTO `oc_area` VALUES ('320924', '射阳县', '3', '320900');
INSERT INTO `oc_area` VALUES ('320925', '建湖县', '3', '320900');
INSERT INTO `oc_area` VALUES ('320981', '东台市', '3', '320900');
INSERT INTO `oc_area` VALUES ('320982', '大丰市', '3', '320900');
INSERT INTO `oc_area` VALUES ('321001', '市辖区', '3', '321000');
INSERT INTO `oc_area` VALUES ('321002', '广陵区', '3', '321000');
INSERT INTO `oc_area` VALUES ('321003', '邗江区', '3', '321000');
INSERT INTO `oc_area` VALUES ('321011', '郊　区', '3', '321000');
INSERT INTO `oc_area` VALUES ('321023', '宝应县', '3', '321000');
INSERT INTO `oc_area` VALUES ('321081', '仪征市', '3', '321000');
INSERT INTO `oc_area` VALUES ('321084', '高邮市', '3', '321000');
INSERT INTO `oc_area` VALUES ('321088', '江都市', '3', '321000');
INSERT INTO `oc_area` VALUES ('321101', '市辖区', '3', '321100');
INSERT INTO `oc_area` VALUES ('321102', '京口区', '3', '321100');
INSERT INTO `oc_area` VALUES ('321111', '润州区', '3', '321100');
INSERT INTO `oc_area` VALUES ('321112', '丹徒区', '3', '321100');
INSERT INTO `oc_area` VALUES ('321181', '丹阳市', '3', '321100');
INSERT INTO `oc_area` VALUES ('321182', '扬中市', '3', '321100');
INSERT INTO `oc_area` VALUES ('321183', '句容市', '3', '321100');
INSERT INTO `oc_area` VALUES ('321201', '市辖区', '3', '321200');
INSERT INTO `oc_area` VALUES ('321202', '海陵区', '3', '321200');
INSERT INTO `oc_area` VALUES ('321203', '高港区', '3', '321200');
INSERT INTO `oc_area` VALUES ('321281', '兴化市', '3', '321200');
INSERT INTO `oc_area` VALUES ('321282', '靖江市', '3', '321200');
INSERT INTO `oc_area` VALUES ('321283', '泰兴市', '3', '321200');
INSERT INTO `oc_area` VALUES ('321284', '姜堰市', '3', '321200');
INSERT INTO `oc_area` VALUES ('321301', '市辖区', '3', '321300');
INSERT INTO `oc_area` VALUES ('321302', '宿城区', '3', '321300');
INSERT INTO `oc_area` VALUES ('321311', '宿豫区', '3', '321300');
INSERT INTO `oc_area` VALUES ('321322', '沭阳县', '3', '321300');
INSERT INTO `oc_area` VALUES ('321323', '泗阳县', '3', '321300');
INSERT INTO `oc_area` VALUES ('321324', '泗洪县', '3', '321300');
INSERT INTO `oc_area` VALUES ('330101', '市辖区', '3', '330100');
INSERT INTO `oc_area` VALUES ('330102', '上城区', '3', '330100');
INSERT INTO `oc_area` VALUES ('330103', '下城区', '3', '330100');
INSERT INTO `oc_area` VALUES ('330104', '江干区', '3', '330100');
INSERT INTO `oc_area` VALUES ('330105', '拱墅区', '3', '330100');
INSERT INTO `oc_area` VALUES ('330106', '西湖区', '3', '330100');
INSERT INTO `oc_area` VALUES ('330108', '滨江区', '3', '330100');
INSERT INTO `oc_area` VALUES ('330109', '萧山区', '3', '330100');
INSERT INTO `oc_area` VALUES ('330110', '余杭区', '3', '330100');
INSERT INTO `oc_area` VALUES ('330122', '桐庐县', '3', '330100');
INSERT INTO `oc_area` VALUES ('330127', '淳安县', '3', '330100');
INSERT INTO `oc_area` VALUES ('330182', '建德市', '3', '330100');
INSERT INTO `oc_area` VALUES ('330183', '富阳市', '3', '330100');
INSERT INTO `oc_area` VALUES ('330185', '临安市', '3', '330100');
INSERT INTO `oc_area` VALUES ('330201', '市辖区', '3', '330200');
INSERT INTO `oc_area` VALUES ('330203', '海曙区', '3', '330200');
INSERT INTO `oc_area` VALUES ('330204', '江东区', '3', '330200');
INSERT INTO `oc_area` VALUES ('330205', '江北区', '3', '330200');
INSERT INTO `oc_area` VALUES ('330206', '北仑区', '3', '330200');
INSERT INTO `oc_area` VALUES ('330211', '镇海区', '3', '330200');
INSERT INTO `oc_area` VALUES ('330212', '鄞州区', '3', '330200');
INSERT INTO `oc_area` VALUES ('330225', '象山县', '3', '330200');
INSERT INTO `oc_area` VALUES ('330226', '宁海县', '3', '330200');
INSERT INTO `oc_area` VALUES ('330281', '余姚市', '3', '330200');
INSERT INTO `oc_area` VALUES ('330282', '慈溪市', '3', '330200');
INSERT INTO `oc_area` VALUES ('330283', '奉化市', '3', '330200');
INSERT INTO `oc_area` VALUES ('330301', '市辖区', '3', '330300');
INSERT INTO `oc_area` VALUES ('330302', '鹿城区', '3', '330300');
INSERT INTO `oc_area` VALUES ('330303', '龙湾区', '3', '330300');
INSERT INTO `oc_area` VALUES ('330304', '瓯海区', '3', '330300');
INSERT INTO `oc_area` VALUES ('330322', '洞头县', '3', '330300');
INSERT INTO `oc_area` VALUES ('330324', '永嘉县', '3', '330300');
INSERT INTO `oc_area` VALUES ('330326', '平阳县', '3', '330300');
INSERT INTO `oc_area` VALUES ('330327', '苍南县', '3', '330300');
INSERT INTO `oc_area` VALUES ('330328', '文成县', '3', '330300');
INSERT INTO `oc_area` VALUES ('330329', '泰顺县', '3', '330300');
INSERT INTO `oc_area` VALUES ('330381', '瑞安市', '3', '330300');
INSERT INTO `oc_area` VALUES ('330382', '乐清市', '3', '330300');
INSERT INTO `oc_area` VALUES ('330401', '市辖区', '3', '330400');
INSERT INTO `oc_area` VALUES ('330402', '秀城区', '3', '330400');
INSERT INTO `oc_area` VALUES ('330411', '秀洲区', '3', '330400');
INSERT INTO `oc_area` VALUES ('330421', '嘉善县', '3', '330400');
INSERT INTO `oc_area` VALUES ('330424', '海盐县', '3', '330400');
INSERT INTO `oc_area` VALUES ('330481', '海宁市', '3', '330400');
INSERT INTO `oc_area` VALUES ('330482', '平湖市', '3', '330400');
INSERT INTO `oc_area` VALUES ('330483', '桐乡市', '3', '330400');
INSERT INTO `oc_area` VALUES ('330501', '市辖区', '3', '330500');
INSERT INTO `oc_area` VALUES ('330502', '吴兴区', '3', '330500');
INSERT INTO `oc_area` VALUES ('330503', '南浔区', '3', '330500');
INSERT INTO `oc_area` VALUES ('330521', '德清县', '3', '330500');
INSERT INTO `oc_area` VALUES ('330522', '长兴县', '3', '330500');
INSERT INTO `oc_area` VALUES ('330523', '安吉县', '3', '330500');
INSERT INTO `oc_area` VALUES ('330601', '市辖区', '3', '330600');
INSERT INTO `oc_area` VALUES ('330602', '越城区', '3', '330600');
INSERT INTO `oc_area` VALUES ('330621', '绍兴县', '3', '330600');
INSERT INTO `oc_area` VALUES ('330624', '新昌县', '3', '330600');
INSERT INTO `oc_area` VALUES ('330681', '诸暨市', '3', '330600');
INSERT INTO `oc_area` VALUES ('330682', '上虞市', '3', '330600');
INSERT INTO `oc_area` VALUES ('330683', '嵊州市', '3', '330600');
INSERT INTO `oc_area` VALUES ('330701', '市辖区', '3', '330700');
INSERT INTO `oc_area` VALUES ('330702', '婺城区', '3', '330700');
INSERT INTO `oc_area` VALUES ('330703', '金东区', '3', '330700');
INSERT INTO `oc_area` VALUES ('330723', '武义县', '3', '330700');
INSERT INTO `oc_area` VALUES ('330726', '浦江县', '3', '330700');
INSERT INTO `oc_area` VALUES ('330727', '磐安县', '3', '330700');
INSERT INTO `oc_area` VALUES ('330781', '兰溪市', '3', '330700');
INSERT INTO `oc_area` VALUES ('330782', '义乌市', '3', '330700');
INSERT INTO `oc_area` VALUES ('330783', '东阳市', '3', '330700');
INSERT INTO `oc_area` VALUES ('330784', '永康市', '3', '330700');
INSERT INTO `oc_area` VALUES ('330801', '市辖区', '3', '330800');
INSERT INTO `oc_area` VALUES ('330802', '柯城区', '3', '330800');
INSERT INTO `oc_area` VALUES ('330803', '衢江区', '3', '330800');
INSERT INTO `oc_area` VALUES ('330822', '常山县', '3', '330800');
INSERT INTO `oc_area` VALUES ('330824', '开化县', '3', '330800');
INSERT INTO `oc_area` VALUES ('330825', '龙游县', '3', '330800');
INSERT INTO `oc_area` VALUES ('330881', '江山市', '3', '330800');
INSERT INTO `oc_area` VALUES ('330901', '市辖区', '3', '330900');
INSERT INTO `oc_area` VALUES ('330902', '定海区', '3', '330900');
INSERT INTO `oc_area` VALUES ('330903', '普陀区', '3', '330900');
INSERT INTO `oc_area` VALUES ('330921', '岱山县', '3', '330900');
INSERT INTO `oc_area` VALUES ('330922', '嵊泗县', '3', '330900');
INSERT INTO `oc_area` VALUES ('331001', '市辖区', '3', '331000');
INSERT INTO `oc_area` VALUES ('331002', '椒江区', '3', '331000');
INSERT INTO `oc_area` VALUES ('331003', '黄岩区', '3', '331000');
INSERT INTO `oc_area` VALUES ('331004', '路桥区', '3', '331000');
INSERT INTO `oc_area` VALUES ('331021', '玉环县', '3', '331000');
INSERT INTO `oc_area` VALUES ('331022', '三门县', '3', '331000');
INSERT INTO `oc_area` VALUES ('331023', '天台县', '3', '331000');
INSERT INTO `oc_area` VALUES ('331024', '仙居县', '3', '331000');
INSERT INTO `oc_area` VALUES ('331081', '温岭市', '3', '331000');
INSERT INTO `oc_area` VALUES ('331082', '临海市', '3', '331000');
INSERT INTO `oc_area` VALUES ('331101', '市辖区', '3', '331100');
INSERT INTO `oc_area` VALUES ('331102', '莲都区', '3', '331100');
INSERT INTO `oc_area` VALUES ('331121', '青田县', '3', '331100');
INSERT INTO `oc_area` VALUES ('331122', '缙云县', '3', '331100');
INSERT INTO `oc_area` VALUES ('331123', '遂昌县', '3', '331100');
INSERT INTO `oc_area` VALUES ('331124', '松阳县', '3', '331100');
INSERT INTO `oc_area` VALUES ('331125', '云和县', '3', '331100');
INSERT INTO `oc_area` VALUES ('331126', '庆元县', '3', '331100');
INSERT INTO `oc_area` VALUES ('331127', '景宁畲族自治县', '3', '331100');
INSERT INTO `oc_area` VALUES ('331181', '龙泉市', '3', '331100');
INSERT INTO `oc_area` VALUES ('340101', '市辖区', '3', '340100');
INSERT INTO `oc_area` VALUES ('340102', '瑶海区', '3', '340100');
INSERT INTO `oc_area` VALUES ('340103', '庐阳区', '3', '340100');
INSERT INTO `oc_area` VALUES ('340104', '蜀山区', '3', '340100');
INSERT INTO `oc_area` VALUES ('340111', '包河区', '3', '340100');
INSERT INTO `oc_area` VALUES ('340121', '长丰县', '3', '340100');
INSERT INTO `oc_area` VALUES ('340122', '肥东县', '3', '340100');
INSERT INTO `oc_area` VALUES ('340123', '肥西县', '3', '340100');
INSERT INTO `oc_area` VALUES ('340201', '市辖区', '3', '340200');
INSERT INTO `oc_area` VALUES ('340202', '镜湖区', '3', '340200');
INSERT INTO `oc_area` VALUES ('340203', '马塘区', '3', '340200');
INSERT INTO `oc_area` VALUES ('340204', '新芜区', '3', '340200');
INSERT INTO `oc_area` VALUES ('340207', '鸠江区', '3', '340200');
INSERT INTO `oc_area` VALUES ('340221', '芜湖县', '3', '340200');
INSERT INTO `oc_area` VALUES ('340222', '繁昌县', '3', '340200');
INSERT INTO `oc_area` VALUES ('340223', '南陵县', '3', '340200');
INSERT INTO `oc_area` VALUES ('340301', '市辖区', '3', '340300');
INSERT INTO `oc_area` VALUES ('340302', '龙子湖区', '3', '340300');
INSERT INTO `oc_area` VALUES ('340303', '蚌山区', '3', '340300');
INSERT INTO `oc_area` VALUES ('340304', '禹会区', '3', '340300');
INSERT INTO `oc_area` VALUES ('340311', '淮上区', '3', '340300');
INSERT INTO `oc_area` VALUES ('340321', '怀远县', '3', '340300');
INSERT INTO `oc_area` VALUES ('340322', '五河县', '3', '340300');
INSERT INTO `oc_area` VALUES ('340323', '固镇县', '3', '340300');
INSERT INTO `oc_area` VALUES ('340401', '市辖区', '3', '340400');
INSERT INTO `oc_area` VALUES ('340402', '大通区', '3', '340400');
INSERT INTO `oc_area` VALUES ('340403', '田家庵区', '3', '340400');
INSERT INTO `oc_area` VALUES ('340404', '谢家集区', '3', '340400');
INSERT INTO `oc_area` VALUES ('340405', '八公山区', '3', '340400');
INSERT INTO `oc_area` VALUES ('340406', '潘集区', '3', '340400');
INSERT INTO `oc_area` VALUES ('340421', '凤台县', '3', '340400');
INSERT INTO `oc_area` VALUES ('340501', '市辖区', '3', '340500');
INSERT INTO `oc_area` VALUES ('340502', '金家庄区', '3', '340500');
INSERT INTO `oc_area` VALUES ('340503', '花山区', '3', '340500');
INSERT INTO `oc_area` VALUES ('340504', '雨山区', '3', '340500');
INSERT INTO `oc_area` VALUES ('340521', '当涂县', '3', '340500');
INSERT INTO `oc_area` VALUES ('340601', '市辖区', '3', '340600');
INSERT INTO `oc_area` VALUES ('340602', '杜集区', '3', '340600');
INSERT INTO `oc_area` VALUES ('340603', '相山区', '3', '340600');
INSERT INTO `oc_area` VALUES ('340604', '烈山区', '3', '340600');
INSERT INTO `oc_area` VALUES ('340621', '濉溪县', '3', '340600');
INSERT INTO `oc_area` VALUES ('340701', '市辖区', '3', '340700');
INSERT INTO `oc_area` VALUES ('340702', '铜官山区', '3', '340700');
INSERT INTO `oc_area` VALUES ('340703', '狮子山区', '3', '340700');
INSERT INTO `oc_area` VALUES ('340711', '郊　区', '3', '340700');
INSERT INTO `oc_area` VALUES ('340721', '铜陵县', '3', '340700');
INSERT INTO `oc_area` VALUES ('340801', '市辖区', '3', '340800');
INSERT INTO `oc_area` VALUES ('340802', '迎江区', '3', '340800');
INSERT INTO `oc_area` VALUES ('340803', '大观区', '3', '340800');
INSERT INTO `oc_area` VALUES ('340811', '郊　区', '3', '340800');
INSERT INTO `oc_area` VALUES ('340822', '怀宁县', '3', '340800');
INSERT INTO `oc_area` VALUES ('340823', '枞阳县', '3', '340800');
INSERT INTO `oc_area` VALUES ('340824', '潜山县', '3', '340800');
INSERT INTO `oc_area` VALUES ('340825', '太湖县', '3', '340800');
INSERT INTO `oc_area` VALUES ('340826', '宿松县', '3', '340800');
INSERT INTO `oc_area` VALUES ('340827', '望江县', '3', '340800');
INSERT INTO `oc_area` VALUES ('340828', '岳西县', '3', '340800');
INSERT INTO `oc_area` VALUES ('340881', '桐城市', '3', '340800');
INSERT INTO `oc_area` VALUES ('341001', '市辖区', '3', '341000');
INSERT INTO `oc_area` VALUES ('341002', '屯溪区', '3', '341000');
INSERT INTO `oc_area` VALUES ('341003', '黄山区', '3', '341000');
INSERT INTO `oc_area` VALUES ('341004', '徽州区', '3', '341000');
INSERT INTO `oc_area` VALUES ('341021', '歙　县', '3', '341000');
INSERT INTO `oc_area` VALUES ('341022', '休宁县', '3', '341000');
INSERT INTO `oc_area` VALUES ('341023', '黟　县', '3', '341000');
INSERT INTO `oc_area` VALUES ('341024', '祁门县', '3', '341000');
INSERT INTO `oc_area` VALUES ('341101', '市辖区', '3', '341100');
INSERT INTO `oc_area` VALUES ('341102', '琅琊区', '3', '341100');
INSERT INTO `oc_area` VALUES ('341103', '南谯区', '3', '341100');
INSERT INTO `oc_area` VALUES ('341122', '来安县', '3', '341100');
INSERT INTO `oc_area` VALUES ('341124', '全椒县', '3', '341100');
INSERT INTO `oc_area` VALUES ('341125', '定远县', '3', '341100');
INSERT INTO `oc_area` VALUES ('341126', '凤阳县', '3', '341100');
INSERT INTO `oc_area` VALUES ('341181', '天长市', '3', '341100');
INSERT INTO `oc_area` VALUES ('341182', '明光市', '3', '341100');
INSERT INTO `oc_area` VALUES ('341201', '市辖区', '3', '341200');
INSERT INTO `oc_area` VALUES ('341202', '颍州区', '3', '341200');
INSERT INTO `oc_area` VALUES ('341203', '颍东区', '3', '341200');
INSERT INTO `oc_area` VALUES ('341204', '颍泉区', '3', '341200');
INSERT INTO `oc_area` VALUES ('341221', '临泉县', '3', '341200');
INSERT INTO `oc_area` VALUES ('341222', '太和县', '3', '341200');
INSERT INTO `oc_area` VALUES ('341225', '阜南县', '3', '341200');
INSERT INTO `oc_area` VALUES ('341226', '颍上县', '3', '341200');
INSERT INTO `oc_area` VALUES ('341282', '界首市', '3', '341200');
INSERT INTO `oc_area` VALUES ('341301', '市辖区', '3', '341300');
INSERT INTO `oc_area` VALUES ('341302', '墉桥区', '3', '341300');
INSERT INTO `oc_area` VALUES ('341321', '砀山县', '3', '341300');
INSERT INTO `oc_area` VALUES ('341322', '萧　县', '3', '341300');
INSERT INTO `oc_area` VALUES ('341323', '灵璧县', '3', '341300');
INSERT INTO `oc_area` VALUES ('341324', '泗　县', '3', '341300');
INSERT INTO `oc_area` VALUES ('341401', '庐江县', '3', '340100');
INSERT INTO `oc_area` VALUES ('341402', '巢湖市', '3', '340100');
INSERT INTO `oc_area` VALUES ('341422', '无为县', '3', '340200');
INSERT INTO `oc_area` VALUES ('341423', '含山县', '3', '340500');
INSERT INTO `oc_area` VALUES ('341424', '和　县', '3', '340500');
INSERT INTO `oc_area` VALUES ('341501', '市辖区', '3', '341500');
INSERT INTO `oc_area` VALUES ('341502', '金安区', '3', '341500');
INSERT INTO `oc_area` VALUES ('341503', '裕安区', '3', '341500');
INSERT INTO `oc_area` VALUES ('341521', '寿　县', '3', '341500');
INSERT INTO `oc_area` VALUES ('341522', '霍邱县', '3', '341500');
INSERT INTO `oc_area` VALUES ('341523', '舒城县', '3', '341500');
INSERT INTO `oc_area` VALUES ('341524', '金寨县', '3', '341500');
INSERT INTO `oc_area` VALUES ('341525', '霍山县', '3', '341500');
INSERT INTO `oc_area` VALUES ('341601', '市辖区', '3', '341600');
INSERT INTO `oc_area` VALUES ('341602', '谯城区', '3', '341600');
INSERT INTO `oc_area` VALUES ('341621', '涡阳县', '3', '341600');
INSERT INTO `oc_area` VALUES ('341622', '蒙城县', '3', '341600');
INSERT INTO `oc_area` VALUES ('341623', '利辛县', '3', '341600');
INSERT INTO `oc_area` VALUES ('341701', '市辖区', '3', '341700');
INSERT INTO `oc_area` VALUES ('341702', '贵池区', '3', '341700');
INSERT INTO `oc_area` VALUES ('341721', '东至县', '3', '341700');
INSERT INTO `oc_area` VALUES ('341722', '石台县', '3', '341700');
INSERT INTO `oc_area` VALUES ('341723', '青阳县', '3', '341700');
INSERT INTO `oc_area` VALUES ('341801', '市辖区', '3', '341800');
INSERT INTO `oc_area` VALUES ('341802', '宣州区', '3', '341800');
INSERT INTO `oc_area` VALUES ('341821', '郎溪县', '3', '341800');
INSERT INTO `oc_area` VALUES ('341822', '广德县', '3', '341800');
INSERT INTO `oc_area` VALUES ('341823', '泾　县', '3', '341800');
INSERT INTO `oc_area` VALUES ('341824', '绩溪县', '3', '341800');
INSERT INTO `oc_area` VALUES ('341825', '旌德县', '3', '341800');
INSERT INTO `oc_area` VALUES ('341881', '宁国市', '3', '341800');
INSERT INTO `oc_area` VALUES ('350101', '市辖区', '3', '350100');
INSERT INTO `oc_area` VALUES ('350102', '鼓楼区', '3', '350100');
INSERT INTO `oc_area` VALUES ('350103', '台江区', '3', '350100');
INSERT INTO `oc_area` VALUES ('350104', '仓山区', '3', '350100');
INSERT INTO `oc_area` VALUES ('350105', '马尾区', '3', '350100');
INSERT INTO `oc_area` VALUES ('350111', '晋安区', '3', '350100');
INSERT INTO `oc_area` VALUES ('350121', '闽侯县', '3', '350100');
INSERT INTO `oc_area` VALUES ('350122', '连江县', '3', '350100');
INSERT INTO `oc_area` VALUES ('350123', '罗源县', '3', '350100');
INSERT INTO `oc_area` VALUES ('350124', '闽清县', '3', '350100');
INSERT INTO `oc_area` VALUES ('350125', '永泰县', '3', '350100');
INSERT INTO `oc_area` VALUES ('350128', '平潭县', '3', '350100');
INSERT INTO `oc_area` VALUES ('350181', '福清市', '3', '350100');
INSERT INTO `oc_area` VALUES ('350182', '长乐市', '3', '350100');
INSERT INTO `oc_area` VALUES ('350201', '市辖区', '3', '350200');
INSERT INTO `oc_area` VALUES ('350203', '思明区', '3', '350200');
INSERT INTO `oc_area` VALUES ('350205', '海沧区', '3', '350200');
INSERT INTO `oc_area` VALUES ('350206', '湖里区', '3', '350200');
INSERT INTO `oc_area` VALUES ('350211', '集美区', '3', '350200');
INSERT INTO `oc_area` VALUES ('350212', '同安区', '3', '350200');
INSERT INTO `oc_area` VALUES ('350213', '翔安区', '3', '350200');
INSERT INTO `oc_area` VALUES ('350301', '市辖区', '3', '350300');
INSERT INTO `oc_area` VALUES ('350302', '城厢区', '3', '350300');
INSERT INTO `oc_area` VALUES ('350303', '涵江区', '3', '350300');
INSERT INTO `oc_area` VALUES ('350304', '荔城区', '3', '350300');
INSERT INTO `oc_area` VALUES ('350305', '秀屿区', '3', '350300');
INSERT INTO `oc_area` VALUES ('350322', '仙游县', '3', '350300');
INSERT INTO `oc_area` VALUES ('350401', '市辖区', '3', '350400');
INSERT INTO `oc_area` VALUES ('350402', '梅列区', '3', '350400');
INSERT INTO `oc_area` VALUES ('350403', '三元区', '3', '350400');
INSERT INTO `oc_area` VALUES ('350421', '明溪县', '3', '350400');
INSERT INTO `oc_area` VALUES ('350423', '清流县', '3', '350400');
INSERT INTO `oc_area` VALUES ('350424', '宁化县', '3', '350400');
INSERT INTO `oc_area` VALUES ('350425', '大田县', '3', '350400');
INSERT INTO `oc_area` VALUES ('350426', '尤溪县', '3', '350400');
INSERT INTO `oc_area` VALUES ('350427', '沙　县', '3', '350400');
INSERT INTO `oc_area` VALUES ('350428', '将乐县', '3', '350400');
INSERT INTO `oc_area` VALUES ('350429', '泰宁县', '3', '350400');
INSERT INTO `oc_area` VALUES ('350430', '建宁县', '3', '350400');
INSERT INTO `oc_area` VALUES ('350481', '永安市', '3', '350400');
INSERT INTO `oc_area` VALUES ('350501', '市辖区', '3', '350500');
INSERT INTO `oc_area` VALUES ('350502', '鲤城区', '3', '350500');
INSERT INTO `oc_area` VALUES ('350503', '丰泽区', '3', '350500');
INSERT INTO `oc_area` VALUES ('350504', '洛江区', '3', '350500');
INSERT INTO `oc_area` VALUES ('350505', '泉港区', '3', '350500');
INSERT INTO `oc_area` VALUES ('350521', '惠安县', '3', '350500');
INSERT INTO `oc_area` VALUES ('350524', '安溪县', '3', '350500');
INSERT INTO `oc_area` VALUES ('350525', '永春县', '3', '350500');
INSERT INTO `oc_area` VALUES ('350526', '德化县', '3', '350500');
INSERT INTO `oc_area` VALUES ('350527', '金门县', '3', '350500');
INSERT INTO `oc_area` VALUES ('350581', '石狮市', '3', '350500');
INSERT INTO `oc_area` VALUES ('350582', '晋江市', '3', '350500');
INSERT INTO `oc_area` VALUES ('350583', '南安市', '3', '350500');
INSERT INTO `oc_area` VALUES ('350601', '市辖区', '3', '350600');
INSERT INTO `oc_area` VALUES ('350602', '芗城区', '3', '350600');
INSERT INTO `oc_area` VALUES ('350603', '龙文区', '3', '350600');
INSERT INTO `oc_area` VALUES ('350622', '云霄县', '3', '350600');
INSERT INTO `oc_area` VALUES ('350623', '漳浦县', '3', '350600');
INSERT INTO `oc_area` VALUES ('350624', '诏安县', '3', '350600');
INSERT INTO `oc_area` VALUES ('350625', '长泰县', '3', '350600');
INSERT INTO `oc_area` VALUES ('350626', '东山县', '3', '350600');
INSERT INTO `oc_area` VALUES ('350627', '南靖县', '3', '350600');
INSERT INTO `oc_area` VALUES ('350628', '平和县', '3', '350600');
INSERT INTO `oc_area` VALUES ('350629', '华安县', '3', '350600');
INSERT INTO `oc_area` VALUES ('350681', '龙海市', '3', '350600');
INSERT INTO `oc_area` VALUES ('350701', '市辖区', '3', '350700');
INSERT INTO `oc_area` VALUES ('350702', '延平区', '3', '350700');
INSERT INTO `oc_area` VALUES ('350721', '顺昌县', '3', '350700');
INSERT INTO `oc_area` VALUES ('350722', '浦城县', '3', '350700');
INSERT INTO `oc_area` VALUES ('350723', '光泽县', '3', '350700');
INSERT INTO `oc_area` VALUES ('350724', '松溪县', '3', '350700');
INSERT INTO `oc_area` VALUES ('350725', '政和县', '3', '350700');
INSERT INTO `oc_area` VALUES ('350781', '邵武市', '3', '350700');
INSERT INTO `oc_area` VALUES ('350782', '武夷山市', '3', '350700');
INSERT INTO `oc_area` VALUES ('350783', '建瓯市', '3', '350700');
INSERT INTO `oc_area` VALUES ('350784', '建阳市', '3', '350700');
INSERT INTO `oc_area` VALUES ('350801', '市辖区', '3', '350800');
INSERT INTO `oc_area` VALUES ('350802', '新罗区', '3', '350800');
INSERT INTO `oc_area` VALUES ('350821', '长汀县', '3', '350800');
INSERT INTO `oc_area` VALUES ('350822', '永定县', '3', '350800');
INSERT INTO `oc_area` VALUES ('350823', '上杭县', '3', '350800');
INSERT INTO `oc_area` VALUES ('350824', '武平县', '3', '350800');
INSERT INTO `oc_area` VALUES ('350825', '连城县', '3', '350800');
INSERT INTO `oc_area` VALUES ('350881', '漳平市', '3', '350800');
INSERT INTO `oc_area` VALUES ('350901', '市辖区', '3', '350900');
INSERT INTO `oc_area` VALUES ('350902', '蕉城区', '3', '350900');
INSERT INTO `oc_area` VALUES ('350921', '霞浦县', '3', '350900');
INSERT INTO `oc_area` VALUES ('350922', '古田县', '3', '350900');
INSERT INTO `oc_area` VALUES ('350923', '屏南县', '3', '350900');
INSERT INTO `oc_area` VALUES ('350924', '寿宁县', '3', '350900');
INSERT INTO `oc_area` VALUES ('350925', '周宁县', '3', '350900');
INSERT INTO `oc_area` VALUES ('350926', '柘荣县', '3', '350900');
INSERT INTO `oc_area` VALUES ('350981', '福安市', '3', '350900');
INSERT INTO `oc_area` VALUES ('350982', '福鼎市', '3', '350900');
INSERT INTO `oc_area` VALUES ('360101', '市辖区', '3', '360100');
INSERT INTO `oc_area` VALUES ('360102', '东湖区', '3', '360100');
INSERT INTO `oc_area` VALUES ('360103', '西湖区', '3', '360100');
INSERT INTO `oc_area` VALUES ('360104', '青云谱区', '3', '360100');
INSERT INTO `oc_area` VALUES ('360105', '湾里区', '3', '360100');
INSERT INTO `oc_area` VALUES ('360111', '青山湖区', '3', '360100');
INSERT INTO `oc_area` VALUES ('360121', '南昌县', '3', '360100');
INSERT INTO `oc_area` VALUES ('360122', '新建县', '3', '360100');
INSERT INTO `oc_area` VALUES ('360123', '安义县', '3', '360100');
INSERT INTO `oc_area` VALUES ('360124', '进贤县', '3', '360100');
INSERT INTO `oc_area` VALUES ('360201', '市辖区', '3', '360200');
INSERT INTO `oc_area` VALUES ('360202', '昌江区', '3', '360200');
INSERT INTO `oc_area` VALUES ('360203', '珠山区', '3', '360200');
INSERT INTO `oc_area` VALUES ('360222', '浮梁县', '3', '360200');
INSERT INTO `oc_area` VALUES ('360281', '乐平市', '3', '360200');
INSERT INTO `oc_area` VALUES ('360301', '市辖区', '3', '360300');
INSERT INTO `oc_area` VALUES ('360302', '安源区', '3', '360300');
INSERT INTO `oc_area` VALUES ('360313', '湘东区', '3', '360300');
INSERT INTO `oc_area` VALUES ('360321', '莲花县', '3', '360300');
INSERT INTO `oc_area` VALUES ('360322', '上栗县', '3', '360300');
INSERT INTO `oc_area` VALUES ('360323', '芦溪县', '3', '360300');
INSERT INTO `oc_area` VALUES ('360401', '市辖区', '3', '360400');
INSERT INTO `oc_area` VALUES ('360402', '庐山区', '3', '360400');
INSERT INTO `oc_area` VALUES ('360403', '浔阳区', '3', '360400');
INSERT INTO `oc_area` VALUES ('360421', '九江县', '3', '360400');
INSERT INTO `oc_area` VALUES ('360423', '武宁县', '3', '360400');
INSERT INTO `oc_area` VALUES ('360424', '修水县', '3', '360400');
INSERT INTO `oc_area` VALUES ('360425', '永修县', '3', '360400');
INSERT INTO `oc_area` VALUES ('360426', '德安县', '3', '360400');
INSERT INTO `oc_area` VALUES ('360427', '星子县', '3', '360400');
INSERT INTO `oc_area` VALUES ('360428', '都昌县', '3', '360400');
INSERT INTO `oc_area` VALUES ('360429', '湖口县', '3', '360400');
INSERT INTO `oc_area` VALUES ('360430', '彭泽县', '3', '360400');
INSERT INTO `oc_area` VALUES ('360481', '瑞昌市', '3', '360400');
INSERT INTO `oc_area` VALUES ('360501', '市辖区', '3', '360500');
INSERT INTO `oc_area` VALUES ('360502', '渝水区', '3', '360500');
INSERT INTO `oc_area` VALUES ('360521', '分宜县', '3', '360500');
INSERT INTO `oc_area` VALUES ('360601', '市辖区', '3', '360600');
INSERT INTO `oc_area` VALUES ('360602', '月湖区', '3', '360600');
INSERT INTO `oc_area` VALUES ('360622', '余江县', '3', '360600');
INSERT INTO `oc_area` VALUES ('360681', '贵溪市', '3', '360600');
INSERT INTO `oc_area` VALUES ('360701', '市辖区', '3', '360700');
INSERT INTO `oc_area` VALUES ('360702', '章贡区', '3', '360700');
INSERT INTO `oc_area` VALUES ('360721', '赣　县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360722', '信丰县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360723', '大余县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360724', '上犹县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360725', '崇义县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360726', '安远县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360727', '龙南县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360728', '定南县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360729', '全南县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360730', '宁都县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360731', '于都县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360732', '兴国县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360733', '会昌县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360734', '寻乌县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360735', '石城县', '3', '360700');
INSERT INTO `oc_area` VALUES ('360781', '瑞金市', '3', '360700');
INSERT INTO `oc_area` VALUES ('360782', '南康市', '3', '360700');
INSERT INTO `oc_area` VALUES ('360801', '市辖区', '3', '360800');
INSERT INTO `oc_area` VALUES ('360802', '吉州区', '3', '360800');
INSERT INTO `oc_area` VALUES ('360803', '青原区', '3', '360800');
INSERT INTO `oc_area` VALUES ('360821', '吉安县', '3', '360800');
INSERT INTO `oc_area` VALUES ('360822', '吉水县', '3', '360800');
INSERT INTO `oc_area` VALUES ('360823', '峡江县', '3', '360800');
INSERT INTO `oc_area` VALUES ('360824', '新干县', '3', '360800');
INSERT INTO `oc_area` VALUES ('360825', '永丰县', '3', '360800');
INSERT INTO `oc_area` VALUES ('360826', '泰和县', '3', '360800');
INSERT INTO `oc_area` VALUES ('360827', '遂川县', '3', '360800');
INSERT INTO `oc_area` VALUES ('360828', '万安县', '3', '360800');
INSERT INTO `oc_area` VALUES ('360829', '安福县', '3', '360800');
INSERT INTO `oc_area` VALUES ('360830', '永新县', '3', '360800');
INSERT INTO `oc_area` VALUES ('360881', '井冈山市', '3', '360800');
INSERT INTO `oc_area` VALUES ('360901', '市辖区', '3', '360900');
INSERT INTO `oc_area` VALUES ('360902', '袁州区', '3', '360900');
INSERT INTO `oc_area` VALUES ('360921', '奉新县', '3', '360900');
INSERT INTO `oc_area` VALUES ('360922', '万载县', '3', '360900');
INSERT INTO `oc_area` VALUES ('360923', '上高县', '3', '360900');
INSERT INTO `oc_area` VALUES ('360924', '宜丰县', '3', '360900');
INSERT INTO `oc_area` VALUES ('360925', '靖安县', '3', '360900');
INSERT INTO `oc_area` VALUES ('360926', '铜鼓县', '3', '360900');
INSERT INTO `oc_area` VALUES ('360981', '丰城市', '3', '360900');
INSERT INTO `oc_area` VALUES ('360982', '樟树市', '3', '360900');
INSERT INTO `oc_area` VALUES ('360983', '高安市', '3', '360900');
INSERT INTO `oc_area` VALUES ('361001', '市辖区', '3', '361000');
INSERT INTO `oc_area` VALUES ('361002', '临川区', '3', '361000');
INSERT INTO `oc_area` VALUES ('361021', '南城县', '3', '361000');
INSERT INTO `oc_area` VALUES ('361022', '黎川县', '3', '361000');
INSERT INTO `oc_area` VALUES ('361023', '南丰县', '3', '361000');
INSERT INTO `oc_area` VALUES ('361024', '崇仁县', '3', '361000');
INSERT INTO `oc_area` VALUES ('361025', '乐安县', '3', '361000');
INSERT INTO `oc_area` VALUES ('361026', '宜黄县', '3', '361000');
INSERT INTO `oc_area` VALUES ('361027', '金溪县', '3', '361000');
INSERT INTO `oc_area` VALUES ('361028', '资溪县', '3', '361000');
INSERT INTO `oc_area` VALUES ('361029', '东乡县', '3', '361000');
INSERT INTO `oc_area` VALUES ('361030', '广昌县', '3', '361000');
INSERT INTO `oc_area` VALUES ('361101', '市辖区', '3', '361100');
INSERT INTO `oc_area` VALUES ('361102', '信州区', '3', '361100');
INSERT INTO `oc_area` VALUES ('361121', '上饶县', '3', '361100');
INSERT INTO `oc_area` VALUES ('361122', '广丰县', '3', '361100');
INSERT INTO `oc_area` VALUES ('361123', '玉山县', '3', '361100');
INSERT INTO `oc_area` VALUES ('361124', '铅山县', '3', '361100');
INSERT INTO `oc_area` VALUES ('361125', '横峰县', '3', '361100');
INSERT INTO `oc_area` VALUES ('361126', '弋阳县', '3', '361100');
INSERT INTO `oc_area` VALUES ('361127', '余干县', '3', '361100');
INSERT INTO `oc_area` VALUES ('361128', '鄱阳县', '3', '361100');
INSERT INTO `oc_area` VALUES ('361129', '万年县', '3', '361100');
INSERT INTO `oc_area` VALUES ('361130', '婺源县', '3', '361100');
INSERT INTO `oc_area` VALUES ('361181', '德兴市', '3', '361100');
INSERT INTO `oc_area` VALUES ('370101', '市辖区', '3', '370100');
INSERT INTO `oc_area` VALUES ('370102', '历下区', '3', '370100');
INSERT INTO `oc_area` VALUES ('370103', '市中区', '3', '370100');
INSERT INTO `oc_area` VALUES ('370104', '槐荫区', '3', '370100');
INSERT INTO `oc_area` VALUES ('370105', '天桥区', '3', '370100');
INSERT INTO `oc_area` VALUES ('370112', '历城区', '3', '370100');
INSERT INTO `oc_area` VALUES ('370113', '长清区', '3', '370100');
INSERT INTO `oc_area` VALUES ('370124', '平阴县', '3', '370100');
INSERT INTO `oc_area` VALUES ('370125', '济阳县', '3', '370100');
INSERT INTO `oc_area` VALUES ('370126', '商河县', '3', '370100');
INSERT INTO `oc_area` VALUES ('370181', '章丘市', '3', '370100');
INSERT INTO `oc_area` VALUES ('370201', '市辖区', '3', '370200');
INSERT INTO `oc_area` VALUES ('370202', '市南区', '3', '370200');
INSERT INTO `oc_area` VALUES ('370203', '市北区', '3', '370200');
INSERT INTO `oc_area` VALUES ('370205', '四方区', '3', '370200');
INSERT INTO `oc_area` VALUES ('370211', '黄岛区', '3', '370200');
INSERT INTO `oc_area` VALUES ('370212', '崂山区', '3', '370200');
INSERT INTO `oc_area` VALUES ('370213', '李沧区', '3', '370200');
INSERT INTO `oc_area` VALUES ('370214', '城阳区', '3', '370200');
INSERT INTO `oc_area` VALUES ('370281', '胶州市', '3', '370200');
INSERT INTO `oc_area` VALUES ('370282', '即墨市', '3', '370200');
INSERT INTO `oc_area` VALUES ('370283', '平度市', '3', '370200');
INSERT INTO `oc_area` VALUES ('370284', '胶南市', '3', '370200');
INSERT INTO `oc_area` VALUES ('370285', '莱西市', '3', '370200');
INSERT INTO `oc_area` VALUES ('370301', '市辖区', '3', '370300');
INSERT INTO `oc_area` VALUES ('370302', '淄川区', '3', '370300');
INSERT INTO `oc_area` VALUES ('370303', '张店区', '3', '370300');
INSERT INTO `oc_area` VALUES ('370304', '博山区', '3', '370300');
INSERT INTO `oc_area` VALUES ('370305', '临淄区', '3', '370300');
INSERT INTO `oc_area` VALUES ('370306', '周村区', '3', '370300');
INSERT INTO `oc_area` VALUES ('370321', '桓台县', '3', '370300');
INSERT INTO `oc_area` VALUES ('370322', '高青县', '3', '370300');
INSERT INTO `oc_area` VALUES ('370323', '沂源县', '3', '370300');
INSERT INTO `oc_area` VALUES ('370401', '市辖区', '3', '370400');
INSERT INTO `oc_area` VALUES ('370402', '市中区', '3', '370400');
INSERT INTO `oc_area` VALUES ('370403', '薛城区', '3', '370400');
INSERT INTO `oc_area` VALUES ('370404', '峄城区', '3', '370400');
INSERT INTO `oc_area` VALUES ('370405', '台儿庄区', '3', '370400');
INSERT INTO `oc_area` VALUES ('370406', '山亭区', '3', '370400');
INSERT INTO `oc_area` VALUES ('370481', '滕州市', '3', '370400');
INSERT INTO `oc_area` VALUES ('370501', '市辖区', '3', '370500');
INSERT INTO `oc_area` VALUES ('370502', '东营区', '3', '370500');
INSERT INTO `oc_area` VALUES ('370503', '河口区', '3', '370500');
INSERT INTO `oc_area` VALUES ('370521', '垦利县', '3', '370500');
INSERT INTO `oc_area` VALUES ('370522', '利津县', '3', '370500');
INSERT INTO `oc_area` VALUES ('370523', '广饶县', '3', '370500');
INSERT INTO `oc_area` VALUES ('370601', '市辖区', '3', '370600');
INSERT INTO `oc_area` VALUES ('370602', '芝罘区', '3', '370600');
INSERT INTO `oc_area` VALUES ('370611', '福山区', '3', '370600');
INSERT INTO `oc_area` VALUES ('370612', '牟平区', '3', '370600');
INSERT INTO `oc_area` VALUES ('370613', '莱山区', '3', '370600');
INSERT INTO `oc_area` VALUES ('370634', '长岛县', '3', '370600');
INSERT INTO `oc_area` VALUES ('370681', '龙口市', '3', '370600');
INSERT INTO `oc_area` VALUES ('370682', '莱阳市', '3', '370600');
INSERT INTO `oc_area` VALUES ('370683', '莱州市', '3', '370600');
INSERT INTO `oc_area` VALUES ('370684', '蓬莱市', '3', '370600');
INSERT INTO `oc_area` VALUES ('370685', '招远市', '3', '370600');
INSERT INTO `oc_area` VALUES ('370686', '栖霞市', '3', '370600');
INSERT INTO `oc_area` VALUES ('370687', '海阳市', '3', '370600');
INSERT INTO `oc_area` VALUES ('370701', '市辖区', '3', '370700');
INSERT INTO `oc_area` VALUES ('370702', '潍城区', '3', '370700');
INSERT INTO `oc_area` VALUES ('370703', '寒亭区', '3', '370700');
INSERT INTO `oc_area` VALUES ('370704', '坊子区', '3', '370700');
INSERT INTO `oc_area` VALUES ('370705', '奎文区', '3', '370700');
INSERT INTO `oc_area` VALUES ('370724', '临朐县', '3', '370700');
INSERT INTO `oc_area` VALUES ('370725', '昌乐县', '3', '370700');
INSERT INTO `oc_area` VALUES ('370781', '青州市', '3', '370700');
INSERT INTO `oc_area` VALUES ('370782', '诸城市', '3', '370700');
INSERT INTO `oc_area` VALUES ('370783', '寿光市', '3', '370700');
INSERT INTO `oc_area` VALUES ('370784', '安丘市', '3', '370700');
INSERT INTO `oc_area` VALUES ('370785', '高密市', '3', '370700');
INSERT INTO `oc_area` VALUES ('370786', '昌邑市', '3', '370700');
INSERT INTO `oc_area` VALUES ('370801', '市辖区', '3', '370800');
INSERT INTO `oc_area` VALUES ('370802', '市中区', '3', '370800');
INSERT INTO `oc_area` VALUES ('370811', '任城区', '3', '370800');
INSERT INTO `oc_area` VALUES ('370826', '微山县', '3', '370800');
INSERT INTO `oc_area` VALUES ('370827', '鱼台县', '3', '370800');
INSERT INTO `oc_area` VALUES ('370828', '金乡县', '3', '370800');
INSERT INTO `oc_area` VALUES ('370829', '嘉祥县', '3', '370800');
INSERT INTO `oc_area` VALUES ('370830', '汶上县', '3', '370800');
INSERT INTO `oc_area` VALUES ('370831', '泗水县', '3', '370800');
INSERT INTO `oc_area` VALUES ('370832', '梁山县', '3', '370800');
INSERT INTO `oc_area` VALUES ('370881', '曲阜市', '3', '370800');
INSERT INTO `oc_area` VALUES ('370882', '兖州市', '3', '370800');
INSERT INTO `oc_area` VALUES ('370883', '邹城市', '3', '370800');
INSERT INTO `oc_area` VALUES ('370901', '市辖区', '3', '370900');
INSERT INTO `oc_area` VALUES ('370902', '泰山区', '3', '370900');
INSERT INTO `oc_area` VALUES ('370903', '岱岳区', '3', '370900');
INSERT INTO `oc_area` VALUES ('370921', '宁阳县', '3', '370900');
INSERT INTO `oc_area` VALUES ('370923', '东平县', '3', '370900');
INSERT INTO `oc_area` VALUES ('370982', '新泰市', '3', '370900');
INSERT INTO `oc_area` VALUES ('370983', '肥城市', '3', '370900');
INSERT INTO `oc_area` VALUES ('371001', '市辖区', '3', '371000');
INSERT INTO `oc_area` VALUES ('371002', '环翠区', '3', '371000');
INSERT INTO `oc_area` VALUES ('371081', '文登市', '3', '371000');
INSERT INTO `oc_area` VALUES ('371082', '荣成市', '3', '371000');
INSERT INTO `oc_area` VALUES ('371083', '乳山市', '3', '371000');
INSERT INTO `oc_area` VALUES ('371101', '市辖区', '3', '371100');
INSERT INTO `oc_area` VALUES ('371102', '东港区', '3', '371100');
INSERT INTO `oc_area` VALUES ('371103', '岚山区', '3', '371100');
INSERT INTO `oc_area` VALUES ('371121', '五莲县', '3', '371100');
INSERT INTO `oc_area` VALUES ('371122', '莒　县', '3', '371100');
INSERT INTO `oc_area` VALUES ('371201', '市辖区', '3', '371200');
INSERT INTO `oc_area` VALUES ('371202', '莱城区', '3', '371200');
INSERT INTO `oc_area` VALUES ('371203', '钢城区', '3', '371200');
INSERT INTO `oc_area` VALUES ('371301', '市辖区', '3', '371300');
INSERT INTO `oc_area` VALUES ('371302', '兰山区', '3', '371300');
INSERT INTO `oc_area` VALUES ('371311', '罗庄区', '3', '371300');
INSERT INTO `oc_area` VALUES ('371312', '河东区', '3', '371300');
INSERT INTO `oc_area` VALUES ('371321', '沂南县', '3', '371300');
INSERT INTO `oc_area` VALUES ('371322', '郯城县', '3', '371300');
INSERT INTO `oc_area` VALUES ('371323', '沂水县', '3', '371300');
INSERT INTO `oc_area` VALUES ('371324', '苍山县', '3', '371300');
INSERT INTO `oc_area` VALUES ('371325', '费　县', '3', '371300');
INSERT INTO `oc_area` VALUES ('371326', '平邑县', '3', '371300');
INSERT INTO `oc_area` VALUES ('371327', '莒南县', '3', '371300');
INSERT INTO `oc_area` VALUES ('371328', '蒙阴县', '3', '371300');
INSERT INTO `oc_area` VALUES ('371329', '临沭县', '3', '371300');
INSERT INTO `oc_area` VALUES ('371401', '市辖区', '3', '371400');
INSERT INTO `oc_area` VALUES ('371402', '德城区', '3', '371400');
INSERT INTO `oc_area` VALUES ('371421', '陵　县', '3', '371400');
INSERT INTO `oc_area` VALUES ('371422', '宁津县', '3', '371400');
INSERT INTO `oc_area` VALUES ('371423', '庆云县', '3', '371400');
INSERT INTO `oc_area` VALUES ('371424', '临邑县', '3', '371400');
INSERT INTO `oc_area` VALUES ('371425', '齐河县', '3', '371400');
INSERT INTO `oc_area` VALUES ('371426', '平原县', '3', '371400');
INSERT INTO `oc_area` VALUES ('371427', '夏津县', '3', '371400');
INSERT INTO `oc_area` VALUES ('371428', '武城县', '3', '371400');
INSERT INTO `oc_area` VALUES ('371481', '乐陵市', '3', '371400');
INSERT INTO `oc_area` VALUES ('371482', '禹城市', '3', '371400');
INSERT INTO `oc_area` VALUES ('371501', '市辖区', '3', '371500');
INSERT INTO `oc_area` VALUES ('371502', '东昌府区', '3', '371500');
INSERT INTO `oc_area` VALUES ('371521', '阳谷县', '3', '371500');
INSERT INTO `oc_area` VALUES ('371522', '莘　县', '3', '371500');
INSERT INTO `oc_area` VALUES ('371523', '茌平县', '3', '371500');
INSERT INTO `oc_area` VALUES ('371524', '东阿县', '3', '371500');
INSERT INTO `oc_area` VALUES ('371525', '冠　县', '3', '371500');
INSERT INTO `oc_area` VALUES ('371526', '高唐县', '3', '371500');
INSERT INTO `oc_area` VALUES ('371581', '临清市', '3', '371500');
INSERT INTO `oc_area` VALUES ('371601', '市辖区', '3', '371600');
INSERT INTO `oc_area` VALUES ('371602', '滨城区', '3', '371600');
INSERT INTO `oc_area` VALUES ('371621', '惠民县', '3', '371600');
INSERT INTO `oc_area` VALUES ('371622', '阳信县', '3', '371600');
INSERT INTO `oc_area` VALUES ('371623', '无棣县', '3', '371600');
INSERT INTO `oc_area` VALUES ('371624', '沾化县', '3', '371600');
INSERT INTO `oc_area` VALUES ('371625', '博兴县', '3', '371600');
INSERT INTO `oc_area` VALUES ('371626', '邹平县', '3', '371600');
INSERT INTO `oc_area` VALUES ('371701', '市辖区', '3', '371700');
INSERT INTO `oc_area` VALUES ('371702', '牡丹区', '3', '371700');
INSERT INTO `oc_area` VALUES ('371721', '曹　县', '3', '371700');
INSERT INTO `oc_area` VALUES ('371722', '单　县', '3', '371700');
INSERT INTO `oc_area` VALUES ('371723', '成武县', '3', '371700');
INSERT INTO `oc_area` VALUES ('371724', '巨野县', '3', '371700');
INSERT INTO `oc_area` VALUES ('371725', '郓城县', '3', '371700');
INSERT INTO `oc_area` VALUES ('371726', '鄄城县', '3', '371700');
INSERT INTO `oc_area` VALUES ('371727', '定陶县', '3', '371700');
INSERT INTO `oc_area` VALUES ('371728', '东明县', '3', '371700');
INSERT INTO `oc_area` VALUES ('410101', '市辖区', '3', '410100');
INSERT INTO `oc_area` VALUES ('410102', '中原区', '3', '410100');
INSERT INTO `oc_area` VALUES ('410103', '二七区', '3', '410100');
INSERT INTO `oc_area` VALUES ('410104', '管城回族区', '3', '410100');
INSERT INTO `oc_area` VALUES ('410105', '金水区', '3', '410100');
INSERT INTO `oc_area` VALUES ('410106', '上街区', '3', '410100');
INSERT INTO `oc_area` VALUES ('410108', '邙山区', '3', '410100');
INSERT INTO `oc_area` VALUES ('410122', '中牟县', '3', '410100');
INSERT INTO `oc_area` VALUES ('410181', '巩义市', '3', '410100');
INSERT INTO `oc_area` VALUES ('410182', '荥阳市', '3', '410100');
INSERT INTO `oc_area` VALUES ('410183', '新密市', '3', '410100');
INSERT INTO `oc_area` VALUES ('410184', '新郑市', '3', '410100');
INSERT INTO `oc_area` VALUES ('410185', '登封市', '3', '410100');
INSERT INTO `oc_area` VALUES ('410201', '市辖区', '3', '410200');
INSERT INTO `oc_area` VALUES ('410202', '龙亭区', '3', '410200');
INSERT INTO `oc_area` VALUES ('410203', '顺河回族区', '3', '410200');
INSERT INTO `oc_area` VALUES ('410204', '鼓楼区', '3', '410200');
INSERT INTO `oc_area` VALUES ('410205', '南关区', '3', '410200');
INSERT INTO `oc_area` VALUES ('410211', '郊　区', '3', '410200');
INSERT INTO `oc_area` VALUES ('410221', '杞　县', '3', '410200');
INSERT INTO `oc_area` VALUES ('410222', '通许县', '3', '410200');
INSERT INTO `oc_area` VALUES ('410223', '尉氏县', '3', '410200');
INSERT INTO `oc_area` VALUES ('410224', '开封县', '3', '410200');
INSERT INTO `oc_area` VALUES ('410225', '兰考县', '3', '410200');
INSERT INTO `oc_area` VALUES ('410301', '市辖区', '3', '410300');
INSERT INTO `oc_area` VALUES ('410302', '老城区', '3', '410300');
INSERT INTO `oc_area` VALUES ('410303', '西工区', '3', '410300');
INSERT INTO `oc_area` VALUES ('410304', '廛河回族区', '3', '410300');
INSERT INTO `oc_area` VALUES ('410305', '涧西区', '3', '410300');
INSERT INTO `oc_area` VALUES ('410306', '吉利区', '3', '410300');
INSERT INTO `oc_area` VALUES ('410307', '洛龙区', '3', '410300');
INSERT INTO `oc_area` VALUES ('410322', '孟津县', '3', '410300');
INSERT INTO `oc_area` VALUES ('410323', '新安县', '3', '410300');
INSERT INTO `oc_area` VALUES ('410324', '栾川县', '3', '410300');
INSERT INTO `oc_area` VALUES ('410325', '嵩　县', '3', '410300');
INSERT INTO `oc_area` VALUES ('410326', '汝阳县', '3', '410300');
INSERT INTO `oc_area` VALUES ('410327', '宜阳县', '3', '410300');
INSERT INTO `oc_area` VALUES ('410328', '洛宁县', '3', '410300');
INSERT INTO `oc_area` VALUES ('410329', '伊川县', '3', '410300');
INSERT INTO `oc_area` VALUES ('410381', '偃师市', '3', '410300');
INSERT INTO `oc_area` VALUES ('410401', '市辖区', '3', '410400');
INSERT INTO `oc_area` VALUES ('410402', '新华区', '3', '410400');
INSERT INTO `oc_area` VALUES ('410403', '卫东区', '3', '410400');
INSERT INTO `oc_area` VALUES ('410404', '石龙区', '3', '410400');
INSERT INTO `oc_area` VALUES ('410411', '湛河区', '3', '410400');
INSERT INTO `oc_area` VALUES ('410421', '宝丰县', '3', '410400');
INSERT INTO `oc_area` VALUES ('410422', '叶　县', '3', '410400');
INSERT INTO `oc_area` VALUES ('410423', '鲁山县', '3', '410400');
INSERT INTO `oc_area` VALUES ('410425', '郏　县', '3', '410400');
INSERT INTO `oc_area` VALUES ('410481', '舞钢市', '3', '410400');
INSERT INTO `oc_area` VALUES ('410482', '汝州市', '3', '410400');
INSERT INTO `oc_area` VALUES ('410501', '市辖区', '3', '410500');
INSERT INTO `oc_area` VALUES ('410502', '文峰区', '3', '410500');
INSERT INTO `oc_area` VALUES ('410503', '北关区', '3', '410500');
INSERT INTO `oc_area` VALUES ('410505', '殷都区', '3', '410500');
INSERT INTO `oc_area` VALUES ('410506', '龙安区', '3', '410500');
INSERT INTO `oc_area` VALUES ('410522', '安阳县', '3', '410500');
INSERT INTO `oc_area` VALUES ('410523', '汤阴县', '3', '410500');
INSERT INTO `oc_area` VALUES ('410526', '滑　县', '3', '410500');
INSERT INTO `oc_area` VALUES ('410527', '内黄县', '3', '410500');
INSERT INTO `oc_area` VALUES ('410581', '林州市', '3', '410500');
INSERT INTO `oc_area` VALUES ('410601', '市辖区', '3', '410600');
INSERT INTO `oc_area` VALUES ('410602', '鹤山区', '3', '410600');
INSERT INTO `oc_area` VALUES ('410603', '山城区', '3', '410600');
INSERT INTO `oc_area` VALUES ('410611', '淇滨区', '3', '410600');
INSERT INTO `oc_area` VALUES ('410621', '浚　县', '3', '410600');
INSERT INTO `oc_area` VALUES ('410622', '淇　县', '3', '410600');
INSERT INTO `oc_area` VALUES ('410701', '市辖区', '3', '410700');
INSERT INTO `oc_area` VALUES ('410702', '红旗区', '3', '410700');
INSERT INTO `oc_area` VALUES ('410703', '卫滨区', '3', '410700');
INSERT INTO `oc_area` VALUES ('410704', '凤泉区', '3', '410700');
INSERT INTO `oc_area` VALUES ('410711', '牧野区', '3', '410700');
INSERT INTO `oc_area` VALUES ('410721', '新乡县', '3', '410700');
INSERT INTO `oc_area` VALUES ('410724', '获嘉县', '3', '410700');
INSERT INTO `oc_area` VALUES ('410725', '原阳县', '3', '410700');
INSERT INTO `oc_area` VALUES ('410726', '延津县', '3', '410700');
INSERT INTO `oc_area` VALUES ('410727', '封丘县', '3', '410700');
INSERT INTO `oc_area` VALUES ('410728', '长垣县', '3', '410700');
INSERT INTO `oc_area` VALUES ('410781', '卫辉市', '3', '410700');
INSERT INTO `oc_area` VALUES ('410782', '辉县市', '3', '410700');
INSERT INTO `oc_area` VALUES ('410801', '市辖区', '3', '410800');
INSERT INTO `oc_area` VALUES ('410802', '解放区', '3', '410800');
INSERT INTO `oc_area` VALUES ('410803', '中站区', '3', '410800');
INSERT INTO `oc_area` VALUES ('410804', '马村区', '3', '410800');
INSERT INTO `oc_area` VALUES ('410811', '山阳区', '3', '410800');
INSERT INTO `oc_area` VALUES ('410821', '修武县', '3', '410800');
INSERT INTO `oc_area` VALUES ('410822', '博爱县', '3', '410800');
INSERT INTO `oc_area` VALUES ('410823', '武陟县', '3', '410800');
INSERT INTO `oc_area` VALUES ('410825', '温　县', '3', '410800');
INSERT INTO `oc_area` VALUES ('410881', '济源市', '3', '410800');
INSERT INTO `oc_area` VALUES ('410882', '沁阳市', '3', '410800');
INSERT INTO `oc_area` VALUES ('410883', '孟州市', '3', '410800');
INSERT INTO `oc_area` VALUES ('410901', '市辖区', '3', '410900');
INSERT INTO `oc_area` VALUES ('410902', '华龙区', '3', '410900');
INSERT INTO `oc_area` VALUES ('410922', '清丰县', '3', '410900');
INSERT INTO `oc_area` VALUES ('410923', '南乐县', '3', '410900');
INSERT INTO `oc_area` VALUES ('410926', '范　县', '3', '410900');
INSERT INTO `oc_area` VALUES ('410927', '台前县', '3', '410900');
INSERT INTO `oc_area` VALUES ('410928', '濮阳县', '3', '410900');
INSERT INTO `oc_area` VALUES ('411001', '市辖区', '3', '411000');
INSERT INTO `oc_area` VALUES ('411002', '魏都区', '3', '411000');
INSERT INTO `oc_area` VALUES ('411023', '许昌县', '3', '411000');
INSERT INTO `oc_area` VALUES ('411024', '鄢陵县', '3', '411000');
INSERT INTO `oc_area` VALUES ('411025', '襄城县', '3', '411000');
INSERT INTO `oc_area` VALUES ('411081', '禹州市', '3', '411000');
INSERT INTO `oc_area` VALUES ('411082', '长葛市', '3', '411000');
INSERT INTO `oc_area` VALUES ('411101', '市辖区', '3', '411100');
INSERT INTO `oc_area` VALUES ('411102', '源汇区', '3', '411100');
INSERT INTO `oc_area` VALUES ('411103', '郾城区', '3', '411100');
INSERT INTO `oc_area` VALUES ('411104', '召陵区', '3', '411100');
INSERT INTO `oc_area` VALUES ('411121', '舞阳县', '3', '411100');
INSERT INTO `oc_area` VALUES ('411122', '临颍县', '3', '411100');
INSERT INTO `oc_area` VALUES ('411201', '市辖区', '3', '411200');
INSERT INTO `oc_area` VALUES ('411202', '湖滨区', '3', '411200');
INSERT INTO `oc_area` VALUES ('411221', '渑池县', '3', '411200');
INSERT INTO `oc_area` VALUES ('411222', '陕　县', '3', '411200');
INSERT INTO `oc_area` VALUES ('411224', '卢氏县', '3', '411200');
INSERT INTO `oc_area` VALUES ('411281', '义马市', '3', '411200');
INSERT INTO `oc_area` VALUES ('411282', '灵宝市', '3', '411200');
INSERT INTO `oc_area` VALUES ('411301', '市辖区', '3', '411300');
INSERT INTO `oc_area` VALUES ('411302', '宛城区', '3', '411300');
INSERT INTO `oc_area` VALUES ('411303', '卧龙区', '3', '411300');
INSERT INTO `oc_area` VALUES ('411321', '南召县', '3', '411300');
INSERT INTO `oc_area` VALUES ('411322', '方城县', '3', '411300');
INSERT INTO `oc_area` VALUES ('411323', '西峡县', '3', '411300');
INSERT INTO `oc_area` VALUES ('411324', '镇平县', '3', '411300');
INSERT INTO `oc_area` VALUES ('411325', '内乡县', '3', '411300');
INSERT INTO `oc_area` VALUES ('411326', '淅川县', '3', '411300');
INSERT INTO `oc_area` VALUES ('411327', '社旗县', '3', '411300');
INSERT INTO `oc_area` VALUES ('411328', '唐河县', '3', '411300');
INSERT INTO `oc_area` VALUES ('411329', '新野县', '3', '411300');
INSERT INTO `oc_area` VALUES ('411330', '桐柏县', '3', '411300');
INSERT INTO `oc_area` VALUES ('411381', '邓州市', '3', '411300');
INSERT INTO `oc_area` VALUES ('411401', '市辖区', '3', '411400');
INSERT INTO `oc_area` VALUES ('411402', '梁园区', '3', '411400');
INSERT INTO `oc_area` VALUES ('411403', '睢阳区', '3', '411400');
INSERT INTO `oc_area` VALUES ('411421', '民权县', '3', '411400');
INSERT INTO `oc_area` VALUES ('411422', '睢　县', '3', '411400');
INSERT INTO `oc_area` VALUES ('411423', '宁陵县', '3', '411400');
INSERT INTO `oc_area` VALUES ('411424', '柘城县', '3', '411400');
INSERT INTO `oc_area` VALUES ('411425', '虞城县', '3', '411400');
INSERT INTO `oc_area` VALUES ('411426', '夏邑县', '3', '411400');
INSERT INTO `oc_area` VALUES ('411481', '永城市', '3', '411400');
INSERT INTO `oc_area` VALUES ('411501', '市辖区', '3', '411500');
INSERT INTO `oc_area` VALUES ('411502', '师河区', '3', '411500');
INSERT INTO `oc_area` VALUES ('411503', '平桥区', '3', '411500');
INSERT INTO `oc_area` VALUES ('411521', '罗山县', '3', '411500');
INSERT INTO `oc_area` VALUES ('411522', '光山县', '3', '411500');
INSERT INTO `oc_area` VALUES ('411523', '新　县', '3', '411500');
INSERT INTO `oc_area` VALUES ('411524', '商城县', '3', '411500');
INSERT INTO `oc_area` VALUES ('411525', '固始县', '3', '411500');
INSERT INTO `oc_area` VALUES ('411526', '潢川县', '3', '411500');
INSERT INTO `oc_area` VALUES ('411527', '淮滨县', '3', '411500');
INSERT INTO `oc_area` VALUES ('411528', '息　县', '3', '411500');
INSERT INTO `oc_area` VALUES ('411601', '市辖区', '3', '411600');
INSERT INTO `oc_area` VALUES ('411602', '川汇区', '3', '411600');
INSERT INTO `oc_area` VALUES ('411621', '扶沟县', '3', '411600');
INSERT INTO `oc_area` VALUES ('411622', '西华县', '3', '411600');
INSERT INTO `oc_area` VALUES ('411623', '商水县', '3', '411600');
INSERT INTO `oc_area` VALUES ('411624', '沈丘县', '3', '411600');
INSERT INTO `oc_area` VALUES ('411625', '郸城县', '3', '411600');
INSERT INTO `oc_area` VALUES ('411626', '淮阳县', '3', '411600');
INSERT INTO `oc_area` VALUES ('411627', '太康县', '3', '411600');
INSERT INTO `oc_area` VALUES ('411628', '鹿邑县', '3', '411600');
INSERT INTO `oc_area` VALUES ('411681', '项城市', '3', '411600');
INSERT INTO `oc_area` VALUES ('411701', '市辖区', '3', '411700');
INSERT INTO `oc_area` VALUES ('411702', '驿城区', '3', '411700');
INSERT INTO `oc_area` VALUES ('411721', '西平县', '3', '411700');
INSERT INTO `oc_area` VALUES ('411722', '上蔡县', '3', '411700');
INSERT INTO `oc_area` VALUES ('411723', '平舆县', '3', '411700');
INSERT INTO `oc_area` VALUES ('411724', '正阳县', '3', '411700');
INSERT INTO `oc_area` VALUES ('411725', '确山县', '3', '411700');
INSERT INTO `oc_area` VALUES ('411726', '泌阳县', '3', '411700');
INSERT INTO `oc_area` VALUES ('411727', '汝南县', '3', '411700');
INSERT INTO `oc_area` VALUES ('411728', '遂平县', '3', '411700');
INSERT INTO `oc_area` VALUES ('411729', '新蔡县', '3', '411700');
INSERT INTO `oc_area` VALUES ('420101', '市辖区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420102', '江岸区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420103', '江汉区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420104', '乔口区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420105', '汉阳区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420106', '武昌区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420107', '青山区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420111', '洪山区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420112', '东西湖区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420113', '汉南区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420114', '蔡甸区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420115', '江夏区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420116', '黄陂区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420117', '新洲区', '3', '420100');
INSERT INTO `oc_area` VALUES ('420201', '市辖区', '3', '420200');
INSERT INTO `oc_area` VALUES ('420202', '黄石港区', '3', '420200');
INSERT INTO `oc_area` VALUES ('420203', '西塞山区', '3', '420200');
INSERT INTO `oc_area` VALUES ('420204', '下陆区', '3', '420200');
INSERT INTO `oc_area` VALUES ('420205', '铁山区', '3', '420200');
INSERT INTO `oc_area` VALUES ('420222', '阳新县', '3', '420200');
INSERT INTO `oc_area` VALUES ('420281', '大冶市', '3', '420200');
INSERT INTO `oc_area` VALUES ('420301', '市辖区', '3', '420300');
INSERT INTO `oc_area` VALUES ('420302', '茅箭区', '3', '420300');
INSERT INTO `oc_area` VALUES ('420303', '张湾区', '3', '420300');
INSERT INTO `oc_area` VALUES ('420321', '郧　县', '3', '420300');
INSERT INTO `oc_area` VALUES ('420322', '郧西县', '3', '420300');
INSERT INTO `oc_area` VALUES ('420323', '竹山县', '3', '420300');
INSERT INTO `oc_area` VALUES ('420324', '竹溪县', '3', '420300');
INSERT INTO `oc_area` VALUES ('420325', '房　县', '3', '420300');
INSERT INTO `oc_area` VALUES ('420381', '丹江口市', '3', '420300');
INSERT INTO `oc_area` VALUES ('420501', '市辖区', '3', '420500');
INSERT INTO `oc_area` VALUES ('420502', '西陵区', '3', '420500');
INSERT INTO `oc_area` VALUES ('420503', '伍家岗区', '3', '420500');
INSERT INTO `oc_area` VALUES ('420504', '点军区', '3', '420500');
INSERT INTO `oc_area` VALUES ('420505', '猇亭区', '3', '420500');
INSERT INTO `oc_area` VALUES ('420506', '夷陵区', '3', '420500');
INSERT INTO `oc_area` VALUES ('420525', '远安县', '3', '420500');
INSERT INTO `oc_area` VALUES ('420526', '兴山县', '3', '420500');
INSERT INTO `oc_area` VALUES ('420527', '秭归县', '3', '420500');
INSERT INTO `oc_area` VALUES ('420528', '长阳土家族自治县', '3', '420500');
INSERT INTO `oc_area` VALUES ('420529', '五峰土家族自治县', '3', '420500');
INSERT INTO `oc_area` VALUES ('420581', '宜都市', '3', '420500');
INSERT INTO `oc_area` VALUES ('420582', '当阳市', '3', '420500');
INSERT INTO `oc_area` VALUES ('420583', '枝江市', '3', '420500');
INSERT INTO `oc_area` VALUES ('420601', '市辖区', '3', '420600');
INSERT INTO `oc_area` VALUES ('420602', '襄城区', '3', '420600');
INSERT INTO `oc_area` VALUES ('420606', '樊城区', '3', '420600');
INSERT INTO `oc_area` VALUES ('420607', '襄阳区', '3', '420600');
INSERT INTO `oc_area` VALUES ('420624', '南漳县', '3', '420600');
INSERT INTO `oc_area` VALUES ('420625', '谷城县', '3', '420600');
INSERT INTO `oc_area` VALUES ('420626', '保康县', '3', '420600');
INSERT INTO `oc_area` VALUES ('420682', '老河口市', '3', '420600');
INSERT INTO `oc_area` VALUES ('420683', '枣阳市', '3', '420600');
INSERT INTO `oc_area` VALUES ('420684', '宜城市', '3', '420600');
INSERT INTO `oc_area` VALUES ('420701', '市辖区', '3', '420700');
INSERT INTO `oc_area` VALUES ('420702', '梁子湖区', '3', '420700');
INSERT INTO `oc_area` VALUES ('420703', '华容区', '3', '420700');
INSERT INTO `oc_area` VALUES ('420704', '鄂城区', '3', '420700');
INSERT INTO `oc_area` VALUES ('420801', '市辖区', '3', '420800');
INSERT INTO `oc_area` VALUES ('420802', '东宝区', '3', '420800');
INSERT INTO `oc_area` VALUES ('420804', '掇刀区', '3', '420800');
INSERT INTO `oc_area` VALUES ('420821', '京山县', '3', '420800');
INSERT INTO `oc_area` VALUES ('420822', '沙洋县', '3', '420800');
INSERT INTO `oc_area` VALUES ('420881', '钟祥市', '3', '420800');
INSERT INTO `oc_area` VALUES ('420901', '市辖区', '3', '420900');
INSERT INTO `oc_area` VALUES ('420902', '孝南区', '3', '420900');
INSERT INTO `oc_area` VALUES ('420921', '孝昌县', '3', '420900');
INSERT INTO `oc_area` VALUES ('420922', '大悟县', '3', '420900');
INSERT INTO `oc_area` VALUES ('420923', '云梦县', '3', '420900');
INSERT INTO `oc_area` VALUES ('420981', '应城市', '3', '420900');
INSERT INTO `oc_area` VALUES ('420982', '安陆市', '3', '420900');
INSERT INTO `oc_area` VALUES ('420984', '汉川市', '3', '420900');
INSERT INTO `oc_area` VALUES ('421001', '市辖区', '3', '421000');
INSERT INTO `oc_area` VALUES ('421002', '沙市区', '3', '421000');
INSERT INTO `oc_area` VALUES ('421003', '荆州区', '3', '421000');
INSERT INTO `oc_area` VALUES ('421022', '公安县', '3', '421000');
INSERT INTO `oc_area` VALUES ('421023', '监利县', '3', '421000');
INSERT INTO `oc_area` VALUES ('421024', '江陵县', '3', '421000');
INSERT INTO `oc_area` VALUES ('421081', '石首市', '3', '421000');
INSERT INTO `oc_area` VALUES ('421083', '洪湖市', '3', '421000');
INSERT INTO `oc_area` VALUES ('421087', '松滋市', '3', '421000');
INSERT INTO `oc_area` VALUES ('421101', '市辖区', '3', '421100');
INSERT INTO `oc_area` VALUES ('421102', '黄州区', '3', '421100');
INSERT INTO `oc_area` VALUES ('421121', '团风县', '3', '421100');
INSERT INTO `oc_area` VALUES ('421122', '红安县', '3', '421100');
INSERT INTO `oc_area` VALUES ('421123', '罗田县', '3', '421100');
INSERT INTO `oc_area` VALUES ('421124', '英山县', '3', '421100');
INSERT INTO `oc_area` VALUES ('421125', '浠水县', '3', '421100');
INSERT INTO `oc_area` VALUES ('421126', '蕲春县', '3', '421100');
INSERT INTO `oc_area` VALUES ('421127', '黄梅县', '3', '421100');
INSERT INTO `oc_area` VALUES ('421181', '麻城市', '3', '421100');
INSERT INTO `oc_area` VALUES ('421182', '武穴市', '3', '421100');
INSERT INTO `oc_area` VALUES ('421201', '市辖区', '3', '421200');
INSERT INTO `oc_area` VALUES ('421202', '咸安区', '3', '421200');
INSERT INTO `oc_area` VALUES ('421221', '嘉鱼县', '3', '421200');
INSERT INTO `oc_area` VALUES ('421222', '通城县', '3', '421200');
INSERT INTO `oc_area` VALUES ('421223', '崇阳县', '3', '421200');
INSERT INTO `oc_area` VALUES ('421224', '通山县', '3', '421200');
INSERT INTO `oc_area` VALUES ('421281', '赤壁市', '3', '421200');
INSERT INTO `oc_area` VALUES ('421301', '市辖区', '3', '421300');
INSERT INTO `oc_area` VALUES ('421302', '曾都区', '3', '421300');
INSERT INTO `oc_area` VALUES ('421381', '广水市', '3', '421300');
INSERT INTO `oc_area` VALUES ('422801', '恩施市', '3', '422800');
INSERT INTO `oc_area` VALUES ('422802', '利川市', '3', '422800');
INSERT INTO `oc_area` VALUES ('422822', '建始县', '3', '422800');
INSERT INTO `oc_area` VALUES ('422823', '巴东县', '3', '422800');
INSERT INTO `oc_area` VALUES ('422825', '宣恩县', '3', '422800');
INSERT INTO `oc_area` VALUES ('422826', '咸丰县', '3', '422800');
INSERT INTO `oc_area` VALUES ('422827', '来凤县', '3', '422800');
INSERT INTO `oc_area` VALUES ('422828', '鹤峰县', '3', '422800');
INSERT INTO `oc_area` VALUES ('429004', '仙桃市', '3', '429000');
INSERT INTO `oc_area` VALUES ('429005', '潜江市', '3', '429000');
INSERT INTO `oc_area` VALUES ('429006', '天门市', '3', '429000');
INSERT INTO `oc_area` VALUES ('429021', '神农架林区', '3', '429000');
INSERT INTO `oc_area` VALUES ('430101', '市辖区', '3', '430100');
INSERT INTO `oc_area` VALUES ('430102', '芙蓉区', '3', '430100');
INSERT INTO `oc_area` VALUES ('430103', '天心区', '3', '430100');
INSERT INTO `oc_area` VALUES ('430104', '岳麓区', '3', '430100');
INSERT INTO `oc_area` VALUES ('430105', '开福区', '3', '430100');
INSERT INTO `oc_area` VALUES ('430111', '雨花区', '3', '430100');
INSERT INTO `oc_area` VALUES ('430121', '长沙县', '3', '430100');
INSERT INTO `oc_area` VALUES ('430122', '望城县', '3', '430100');
INSERT INTO `oc_area` VALUES ('430124', '宁乡县', '3', '430100');
INSERT INTO `oc_area` VALUES ('430181', '浏阳市', '3', '430100');
INSERT INTO `oc_area` VALUES ('430201', '市辖区', '3', '430200');
INSERT INTO `oc_area` VALUES ('430202', '荷塘区', '3', '430200');
INSERT INTO `oc_area` VALUES ('430203', '芦淞区', '3', '430200');
INSERT INTO `oc_area` VALUES ('430204', '石峰区', '3', '430200');
INSERT INTO `oc_area` VALUES ('430211', '天元区', '3', '430200');
INSERT INTO `oc_area` VALUES ('430221', '株洲县', '3', '430200');
INSERT INTO `oc_area` VALUES ('430223', '攸　县', '3', '430200');
INSERT INTO `oc_area` VALUES ('430224', '茶陵县', '3', '430200');
INSERT INTO `oc_area` VALUES ('430225', '炎陵县', '3', '430200');
INSERT INTO `oc_area` VALUES ('430281', '醴陵市', '3', '430200');
INSERT INTO `oc_area` VALUES ('430301', '市辖区', '3', '430300');
INSERT INTO `oc_area` VALUES ('430302', '雨湖区', '3', '430300');
INSERT INTO `oc_area` VALUES ('430304', '岳塘区', '3', '430300');
INSERT INTO `oc_area` VALUES ('430321', '湘潭县', '3', '430300');
INSERT INTO `oc_area` VALUES ('430381', '湘乡市', '3', '430300');
INSERT INTO `oc_area` VALUES ('430382', '韶山市', '3', '430300');
INSERT INTO `oc_area` VALUES ('430401', '市辖区', '3', '430400');
INSERT INTO `oc_area` VALUES ('430405', '珠晖区', '3', '430400');
INSERT INTO `oc_area` VALUES ('430406', '雁峰区', '3', '430400');
INSERT INTO `oc_area` VALUES ('430407', '石鼓区', '3', '430400');
INSERT INTO `oc_area` VALUES ('430408', '蒸湘区', '3', '430400');
INSERT INTO `oc_area` VALUES ('430412', '南岳区', '3', '430400');
INSERT INTO `oc_area` VALUES ('430421', '衡阳县', '3', '430400');
INSERT INTO `oc_area` VALUES ('430422', '衡南县', '3', '430400');
INSERT INTO `oc_area` VALUES ('430423', '衡山县', '3', '430400');
INSERT INTO `oc_area` VALUES ('430424', '衡东县', '3', '430400');
INSERT INTO `oc_area` VALUES ('430426', '祁东县', '3', '430400');
INSERT INTO `oc_area` VALUES ('430481', '耒阳市', '3', '430400');
INSERT INTO `oc_area` VALUES ('430482', '常宁市', '3', '430400');
INSERT INTO `oc_area` VALUES ('430501', '市辖区', '3', '430500');
INSERT INTO `oc_area` VALUES ('430502', '双清区', '3', '430500');
INSERT INTO `oc_area` VALUES ('430503', '大祥区', '3', '430500');
INSERT INTO `oc_area` VALUES ('430511', '北塔区', '3', '430500');
INSERT INTO `oc_area` VALUES ('430521', '邵东县', '3', '430500');
INSERT INTO `oc_area` VALUES ('430522', '新邵县', '3', '430500');
INSERT INTO `oc_area` VALUES ('430523', '邵阳县', '3', '430500');
INSERT INTO `oc_area` VALUES ('430524', '隆回县', '3', '430500');
INSERT INTO `oc_area` VALUES ('430525', '洞口县', '3', '430500');
INSERT INTO `oc_area` VALUES ('430527', '绥宁县', '3', '430500');
INSERT INTO `oc_area` VALUES ('430528', '新宁县', '3', '430500');
INSERT INTO `oc_area` VALUES ('430529', '城步苗族自治县', '3', '430500');
INSERT INTO `oc_area` VALUES ('430581', '武冈市', '3', '430500');
INSERT INTO `oc_area` VALUES ('430601', '市辖区', '3', '430600');
INSERT INTO `oc_area` VALUES ('430602', '岳阳楼区', '3', '430600');
INSERT INTO `oc_area` VALUES ('430603', '云溪区', '3', '430600');
INSERT INTO `oc_area` VALUES ('430611', '君山区', '3', '430600');
INSERT INTO `oc_area` VALUES ('430621', '岳阳县', '3', '430600');
INSERT INTO `oc_area` VALUES ('430623', '华容县', '3', '430600');
INSERT INTO `oc_area` VALUES ('430624', '湘阴县', '3', '430600');
INSERT INTO `oc_area` VALUES ('430626', '平江县', '3', '430600');
INSERT INTO `oc_area` VALUES ('430681', '汨罗市', '3', '430600');
INSERT INTO `oc_area` VALUES ('430682', '临湘市', '3', '430600');
INSERT INTO `oc_area` VALUES ('430701', '市辖区', '3', '430700');
INSERT INTO `oc_area` VALUES ('430702', '武陵区', '3', '430700');
INSERT INTO `oc_area` VALUES ('430703', '鼎城区', '3', '430700');
INSERT INTO `oc_area` VALUES ('430721', '安乡县', '3', '430700');
INSERT INTO `oc_area` VALUES ('430722', '汉寿县', '3', '430700');
INSERT INTO `oc_area` VALUES ('430723', '澧　县', '3', '430700');
INSERT INTO `oc_area` VALUES ('430724', '临澧县', '3', '430700');
INSERT INTO `oc_area` VALUES ('430725', '桃源县', '3', '430700');
INSERT INTO `oc_area` VALUES ('430726', '石门县', '3', '430700');
INSERT INTO `oc_area` VALUES ('430781', '津市市', '3', '430700');
INSERT INTO `oc_area` VALUES ('430801', '市辖区', '3', '430800');
INSERT INTO `oc_area` VALUES ('430802', '永定区', '3', '430800');
INSERT INTO `oc_area` VALUES ('430811', '武陵源区', '3', '430800');
INSERT INTO `oc_area` VALUES ('430821', '慈利县', '3', '430800');
INSERT INTO `oc_area` VALUES ('430822', '桑植县', '3', '430800');
INSERT INTO `oc_area` VALUES ('430901', '市辖区', '3', '430900');
INSERT INTO `oc_area` VALUES ('430902', '资阳区', '3', '430900');
INSERT INTO `oc_area` VALUES ('430903', '赫山区', '3', '430900');
INSERT INTO `oc_area` VALUES ('430921', '南　县', '3', '430900');
INSERT INTO `oc_area` VALUES ('430922', '桃江县', '3', '430900');
INSERT INTO `oc_area` VALUES ('430923', '安化县', '3', '430900');
INSERT INTO `oc_area` VALUES ('430981', '沅江市', '3', '430900');
INSERT INTO `oc_area` VALUES ('431001', '市辖区', '3', '431000');
INSERT INTO `oc_area` VALUES ('431002', '北湖区', '3', '431000');
INSERT INTO `oc_area` VALUES ('431003', '苏仙区', '3', '431000');
INSERT INTO `oc_area` VALUES ('431021', '桂阳县', '3', '431000');
INSERT INTO `oc_area` VALUES ('431022', '宜章县', '3', '431000');
INSERT INTO `oc_area` VALUES ('431023', '永兴县', '3', '431000');
INSERT INTO `oc_area` VALUES ('431024', '嘉禾县', '3', '431000');
INSERT INTO `oc_area` VALUES ('431025', '临武县', '3', '431000');
INSERT INTO `oc_area` VALUES ('431026', '汝城县', '3', '431000');
INSERT INTO `oc_area` VALUES ('431027', '桂东县', '3', '431000');
INSERT INTO `oc_area` VALUES ('431028', '安仁县', '3', '431000');
INSERT INTO `oc_area` VALUES ('431081', '资兴市', '3', '431000');
INSERT INTO `oc_area` VALUES ('431101', '市辖区', '3', '431100');
INSERT INTO `oc_area` VALUES ('431102', '芝山区', '3', '431100');
INSERT INTO `oc_area` VALUES ('431103', '冷水滩区', '3', '431100');
INSERT INTO `oc_area` VALUES ('431121', '祁阳县', '3', '431100');
INSERT INTO `oc_area` VALUES ('431122', '东安县', '3', '431100');
INSERT INTO `oc_area` VALUES ('431123', '双牌县', '3', '431100');
INSERT INTO `oc_area` VALUES ('431124', '道　县', '3', '431100');
INSERT INTO `oc_area` VALUES ('431125', '江永县', '3', '431100');
INSERT INTO `oc_area` VALUES ('431126', '宁远县', '3', '431100');
INSERT INTO `oc_area` VALUES ('431127', '蓝山县', '3', '431100');
INSERT INTO `oc_area` VALUES ('431128', '新田县', '3', '431100');
INSERT INTO `oc_area` VALUES ('431129', '江华瑶族自治县', '3', '431100');
INSERT INTO `oc_area` VALUES ('431201', '市辖区', '3', '431200');
INSERT INTO `oc_area` VALUES ('431202', '鹤城区', '3', '431200');
INSERT INTO `oc_area` VALUES ('431221', '中方县', '3', '431200');
INSERT INTO `oc_area` VALUES ('431222', '沅陵县', '3', '431200');
INSERT INTO `oc_area` VALUES ('431223', '辰溪县', '3', '431200');
INSERT INTO `oc_area` VALUES ('431224', '溆浦县', '3', '431200');
INSERT INTO `oc_area` VALUES ('431225', '会同县', '3', '431200');
INSERT INTO `oc_area` VALUES ('431226', '麻阳苗族自治县', '3', '431200');
INSERT INTO `oc_area` VALUES ('431227', '新晃侗族自治县', '3', '431200');
INSERT INTO `oc_area` VALUES ('431228', '芷江侗族自治县', '3', '431200');
INSERT INTO `oc_area` VALUES ('431229', '靖州苗族侗族自治县', '3', '431200');
INSERT INTO `oc_area` VALUES ('431230', '通道侗族自治县', '3', '431200');
INSERT INTO `oc_area` VALUES ('431281', '洪江市', '3', '431200');
INSERT INTO `oc_area` VALUES ('431301', '市辖区', '3', '431300');
INSERT INTO `oc_area` VALUES ('431302', '娄星区', '3', '431300');
INSERT INTO `oc_area` VALUES ('431321', '双峰县', '3', '431300');
INSERT INTO `oc_area` VALUES ('431322', '新化县', '3', '431300');
INSERT INTO `oc_area` VALUES ('431381', '冷水江市', '3', '431300');
INSERT INTO `oc_area` VALUES ('431382', '涟源市', '3', '431300');
INSERT INTO `oc_area` VALUES ('433101', '吉首市', '3', '433100');
INSERT INTO `oc_area` VALUES ('433122', '泸溪县', '3', '433100');
INSERT INTO `oc_area` VALUES ('433123', '凤凰县', '3', '433100');
INSERT INTO `oc_area` VALUES ('433124', '花垣县', '3', '433100');
INSERT INTO `oc_area` VALUES ('433125', '保靖县', '3', '433100');
INSERT INTO `oc_area` VALUES ('433126', '古丈县', '3', '433100');
INSERT INTO `oc_area` VALUES ('433127', '永顺县', '3', '433100');
INSERT INTO `oc_area` VALUES ('433130', '龙山县', '3', '433100');
INSERT INTO `oc_area` VALUES ('440101', '市辖区', '3', '440100');
INSERT INTO `oc_area` VALUES ('440102', '东山区', '3', '440100');
INSERT INTO `oc_area` VALUES ('440103', '荔湾区', '3', '440100');
INSERT INTO `oc_area` VALUES ('440104', '越秀区', '3', '440100');
INSERT INTO `oc_area` VALUES ('440105', '海珠区', '3', '440100');
INSERT INTO `oc_area` VALUES ('440106', '天河区', '3', '440100');
INSERT INTO `oc_area` VALUES ('440107', '芳村区', '3', '440100');
INSERT INTO `oc_area` VALUES ('440111', '白云区', '3', '440100');
INSERT INTO `oc_area` VALUES ('440112', '黄埔区', '3', '440100');
INSERT INTO `oc_area` VALUES ('440113', '番禺区', '3', '440100');
INSERT INTO `oc_area` VALUES ('440114', '花都区', '3', '440100');
INSERT INTO `oc_area` VALUES ('440183', '增城市', '3', '440100');
INSERT INTO `oc_area` VALUES ('440184', '从化市', '3', '440100');
INSERT INTO `oc_area` VALUES ('440201', '市辖区', '3', '440200');
INSERT INTO `oc_area` VALUES ('440203', '武江区', '3', '440200');
INSERT INTO `oc_area` VALUES ('440204', '浈江区', '3', '440200');
INSERT INTO `oc_area` VALUES ('440205', '曲江区', '3', '440200');
INSERT INTO `oc_area` VALUES ('440222', '始兴县', '3', '440200');
INSERT INTO `oc_area` VALUES ('440224', '仁化县', '3', '440200');
INSERT INTO `oc_area` VALUES ('440229', '翁源县', '3', '440200');
INSERT INTO `oc_area` VALUES ('440232', '乳源瑶族自治县', '3', '440200');
INSERT INTO `oc_area` VALUES ('440233', '新丰县', '3', '440200');
INSERT INTO `oc_area` VALUES ('440281', '乐昌市', '3', '440200');
INSERT INTO `oc_area` VALUES ('440282', '南雄市', '3', '440200');
INSERT INTO `oc_area` VALUES ('440301', '市辖区', '3', '440300');
INSERT INTO `oc_area` VALUES ('440303', '罗湖区', '3', '440300');
INSERT INTO `oc_area` VALUES ('440304', '福田区', '3', '440300');
INSERT INTO `oc_area` VALUES ('440305', '南山区', '3', '440300');
INSERT INTO `oc_area` VALUES ('440306', '宝安区', '3', '440300');
INSERT INTO `oc_area` VALUES ('440307', '龙岗区', '3', '440300');
INSERT INTO `oc_area` VALUES ('440308', '盐田区', '3', '440300');
INSERT INTO `oc_area` VALUES ('440401', '市辖区', '3', '440400');
INSERT INTO `oc_area` VALUES ('440402', '香洲区', '3', '440400');
INSERT INTO `oc_area` VALUES ('440403', '斗门区', '3', '440400');
INSERT INTO `oc_area` VALUES ('440404', '金湾区', '3', '440400');
INSERT INTO `oc_area` VALUES ('440501', '市辖区', '3', '440500');
INSERT INTO `oc_area` VALUES ('440507', '龙湖区', '3', '440500');
INSERT INTO `oc_area` VALUES ('440511', '金平区', '3', '440500');
INSERT INTO `oc_area` VALUES ('440512', '濠江区', '3', '440500');
INSERT INTO `oc_area` VALUES ('440513', '潮阳区', '3', '440500');
INSERT INTO `oc_area` VALUES ('440514', '潮南区', '3', '440500');
INSERT INTO `oc_area` VALUES ('440515', '澄海区', '3', '440500');
INSERT INTO `oc_area` VALUES ('440523', '南澳县', '3', '440500');
INSERT INTO `oc_area` VALUES ('440601', '市辖区', '3', '440600');
INSERT INTO `oc_area` VALUES ('440604', '禅城区', '3', '440600');
INSERT INTO `oc_area` VALUES ('440605', '南海区', '3', '440600');
INSERT INTO `oc_area` VALUES ('440606', '顺德区', '3', '440600');
INSERT INTO `oc_area` VALUES ('440607', '三水区', '3', '440600');
INSERT INTO `oc_area` VALUES ('440608', '高明区', '3', '440600');
INSERT INTO `oc_area` VALUES ('440701', '市辖区', '3', '440700');
INSERT INTO `oc_area` VALUES ('440703', '蓬江区', '3', '440700');
INSERT INTO `oc_area` VALUES ('440704', '江海区', '3', '440700');
INSERT INTO `oc_area` VALUES ('440705', '新会区', '3', '440700');
INSERT INTO `oc_area` VALUES ('440781', '台山市', '3', '440700');
INSERT INTO `oc_area` VALUES ('440783', '开平市', '3', '440700');
INSERT INTO `oc_area` VALUES ('440784', '鹤山市', '3', '440700');
INSERT INTO `oc_area` VALUES ('440785', '恩平市', '3', '440700');
INSERT INTO `oc_area` VALUES ('440801', '市辖区', '3', '440800');
INSERT INTO `oc_area` VALUES ('440802', '赤坎区', '3', '440800');
INSERT INTO `oc_area` VALUES ('440803', '霞山区', '3', '440800');
INSERT INTO `oc_area` VALUES ('440804', '坡头区', '3', '440800');
INSERT INTO `oc_area` VALUES ('440811', '麻章区', '3', '440800');
INSERT INTO `oc_area` VALUES ('440823', '遂溪县', '3', '440800');
INSERT INTO `oc_area` VALUES ('440825', '徐闻县', '3', '440800');
INSERT INTO `oc_area` VALUES ('440881', '廉江市', '3', '440800');
INSERT INTO `oc_area` VALUES ('440882', '雷州市', '3', '440800');
INSERT INTO `oc_area` VALUES ('440883', '吴川市', '3', '440800');
INSERT INTO `oc_area` VALUES ('440901', '市辖区', '3', '440900');
INSERT INTO `oc_area` VALUES ('440902', '茂南区', '3', '440900');
INSERT INTO `oc_area` VALUES ('440903', '茂港区', '3', '440900');
INSERT INTO `oc_area` VALUES ('440923', '电白县', '3', '440900');
INSERT INTO `oc_area` VALUES ('440981', '高州市', '3', '440900');
INSERT INTO `oc_area` VALUES ('440982', '化州市', '3', '440900');
INSERT INTO `oc_area` VALUES ('440983', '信宜市', '3', '440900');
INSERT INTO `oc_area` VALUES ('441201', '市辖区', '3', '441200');
INSERT INTO `oc_area` VALUES ('441202', '端州区', '3', '441200');
INSERT INTO `oc_area` VALUES ('441203', '鼎湖区', '3', '441200');
INSERT INTO `oc_area` VALUES ('441223', '广宁县', '3', '441200');
INSERT INTO `oc_area` VALUES ('441224', '怀集县', '3', '441200');
INSERT INTO `oc_area` VALUES ('441225', '封开县', '3', '441200');
INSERT INTO `oc_area` VALUES ('441226', '德庆县', '3', '441200');
INSERT INTO `oc_area` VALUES ('441283', '高要市', '3', '441200');
INSERT INTO `oc_area` VALUES ('441284', '四会市', '3', '441200');
INSERT INTO `oc_area` VALUES ('441301', '市辖区', '3', '441300');
INSERT INTO `oc_area` VALUES ('441302', '惠城区', '3', '441300');
INSERT INTO `oc_area` VALUES ('441303', '惠阳区', '3', '441300');
INSERT INTO `oc_area` VALUES ('441322', '博罗县', '3', '441300');
INSERT INTO `oc_area` VALUES ('441323', '惠东县', '3', '441300');
INSERT INTO `oc_area` VALUES ('441324', '龙门县', '3', '441300');
INSERT INTO `oc_area` VALUES ('441401', '市辖区', '3', '441400');
INSERT INTO `oc_area` VALUES ('441402', '梅江区', '3', '441400');
INSERT INTO `oc_area` VALUES ('441421', '梅　县', '3', '441400');
INSERT INTO `oc_area` VALUES ('441422', '大埔县', '3', '441400');
INSERT INTO `oc_area` VALUES ('441423', '丰顺县', '3', '441400');
INSERT INTO `oc_area` VALUES ('441424', '五华县', '3', '441400');
INSERT INTO `oc_area` VALUES ('441426', '平远县', '3', '441400');
INSERT INTO `oc_area` VALUES ('441427', '蕉岭县', '3', '441400');
INSERT INTO `oc_area` VALUES ('441481', '兴宁市', '3', '441400');
INSERT INTO `oc_area` VALUES ('441501', '市辖区', '3', '441500');
INSERT INTO `oc_area` VALUES ('441502', '城　区', '3', '441500');
INSERT INTO `oc_area` VALUES ('441521', '海丰县', '3', '441500');
INSERT INTO `oc_area` VALUES ('441523', '陆河县', '3', '441500');
INSERT INTO `oc_area` VALUES ('441581', '陆丰市', '3', '441500');
INSERT INTO `oc_area` VALUES ('441601', '市辖区', '3', '441600');
INSERT INTO `oc_area` VALUES ('441602', '源城区', '3', '441600');
INSERT INTO `oc_area` VALUES ('441621', '紫金县', '3', '441600');
INSERT INTO `oc_area` VALUES ('441622', '龙川县', '3', '441600');
INSERT INTO `oc_area` VALUES ('441623', '连平县', '3', '441600');
INSERT INTO `oc_area` VALUES ('441624', '和平县', '3', '441600');
INSERT INTO `oc_area` VALUES ('441625', '东源县', '3', '441600');
INSERT INTO `oc_area` VALUES ('441701', '市辖区', '3', '441700');
INSERT INTO `oc_area` VALUES ('441702', '江城区', '3', '441700');
INSERT INTO `oc_area` VALUES ('441721', '阳西县', '3', '441700');
INSERT INTO `oc_area` VALUES ('441723', '阳东县', '3', '441700');
INSERT INTO `oc_area` VALUES ('441781', '阳春市', '3', '441700');
INSERT INTO `oc_area` VALUES ('441801', '市辖区', '3', '441800');
INSERT INTO `oc_area` VALUES ('441802', '清城区', '3', '441800');
INSERT INTO `oc_area` VALUES ('441821', '佛冈县', '3', '441800');
INSERT INTO `oc_area` VALUES ('441823', '阳山县', '3', '441800');
INSERT INTO `oc_area` VALUES ('441825', '连山壮族瑶族自治县', '3', '441800');
INSERT INTO `oc_area` VALUES ('441826', '连南瑶族自治县', '3', '441800');
INSERT INTO `oc_area` VALUES ('441827', '清新县', '3', '441800');
INSERT INTO `oc_area` VALUES ('441881', '英德市', '3', '441800');
INSERT INTO `oc_area` VALUES ('441882', '连州市', '3', '441800');
INSERT INTO `oc_area` VALUES ('445101', '市辖区', '3', '445100');
INSERT INTO `oc_area` VALUES ('445102', '湘桥区', '3', '445100');
INSERT INTO `oc_area` VALUES ('445121', '潮安县', '3', '445100');
INSERT INTO `oc_area` VALUES ('445122', '饶平县', '3', '445100');
INSERT INTO `oc_area` VALUES ('445201', '市辖区', '3', '445200');
INSERT INTO `oc_area` VALUES ('445202', '榕城区', '3', '445200');
INSERT INTO `oc_area` VALUES ('445221', '揭东县', '3', '445200');
INSERT INTO `oc_area` VALUES ('445222', '揭西县', '3', '445200');
INSERT INTO `oc_area` VALUES ('445224', '惠来县', '3', '445200');
INSERT INTO `oc_area` VALUES ('445281', '普宁市', '3', '445200');
INSERT INTO `oc_area` VALUES ('445301', '市辖区', '3', '445300');
INSERT INTO `oc_area` VALUES ('445302', '云城区', '3', '445300');
INSERT INTO `oc_area` VALUES ('445321', '新兴县', '3', '445300');
INSERT INTO `oc_area` VALUES ('445322', '郁南县', '3', '445300');
INSERT INTO `oc_area` VALUES ('445323', '云安县', '3', '445300');
INSERT INTO `oc_area` VALUES ('445381', '罗定市', '3', '445300');
INSERT INTO `oc_area` VALUES ('450101', '市辖区', '3', '450100');
INSERT INTO `oc_area` VALUES ('450102', '兴宁区', '3', '450100');
INSERT INTO `oc_area` VALUES ('450103', '青秀区', '3', '450100');
INSERT INTO `oc_area` VALUES ('450105', '江南区', '3', '450100');
INSERT INTO `oc_area` VALUES ('450107', '西乡塘区', '3', '450100');
INSERT INTO `oc_area` VALUES ('450108', '良庆区', '3', '450100');
INSERT INTO `oc_area` VALUES ('450109', '邕宁区', '3', '450100');
INSERT INTO `oc_area` VALUES ('450122', '武鸣县', '3', '450100');
INSERT INTO `oc_area` VALUES ('450123', '隆安县', '3', '450100');
INSERT INTO `oc_area` VALUES ('450124', '马山县', '3', '450100');
INSERT INTO `oc_area` VALUES ('450125', '上林县', '3', '450100');
INSERT INTO `oc_area` VALUES ('450126', '宾阳县', '3', '450100');
INSERT INTO `oc_area` VALUES ('450127', '横　县', '3', '450100');
INSERT INTO `oc_area` VALUES ('450201', '市辖区', '3', '450200');
INSERT INTO `oc_area` VALUES ('450202', '城中区', '3', '450200');
INSERT INTO `oc_area` VALUES ('450203', '鱼峰区', '3', '450200');
INSERT INTO `oc_area` VALUES ('450204', '柳南区', '3', '450200');
INSERT INTO `oc_area` VALUES ('450205', '柳北区', '3', '450200');
INSERT INTO `oc_area` VALUES ('450221', '柳江县', '3', '450200');
INSERT INTO `oc_area` VALUES ('450222', '柳城县', '3', '450200');
INSERT INTO `oc_area` VALUES ('450223', '鹿寨县', '3', '450200');
INSERT INTO `oc_area` VALUES ('450224', '融安县', '3', '450200');
INSERT INTO `oc_area` VALUES ('450225', '融水苗族自治县', '3', '450200');
INSERT INTO `oc_area` VALUES ('450226', '三江侗族自治县', '3', '450200');
INSERT INTO `oc_area` VALUES ('450301', '市辖区', '3', '450300');
INSERT INTO `oc_area` VALUES ('450302', '秀峰区', '3', '450300');
INSERT INTO `oc_area` VALUES ('450303', '叠彩区', '3', '450300');
INSERT INTO `oc_area` VALUES ('450304', '象山区', '3', '450300');
INSERT INTO `oc_area` VALUES ('450305', '七星区', '3', '450300');
INSERT INTO `oc_area` VALUES ('450311', '雁山区', '3', '450300');
INSERT INTO `oc_area` VALUES ('450321', '阳朔县', '3', '450300');
INSERT INTO `oc_area` VALUES ('450322', '临桂县', '3', '450300');
INSERT INTO `oc_area` VALUES ('450323', '灵川县', '3', '450300');
INSERT INTO `oc_area` VALUES ('450324', '全州县', '3', '450300');
INSERT INTO `oc_area` VALUES ('450325', '兴安县', '3', '450300');
INSERT INTO `oc_area` VALUES ('450326', '永福县', '3', '450300');
INSERT INTO `oc_area` VALUES ('450327', '灌阳县', '3', '450300');
INSERT INTO `oc_area` VALUES ('450328', '龙胜各族自治县', '3', '450300');
INSERT INTO `oc_area` VALUES ('450329', '资源县', '3', '450300');
INSERT INTO `oc_area` VALUES ('450330', '平乐县', '3', '450300');
INSERT INTO `oc_area` VALUES ('450331', '荔蒲县', '3', '450300');
INSERT INTO `oc_area` VALUES ('450332', '恭城瑶族自治县', '3', '450300');
INSERT INTO `oc_area` VALUES ('450401', '市辖区', '3', '450400');
INSERT INTO `oc_area` VALUES ('450403', '万秀区', '3', '450400');
INSERT INTO `oc_area` VALUES ('450404', '蝶山区', '3', '450400');
INSERT INTO `oc_area` VALUES ('450405', '长洲区', '3', '450400');
INSERT INTO `oc_area` VALUES ('450421', '苍梧县', '3', '450400');
INSERT INTO `oc_area` VALUES ('450422', '藤　县', '3', '450400');
INSERT INTO `oc_area` VALUES ('450423', '蒙山县', '3', '450400');
INSERT INTO `oc_area` VALUES ('450481', '岑溪市', '3', '450400');
INSERT INTO `oc_area` VALUES ('450501', '市辖区', '3', '450500');
INSERT INTO `oc_area` VALUES ('450502', '海城区', '3', '450500');
INSERT INTO `oc_area` VALUES ('450503', '银海区', '3', '450500');
INSERT INTO `oc_area` VALUES ('450512', '铁山港区', '3', '450500');
INSERT INTO `oc_area` VALUES ('450521', '合浦县', '3', '450500');
INSERT INTO `oc_area` VALUES ('450601', '市辖区', '3', '450600');
INSERT INTO `oc_area` VALUES ('450602', '港口区', '3', '450600');
INSERT INTO `oc_area` VALUES ('450603', '防城区', '3', '450600');
INSERT INTO `oc_area` VALUES ('450621', '上思县', '3', '450600');
INSERT INTO `oc_area` VALUES ('450681', '东兴市', '3', '450600');
INSERT INTO `oc_area` VALUES ('450701', '市辖区', '3', '450700');
INSERT INTO `oc_area` VALUES ('450702', '钦南区', '3', '450700');
INSERT INTO `oc_area` VALUES ('450703', '钦北区', '3', '450700');
INSERT INTO `oc_area` VALUES ('450721', '灵山县', '3', '450700');
INSERT INTO `oc_area` VALUES ('450722', '浦北县', '3', '450700');
INSERT INTO `oc_area` VALUES ('450801', '市辖区', '3', '450800');
INSERT INTO `oc_area` VALUES ('450802', '港北区', '3', '450800');
INSERT INTO `oc_area` VALUES ('450803', '港南区', '3', '450800');
INSERT INTO `oc_area` VALUES ('450804', '覃塘区', '3', '450800');
INSERT INTO `oc_area` VALUES ('450821', '平南县', '3', '450800');
INSERT INTO `oc_area` VALUES ('450881', '桂平市', '3', '450800');
INSERT INTO `oc_area` VALUES ('450901', '市辖区', '3', '450900');
INSERT INTO `oc_area` VALUES ('450902', '玉州区', '3', '450900');
INSERT INTO `oc_area` VALUES ('450921', '容　县', '3', '450900');
INSERT INTO `oc_area` VALUES ('450922', '陆川县', '3', '450900');
INSERT INTO `oc_area` VALUES ('450923', '博白县', '3', '450900');
INSERT INTO `oc_area` VALUES ('450924', '兴业县', '3', '450900');
INSERT INTO `oc_area` VALUES ('450981', '北流市', '3', '450900');
INSERT INTO `oc_area` VALUES ('451001', '市辖区', '3', '451000');
INSERT INTO `oc_area` VALUES ('451002', '右江区', '3', '451000');
INSERT INTO `oc_area` VALUES ('451021', '田阳县', '3', '451000');
INSERT INTO `oc_area` VALUES ('451022', '田东县', '3', '451000');
INSERT INTO `oc_area` VALUES ('451023', '平果县', '3', '451000');
INSERT INTO `oc_area` VALUES ('451024', '德保县', '3', '451000');
INSERT INTO `oc_area` VALUES ('451025', '靖西县', '3', '451000');
INSERT INTO `oc_area` VALUES ('451026', '那坡县', '3', '451000');
INSERT INTO `oc_area` VALUES ('451027', '凌云县', '3', '451000');
INSERT INTO `oc_area` VALUES ('451028', '乐业县', '3', '451000');
INSERT INTO `oc_area` VALUES ('451029', '田林县', '3', '451000');
INSERT INTO `oc_area` VALUES ('451030', '西林县', '3', '451000');
INSERT INTO `oc_area` VALUES ('451031', '隆林各族自治县', '3', '451000');
INSERT INTO `oc_area` VALUES ('451101', '市辖区', '3', '451100');
INSERT INTO `oc_area` VALUES ('451102', '八步区', '3', '451100');
INSERT INTO `oc_area` VALUES ('451121', '昭平县', '3', '451100');
INSERT INTO `oc_area` VALUES ('451122', '钟山县', '3', '451100');
INSERT INTO `oc_area` VALUES ('451123', '富川瑶族自治县', '3', '451100');
INSERT INTO `oc_area` VALUES ('451201', '市辖区', '3', '451200');
INSERT INTO `oc_area` VALUES ('451202', '金城江区', '3', '451200');
INSERT INTO `oc_area` VALUES ('451221', '南丹县', '3', '451200');
INSERT INTO `oc_area` VALUES ('451222', '天峨县', '3', '451200');
INSERT INTO `oc_area` VALUES ('451223', '凤山县', '3', '451200');
INSERT INTO `oc_area` VALUES ('451224', '东兰县', '3', '451200');
INSERT INTO `oc_area` VALUES ('451225', '罗城仫佬族自治县', '3', '451200');
INSERT INTO `oc_area` VALUES ('451226', '环江毛南族自治县', '3', '451200');
INSERT INTO `oc_area` VALUES ('451227', '巴马瑶族自治县', '3', '451200');
INSERT INTO `oc_area` VALUES ('451228', '都安瑶族自治县', '3', '451200');
INSERT INTO `oc_area` VALUES ('451229', '大化瑶族自治县', '3', '451200');
INSERT INTO `oc_area` VALUES ('451281', '宜州市', '3', '451200');
INSERT INTO `oc_area` VALUES ('451301', '市辖区', '3', '451300');
INSERT INTO `oc_area` VALUES ('451302', '兴宾区', '3', '451300');
INSERT INTO `oc_area` VALUES ('451321', '忻城县', '3', '451300');
INSERT INTO `oc_area` VALUES ('451322', '象州县', '3', '451300');
INSERT INTO `oc_area` VALUES ('451323', '武宣县', '3', '451300');
INSERT INTO `oc_area` VALUES ('451324', '金秀瑶族自治县', '3', '451300');
INSERT INTO `oc_area` VALUES ('451381', '合山市', '3', '451300');
INSERT INTO `oc_area` VALUES ('451401', '市辖区', '3', '451400');
INSERT INTO `oc_area` VALUES ('451402', '江洲区', '3', '451400');
INSERT INTO `oc_area` VALUES ('451421', '扶绥县', '3', '451400');
INSERT INTO `oc_area` VALUES ('451422', '宁明县', '3', '451400');
INSERT INTO `oc_area` VALUES ('451423', '龙州县', '3', '451400');
INSERT INTO `oc_area` VALUES ('451424', '大新县', '3', '451400');
INSERT INTO `oc_area` VALUES ('451425', '天等县', '3', '451400');
INSERT INTO `oc_area` VALUES ('451481', '凭祥市', '3', '451400');
INSERT INTO `oc_area` VALUES ('460101', '市辖区', '3', '460100');
INSERT INTO `oc_area` VALUES ('460105', '秀英区', '3', '460100');
INSERT INTO `oc_area` VALUES ('460106', '龙华区', '3', '460100');
INSERT INTO `oc_area` VALUES ('460107', '琼山区', '3', '460100');
INSERT INTO `oc_area` VALUES ('460108', '美兰区', '3', '460100');
INSERT INTO `oc_area` VALUES ('460201', '市辖区', '3', '460200');
INSERT INTO `oc_area` VALUES ('469001', '五指山市', '3', '469000');
INSERT INTO `oc_area` VALUES ('469002', '琼海市', '3', '469000');
INSERT INTO `oc_area` VALUES ('469003', '儋州市', '3', '469000');
INSERT INTO `oc_area` VALUES ('469005', '文昌市', '3', '469000');
INSERT INTO `oc_area` VALUES ('469006', '万宁市', '3', '469000');
INSERT INTO `oc_area` VALUES ('469007', '东方市', '3', '469000');
INSERT INTO `oc_area` VALUES ('469025', '定安县', '3', '469000');
INSERT INTO `oc_area` VALUES ('469026', '屯昌县', '3', '469000');
INSERT INTO `oc_area` VALUES ('469027', '澄迈县', '3', '469000');
INSERT INTO `oc_area` VALUES ('469028', '临高县', '3', '469000');
INSERT INTO `oc_area` VALUES ('469030', '白沙黎族自治县', '3', '469000');
INSERT INTO `oc_area` VALUES ('469031', '昌江黎族自治县', '3', '469000');
INSERT INTO `oc_area` VALUES ('469033', '乐东黎族自治县', '3', '469000');
INSERT INTO `oc_area` VALUES ('469034', '陵水黎族自治县', '3', '469000');
INSERT INTO `oc_area` VALUES ('469035', '保亭黎族苗族自治县', '3', '469000');
INSERT INTO `oc_area` VALUES ('469036', '琼中黎族苗族自治县', '3', '469000');
INSERT INTO `oc_area` VALUES ('469037', '西沙群岛', '3', '469000');
INSERT INTO `oc_area` VALUES ('469038', '南沙群岛', '3', '469000');
INSERT INTO `oc_area` VALUES ('469039', '中沙群岛的岛礁及其海域', '3', '469000');
INSERT INTO `oc_area` VALUES ('500101', '万州区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500102', '涪陵区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500103', '渝中区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500104', '大渡口区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500105', '江北区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500106', '沙坪坝区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500107', '九龙坡区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500108', '南岸区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500109', '北碚区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500110', '万盛区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500111', '双桥区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500112', '渝北区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500113', '巴南区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500114', '黔江区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500115', '长寿区', '3', '500100');
INSERT INTO `oc_area` VALUES ('500222', '綦江县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500223', '潼南县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500224', '铜梁县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500225', '大足县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500226', '荣昌县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500227', '璧山县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500228', '梁平县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500229', '城口县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500230', '丰都县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500231', '垫江县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500232', '武隆县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500233', '忠　县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500234', '开　县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500235', '云阳县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500236', '奉节县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500237', '巫山县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500238', '巫溪县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500240', '石柱土家族自治县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500241', '秀山土家族苗族自治县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500242', '酉阳土家族苗族自治县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500243', '彭水苗族土家族自治县', '3', '500200');
INSERT INTO `oc_area` VALUES ('500381', '江津市', '3', '500300');
INSERT INTO `oc_area` VALUES ('500382', '合川市', '3', '500300');
INSERT INTO `oc_area` VALUES ('500383', '永川市', '3', '500300');
INSERT INTO `oc_area` VALUES ('500384', '南川市', '3', '500300');
INSERT INTO `oc_area` VALUES ('510101', '市辖区', '3', '510100');
INSERT INTO `oc_area` VALUES ('510104', '锦江区', '3', '510100');
INSERT INTO `oc_area` VALUES ('510105', '青羊区', '3', '510100');
INSERT INTO `oc_area` VALUES ('510106', '金牛区', '3', '510100');
INSERT INTO `oc_area` VALUES ('510107', '武侯区', '3', '510100');
INSERT INTO `oc_area` VALUES ('510108', '成华区', '3', '510100');
INSERT INTO `oc_area` VALUES ('510112', '龙泉驿区', '3', '510100');
INSERT INTO `oc_area` VALUES ('510113', '青白江区', '3', '510100');
INSERT INTO `oc_area` VALUES ('510114', '新都区', '3', '510100');
INSERT INTO `oc_area` VALUES ('510115', '温江区', '3', '510100');
INSERT INTO `oc_area` VALUES ('510121', '金堂县', '3', '510100');
INSERT INTO `oc_area` VALUES ('510122', '双流县', '3', '510100');
INSERT INTO `oc_area` VALUES ('510124', '郫　县', '3', '510100');
INSERT INTO `oc_area` VALUES ('510129', '大邑县', '3', '510100');
INSERT INTO `oc_area` VALUES ('510131', '蒲江县', '3', '510100');
INSERT INTO `oc_area` VALUES ('510132', '新津县', '3', '510100');
INSERT INTO `oc_area` VALUES ('510181', '都江堰市', '3', '510100');
INSERT INTO `oc_area` VALUES ('510182', '彭州市', '3', '510100');
INSERT INTO `oc_area` VALUES ('510183', '邛崃市', '3', '510100');
INSERT INTO `oc_area` VALUES ('510184', '崇州市', '3', '510100');
INSERT INTO `oc_area` VALUES ('510301', '市辖区', '3', '510300');
INSERT INTO `oc_area` VALUES ('510302', '自流井区', '3', '510300');
INSERT INTO `oc_area` VALUES ('510303', '贡井区', '3', '510300');
INSERT INTO `oc_area` VALUES ('510304', '大安区', '3', '510300');
INSERT INTO `oc_area` VALUES ('510311', '沿滩区', '3', '510300');
INSERT INTO `oc_area` VALUES ('510321', '荣　县', '3', '510300');
INSERT INTO `oc_area` VALUES ('510322', '富顺县', '3', '510300');
INSERT INTO `oc_area` VALUES ('510401', '市辖区', '3', '510400');
INSERT INTO `oc_area` VALUES ('510402', '东　区', '3', '510400');
INSERT INTO `oc_area` VALUES ('510403', '西　区', '3', '510400');
INSERT INTO `oc_area` VALUES ('510411', '仁和区', '3', '510400');
INSERT INTO `oc_area` VALUES ('510421', '米易县', '3', '510400');
INSERT INTO `oc_area` VALUES ('510422', '盐边县', '3', '510400');
INSERT INTO `oc_area` VALUES ('510501', '市辖区', '3', '510500');
INSERT INTO `oc_area` VALUES ('510502', '江阳区', '3', '510500');
INSERT INTO `oc_area` VALUES ('510503', '纳溪区', '3', '510500');
INSERT INTO `oc_area` VALUES ('510504', '龙马潭区', '3', '510500');
INSERT INTO `oc_area` VALUES ('510521', '泸　县', '3', '510500');
INSERT INTO `oc_area` VALUES ('510522', '合江县', '3', '510500');
INSERT INTO `oc_area` VALUES ('510524', '叙永县', '3', '510500');
INSERT INTO `oc_area` VALUES ('510525', '古蔺县', '3', '510500');
INSERT INTO `oc_area` VALUES ('510601', '市辖区', '3', '510600');
INSERT INTO `oc_area` VALUES ('510603', '旌阳区', '3', '510600');
INSERT INTO `oc_area` VALUES ('510623', '中江县', '3', '510600');
INSERT INTO `oc_area` VALUES ('510626', '罗江县', '3', '510600');
INSERT INTO `oc_area` VALUES ('510681', '广汉市', '3', '510600');
INSERT INTO `oc_area` VALUES ('510682', '什邡市', '3', '510600');
INSERT INTO `oc_area` VALUES ('510683', '绵竹市', '3', '510600');
INSERT INTO `oc_area` VALUES ('510701', '市辖区', '3', '510700');
INSERT INTO `oc_area` VALUES ('510703', '涪城区', '3', '510700');
INSERT INTO `oc_area` VALUES ('510704', '游仙区', '3', '510700');
INSERT INTO `oc_area` VALUES ('510722', '三台县', '3', '510700');
INSERT INTO `oc_area` VALUES ('510723', '盐亭县', '3', '510700');
INSERT INTO `oc_area` VALUES ('510724', '安　县', '3', '510700');
INSERT INTO `oc_area` VALUES ('510725', '梓潼县', '3', '510700');
INSERT INTO `oc_area` VALUES ('510726', '北川羌族自治县', '3', '510700');
INSERT INTO `oc_area` VALUES ('510727', '平武县', '3', '510700');
INSERT INTO `oc_area` VALUES ('510781', '江油市', '3', '510700');
INSERT INTO `oc_area` VALUES ('510801', '市辖区', '3', '510800');
INSERT INTO `oc_area` VALUES ('510802', '市中区', '3', '510800');
INSERT INTO `oc_area` VALUES ('510811', '元坝区', '3', '510800');
INSERT INTO `oc_area` VALUES ('510812', '朝天区', '3', '510800');
INSERT INTO `oc_area` VALUES ('510821', '旺苍县', '3', '510800');
INSERT INTO `oc_area` VALUES ('510822', '青川县', '3', '510800');
INSERT INTO `oc_area` VALUES ('510823', '剑阁县', '3', '510800');
INSERT INTO `oc_area` VALUES ('510824', '苍溪县', '3', '510800');
INSERT INTO `oc_area` VALUES ('510901', '市辖区', '3', '510900');
INSERT INTO `oc_area` VALUES ('510903', '船山区', '3', '510900');
INSERT INTO `oc_area` VALUES ('510904', '安居区', '3', '510900');
INSERT INTO `oc_area` VALUES ('510921', '蓬溪县', '3', '510900');
INSERT INTO `oc_area` VALUES ('510922', '射洪县', '3', '510900');
INSERT INTO `oc_area` VALUES ('510923', '大英县', '3', '510900');
INSERT INTO `oc_area` VALUES ('511001', '市辖区', '3', '511000');
INSERT INTO `oc_area` VALUES ('511002', '市中区', '3', '511000');
INSERT INTO `oc_area` VALUES ('511011', '东兴区', '3', '511000');
INSERT INTO `oc_area` VALUES ('511024', '威远县', '3', '511000');
INSERT INTO `oc_area` VALUES ('511025', '资中县', '3', '511000');
INSERT INTO `oc_area` VALUES ('511028', '隆昌县', '3', '511000');
INSERT INTO `oc_area` VALUES ('511101', '市辖区', '3', '511100');
INSERT INTO `oc_area` VALUES ('511102', '市中区', '3', '511100');
INSERT INTO `oc_area` VALUES ('511111', '沙湾区', '3', '511100');
INSERT INTO `oc_area` VALUES ('511112', '五通桥区', '3', '511100');
INSERT INTO `oc_area` VALUES ('511113', '金口河区', '3', '511100');
INSERT INTO `oc_area` VALUES ('511123', '犍为县', '3', '511100');
INSERT INTO `oc_area` VALUES ('511124', '井研县', '3', '511100');
INSERT INTO `oc_area` VALUES ('511126', '夹江县', '3', '511100');
INSERT INTO `oc_area` VALUES ('511129', '沐川县', '3', '511100');
INSERT INTO `oc_area` VALUES ('511132', '峨边彝族自治县', '3', '511100');
INSERT INTO `oc_area` VALUES ('511133', '马边彝族自治县', '3', '511100');
INSERT INTO `oc_area` VALUES ('511181', '峨眉山市', '3', '511100');
INSERT INTO `oc_area` VALUES ('511301', '市辖区', '3', '511300');
INSERT INTO `oc_area` VALUES ('511302', '顺庆区', '3', '511300');
INSERT INTO `oc_area` VALUES ('511303', '高坪区', '3', '511300');
INSERT INTO `oc_area` VALUES ('511304', '嘉陵区', '3', '511300');
INSERT INTO `oc_area` VALUES ('511321', '南部县', '3', '511300');
INSERT INTO `oc_area` VALUES ('511322', '营山县', '3', '511300');
INSERT INTO `oc_area` VALUES ('511323', '蓬安县', '3', '511300');
INSERT INTO `oc_area` VALUES ('511324', '仪陇县', '3', '511300');
INSERT INTO `oc_area` VALUES ('511325', '西充县', '3', '511300');
INSERT INTO `oc_area` VALUES ('511381', '阆中市', '3', '511300');
INSERT INTO `oc_area` VALUES ('511401', '市辖区', '3', '511400');
INSERT INTO `oc_area` VALUES ('511402', '东坡区', '3', '511400');
INSERT INTO `oc_area` VALUES ('511421', '仁寿县', '3', '511400');
INSERT INTO `oc_area` VALUES ('511422', '彭山县', '3', '511400');
INSERT INTO `oc_area` VALUES ('511423', '洪雅县', '3', '511400');
INSERT INTO `oc_area` VALUES ('511424', '丹棱县', '3', '511400');
INSERT INTO `oc_area` VALUES ('511425', '青神县', '3', '511400');
INSERT INTO `oc_area` VALUES ('511501', '市辖区', '3', '511500');
INSERT INTO `oc_area` VALUES ('511502', '翠屏区', '3', '511500');
INSERT INTO `oc_area` VALUES ('511521', '宜宾县', '3', '511500');
INSERT INTO `oc_area` VALUES ('511522', '南溪县', '3', '511500');
INSERT INTO `oc_area` VALUES ('511523', '江安县', '3', '511500');
INSERT INTO `oc_area` VALUES ('511524', '长宁县', '3', '511500');
INSERT INTO `oc_area` VALUES ('511525', '高　县', '3', '511500');
INSERT INTO `oc_area` VALUES ('511526', '珙　县', '3', '511500');
INSERT INTO `oc_area` VALUES ('511527', '筠连县', '3', '511500');
INSERT INTO `oc_area` VALUES ('511528', '兴文县', '3', '511500');
INSERT INTO `oc_area` VALUES ('511529', '屏山县', '3', '511500');
INSERT INTO `oc_area` VALUES ('511601', '市辖区', '3', '511600');
INSERT INTO `oc_area` VALUES ('511602', '广安区', '3', '511600');
INSERT INTO `oc_area` VALUES ('511621', '岳池县', '3', '511600');
INSERT INTO `oc_area` VALUES ('511622', '武胜县', '3', '511600');
INSERT INTO `oc_area` VALUES ('511623', '邻水县', '3', '511600');
INSERT INTO `oc_area` VALUES ('511681', '华莹市', '3', '511600');
INSERT INTO `oc_area` VALUES ('511701', '市辖区', '3', '511700');
INSERT INTO `oc_area` VALUES ('511702', '通川区', '3', '511700');
INSERT INTO `oc_area` VALUES ('511721', '达　县', '3', '511700');
INSERT INTO `oc_area` VALUES ('511722', '宣汉县', '3', '511700');
INSERT INTO `oc_area` VALUES ('511723', '开江县', '3', '511700');
INSERT INTO `oc_area` VALUES ('511724', '大竹县', '3', '511700');
INSERT INTO `oc_area` VALUES ('511725', '渠　县', '3', '511700');
INSERT INTO `oc_area` VALUES ('511781', '万源市', '3', '511700');
INSERT INTO `oc_area` VALUES ('511801', '市辖区', '3', '511800');
INSERT INTO `oc_area` VALUES ('511802', '雨城区', '3', '511800');
INSERT INTO `oc_area` VALUES ('511821', '名山县', '3', '511800');
INSERT INTO `oc_area` VALUES ('511822', '荥经县', '3', '511800');
INSERT INTO `oc_area` VALUES ('511823', '汉源县', '3', '511800');
INSERT INTO `oc_area` VALUES ('511824', '石棉县', '3', '511800');
INSERT INTO `oc_area` VALUES ('511825', '天全县', '3', '511800');
INSERT INTO `oc_area` VALUES ('511826', '芦山县', '3', '511800');
INSERT INTO `oc_area` VALUES ('511827', '宝兴县', '3', '511800');
INSERT INTO `oc_area` VALUES ('511901', '市辖区', '3', '511900');
INSERT INTO `oc_area` VALUES ('511902', '巴州区', '3', '511900');
INSERT INTO `oc_area` VALUES ('511921', '通江县', '3', '511900');
INSERT INTO `oc_area` VALUES ('511922', '南江县', '3', '511900');
INSERT INTO `oc_area` VALUES ('511923', '平昌县', '3', '511900');
INSERT INTO `oc_area` VALUES ('512001', '市辖区', '3', '512000');
INSERT INTO `oc_area` VALUES ('512002', '雁江区', '3', '512000');
INSERT INTO `oc_area` VALUES ('512021', '安岳县', '3', '512000');
INSERT INTO `oc_area` VALUES ('512022', '乐至县', '3', '512000');
INSERT INTO `oc_area` VALUES ('512081', '简阳市', '3', '512000');
INSERT INTO `oc_area` VALUES ('513221', '汶川县', '3', '513200');
INSERT INTO `oc_area` VALUES ('513222', '理　县', '3', '513200');
INSERT INTO `oc_area` VALUES ('513223', '茂　县', '3', '513200');
INSERT INTO `oc_area` VALUES ('513224', '松潘县', '3', '513200');
INSERT INTO `oc_area` VALUES ('513225', '九寨沟县', '3', '513200');
INSERT INTO `oc_area` VALUES ('513226', '金川县', '3', '513200');
INSERT INTO `oc_area` VALUES ('513227', '小金县', '3', '513200');
INSERT INTO `oc_area` VALUES ('513228', '黑水县', '3', '513200');
INSERT INTO `oc_area` VALUES ('513229', '马尔康县', '3', '513200');
INSERT INTO `oc_area` VALUES ('513230', '壤塘县', '3', '513200');
INSERT INTO `oc_area` VALUES ('513231', '阿坝县', '3', '513200');
INSERT INTO `oc_area` VALUES ('513232', '若尔盖县', '3', '513200');
INSERT INTO `oc_area` VALUES ('513233', '红原县', '3', '513200');
INSERT INTO `oc_area` VALUES ('513321', '康定县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513322', '泸定县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513323', '丹巴县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513324', '九龙县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513325', '雅江县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513326', '道孚县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513327', '炉霍县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513328', '甘孜县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513329', '新龙县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513330', '德格县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513331', '白玉县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513332', '石渠县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513333', '色达县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513334', '理塘县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513335', '巴塘县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513336', '乡城县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513337', '稻城县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513338', '得荣县', '3', '513300');
INSERT INTO `oc_area` VALUES ('513401', '西昌市', '3', '513400');
INSERT INTO `oc_area` VALUES ('513422', '木里藏族自治县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513423', '盐源县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513424', '德昌县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513425', '会理县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513426', '会东县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513427', '宁南县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513428', '普格县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513429', '布拖县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513430', '金阳县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513431', '昭觉县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513432', '喜德县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513433', '冕宁县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513434', '越西县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513435', '甘洛县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513436', '美姑县', '3', '513400');
INSERT INTO `oc_area` VALUES ('513437', '雷波县', '3', '513400');
INSERT INTO `oc_area` VALUES ('520101', '市辖区', '3', '520100');
INSERT INTO `oc_area` VALUES ('520102', '南明区', '3', '520100');
INSERT INTO `oc_area` VALUES ('520103', '云岩区', '3', '520100');
INSERT INTO `oc_area` VALUES ('520111', '花溪区', '3', '520100');
INSERT INTO `oc_area` VALUES ('520112', '乌当区', '3', '520100');
INSERT INTO `oc_area` VALUES ('520113', '白云区', '3', '520100');
INSERT INTO `oc_area` VALUES ('520114', '小河区', '3', '520100');
INSERT INTO `oc_area` VALUES ('520121', '开阳县', '3', '520100');
INSERT INTO `oc_area` VALUES ('520122', '息烽县', '3', '520100');
INSERT INTO `oc_area` VALUES ('520123', '修文县', '3', '520100');
INSERT INTO `oc_area` VALUES ('520181', '清镇市', '3', '520100');
INSERT INTO `oc_area` VALUES ('520201', '钟山区', '3', '520200');
INSERT INTO `oc_area` VALUES ('520203', '六枝特区', '3', '520200');
INSERT INTO `oc_area` VALUES ('520221', '水城县', '3', '520200');
INSERT INTO `oc_area` VALUES ('520222', '盘　县', '3', '520200');
INSERT INTO `oc_area` VALUES ('520301', '市辖区', '3', '520300');
INSERT INTO `oc_area` VALUES ('520302', '红花岗区', '3', '520300');
INSERT INTO `oc_area` VALUES ('520303', '汇川区', '3', '520300');
INSERT INTO `oc_area` VALUES ('520321', '遵义县', '3', '520300');
INSERT INTO `oc_area` VALUES ('520322', '桐梓县', '3', '520300');
INSERT INTO `oc_area` VALUES ('520323', '绥阳县', '3', '520300');
INSERT INTO `oc_area` VALUES ('520324', '正安县', '3', '520300');
INSERT INTO `oc_area` VALUES ('520325', '道真仡佬族苗族自治县', '3', '520300');
INSERT INTO `oc_area` VALUES ('520326', '务川仡佬族苗族自治县', '3', '520300');
INSERT INTO `oc_area` VALUES ('520327', '凤冈县', '3', '520300');
INSERT INTO `oc_area` VALUES ('520328', '湄潭县', '3', '520300');
INSERT INTO `oc_area` VALUES ('520329', '余庆县', '3', '520300');
INSERT INTO `oc_area` VALUES ('520330', '习水县', '3', '520300');
INSERT INTO `oc_area` VALUES ('520381', '赤水市', '3', '520300');
INSERT INTO `oc_area` VALUES ('520382', '仁怀市', '3', '520300');
INSERT INTO `oc_area` VALUES ('520401', '市辖区', '3', '520400');
INSERT INTO `oc_area` VALUES ('520402', '西秀区', '3', '520400');
INSERT INTO `oc_area` VALUES ('520421', '平坝县', '3', '520400');
INSERT INTO `oc_area` VALUES ('520422', '普定县', '3', '520400');
INSERT INTO `oc_area` VALUES ('520423', '镇宁布依族苗族自治县', '3', '520400');
INSERT INTO `oc_area` VALUES ('520424', '关岭布依族苗族自治县', '3', '520400');
INSERT INTO `oc_area` VALUES ('520425', '紫云苗族布依族自治县', '3', '520400');
INSERT INTO `oc_area` VALUES ('522201', '铜仁市', '3', '522200');
INSERT INTO `oc_area` VALUES ('522222', '江口县', '3', '522200');
INSERT INTO `oc_area` VALUES ('522223', '玉屏侗族自治县', '3', '522200');
INSERT INTO `oc_area` VALUES ('522224', '石阡县', '3', '522200');
INSERT INTO `oc_area` VALUES ('522225', '思南县', '3', '522200');
INSERT INTO `oc_area` VALUES ('522226', '印江土家族苗族自治县', '3', '522200');
INSERT INTO `oc_area` VALUES ('522227', '德江县', '3', '522200');
INSERT INTO `oc_area` VALUES ('522228', '沿河土家族自治县', '3', '522200');
INSERT INTO `oc_area` VALUES ('522229', '松桃苗族自治县', '3', '522200');
INSERT INTO `oc_area` VALUES ('522230', '万山特区', '3', '522200');
INSERT INTO `oc_area` VALUES ('522301', '兴义市', '3', '522300');
INSERT INTO `oc_area` VALUES ('522322', '兴仁县', '3', '522300');
INSERT INTO `oc_area` VALUES ('522323', '普安县', '3', '522300');
INSERT INTO `oc_area` VALUES ('522324', '晴隆县', '3', '522300');
INSERT INTO `oc_area` VALUES ('522325', '贞丰县', '3', '522300');
INSERT INTO `oc_area` VALUES ('522326', '望谟县', '3', '522300');
INSERT INTO `oc_area` VALUES ('522327', '册亨县', '3', '522300');
INSERT INTO `oc_area` VALUES ('522328', '安龙县', '3', '522300');
INSERT INTO `oc_area` VALUES ('522401', '毕节市', '3', '522400');
INSERT INTO `oc_area` VALUES ('522422', '大方县', '3', '522400');
INSERT INTO `oc_area` VALUES ('522423', '黔西县', '3', '522400');
INSERT INTO `oc_area` VALUES ('522424', '金沙县', '3', '522400');
INSERT INTO `oc_area` VALUES ('522425', '织金县', '3', '522400');
INSERT INTO `oc_area` VALUES ('522426', '纳雍县', '3', '522400');
INSERT INTO `oc_area` VALUES ('522427', '威宁彝族回族苗族自治县', '3', '522400');
INSERT INTO `oc_area` VALUES ('522428', '赫章县', '3', '522400');
INSERT INTO `oc_area` VALUES ('522601', '凯里市', '3', '522600');
INSERT INTO `oc_area` VALUES ('522622', '黄平县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522623', '施秉县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522624', '三穗县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522625', '镇远县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522626', '岑巩县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522627', '天柱县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522628', '锦屏县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522629', '剑河县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522630', '台江县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522631', '黎平县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522632', '榕江县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522633', '从江县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522634', '雷山县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522635', '麻江县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522636', '丹寨县', '3', '522600');
INSERT INTO `oc_area` VALUES ('522701', '都匀市', '3', '522700');
INSERT INTO `oc_area` VALUES ('522702', '福泉市', '3', '522700');
INSERT INTO `oc_area` VALUES ('522722', '荔波县', '3', '522700');
INSERT INTO `oc_area` VALUES ('522723', '贵定县', '3', '522700');
INSERT INTO `oc_area` VALUES ('522725', '瓮安县', '3', '522700');
INSERT INTO `oc_area` VALUES ('522726', '独山县', '3', '522700');
INSERT INTO `oc_area` VALUES ('522727', '平塘县', '3', '522700');
INSERT INTO `oc_area` VALUES ('522728', '罗甸县', '3', '522700');
INSERT INTO `oc_area` VALUES ('522729', '长顺县', '3', '522700');
INSERT INTO `oc_area` VALUES ('522730', '龙里县', '3', '522700');
INSERT INTO `oc_area` VALUES ('522731', '惠水县', '3', '522700');
INSERT INTO `oc_area` VALUES ('522732', '三都水族自治县', '3', '522700');
INSERT INTO `oc_area` VALUES ('530101', '市辖区', '3', '530100');
INSERT INTO `oc_area` VALUES ('530102', '五华区', '3', '530100');
INSERT INTO `oc_area` VALUES ('530103', '盘龙区', '3', '530100');
INSERT INTO `oc_area` VALUES ('530111', '官渡区', '3', '530100');
INSERT INTO `oc_area` VALUES ('530112', '西山区', '3', '530100');
INSERT INTO `oc_area` VALUES ('530113', '东川区', '3', '530100');
INSERT INTO `oc_area` VALUES ('530121', '呈贡县', '3', '530100');
INSERT INTO `oc_area` VALUES ('530122', '晋宁县', '3', '530100');
INSERT INTO `oc_area` VALUES ('530124', '富民县', '3', '530100');
INSERT INTO `oc_area` VALUES ('530125', '宜良县', '3', '530100');
INSERT INTO `oc_area` VALUES ('530126', '石林彝族自治县', '3', '530100');
INSERT INTO `oc_area` VALUES ('530127', '嵩明县', '3', '530100');
INSERT INTO `oc_area` VALUES ('530128', '禄劝彝族苗族自治县', '3', '530100');
INSERT INTO `oc_area` VALUES ('530129', '寻甸回族彝族自治县', '3', '530100');
INSERT INTO `oc_area` VALUES ('530181', '安宁市', '3', '530100');
INSERT INTO `oc_area` VALUES ('530301', '市辖区', '3', '530300');
INSERT INTO `oc_area` VALUES ('530302', '麒麟区', '3', '530300');
INSERT INTO `oc_area` VALUES ('530321', '马龙县', '3', '530300');
INSERT INTO `oc_area` VALUES ('530322', '陆良县', '3', '530300');
INSERT INTO `oc_area` VALUES ('530323', '师宗县', '3', '530300');
INSERT INTO `oc_area` VALUES ('530324', '罗平县', '3', '530300');
INSERT INTO `oc_area` VALUES ('530325', '富源县', '3', '530300');
INSERT INTO `oc_area` VALUES ('530326', '会泽县', '3', '530300');
INSERT INTO `oc_area` VALUES ('530328', '沾益县', '3', '530300');
INSERT INTO `oc_area` VALUES ('530381', '宣威市', '3', '530300');
INSERT INTO `oc_area` VALUES ('530401', '市辖区', '3', '530400');
INSERT INTO `oc_area` VALUES ('530402', '红塔区', '3', '530400');
INSERT INTO `oc_area` VALUES ('530421', '江川县', '3', '530400');
INSERT INTO `oc_area` VALUES ('530422', '澄江县', '3', '530400');
INSERT INTO `oc_area` VALUES ('530423', '通海县', '3', '530400');
INSERT INTO `oc_area` VALUES ('530424', '华宁县', '3', '530400');
INSERT INTO `oc_area` VALUES ('530425', '易门县', '3', '530400');
INSERT INTO `oc_area` VALUES ('530426', '峨山彝族自治县', '3', '530400');
INSERT INTO `oc_area` VALUES ('530427', '新平彝族傣族自治县', '3', '530400');
INSERT INTO `oc_area` VALUES ('530428', '元江哈尼族彝族傣族自治县', '3', '530400');
INSERT INTO `oc_area` VALUES ('530501', '市辖区', '3', '530500');
INSERT INTO `oc_area` VALUES ('530502', '隆阳区', '3', '530500');
INSERT INTO `oc_area` VALUES ('530521', '施甸县', '3', '530500');
INSERT INTO `oc_area` VALUES ('530522', '腾冲县', '3', '530500');
INSERT INTO `oc_area` VALUES ('530523', '龙陵县', '3', '530500');
INSERT INTO `oc_area` VALUES ('530524', '昌宁县', '3', '530500');
INSERT INTO `oc_area` VALUES ('530601', '市辖区', '3', '530600');
INSERT INTO `oc_area` VALUES ('530602', '昭阳区', '3', '530600');
INSERT INTO `oc_area` VALUES ('530621', '鲁甸县', '3', '530600');
INSERT INTO `oc_area` VALUES ('530622', '巧家县', '3', '530600');
INSERT INTO `oc_area` VALUES ('530623', '盐津县', '3', '530600');
INSERT INTO `oc_area` VALUES ('530624', '大关县', '3', '530600');
INSERT INTO `oc_area` VALUES ('530625', '永善县', '3', '530600');
INSERT INTO `oc_area` VALUES ('530626', '绥江县', '3', '530600');
INSERT INTO `oc_area` VALUES ('530627', '镇雄县', '3', '530600');
INSERT INTO `oc_area` VALUES ('530628', '彝良县', '3', '530600');
INSERT INTO `oc_area` VALUES ('530629', '威信县', '3', '530600');
INSERT INTO `oc_area` VALUES ('530630', '水富县', '3', '530600');
INSERT INTO `oc_area` VALUES ('530701', '市辖区', '3', '530700');
INSERT INTO `oc_area` VALUES ('530702', '古城区', '3', '530700');
INSERT INTO `oc_area` VALUES ('530721', '玉龙纳西族自治县', '3', '530700');
INSERT INTO `oc_area` VALUES ('530722', '永胜县', '3', '530700');
INSERT INTO `oc_area` VALUES ('530723', '华坪县', '3', '530700');
INSERT INTO `oc_area` VALUES ('530724', '宁蒗彝族自治县', '3', '530700');
INSERT INTO `oc_area` VALUES ('530801', '市辖区', '3', '530800');
INSERT INTO `oc_area` VALUES ('530802', '翠云区', '3', '530800');
INSERT INTO `oc_area` VALUES ('530821', '普洱哈尼族彝族自治县', '3', '530800');
INSERT INTO `oc_area` VALUES ('530822', '墨江哈尼族自治县', '3', '530800');
INSERT INTO `oc_area` VALUES ('530823', '景东彝族自治县', '3', '530800');
INSERT INTO `oc_area` VALUES ('530824', '景谷傣族彝族自治县', '3', '530800');
INSERT INTO `oc_area` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '3', '530800');
INSERT INTO `oc_area` VALUES ('530826', '江城哈尼族彝族自治县', '3', '530800');
INSERT INTO `oc_area` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '3', '530800');
INSERT INTO `oc_area` VALUES ('530828', '澜沧拉祜族自治县', '3', '530800');
INSERT INTO `oc_area` VALUES ('530829', '西盟佤族自治县', '3', '530800');
INSERT INTO `oc_area` VALUES ('530901', '市辖区', '3', '530900');
INSERT INTO `oc_area` VALUES ('530902', '临翔区', '3', '530900');
INSERT INTO `oc_area` VALUES ('530921', '凤庆县', '3', '530900');
INSERT INTO `oc_area` VALUES ('530922', '云　县', '3', '530900');
INSERT INTO `oc_area` VALUES ('530923', '永德县', '3', '530900');
INSERT INTO `oc_area` VALUES ('530924', '镇康县', '3', '530900');
INSERT INTO `oc_area` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '3', '530900');
INSERT INTO `oc_area` VALUES ('530926', '耿马傣族佤族自治县', '3', '530900');
INSERT INTO `oc_area` VALUES ('530927', '沧源佤族自治县', '3', '530900');
INSERT INTO `oc_area` VALUES ('532301', '楚雄市', '3', '532300');
INSERT INTO `oc_area` VALUES ('532322', '双柏县', '3', '532300');
INSERT INTO `oc_area` VALUES ('532323', '牟定县', '3', '532300');
INSERT INTO `oc_area` VALUES ('532324', '南华县', '3', '532300');
INSERT INTO `oc_area` VALUES ('532325', '姚安县', '3', '532300');
INSERT INTO `oc_area` VALUES ('532326', '大姚县', '3', '532300');
INSERT INTO `oc_area` VALUES ('532327', '永仁县', '3', '532300');
INSERT INTO `oc_area` VALUES ('532328', '元谋县', '3', '532300');
INSERT INTO `oc_area` VALUES ('532329', '武定县', '3', '532300');
INSERT INTO `oc_area` VALUES ('532331', '禄丰县', '3', '532300');
INSERT INTO `oc_area` VALUES ('532501', '个旧市', '3', '532500');
INSERT INTO `oc_area` VALUES ('532502', '开远市', '3', '532500');
INSERT INTO `oc_area` VALUES ('532522', '蒙自县', '3', '532500');
INSERT INTO `oc_area` VALUES ('532523', '屏边苗族自治县', '3', '532500');
INSERT INTO `oc_area` VALUES ('532524', '建水县', '3', '532500');
INSERT INTO `oc_area` VALUES ('532525', '石屏县', '3', '532500');
INSERT INTO `oc_area` VALUES ('532526', '弥勒县', '3', '532500');
INSERT INTO `oc_area` VALUES ('532527', '泸西县', '3', '532500');
INSERT INTO `oc_area` VALUES ('532528', '元阳县', '3', '532500');
INSERT INTO `oc_area` VALUES ('532529', '红河县', '3', '532500');
INSERT INTO `oc_area` VALUES ('532530', '金平苗族瑶族傣族自治县', '3', '532500');
INSERT INTO `oc_area` VALUES ('532531', '绿春县', '3', '532500');
INSERT INTO `oc_area` VALUES ('532532', '河口瑶族自治县', '3', '532500');
INSERT INTO `oc_area` VALUES ('532621', '文山县', '3', '532600');
INSERT INTO `oc_area` VALUES ('532622', '砚山县', '3', '532600');
INSERT INTO `oc_area` VALUES ('532623', '西畴县', '3', '532600');
INSERT INTO `oc_area` VALUES ('532624', '麻栗坡县', '3', '532600');
INSERT INTO `oc_area` VALUES ('532625', '马关县', '3', '532600');
INSERT INTO `oc_area` VALUES ('532626', '丘北县', '3', '532600');
INSERT INTO `oc_area` VALUES ('532627', '广南县', '3', '532600');
INSERT INTO `oc_area` VALUES ('532628', '富宁县', '3', '532600');
INSERT INTO `oc_area` VALUES ('532801', '景洪市', '3', '532800');
INSERT INTO `oc_area` VALUES ('532822', '勐海县', '3', '532800');
INSERT INTO `oc_area` VALUES ('532823', '勐腊县', '3', '532800');
INSERT INTO `oc_area` VALUES ('532901', '大理市', '3', '532900');
INSERT INTO `oc_area` VALUES ('532922', '漾濞彝族自治县', '3', '532900');
INSERT INTO `oc_area` VALUES ('532923', '祥云县', '3', '532900');
INSERT INTO `oc_area` VALUES ('532924', '宾川县', '3', '532900');
INSERT INTO `oc_area` VALUES ('532925', '弥渡县', '3', '532900');
INSERT INTO `oc_area` VALUES ('532926', '南涧彝族自治县', '3', '532900');
INSERT INTO `oc_area` VALUES ('532927', '巍山彝族回族自治县', '3', '532900');
INSERT INTO `oc_area` VALUES ('532928', '永平县', '3', '532900');
INSERT INTO `oc_area` VALUES ('532929', '云龙县', '3', '532900');
INSERT INTO `oc_area` VALUES ('532930', '洱源县', '3', '532900');
INSERT INTO `oc_area` VALUES ('532931', '剑川县', '3', '532900');
INSERT INTO `oc_area` VALUES ('532932', '鹤庆县', '3', '532900');
INSERT INTO `oc_area` VALUES ('533102', '瑞丽市', '3', '533100');
INSERT INTO `oc_area` VALUES ('533103', '潞西市', '3', '533100');
INSERT INTO `oc_area` VALUES ('533122', '梁河县', '3', '533100');
INSERT INTO `oc_area` VALUES ('533123', '盈江县', '3', '533100');
INSERT INTO `oc_area` VALUES ('533124', '陇川县', '3', '533100');
INSERT INTO `oc_area` VALUES ('533321', '泸水县', '3', '533300');
INSERT INTO `oc_area` VALUES ('533323', '福贡县', '3', '533300');
INSERT INTO `oc_area` VALUES ('533324', '贡山独龙族怒族自治县', '3', '533300');
INSERT INTO `oc_area` VALUES ('533325', '兰坪白族普米族自治县', '3', '533300');
INSERT INTO `oc_area` VALUES ('533421', '香格里拉县', '3', '533400');
INSERT INTO `oc_area` VALUES ('533422', '德钦县', '3', '533400');
INSERT INTO `oc_area` VALUES ('533423', '维西傈僳族自治县', '3', '533400');
INSERT INTO `oc_area` VALUES ('540101', '市辖区', '3', '540100');
INSERT INTO `oc_area` VALUES ('540102', '城关区', '3', '540100');
INSERT INTO `oc_area` VALUES ('540121', '林周县', '3', '540100');
INSERT INTO `oc_area` VALUES ('540122', '当雄县', '3', '540100');
INSERT INTO `oc_area` VALUES ('540123', '尼木县', '3', '540100');
INSERT INTO `oc_area` VALUES ('540124', '曲水县', '3', '540100');
INSERT INTO `oc_area` VALUES ('540125', '堆龙德庆县', '3', '540100');
INSERT INTO `oc_area` VALUES ('540126', '达孜县', '3', '540100');
INSERT INTO `oc_area` VALUES ('540127', '墨竹工卡县', '3', '540100');
INSERT INTO `oc_area` VALUES ('542121', '昌都县', '3', '542100');
INSERT INTO `oc_area` VALUES ('542122', '江达县', '3', '542100');
INSERT INTO `oc_area` VALUES ('542123', '贡觉县', '3', '542100');
INSERT INTO `oc_area` VALUES ('542124', '类乌齐县', '3', '542100');
INSERT INTO `oc_area` VALUES ('542125', '丁青县', '3', '542100');
INSERT INTO `oc_area` VALUES ('542126', '察雅县', '3', '542100');
INSERT INTO `oc_area` VALUES ('542127', '八宿县', '3', '542100');
INSERT INTO `oc_area` VALUES ('542128', '左贡县', '3', '542100');
INSERT INTO `oc_area` VALUES ('542129', '芒康县', '3', '542100');
INSERT INTO `oc_area` VALUES ('542132', '洛隆县', '3', '542100');
INSERT INTO `oc_area` VALUES ('542133', '边坝县', '3', '542100');
INSERT INTO `oc_area` VALUES ('542221', '乃东县', '3', '542200');
INSERT INTO `oc_area` VALUES ('542222', '扎囊县', '3', '542200');
INSERT INTO `oc_area` VALUES ('542223', '贡嘎县', '3', '542200');
INSERT INTO `oc_area` VALUES ('542224', '桑日县', '3', '542200');
INSERT INTO `oc_area` VALUES ('542225', '琼结县', '3', '542200');
INSERT INTO `oc_area` VALUES ('542226', '曲松县', '3', '542200');
INSERT INTO `oc_area` VALUES ('542227', '措美县', '3', '542200');
INSERT INTO `oc_area` VALUES ('542228', '洛扎县', '3', '542200');
INSERT INTO `oc_area` VALUES ('542229', '加查县', '3', '542200');
INSERT INTO `oc_area` VALUES ('542231', '隆子县', '3', '542200');
INSERT INTO `oc_area` VALUES ('542232', '错那县', '3', '542200');
INSERT INTO `oc_area` VALUES ('542233', '浪卡子县', '3', '542200');
INSERT INTO `oc_area` VALUES ('542301', '日喀则市', '3', '542300');
INSERT INTO `oc_area` VALUES ('542322', '南木林县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542323', '江孜县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542324', '定日县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542325', '萨迦县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542326', '拉孜县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542327', '昂仁县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542328', '谢通门县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542329', '白朗县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542330', '仁布县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542331', '康马县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542332', '定结县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542333', '仲巴县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542334', '亚东县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542335', '吉隆县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542336', '聂拉木县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542337', '萨嘎县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542338', '岗巴县', '3', '542300');
INSERT INTO `oc_area` VALUES ('542421', '那曲县', '3', '542400');
INSERT INTO `oc_area` VALUES ('542422', '嘉黎县', '3', '542400');
INSERT INTO `oc_area` VALUES ('542423', '比如县', '3', '542400');
INSERT INTO `oc_area` VALUES ('542424', '聂荣县', '3', '542400');
INSERT INTO `oc_area` VALUES ('542425', '安多县', '3', '542400');
INSERT INTO `oc_area` VALUES ('542426', '申扎县', '3', '542400');
INSERT INTO `oc_area` VALUES ('542427', '索　县', '3', '542400');
INSERT INTO `oc_area` VALUES ('542428', '班戈县', '3', '542400');
INSERT INTO `oc_area` VALUES ('542429', '巴青县', '3', '542400');
INSERT INTO `oc_area` VALUES ('542430', '尼玛县', '3', '542400');
INSERT INTO `oc_area` VALUES ('542521', '普兰县', '3', '542500');
INSERT INTO `oc_area` VALUES ('542522', '札达县', '3', '542500');
INSERT INTO `oc_area` VALUES ('542523', '噶尔县', '3', '542500');
INSERT INTO `oc_area` VALUES ('542524', '日土县', '3', '542500');
INSERT INTO `oc_area` VALUES ('542525', '革吉县', '3', '542500');
INSERT INTO `oc_area` VALUES ('542526', '改则县', '3', '542500');
INSERT INTO `oc_area` VALUES ('542527', '措勤县', '3', '542500');
INSERT INTO `oc_area` VALUES ('542621', '林芝县', '3', '542600');
INSERT INTO `oc_area` VALUES ('542622', '工布江达县', '3', '542600');
INSERT INTO `oc_area` VALUES ('542623', '米林县', '3', '542600');
INSERT INTO `oc_area` VALUES ('542624', '墨脱县', '3', '542600');
INSERT INTO `oc_area` VALUES ('542625', '波密县', '3', '542600');
INSERT INTO `oc_area` VALUES ('542626', '察隅县', '3', '542600');
INSERT INTO `oc_area` VALUES ('542627', '朗　县', '3', '542600');
INSERT INTO `oc_area` VALUES ('610101', '市辖区', '3', '610100');
INSERT INTO `oc_area` VALUES ('610102', '新城区', '3', '610100');
INSERT INTO `oc_area` VALUES ('610103', '碑林区', '3', '610100');
INSERT INTO `oc_area` VALUES ('610104', '莲湖区', '3', '610100');
INSERT INTO `oc_area` VALUES ('610111', '灞桥区', '3', '610100');
INSERT INTO `oc_area` VALUES ('610112', '未央区', '3', '610100');
INSERT INTO `oc_area` VALUES ('610113', '雁塔区', '3', '610100');
INSERT INTO `oc_area` VALUES ('610114', '阎良区', '3', '610100');
INSERT INTO `oc_area` VALUES ('610115', '临潼区', '3', '610100');
INSERT INTO `oc_area` VALUES ('610116', '长安区', '3', '610100');
INSERT INTO `oc_area` VALUES ('610122', '蓝田县', '3', '610100');
INSERT INTO `oc_area` VALUES ('610124', '周至县', '3', '610100');
INSERT INTO `oc_area` VALUES ('610125', '户　县', '3', '610100');
INSERT INTO `oc_area` VALUES ('610126', '高陵县', '3', '610100');
INSERT INTO `oc_area` VALUES ('610201', '市辖区', '3', '610200');
INSERT INTO `oc_area` VALUES ('610202', '王益区', '3', '610200');
INSERT INTO `oc_area` VALUES ('610203', '印台区', '3', '610200');
INSERT INTO `oc_area` VALUES ('610204', '耀州区', '3', '610200');
INSERT INTO `oc_area` VALUES ('610222', '宜君县', '3', '610200');
INSERT INTO `oc_area` VALUES ('610301', '市辖区', '3', '610300');
INSERT INTO `oc_area` VALUES ('610302', '渭滨区', '3', '610300');
INSERT INTO `oc_area` VALUES ('610303', '金台区', '3', '610300');
INSERT INTO `oc_area` VALUES ('610304', '陈仓区', '3', '610300');
INSERT INTO `oc_area` VALUES ('610322', '凤翔县', '3', '610300');
INSERT INTO `oc_area` VALUES ('610323', '岐山县', '3', '610300');
INSERT INTO `oc_area` VALUES ('610324', '扶风县', '3', '610300');
INSERT INTO `oc_area` VALUES ('610326', '眉　县', '3', '610300');
INSERT INTO `oc_area` VALUES ('610327', '陇　县', '3', '610300');
INSERT INTO `oc_area` VALUES ('610328', '千阳县', '3', '610300');
INSERT INTO `oc_area` VALUES ('610329', '麟游县', '3', '610300');
INSERT INTO `oc_area` VALUES ('610330', '凤　县', '3', '610300');
INSERT INTO `oc_area` VALUES ('610331', '太白县', '3', '610300');
INSERT INTO `oc_area` VALUES ('610401', '市辖区', '3', '610400');
INSERT INTO `oc_area` VALUES ('610402', '秦都区', '3', '610400');
INSERT INTO `oc_area` VALUES ('610403', '杨凌区', '3', '610400');
INSERT INTO `oc_area` VALUES ('610404', '渭城区', '3', '610400');
INSERT INTO `oc_area` VALUES ('610422', '三原县', '3', '610400');
INSERT INTO `oc_area` VALUES ('610423', '泾阳县', '3', '610400');
INSERT INTO `oc_area` VALUES ('610424', '乾　县', '3', '610400');
INSERT INTO `oc_area` VALUES ('610425', '礼泉县', '3', '610400');
INSERT INTO `oc_area` VALUES ('610426', '永寿县', '3', '610400');
INSERT INTO `oc_area` VALUES ('610427', '彬　县', '3', '610400');
INSERT INTO `oc_area` VALUES ('610428', '长武县', '3', '610400');
INSERT INTO `oc_area` VALUES ('610429', '旬邑县', '3', '610400');
INSERT INTO `oc_area` VALUES ('610430', '淳化县', '3', '610400');
INSERT INTO `oc_area` VALUES ('610431', '武功县', '3', '610400');
INSERT INTO `oc_area` VALUES ('610481', '兴平市', '3', '610400');
INSERT INTO `oc_area` VALUES ('610501', '市辖区', '3', '610500');
INSERT INTO `oc_area` VALUES ('610502', '临渭区', '3', '610500');
INSERT INTO `oc_area` VALUES ('610521', '华　县', '3', '610500');
INSERT INTO `oc_area` VALUES ('610522', '潼关县', '3', '610500');
INSERT INTO `oc_area` VALUES ('610523', '大荔县', '3', '610500');
INSERT INTO `oc_area` VALUES ('610524', '合阳县', '3', '610500');
INSERT INTO `oc_area` VALUES ('610525', '澄城县', '3', '610500');
INSERT INTO `oc_area` VALUES ('610526', '蒲城县', '3', '610500');
INSERT INTO `oc_area` VALUES ('610527', '白水县', '3', '610500');
INSERT INTO `oc_area` VALUES ('610528', '富平县', '3', '610500');
INSERT INTO `oc_area` VALUES ('610581', '韩城市', '3', '610500');
INSERT INTO `oc_area` VALUES ('610582', '华阴市', '3', '610500');
INSERT INTO `oc_area` VALUES ('610601', '市辖区', '3', '610600');
INSERT INTO `oc_area` VALUES ('610602', '宝塔区', '3', '610600');
INSERT INTO `oc_area` VALUES ('610621', '延长县', '3', '610600');
INSERT INTO `oc_area` VALUES ('610622', '延川县', '3', '610600');
INSERT INTO `oc_area` VALUES ('610623', '子长县', '3', '610600');
INSERT INTO `oc_area` VALUES ('610624', '安塞县', '3', '610600');
INSERT INTO `oc_area` VALUES ('610625', '志丹县', '3', '610600');
INSERT INTO `oc_area` VALUES ('610626', '吴旗县', '3', '610600');
INSERT INTO `oc_area` VALUES ('610627', '甘泉县', '3', '610600');
INSERT INTO `oc_area` VALUES ('610628', '富　县', '3', '610600');
INSERT INTO `oc_area` VALUES ('610629', '洛川县', '3', '610600');
INSERT INTO `oc_area` VALUES ('610630', '宜川县', '3', '610600');
INSERT INTO `oc_area` VALUES ('610631', '黄龙县', '3', '610600');
INSERT INTO `oc_area` VALUES ('610632', '黄陵县', '3', '610600');
INSERT INTO `oc_area` VALUES ('610701', '市辖区', '3', '610700');
INSERT INTO `oc_area` VALUES ('610702', '汉台区', '3', '610700');
INSERT INTO `oc_area` VALUES ('610721', '南郑县', '3', '610700');
INSERT INTO `oc_area` VALUES ('610722', '城固县', '3', '610700');
INSERT INTO `oc_area` VALUES ('610723', '洋　县', '3', '610700');
INSERT INTO `oc_area` VALUES ('610724', '西乡县', '3', '610700');
INSERT INTO `oc_area` VALUES ('610725', '勉　县', '3', '610700');
INSERT INTO `oc_area` VALUES ('610726', '宁强县', '3', '610700');
INSERT INTO `oc_area` VALUES ('610727', '略阳县', '3', '610700');
INSERT INTO `oc_area` VALUES ('610728', '镇巴县', '3', '610700');
INSERT INTO `oc_area` VALUES ('610729', '留坝县', '3', '610700');
INSERT INTO `oc_area` VALUES ('610730', '佛坪县', '3', '610700');
INSERT INTO `oc_area` VALUES ('610801', '市辖区', '3', '610800');
INSERT INTO `oc_area` VALUES ('610802', '榆阳区', '3', '610800');
INSERT INTO `oc_area` VALUES ('610821', '神木县', '3', '610800');
INSERT INTO `oc_area` VALUES ('610822', '府谷县', '3', '610800');
INSERT INTO `oc_area` VALUES ('610823', '横山县', '3', '610800');
INSERT INTO `oc_area` VALUES ('610824', '靖边县', '3', '610800');
INSERT INTO `oc_area` VALUES ('610825', '定边县', '3', '610800');
INSERT INTO `oc_area` VALUES ('610826', '绥德县', '3', '610800');
INSERT INTO `oc_area` VALUES ('610827', '米脂县', '3', '610800');
INSERT INTO `oc_area` VALUES ('610828', '佳　县', '3', '610800');
INSERT INTO `oc_area` VALUES ('610829', '吴堡县', '3', '610800');
INSERT INTO `oc_area` VALUES ('610830', '清涧县', '3', '610800');
INSERT INTO `oc_area` VALUES ('610831', '子洲县', '3', '610800');
INSERT INTO `oc_area` VALUES ('610901', '市辖区', '3', '610900');
INSERT INTO `oc_area` VALUES ('610902', '汉滨区', '3', '610900');
INSERT INTO `oc_area` VALUES ('610921', '汉阴县', '3', '610900');
INSERT INTO `oc_area` VALUES ('610922', '石泉县', '3', '610900');
INSERT INTO `oc_area` VALUES ('610923', '宁陕县', '3', '610900');
INSERT INTO `oc_area` VALUES ('610924', '紫阳县', '3', '610900');
INSERT INTO `oc_area` VALUES ('610925', '岚皋县', '3', '610900');
INSERT INTO `oc_area` VALUES ('610926', '平利县', '3', '610900');
INSERT INTO `oc_area` VALUES ('610927', '镇坪县', '3', '610900');
INSERT INTO `oc_area` VALUES ('610928', '旬阳县', '3', '610900');
INSERT INTO `oc_area` VALUES ('610929', '白河县', '3', '610900');
INSERT INTO `oc_area` VALUES ('611001', '市辖区', '3', '611000');
INSERT INTO `oc_area` VALUES ('611002', '商州区', '3', '611000');
INSERT INTO `oc_area` VALUES ('611021', '洛南县', '3', '611000');
INSERT INTO `oc_area` VALUES ('611022', '丹凤县', '3', '611000');
INSERT INTO `oc_area` VALUES ('611023', '商南县', '3', '611000');
INSERT INTO `oc_area` VALUES ('611024', '山阳县', '3', '611000');
INSERT INTO `oc_area` VALUES ('611025', '镇安县', '3', '611000');
INSERT INTO `oc_area` VALUES ('611026', '柞水县', '3', '611000');
INSERT INTO `oc_area` VALUES ('620101', '市辖区', '3', '620100');
INSERT INTO `oc_area` VALUES ('620102', '城关区', '3', '620100');
INSERT INTO `oc_area` VALUES ('620103', '七里河区', '3', '620100');
INSERT INTO `oc_area` VALUES ('620104', '西固区', '3', '620100');
INSERT INTO `oc_area` VALUES ('620105', '安宁区', '3', '620100');
INSERT INTO `oc_area` VALUES ('620111', '红古区', '3', '620100');
INSERT INTO `oc_area` VALUES ('620121', '永登县', '3', '620100');
INSERT INTO `oc_area` VALUES ('620122', '皋兰县', '3', '620100');
INSERT INTO `oc_area` VALUES ('620123', '榆中县', '3', '620100');
INSERT INTO `oc_area` VALUES ('620201', '市辖区', '3', '620200');
INSERT INTO `oc_area` VALUES ('620301', '市辖区', '3', '620300');
INSERT INTO `oc_area` VALUES ('620302', '金川区', '3', '620300');
INSERT INTO `oc_area` VALUES ('620321', '永昌县', '3', '620300');
INSERT INTO `oc_area` VALUES ('620401', '市辖区', '3', '620400');
INSERT INTO `oc_area` VALUES ('620402', '白银区', '3', '620400');
INSERT INTO `oc_area` VALUES ('620403', '平川区', '3', '620400');
INSERT INTO `oc_area` VALUES ('620421', '靖远县', '3', '620400');
INSERT INTO `oc_area` VALUES ('620422', '会宁县', '3', '620400');
INSERT INTO `oc_area` VALUES ('620423', '景泰县', '3', '620400');
INSERT INTO `oc_area` VALUES ('620501', '市辖区', '3', '620500');
INSERT INTO `oc_area` VALUES ('620502', '秦城区', '3', '620500');
INSERT INTO `oc_area` VALUES ('620503', '北道区', '3', '620500');
INSERT INTO `oc_area` VALUES ('620521', '清水县', '3', '620500');
INSERT INTO `oc_area` VALUES ('620522', '秦安县', '3', '620500');
INSERT INTO `oc_area` VALUES ('620523', '甘谷县', '3', '620500');
INSERT INTO `oc_area` VALUES ('620524', '武山县', '3', '620500');
INSERT INTO `oc_area` VALUES ('620525', '张家川回族自治县', '3', '620500');
INSERT INTO `oc_area` VALUES ('620601', '市辖区', '3', '620600');
INSERT INTO `oc_area` VALUES ('620602', '凉州区', '3', '620600');
INSERT INTO `oc_area` VALUES ('620621', '民勤县', '3', '620600');
INSERT INTO `oc_area` VALUES ('620622', '古浪县', '3', '620600');
INSERT INTO `oc_area` VALUES ('620623', '天祝藏族自治县', '3', '620600');
INSERT INTO `oc_area` VALUES ('620701', '市辖区', '3', '620700');
INSERT INTO `oc_area` VALUES ('620702', '甘州区', '3', '620700');
INSERT INTO `oc_area` VALUES ('620721', '肃南裕固族自治县', '3', '620700');
INSERT INTO `oc_area` VALUES ('620722', '民乐县', '3', '620700');
INSERT INTO `oc_area` VALUES ('620723', '临泽县', '3', '620700');
INSERT INTO `oc_area` VALUES ('620724', '高台县', '3', '620700');
INSERT INTO `oc_area` VALUES ('620725', '山丹县', '3', '620700');
INSERT INTO `oc_area` VALUES ('620801', '市辖区', '3', '620800');
INSERT INTO `oc_area` VALUES ('620802', '崆峒区', '3', '620800');
INSERT INTO `oc_area` VALUES ('620821', '泾川县', '3', '620800');
INSERT INTO `oc_area` VALUES ('620822', '灵台县', '3', '620800');
INSERT INTO `oc_area` VALUES ('620823', '崇信县', '3', '620800');
INSERT INTO `oc_area` VALUES ('620824', '华亭县', '3', '620800');
INSERT INTO `oc_area` VALUES ('620825', '庄浪县', '3', '620800');
INSERT INTO `oc_area` VALUES ('620826', '静宁县', '3', '620800');
INSERT INTO `oc_area` VALUES ('620901', '市辖区', '3', '620900');
INSERT INTO `oc_area` VALUES ('620902', '肃州区', '3', '620900');
INSERT INTO `oc_area` VALUES ('620921', '金塔县', '3', '620900');
INSERT INTO `oc_area` VALUES ('620922', '安西县', '3', '620900');
INSERT INTO `oc_area` VALUES ('620923', '肃北蒙古族自治县', '3', '620900');
INSERT INTO `oc_area` VALUES ('620924', '阿克塞哈萨克族自治县', '3', '620900');
INSERT INTO `oc_area` VALUES ('620981', '玉门市', '3', '620900');
INSERT INTO `oc_area` VALUES ('620982', '敦煌市', '3', '620900');
INSERT INTO `oc_area` VALUES ('621001', '市辖区', '3', '621000');
INSERT INTO `oc_area` VALUES ('621002', '西峰区', '3', '621000');
INSERT INTO `oc_area` VALUES ('621021', '庆城县', '3', '621000');
INSERT INTO `oc_area` VALUES ('621022', '环　县', '3', '621000');
INSERT INTO `oc_area` VALUES ('621023', '华池县', '3', '621000');
INSERT INTO `oc_area` VALUES ('621024', '合水县', '3', '621000');
INSERT INTO `oc_area` VALUES ('621025', '正宁县', '3', '621000');
INSERT INTO `oc_area` VALUES ('621026', '宁　县', '3', '621000');
INSERT INTO `oc_area` VALUES ('621027', '镇原县', '3', '621000');
INSERT INTO `oc_area` VALUES ('621101', '市辖区', '3', '621100');
INSERT INTO `oc_area` VALUES ('621102', '安定区', '3', '621100');
INSERT INTO `oc_area` VALUES ('621121', '通渭县', '3', '621100');
INSERT INTO `oc_area` VALUES ('621122', '陇西县', '3', '621100');
INSERT INTO `oc_area` VALUES ('621123', '渭源县', '3', '621100');
INSERT INTO `oc_area` VALUES ('621124', '临洮县', '3', '621100');
INSERT INTO `oc_area` VALUES ('621125', '漳　县', '3', '621100');
INSERT INTO `oc_area` VALUES ('621126', '岷　县', '3', '621100');
INSERT INTO `oc_area` VALUES ('621201', '市辖区', '3', '621200');
INSERT INTO `oc_area` VALUES ('621202', '武都区', '3', '621200');
INSERT INTO `oc_area` VALUES ('621221', '成　县', '3', '621200');
INSERT INTO `oc_area` VALUES ('621222', '文　县', '3', '621200');
INSERT INTO `oc_area` VALUES ('621223', '宕昌县', '3', '621200');
INSERT INTO `oc_area` VALUES ('621224', '康　县', '3', '621200');
INSERT INTO `oc_area` VALUES ('621225', '西和县', '3', '621200');
INSERT INTO `oc_area` VALUES ('621226', '礼　县', '3', '621200');
INSERT INTO `oc_area` VALUES ('621227', '徽　县', '3', '621200');
INSERT INTO `oc_area` VALUES ('621228', '两当县', '3', '621200');
INSERT INTO `oc_area` VALUES ('622901', '临夏市', '3', '622900');
INSERT INTO `oc_area` VALUES ('622921', '临夏县', '3', '622900');
INSERT INTO `oc_area` VALUES ('622922', '康乐县', '3', '622900');
INSERT INTO `oc_area` VALUES ('622923', '永靖县', '3', '622900');
INSERT INTO `oc_area` VALUES ('622924', '广河县', '3', '622900');
INSERT INTO `oc_area` VALUES ('622925', '和政县', '3', '622900');
INSERT INTO `oc_area` VALUES ('622926', '东乡族自治县', '3', '622900');
INSERT INTO `oc_area` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '3', '622900');
INSERT INTO `oc_area` VALUES ('623001', '合作市', '3', '623000');
INSERT INTO `oc_area` VALUES ('623021', '临潭县', '3', '623000');
INSERT INTO `oc_area` VALUES ('623022', '卓尼县', '3', '623000');
INSERT INTO `oc_area` VALUES ('623023', '舟曲县', '3', '623000');
INSERT INTO `oc_area` VALUES ('623024', '迭部县', '3', '623000');
INSERT INTO `oc_area` VALUES ('623025', '玛曲县', '3', '623000');
INSERT INTO `oc_area` VALUES ('623026', '碌曲县', '3', '623000');
INSERT INTO `oc_area` VALUES ('623027', '夏河县', '3', '623000');
INSERT INTO `oc_area` VALUES ('630101', '市辖区', '3', '630100');
INSERT INTO `oc_area` VALUES ('630102', '城东区', '3', '630100');
INSERT INTO `oc_area` VALUES ('630103', '城中区', '3', '630100');
INSERT INTO `oc_area` VALUES ('630104', '城西区', '3', '630100');
INSERT INTO `oc_area` VALUES ('630105', '城北区', '3', '630100');
INSERT INTO `oc_area` VALUES ('630121', '大通回族土族自治县', '3', '630100');
INSERT INTO `oc_area` VALUES ('630122', '湟中县', '3', '630100');
INSERT INTO `oc_area` VALUES ('630123', '湟源县', '3', '630100');
INSERT INTO `oc_area` VALUES ('632121', '平安县', '3', '632100');
INSERT INTO `oc_area` VALUES ('632122', '民和回族土族自治县', '3', '632100');
INSERT INTO `oc_area` VALUES ('632123', '乐都县', '3', '632100');
INSERT INTO `oc_area` VALUES ('632126', '互助土族自治县', '3', '632100');
INSERT INTO `oc_area` VALUES ('632127', '化隆回族自治县', '3', '632100');
INSERT INTO `oc_area` VALUES ('632128', '循化撒拉族自治县', '3', '632100');
INSERT INTO `oc_area` VALUES ('632221', '门源回族自治县', '3', '632200');
INSERT INTO `oc_area` VALUES ('632222', '祁连县', '3', '632200');
INSERT INTO `oc_area` VALUES ('632223', '海晏县', '3', '632200');
INSERT INTO `oc_area` VALUES ('632224', '刚察县', '3', '632200');
INSERT INTO `oc_area` VALUES ('632321', '同仁县', '3', '632300');
INSERT INTO `oc_area` VALUES ('632322', '尖扎县', '3', '632300');
INSERT INTO `oc_area` VALUES ('632323', '泽库县', '3', '632300');
INSERT INTO `oc_area` VALUES ('632324', '河南蒙古族自治县', '3', '632300');
INSERT INTO `oc_area` VALUES ('632521', '共和县', '3', '632500');
INSERT INTO `oc_area` VALUES ('632522', '同德县', '3', '632500');
INSERT INTO `oc_area` VALUES ('632523', '贵德县', '3', '632500');
INSERT INTO `oc_area` VALUES ('632524', '兴海县', '3', '632500');
INSERT INTO `oc_area` VALUES ('632525', '贵南县', '3', '632500');
INSERT INTO `oc_area` VALUES ('632621', '玛沁县', '3', '632600');
INSERT INTO `oc_area` VALUES ('632622', '班玛县', '3', '632600');
INSERT INTO `oc_area` VALUES ('632623', '甘德县', '3', '632600');
INSERT INTO `oc_area` VALUES ('632624', '达日县', '3', '632600');
INSERT INTO `oc_area` VALUES ('632625', '久治县', '3', '632600');
INSERT INTO `oc_area` VALUES ('632626', '玛多县', '3', '632600');
INSERT INTO `oc_area` VALUES ('632721', '玉树县', '3', '632700');
INSERT INTO `oc_area` VALUES ('632722', '杂多县', '3', '632700');
INSERT INTO `oc_area` VALUES ('632723', '称多县', '3', '632700');
INSERT INTO `oc_area` VALUES ('632724', '治多县', '3', '632700');
INSERT INTO `oc_area` VALUES ('632725', '囊谦县', '3', '632700');
INSERT INTO `oc_area` VALUES ('632726', '曲麻莱县', '3', '632700');
INSERT INTO `oc_area` VALUES ('632801', '格尔木市', '3', '632800');
INSERT INTO `oc_area` VALUES ('632802', '德令哈市', '3', '632800');
INSERT INTO `oc_area` VALUES ('632821', '乌兰县', '3', '632800');
INSERT INTO `oc_area` VALUES ('632822', '都兰县', '3', '632800');
INSERT INTO `oc_area` VALUES ('632823', '天峻县', '3', '632800');
INSERT INTO `oc_area` VALUES ('640101', '市辖区', '3', '640100');
INSERT INTO `oc_area` VALUES ('640104', '兴庆区', '3', '640100');
INSERT INTO `oc_area` VALUES ('640105', '西夏区', '3', '640100');
INSERT INTO `oc_area` VALUES ('640106', '金凤区', '3', '640100');
INSERT INTO `oc_area` VALUES ('640121', '永宁县', '3', '640100');
INSERT INTO `oc_area` VALUES ('640122', '贺兰县', '3', '640100');
INSERT INTO `oc_area` VALUES ('640181', '灵武市', '3', '640100');
INSERT INTO `oc_area` VALUES ('640201', '市辖区', '3', '640200');
INSERT INTO `oc_area` VALUES ('640202', '大武口区', '3', '640200');
INSERT INTO `oc_area` VALUES ('640205', '惠农区', '3', '640200');
INSERT INTO `oc_area` VALUES ('640221', '平罗县', '3', '640200');
INSERT INTO `oc_area` VALUES ('640301', '市辖区', '3', '640300');
INSERT INTO `oc_area` VALUES ('640302', '利通区', '3', '640300');
INSERT INTO `oc_area` VALUES ('640323', '盐池县', '3', '640300');
INSERT INTO `oc_area` VALUES ('640324', '同心县', '3', '640300');
INSERT INTO `oc_area` VALUES ('640381', '青铜峡市', '3', '640300');
INSERT INTO `oc_area` VALUES ('640401', '市辖区', '3', '640400');
INSERT INTO `oc_area` VALUES ('640402', '原州区', '3', '640400');
INSERT INTO `oc_area` VALUES ('640422', '西吉县', '3', '640400');
INSERT INTO `oc_area` VALUES ('640423', '隆德县', '3', '640400');
INSERT INTO `oc_area` VALUES ('640424', '泾源县', '3', '640400');
INSERT INTO `oc_area` VALUES ('640425', '彭阳县', '3', '640400');
INSERT INTO `oc_area` VALUES ('640501', '市辖区', '3', '640500');
INSERT INTO `oc_area` VALUES ('640502', '沙坡头区', '3', '640500');
INSERT INTO `oc_area` VALUES ('640521', '中宁县', '3', '640500');
INSERT INTO `oc_area` VALUES ('640522', '海原县', '3', '640500');
INSERT INTO `oc_area` VALUES ('650101', '市辖区', '3', '650100');
INSERT INTO `oc_area` VALUES ('650102', '天山区', '3', '650100');
INSERT INTO `oc_area` VALUES ('650103', '沙依巴克区', '3', '650100');
INSERT INTO `oc_area` VALUES ('650104', '新市区', '3', '650100');
INSERT INTO `oc_area` VALUES ('650105', '水磨沟区', '3', '650100');
INSERT INTO `oc_area` VALUES ('650106', '头屯河区', '3', '650100');
INSERT INTO `oc_area` VALUES ('650107', '达坂城区', '3', '650100');
INSERT INTO `oc_area` VALUES ('650108', '东山区', '3', '650100');
INSERT INTO `oc_area` VALUES ('650121', '乌鲁木齐县', '3', '650100');
INSERT INTO `oc_area` VALUES ('650201', '市辖区', '3', '650200');
INSERT INTO `oc_area` VALUES ('650202', '独山子区', '3', '650200');
INSERT INTO `oc_area` VALUES ('650203', '克拉玛依区', '3', '650200');
INSERT INTO `oc_area` VALUES ('650204', '白碱滩区', '3', '650200');
INSERT INTO `oc_area` VALUES ('650205', '乌尔禾区', '3', '650200');
INSERT INTO `oc_area` VALUES ('652101', '吐鲁番市', '3', '652100');
INSERT INTO `oc_area` VALUES ('652122', '鄯善县', '3', '652100');
INSERT INTO `oc_area` VALUES ('652123', '托克逊县', '3', '652100');
INSERT INTO `oc_area` VALUES ('652201', '哈密市', '3', '652200');
INSERT INTO `oc_area` VALUES ('652222', '巴里坤哈萨克自治县', '3', '652200');
INSERT INTO `oc_area` VALUES ('652223', '伊吾县', '3', '652200');
INSERT INTO `oc_area` VALUES ('652301', '昌吉市', '3', '652300');
INSERT INTO `oc_area` VALUES ('652302', '阜康市', '3', '652300');
INSERT INTO `oc_area` VALUES ('652303', '米泉市', '3', '652300');
INSERT INTO `oc_area` VALUES ('652323', '呼图壁县', '3', '652300');
INSERT INTO `oc_area` VALUES ('652324', '玛纳斯县', '3', '652300');
INSERT INTO `oc_area` VALUES ('652325', '奇台县', '3', '652300');
INSERT INTO `oc_area` VALUES ('652327', '吉木萨尔县', '3', '652300');
INSERT INTO `oc_area` VALUES ('652328', '木垒哈萨克自治县', '3', '652300');
INSERT INTO `oc_area` VALUES ('652701', '博乐市', '3', '652700');
INSERT INTO `oc_area` VALUES ('652722', '精河县', '3', '652700');
INSERT INTO `oc_area` VALUES ('652723', '温泉县', '3', '652700');
INSERT INTO `oc_area` VALUES ('652801', '库尔勒市', '3', '652800');
INSERT INTO `oc_area` VALUES ('652822', '轮台县', '3', '652800');
INSERT INTO `oc_area` VALUES ('652823', '尉犁县', '3', '652800');
INSERT INTO `oc_area` VALUES ('652824', '若羌县', '3', '652800');
INSERT INTO `oc_area` VALUES ('652825', '且末县', '3', '652800');
INSERT INTO `oc_area` VALUES ('652826', '焉耆回族自治县', '3', '652800');
INSERT INTO `oc_area` VALUES ('652827', '和静县', '3', '652800');
INSERT INTO `oc_area` VALUES ('652828', '和硕县', '3', '652800');
INSERT INTO `oc_area` VALUES ('652829', '博湖县', '3', '652800');
INSERT INTO `oc_area` VALUES ('652901', '阿克苏市', '3', '652900');
INSERT INTO `oc_area` VALUES ('652922', '温宿县', '3', '652900');
INSERT INTO `oc_area` VALUES ('652923', '库车县', '3', '652900');
INSERT INTO `oc_area` VALUES ('652924', '沙雅县', '3', '652900');
INSERT INTO `oc_area` VALUES ('652925', '新和县', '3', '652900');
INSERT INTO `oc_area` VALUES ('652926', '拜城县', '3', '652900');
INSERT INTO `oc_area` VALUES ('652927', '乌什县', '3', '652900');
INSERT INTO `oc_area` VALUES ('652928', '阿瓦提县', '3', '652900');
INSERT INTO `oc_area` VALUES ('652929', '柯坪县', '3', '652900');
INSERT INTO `oc_area` VALUES ('653001', '阿图什市', '3', '653000');
INSERT INTO `oc_area` VALUES ('653022', '阿克陶县', '3', '653000');
INSERT INTO `oc_area` VALUES ('653023', '阿合奇县', '3', '653000');
INSERT INTO `oc_area` VALUES ('653024', '乌恰县', '3', '653000');
INSERT INTO `oc_area` VALUES ('653101', '喀什市', '3', '653100');
INSERT INTO `oc_area` VALUES ('653121', '疏附县', '3', '653100');
INSERT INTO `oc_area` VALUES ('653122', '疏勒县', '3', '653100');
INSERT INTO `oc_area` VALUES ('653123', '英吉沙县', '3', '653100');
INSERT INTO `oc_area` VALUES ('653124', '泽普县', '3', '653100');
INSERT INTO `oc_area` VALUES ('653125', '莎车县', '3', '653100');
INSERT INTO `oc_area` VALUES ('653126', '叶城县', '3', '653100');
INSERT INTO `oc_area` VALUES ('653127', '麦盖提县', '3', '653100');
INSERT INTO `oc_area` VALUES ('653128', '岳普湖县', '3', '653100');
INSERT INTO `oc_area` VALUES ('653129', '伽师县', '3', '653100');
INSERT INTO `oc_area` VALUES ('653130', '巴楚县', '3', '653100');
INSERT INTO `oc_area` VALUES ('653131', '塔什库尔干塔吉克自治县', '3', '653100');
INSERT INTO `oc_area` VALUES ('653201', '和田市', '3', '653200');
INSERT INTO `oc_area` VALUES ('653221', '和田县', '3', '653200');
INSERT INTO `oc_area` VALUES ('653222', '墨玉县', '3', '653200');
INSERT INTO `oc_area` VALUES ('653223', '皮山县', '3', '653200');
INSERT INTO `oc_area` VALUES ('653224', '洛浦县', '3', '653200');
INSERT INTO `oc_area` VALUES ('653225', '策勒县', '3', '653200');
INSERT INTO `oc_area` VALUES ('653226', '于田县', '3', '653200');
INSERT INTO `oc_area` VALUES ('653227', '民丰县', '3', '653200');
INSERT INTO `oc_area` VALUES ('654002', '伊宁市', '3', '654000');
INSERT INTO `oc_area` VALUES ('654003', '奎屯市', '3', '654000');
INSERT INTO `oc_area` VALUES ('654021', '伊宁县', '3', '654000');
INSERT INTO `oc_area` VALUES ('654022', '察布查尔锡伯自治县', '3', '654000');
INSERT INTO `oc_area` VALUES ('654023', '霍城县', '3', '654000');
INSERT INTO `oc_area` VALUES ('654024', '巩留县', '3', '654000');
INSERT INTO `oc_area` VALUES ('654025', '新源县', '3', '654000');
INSERT INTO `oc_area` VALUES ('654026', '昭苏县', '3', '654000');
INSERT INTO `oc_area` VALUES ('654027', '特克斯县', '3', '654000');
INSERT INTO `oc_area` VALUES ('654028', '尼勒克县', '3', '654000');
INSERT INTO `oc_area` VALUES ('654201', '塔城市', '3', '654200');
INSERT INTO `oc_area` VALUES ('654202', '乌苏市', '3', '654200');
INSERT INTO `oc_area` VALUES ('654221', '额敏县', '3', '654200');
INSERT INTO `oc_area` VALUES ('654223', '沙湾县', '3', '654200');
INSERT INTO `oc_area` VALUES ('654224', '托里县', '3', '654200');
INSERT INTO `oc_area` VALUES ('654225', '裕民县', '3', '654200');
INSERT INTO `oc_area` VALUES ('654226', '和布克赛尔蒙古自治县', '3', '654200');
INSERT INTO `oc_area` VALUES ('654301', '阿勒泰市', '3', '654300');
INSERT INTO `oc_area` VALUES ('654321', '布尔津县', '3', '654300');
INSERT INTO `oc_area` VALUES ('654322', '富蕴县', '3', '654300');
INSERT INTO `oc_area` VALUES ('654323', '福海县', '3', '654300');
INSERT INTO `oc_area` VALUES ('654324', '哈巴河县', '3', '654300');
INSERT INTO `oc_area` VALUES ('654325', '青河县', '3', '654300');
INSERT INTO `oc_area` VALUES ('654326', '吉木乃县', '3', '654300');
INSERT INTO `oc_area` VALUES ('659001', '石河子市', '3', '659000');
INSERT INTO `oc_area` VALUES ('659002', '阿拉尔市', '3', '659000');
INSERT INTO `oc_area` VALUES ('659003', '图木舒克市', '3', '659000');
INSERT INTO `oc_area` VALUES ('659004', '五家渠市', '3', '659000');
INSERT INTO `oc_area` VALUES ('810001', '香港', '2', '810000');
INSERT INTO `oc_area` VALUES ('810002', '中西区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810003', '九龙城区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810004', '南区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810005', '黄大仙区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810006', '油尖旺区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810007', '葵青区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810008', '西贡区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810009', '屯门区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810010', '荃湾区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810011', '东区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810012', '观塘区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810013', '深水步区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810014', '湾仔区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810015', '离岛区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810016', '北区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810017', '沙田区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810018', '大埔区', '3', '810001');
INSERT INTO `oc_area` VALUES ('810019', '元朗区', '3', '810001');
INSERT INTO `oc_area` VALUES ('820001', '澳门', '2', '820000');
INSERT INTO `oc_area` VALUES ('820002', '澳门', '3', '820001');
INSERT INTO `oc_area` VALUES ('710001', '台北市', '2', '710000');
INSERT INTO `oc_area` VALUES ('710002', '台北县', '3', '710001');
INSERT INTO `oc_area` VALUES ('710003', '基隆市', '2', '710000');
INSERT INTO `oc_area` VALUES ('910005', '中山市', '3', '442000');
INSERT INTO `oc_area` VALUES ('710004', '花莲县', '3', '710003');
INSERT INTO `oc_area` VALUES ('910006', '东莞市', '3', '441900');

-- ----------------------------
-- Table structure for oc_area_agent
-- ----------------------------
DROP TABLE IF EXISTS `oc_area_agent`;
CREATE TABLE `oc_area_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '当前用户id',
  `pos_province` int(11) NOT NULL DEFAULT '0' COMMENT '省',
  `pos_city` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `pos_district` int(11) NOT NULL DEFAULT '0' COMMENT '区',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态,1：显示，0：隐藏',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oc_area_agent
-- ----------------------------

-- ----------------------------
-- Table structure for oc_area_agent_order
-- ----------------------------
DROP TABLE IF EXISTS `oc_area_agent_order`;
CREATE TABLE `oc_area_agent_order` (
  `id` int(11) NOT NULL,
  `service_number` varchar(255) NOT NULL COMMENT '服务号',
  `mid` int(11) NOT NULL COMMENT '用户id',
  `aere_agent_id` int(11) NOT NULL COMMENT '区域id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_sn` varchar(255) NOT NULL COMMENT '订单号',
  `create_time` time DEFAULT NULL,
  `update_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oc_area_agent_order
-- ----------------------------

-- ----------------------------
-- Table structure for oc_cms_article
-- ----------------------------
DROP TABLE IF EXISTS `oc_cms_article`;
CREATE TABLE `oc_cms_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `cate_id` int(11) unsigned NOT NULL COMMENT '分类ID',
  `title` varchar(127) NOT NULL DEFAULT '' COMMENT '标题',
  `abstract` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `content` text NOT NULL COMMENT '正文内容',
  `tags` varchar(127) NOT NULL COMMENT '标签',
  `cover` int(11) NOT NULL DEFAULT '0' COMMENT '封面图片ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `mid` bigint(11) NOT NULL DEFAULT '0' COMMENT '某用户标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of oc_cms_article
-- ----------------------------
INSERT INTO `oc_cms_article` VALUES ('1', '4', '下单后可以修改订单吗？', '', '<p>由京东快递发货的自营（非自提）订单，在订单打印之前可以修改，打开“订单详情”页面，点击右上角的“修改订单”即可，若没有修改订单按钮，则表示订单无法修改。</p><p>注：</p><p>1. 修改订单可能影响送货时间。</p><p>2. 修改时将以当前商品信息为准，修改时需要注意查看活动信息。</p><p>3. 由于订单生产速度快，可能出现修改不成功的情况。</p><p><br/></p>', '', '0', '1482206801', '1482310224', '22', '0', '0');
INSERT INTO `oc_cms_article` VALUES ('2', '4', '为什么购物车中显示有货，去结算时无货？', '', '<p>1.可能您未设置商品详情页面或购物车右上角的“配送至地区”，如果“结算页面设置的地区”和“购物车中的配送至地区”不同，有些商品在本地区无货，但别的地区还有货，建议去结算前请先核对页面右上角的“配送至地区”，看是否有货；</p><p>2.可能因为抢购（特别是紧俏的商品），没有抢购到，若别的地区还有货，修改收货地区后，请尝试重新购买；&nbsp;</p><p>3.赠品在购物车中没显示库存信息，结算时赠品如果显示无货，可以回到购物车页中删除赠品后继续下单。</p><p><br/></p>', '', '0', '1482310156', '0', '0', '0', '0');
INSERT INTO `oc_cms_article` VALUES ('3', '4', '为什么参加', '', '<p>由京东快递发货的自营（非自提）订单，在订单打印之前可以修改，打开“订单详情”页面，点击右上角的“修改订单”即可，若没有修改订单按钮，则表示订单无法修改。</p><p>注：</p><p>1. 修改订单可能影响送货时间。</p><p>2. 修改时将以当前商品信息为准，修改时需要注意查看活动信息。</p><p>3. 由于订单生产速度快，可能出现修改不成功的情况。</p><p><br/></p>', '', '0', '1482310314', '1482738967', '0', '0', '0');

-- ----------------------------
-- Table structure for oc_cms_category
-- ----------------------------
DROP TABLE IF EXISTS `oc_cms_category`;
CREATE TABLE `oc_cms_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父类ID',
  `cate_name` varchar(32) NOT NULL DEFAULT '' COMMENT '分类名称',
  `cover` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '图片ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='cms分类表';

-- ----------------------------
-- Records of oc_cms_category
-- ----------------------------
INSERT INTO `oc_cms_category` VALUES ('4', '0', '平台公告', '519', '1482202897', '0', '0', '1');
INSERT INTO `oc_cms_category` VALUES ('9', '0', '促销活动', '0', '1486197325', '0', '0', '1');

-- ----------------------------
-- Table structure for oc_goods
-- ----------------------------
DROP TABLE IF EXISTS `oc_goods`;
CREATE TABLE `oc_goods` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `info_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '基本信息ID',
  `sku` varchar(255) NOT NULL DEFAULT '' COMMENT '商品编码',
  `putway` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '上架状态 1：上架 0：下架\r\n',
  `price` decimal(12,2) DEFAULT NULL COMMENT '市场价',
  `costprice` decimal(12,2) DEFAULT NULL COMMENT '成本价',
  `barcode` varchar(32) DEFAULT '' COMMENT '商品条形码',
  `stocknum` double(12,2) DEFAULT NULL COMMENT '当前库存',
  `stockmax` double(12,2) DEFAULT NULL COMMENT '库存上限',
  `stockmin` double(12,2) DEFAULT NULL COMMENT '库存下限',
  `standard_value1` varchar(255) NOT NULL DEFAULT '' COMMENT '规格属性值一',
  `standard_value2` varchar(255) NOT NULL DEFAULT '' COMMENT '规格属性值二',
  `standard_value3` varchar(255) NOT NULL DEFAULT '' COMMENT '规格属性值三',
  `standard_value4` varchar(255) NOT NULL DEFAULT '' COMMENT '规格属性值四',
  `standard_value5` varchar(255) NOT NULL DEFAULT '' COMMENT '规格属性值五',
  `fenxiao_rate` decimal(12,2) DEFAULT NULL COMMENT '上级分佣比例',
  `daili_rate` decimal(12,2) NOT NULL COMMENT '代理佣金比例',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(2) unsigned DEFAULT '1' COMMENT '删除状态 1：未删除（默认）；0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of oc_goods
-- ----------------------------
INSERT INTO `oc_goods` VALUES ('49', '1', 'Lw22242850', '1', '1948.00', '1500.00', '', null, null, null, '13.3寸', '双核i5', '4g', '银灰色', '', '10.00', '0.00', '0', '0', '1');
INSERT INTO `oc_goods` VALUES ('50', '2', 'Lw81441704', '1', '2398.00', '2000.00', '', null, null, null, '14.3寸', '双核i6', '6g', '金色', '', '15.00', '0.00', '0', '0', '1');
INSERT INTO `oc_goods` VALUES ('51', '3', 'Lw13195148', '1', '8488.00', '8000.00', '', null, null, null, '15.3寸', '双核i7', '8g', '黑色', '', '10.00', '0.00', '0', '0', '1');

-- ----------------------------
-- Table structure for oc_goods_cart
-- ----------------------------
DROP TABLE IF EXISTS `oc_goods_cart`;
CREATE TABLE `oc_goods_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '用户id',
  `deviceid` varchar(255) NOT NULL COMMENT '设备号（主要用于支持免登陆加入购物车）',
  `goods_id` int(11) NOT NULL COMMENT '商品表ID',
  `info_id` int(11) NOT NULL COMMENT '商品基本信息id',
  `goods_sum` int(11) NOT NULL COMMENT '商品数量',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态,1：选中，0：未选中',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of oc_goods_cart
-- ----------------------------
INSERT INTO `oc_goods_cart` VALUES ('197', '22', '0', '51', '1', '2', '1546080270', '0', '1');

-- ----------------------------
-- Table structure for oc_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `oc_goods_category`;
CREATE TABLE `oc_goods_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父类ID',
  `cate_name` varchar(32) NOT NULL DEFAULT '' COMMENT '分类名称',
  `cover` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '图片ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of oc_goods_category
-- ----------------------------
INSERT INTO `oc_goods_category` VALUES ('59', '0', '手机数码', '0', '1486199792', '1545643638', '0', '1');
INSERT INTO `oc_goods_category` VALUES ('63', '0', '电脑办公', '0', '1545643624', '0', '0', '1');
INSERT INTO `oc_goods_category` VALUES ('64', '63', '笔记本', '559', '1545643687', '0', '0', '1');
INSERT INTO `oc_goods_category` VALUES ('60', '59', '手机', '556', '1545643413', '0', '0', '1');
INSERT INTO `oc_goods_category` VALUES ('61', '59', '对讲机', '557', '1545643482', '0', '0', '1');
INSERT INTO `oc_goods_category` VALUES ('62', '59', 'canon', '558', '1545643555', '0', '0', '1');
INSERT INTO `oc_goods_category` VALUES ('65', '63', '台式机', '560', '1545643739', '0', '0', '1');

-- ----------------------------
-- Table structure for oc_goods_collect
-- ----------------------------
DROP TABLE IF EXISTS `oc_goods_collect`;
CREATE TABLE `oc_goods_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '当前用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `info_id` int(11) NOT NULL COMMENT '商品信息ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='商品收藏表';

-- ----------------------------
-- Records of oc_goods_collect
-- ----------------------------
INSERT INTO `oc_goods_collect` VALUES ('12', '22', '51', '1', '1545999896', '0');

-- ----------------------------
-- Table structure for oc_goods_gallery
-- ----------------------------
DROP TABLE IF EXISTS `oc_goods_gallery`;
CREATE TABLE `oc_goods_gallery` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `info_id` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `cover` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '图片ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `info_id` (`info_id`),
  KEY `cover` (`cover`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品相册表';

-- ----------------------------
-- Records of oc_goods_gallery
-- ----------------------------
INSERT INTO `oc_goods_gallery` VALUES ('1', '1', '548', '0', '0');
INSERT INTO `oc_goods_gallery` VALUES ('2', '2', '549', '0', '0');
INSERT INTO `oc_goods_gallery` VALUES ('3', '3', '550', '0', '0');

-- ----------------------------
-- Table structure for oc_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `oc_goods_info`;
CREATE TABLE `oc_goods_info` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `sku` varchar(255) NOT NULL DEFAULT '' COMMENT '商品编码',
  `cate_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品类别ID',
  `brand_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品品牌',
  `unit_id` bigint(20) unsigned DEFAULT '0' COMMENT '计量单位',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `content` text COMMENT '产品介绍',
  `is_new` tinyint(4) NOT NULL DEFAULT '0' COMMENT '新品',
  `is_rec` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推荐',
  `is_hot` tinyint(4) NOT NULL DEFAULT '0' COMMENT '热销',
  `price` decimal(12,2) DEFAULT NULL COMMENT '市场价',
  `costprice` decimal(12,2) DEFAULT NULL COMMENT '成本价',
  `fenxiao_rate` decimal(12,2) DEFAULT NULL COMMENT '上级分佣比例',
  `daili_rate` decimal(12,2) DEFAULT NULL COMMENT '代理佣金比例',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `putway` tinyint(4) NOT NULL DEFAULT '1' COMMENT '上架状态 1：上架 0：下架',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='商品基本信息表';

-- ----------------------------
-- Records of oc_goods_info
-- ----------------------------
INSERT INTO `oc_goods_info` VALUES ('1', '华为 Nova 全网通(4GB+64GB)玫瑰金 移动版', 'Lw22242850', '60', '0', '0', '', null, '1', '1', '1', '1948.00', '1500.00', '10.00', null, '0', '0', '0', '1');
INSERT INTO `oc_goods_info` VALUES ('2', '华为 P9  公开版(3GB+32GB)钛银灰 联通版 移动联通4G手机 双卡双待', 'Lw81441704', '60', '0', '0', '', null, '1', '1', '1', '2398.00', '2000.00', '15.00', null, '0', '0', '0', '1');
INSERT INTO `oc_goods_info` VALUES ('3', 'Apple MacBook Air 13.3英寸笔记本电脑', 'Lw13195148', '64', '0', '0', '', null, '1', '1', '1', '10399.00', '10000.00', '10.00', null, '0', '0', '0', '1');

-- ----------------------------
-- Table structure for oc_goods_unit
-- ----------------------------
DROP TABLE IF EXISTS `oc_goods_unit`;
CREATE TABLE `oc_goods_unit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='商品单位表';

-- ----------------------------
-- Records of oc_goods_unit
-- ----------------------------
INSERT INTO `oc_goods_unit` VALUES ('24', '克', '1486200205', '0', '1');
INSERT INTO `oc_goods_unit` VALUES ('25', '斤', '1486200217', '0', '1');
INSERT INTO `oc_goods_unit` VALUES ('26', '尺寸', '1545706083', '0', '1');

-- ----------------------------
-- Table structure for oc_member
-- ----------------------------
DROP TABLE IF EXISTS `oc_member`;
CREATE TABLE `oc_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'mid',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(63) NOT NULL DEFAULT '' COMMENT '邮箱',
  `email_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮箱验证',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `mobile_bind` tinyint(1) NOT NULL DEFAULT '1' COMMENT '手机验证',
  `cover` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '头像图片ID',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分,保留字段',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `sex` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0：男，1：女',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  `name` varchar(255) DEFAULT '' COMMENT '姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='用户账号表';

-- ----------------------------
-- Records of oc_member
-- ----------------------------
INSERT INTO `oc_member` VALUES ('22', '0', '小汪', 'e10adc3949ba59abbe56e057f20f883e', '', '0', '13058185654', '1', '0', '0', '0.00', '0', '1545570430', '0', '1', '');

-- ----------------------------
-- Table structure for oc_member_address
-- ----------------------------
DROP TABLE IF EXISTS `oc_member_address`;
CREATE TABLE `oc_member_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '当前用户id',
  `name` varchar(255) NOT NULL DEFAULT '0' COMMENT '收货人名称',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机',
  `pos_province` int(11) NOT NULL DEFAULT '0' COMMENT '省',
  `pos_city` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `pos_district` int(11) NOT NULL DEFAULT '0' COMMENT '区',
  `pos_name` varchar(255) NOT NULL DEFAULT '' COMMENT '省市区',
  `address_info` text NOT NULL COMMENT '具体收货地址',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1:默认收货地址，0：非默认收货地址',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态,1：显示，0：隐藏',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='收货地址表';

-- ----------------------------
-- Records of oc_member_address
-- ----------------------------
INSERT INTO `oc_member_address` VALUES ('131', '22', '小蔡', '15927074359', '0', '0', '0', '湖北省武汉市武昌区', '武汉职业技术学院', '0', '1545627201', '0', '1');
INSERT INTO `oc_member_address` VALUES ('132', '22', '小蔡', '15927074359', '0', '0', '0', '湖北省武汉市武昌区', '武汉职业技术学院', '0', '1545627245', '0', '1');
INSERT INTO `oc_member_address` VALUES ('133', '22', '明真', '13059243816', '0', '0', '0', '北京市北京市朝阳区', '武汉职业技术学院', '0', '1545632993', '0', '1');
INSERT INTO `oc_member_address` VALUES ('134', '22', '汪春景', '13058185654', '0', '0', '0', '广东省深圳市宝安区', '固戍南昌公园', '1', '1545633867', '0', '1');

-- ----------------------------
-- Table structure for oc_member_card
-- ----------------------------
DROP TABLE IF EXISTS `oc_member_card`;
CREATE TABLE `oc_member_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '当前用户id',
  `card_number` varchar(255) NOT NULL DEFAULT '' COMMENT '卡号',
  `card_bank` varchar(255) NOT NULL DEFAULT '' COMMENT '开户银行',
  `auth_name` varchar(255) NOT NULL DEFAULT '' COMMENT '开户人姓名',
  `auth_number` varchar(255) NOT NULL DEFAULT '' COMMENT '开户人身份证号',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1:默认0：非默认',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态,1：正常，0：禁用或删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='银行卡表';

-- ----------------------------
-- Records of oc_member_card
-- ----------------------------

-- ----------------------------
-- Table structure for oc_member_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `oc_member_withdraw`;
CREATE TABLE `oc_member_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '当前用户id',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `recevie_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '实际到账',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：处理中，1：提现完成，2：提现失败',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='提现记录表';

-- ----------------------------
-- Records of oc_member_withdraw
-- ----------------------------
INSERT INTO `oc_member_withdraw` VALUES ('21', '22', '100.00', '75.00', '1546401380', '0', '0');

-- ----------------------------
-- Table structure for oc_order
-- ----------------------------
DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE `oc_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '当前用户id',
  `order_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `order_total` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '支付总计',
  `total_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '产品总计',
  `goods_sum` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品总数',
  `pay_ways` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付方式,1：微信，2：支付宝，3：货到付款',
  `name` varchar(255) NOT NULL DEFAULT '0' COMMENT '收货人名称',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人手机',
  `pos_province` int(11) NOT NULL DEFAULT '0' COMMENT '省',
  `pos_city` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `pos_district` int(11) NOT NULL DEFAULT '0' COMMENT '区',
  `trans_price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `trans_type` int(11) NOT NULL DEFAULT '0' COMMENT '配送方式，1,通用，2：仓库配送，3：物流配送',
  `trans_content` varchar(255) NOT NULL DEFAULT '' COMMENT '配送要求',
  `address_info` text NOT NULL COMMENT '具体收货地址',
  `content` text NOT NULL COMMENT '订单留言',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '返货仓库ID',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `payno` varchar(255) NOT NULL DEFAULT '' COMMENT '支付流水号',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：待付款，1：支付完成，待发货，2：已完成，3：已取消',
  PRIMARY KEY (`id`,`store_id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `mid` (`mid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='订单主表';

-- ----------------------------
-- Records of oc_order
-- ----------------------------
INSERT INTO `oc_order` VALUES ('57', '22', '2018122739883', '16976.00', '16976.00', '2.00', '0', '汪春景', '13058185654', '0', '0', '0', '0.00', '1', '', '固戍南昌公园', '麻烦物流快点吧', '0', '0', '', '1545910583', '0', '3');

-- ----------------------------
-- Table structure for oc_order_fenxiao
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_fenxiao`;
CREATE TABLE `oc_order_fenxiao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_mid` int(11) NOT NULL COMMENT '用户id',
  `to_mid` int(11) NOT NULL COMMENT '上线id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `effect_money` decimal(12,2) NOT NULL COMMENT '上线分佣总计',
  `area_agent_id` int(11) DEFAULT NULL COMMENT '区域代理id',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oc_order_fenxiao
-- ----------------------------
INSERT INTO `oc_order_fenxiao` VALUES ('1', '22', '1', '57', '550.00', '1', null, null);

-- ----------------------------
-- Table structure for oc_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_goods`;
CREATE TABLE `oc_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `info_id` int(11) NOT NULL COMMENT '商品信息表id',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_total` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品总计',
  `goods_sum` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品总数',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='订单商品表';

-- ----------------------------
-- Records of oc_order_goods
-- ----------------------------
INSERT INTO `oc_order_goods` VALUES ('90', '57', '51', '1', 'Apple MacBook Air 13.3英寸笔记本电脑', '16976.00', '2.00', '8488.00', '0', '0');

-- ----------------------------
-- Table structure for oc_standard
-- ----------------------------
DROP TABLE IF EXISTS `oc_standard`;
CREATE TABLE `oc_standard` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格ID',
  `info_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '规格商品ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规格名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格表';

-- ----------------------------
-- Records of oc_standard
-- ----------------------------

-- ----------------------------
-- Table structure for oc_standard_value
-- ----------------------------
DROP TABLE IF EXISTS `oc_standard_value`;
CREATE TABLE `oc_standard_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值ID',
  `info_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '规格商品ID',
  `standard_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '规格ID',
  `standard_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0：未选中，1：选中，-1：不可选',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规格属性值表';

-- ----------------------------
-- Records of oc_standard_value
-- ----------------------------

-- ----------------------------
-- Table structure for oc_store_area
-- ----------------------------
DROP TABLE IF EXISTS `oc_store_area`;
CREATE TABLE `oc_store_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_province` int(11) NOT NULL DEFAULT '0',
  `pos_city` int(11) NOT NULL DEFAULT '0',
  `pos_district` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1' COMMENT '仓库id  1：通用，2：仓库配送，3：物流配送',
  PRIMARY KEY (`id`,`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oc_store_area
-- ----------------------------
INSERT INTO `oc_store_area` VALUES ('1', '0', '0', '0', '3');

-- ----------------------------
-- Table structure for oc_store_template
-- ----------------------------
DROP TABLE IF EXISTS `oc_store_template`;
CREATE TABLE `oc_store_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basesum` int(11) NOT NULL COMMENT '最小数量',
  `baseprice` decimal(12,2) NOT NULL COMMENT '最小价格',
  `oversum` int(11) NOT NULL COMMENT '最大数量',
  `overprice` decimal(12,2) NOT NULL COMMENT '最大价格',
  `store_id` int(11) NOT NULL COMMENT '返货仓库ID',
  `is_common` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:默认，0：非默认收',
  PRIMARY KEY (`id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='总仓库通用自营运费模板';

-- ----------------------------
-- Records of oc_store_template
-- ----------------------------

-- ----------------------------
-- Table structure for oc_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oc_tokens`;
CREATE TABLE `oc_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '当前用户id',
  `deviceid` varchar(64) NOT NULL COMMENT '设备号',
  `token` varchar(64) NOT NULL COMMENT '令牌',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='用户Token表';

-- ----------------------------
-- Records of oc_tokens
-- ----------------------------
INSERT INTO `oc_tokens` VALUES ('26', '22', '', '279dc42367325c6f16dea3bec260688c35f19af3');

-- ----------------------------
-- Table structure for oc_trans_template
-- ----------------------------
DROP TABLE IF EXISTS `oc_trans_template`;
CREATE TABLE `oc_trans_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basesum` int(11) NOT NULL COMMENT '最小数量',
  `baseprice` decimal(12,2) NOT NULL COMMENT '最小价格',
  `oversum` int(11) NOT NULL COMMENT '最大数量',
  `overprice` decimal(12,2) NOT NULL,
  `store_id` int(11) NOT NULL,
  `is_common` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:默认，0：非默认收',
  `pos_province` int(11) NOT NULL DEFAULT '0',
  `pos_city` int(11) NOT NULL DEFAULT '0',
  `pos_district` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='总仓库通用物流模板';

-- ----------------------------
-- Records of oc_trans_template
-- ----------------------------
INSERT INTO `oc_trans_template` VALUES ('1', '10', '45.88', '500', '90.88', '3', '1', '0', '0', '0');
