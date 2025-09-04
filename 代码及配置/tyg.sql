/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : tyg

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 15/05/2024 23:32:35
*/

-- 设置数据库字符集为utf8mb4
SET NAMES utf8mb4;
-- 关闭外键检查，以避免约束问题
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buykecheng
-- ----------------------------
-- 如果表存在则删除表buykecheng
DROP TABLE IF EXISTS `buykecheng`;
-- 创建表buykecheng，用于存储课程信息
CREATE TABLE `buykecheng`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '课程名称',
  `leixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类型',
  `xueke` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学科',
  `feiyong` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '费用',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户账号',
  `goumaishijian` datetime(0) DEFAULT NULL COMMENT '购买时间',
  `sfsh` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '审核回复',
  `ispay` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for claut_conversations
-- ----------------------------
-- 如果表存在则删除表claut_conversations
DROP TABLE IF EXISTS `claut_conversations`;
-- 创建表claut_conversations，用于存储客户会话信息
CREATE TABLE `claut_conversations`  (
  `conversation_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '会话ID',
  `creation_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `admin_id` bigint(0) DEFAULT NULL COMMENT '管理员ID',
  `inquiry` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '咨询内容',
  `response` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '回复内容',
  `is_responded` int(0) DEFAULT NULL COMMENT '是否已回复',
  PRIMARY KEY (`conversation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户会话' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guanliyuan
-- ----------------------------
-- 如果表存在则删除表guanliyuan
DROP TABLE IF EXISTS `guanliyuan`;
-- 创建表guanliyuan，用于存储管理员信息
CREATE TABLE `guanliyuan`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jiaoyuzhixun
-- ----------------------------
-- 如果表存在则删除表jiaoyuzhixun
DROP TABLE IF EXISTS `jiaoyuzhixun`;
-- 创建表jiaoyuzhixun，用于存储教育咨询信息
CREATE TABLE `jiaoyuzhixun`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '简介',
  `picture` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kaosijilubiao
-- ----------------------------
-- 如果表存在则删除表kaosijilubiao
DROP TABLE IF EXISTS `kaosijilubiao`;
-- 创建表kaosijilubiao，用于存储考试记录信息
CREATE TABLE `kaosijilubiao`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` bigint(0) NOT NULL,
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(0) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '试卷名称',
  `questionid` bigint(0) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '试题名称',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '选项，json字符串',
  `score` bigint(0) DEFAULT 0 COMMENT '分值',
  `answer` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '答案解析',
  `myscore` bigint(0) NOT NULL DEFAULT 0 COMMENT '试题得分',
  `myanswer` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kecheng
-- ----------------------------
-- 如果表存在则删除表kecheng
DROP TABLE IF EXISTS `kecheng`;
-- 创建表kecheng，用于存储课程信息
CREATE TABLE `kecheng`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kechengmingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '课程名称',
  `wenjian` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户账号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kechengleixing
-- ----------------------------
-- 如果表存在则删除表kechengleixing
DROP TABLE IF EXISTS `kechengleixing`;
-- 创建表kechengleixing，用于存储课程类型信息
CREATE TABLE `kechengleixing`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `leixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kechengxinxi
-- ----------------------------
-- 如果表存在则删除表kechengxinxi
DROP TABLE IF EXISTS `kechengxinxi`;
-- 创建表kechengxinxi，用于存储课程详细信息
CREATE TABLE `kechengxinxi`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '课程名称',
  `leixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类型',
  `xueke` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学科',
  `shipin` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '视频',
  `laoshixingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '老师姓名',
  `feiyong` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '费用',
  `kechengtupian` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '课程图片',
  `fabushijian` date DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for liuyanban
-- ----------------------------
-- 如果表存在则删除表liuyanban
DROP TABLE IF EXISTS `liuyanban`;
-- 创建表liuyanban，用于存储留言板信息
CREATE TABLE `liuyanban`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(0) NOT NULL COMMENT '留言人id',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言内容',
  `reply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pinglun
-- ----------------------------
-- 如果表存在则删除表pinglun
DROP TABLE IF EXISTS `pinglun`;
-- 创建表pinglun，用于存储评论信息
CREATE TABLE `pinglun`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `refid` bigint(0) NOT NULL,
  `userid` bigint(0) NOT NULL,
  `nickname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shipindianbo
-- ----------------------------
-- 如果表存在则删除表shipindianbo
DROP TABLE IF EXISTS `shipindianbo`;
-- 创建表shipindianbo，用于存储视频点播信息
CREATE TABLE `shipindianbo`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shipinmingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '视频名称',
  `shipin` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '视频',
  `shipinjianjie` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '视频简介',
  `laiyuan` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '来源',
  `shangchuanshijian` datetime(0) DEFAULT NULL COMMENT '上传时间',
  `fengmian` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shouchang
-- ----------------------------
-- 如果表存在则删除表shouchang
DROP TABLE IF EXISTS `shouchang`;
-- 创建表shouchang，用于存储收藏信息
CREATE TABLE `shouchang`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(0) NOT NULL COMMENT '用户id',
  `refid` bigint(0) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shujujilubiao
-- ----------------------------
-- 如果表存在则删除表shujujilubiao
DROP TABLE IF EXISTS `shujujilubiao`;
-- 创建表shujujilubiao，用于存储数据记录信息
CREATE TABLE `shujujilubiao`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '帖子标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '帖子内容',
  `parentid` bigint(0) DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(0) NOT NULL COMMENT '用户id',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  `isdone` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sijuan
-- ----------------------------
-- 如果表存在则删除表sijuan
DROP TABLE IF EXISTS `sijuan`;
-- 创建表sijuan，用于存储试卷信息
CREATE TABLE `sijuan`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` int(0) NOT NULL,
  `status` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for siti
-- ----------------------------
-- 如果表存在则删除表siti
DROP TABLE IF EXISTS `siti`;
-- 创建表siti，用于存储试题信息
CREATE TABLE `siti`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paperid` bigint(0) NOT NULL,
  `papername` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `questionname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `score` bigint(0) DEFAULT 0,
  `answer` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `analysis` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `type` bigint(0) DEFAULT 0 COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(0) DEFAULT 100 COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `paperid`(`paperid`) USING BTREE,
  CONSTRAINT `siti_ibfk_1` FOREIGN KEY (`paperid`) REFERENCES `sijuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xiaoitongzhi
-- ----------------------------
-- 如果表存在则删除表xiaoitongzhi
DROP TABLE IF EXISTS `xiaoitongzhi`;
-- 创建表xiaoitongzhi，用于存储通知信息
CREATE TABLE `xiaoitongzhi`  (
  `id` bigint(0) NOT NULL,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tongzhibiaoti` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tongzhineirong` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fasongshijian` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xueke
-- ----------------------------
-- 如果表存在则删除表xueke
DROP TABLE IF EXISTS `xueke`;
-- 创建表xueke，用于存储学科信息
CREATE TABLE `xueke`  (
  `id` bigint(0) NOT NULL,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `xueke` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
-- 如果表存在则删除表yonghu
DROP TABLE IF EXISTS `yonghu`;
-- 创建表yonghu，用于存储用户信息
CREATE TABLE `yonghu`  (
  `id` bigint(0) NOT NULL,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mima` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `yonghuxingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `xingbie` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `shouji` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `youxiang` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `touxiang` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for your_table_name
-- ----------------------------
-- 如果表存在则删除表your_table_name
DROP TABLE IF EXISTS `your_table_name`;
-- 创建表your_table_name，用于存储用户提问和回复信息
CREATE TABLE `your_table_name`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` bigint(0) NOT NULL,
  `adminid` bigint(0) DEFAULT NULL,
  `ask` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `reply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `isreply` int(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zhiyeguihua
-- ----------------------------
-- 如果表存在则删除表zhiyeguihua
DROP TABLE IF EXISTS `zhiyeguihua`;
-- 创建表zhiyeguihua，用于存储职业规划信息
CREATE TABLE `zhiyeguihua`  (
  `id` bigint(0) NOT NULL,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ziwofenxi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `quelimubiao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `huanjingpingjia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `zhiyedingwei` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `shishicelve` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pingguyufankui` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fengmian` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `xingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `xingbie` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nianling` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `muqianzhiye` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- 恢复外键检查
SET FOREIGN_KEY_CHECKS = 1;