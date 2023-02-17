/*
 Navicat Premium Data Transfer

 Source Server         : 47.108.94.36
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 47.108.94.36:3306
 Source Schema         : pddou

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 17/02/2023 21:48:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pddou_cinema
-- ----------------------------
DROP TABLE IF EXISTS `pddou_cinema`;
CREATE TABLE `pddou_cinema`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '影院id',
  `cinema_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '影院名称',
  `cinema_phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '影院电话',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '影院所在省份',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '影院所在市',
  `county` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '影院所在区县',
  `specified_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '影院详细地址',
  `employee_id` bigint NOT NULL COMMENT '员工ID（法定代表人）',
  `is_block` tinyint(1) NOT NULL DEFAULT 0 COMMENT '影院是否被拉黑（0-false，1-true）',
  `is_examine` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'HAVING_APPLY' COMMENT '审核（HAVING_APPLY-审核中，FAIL-审核失败，ON_ACTIVITY-审核通过）',
  `check_employee_id` bigint NULL DEFAULT NULL COMMENT '审核人ID',
  `check_time` datetime(6) NULL DEFAULT NULL COMMENT '审核时间',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_cinema
-- ----------------------------
INSERT INTO `pddou_cinema` VALUES (1, '横店电影城(庆丰店)', '13498476301', '广东', '广州', '白云区', '白云区庆丰广场路财智广场2楼', 4, 0, 'HAVING_APPLY', NULL, NULL, '2023-02-17 20:57:52.000000', '2023-02-17 20:58:04.000000');
INSERT INTO `pddou_cinema` VALUES (2, '尚影影院', '13745454545', '广东', '广州', '白云区', '白云区石夏路288号金铂广场7楼', 8, 0, 'HAVING_APPLY', NULL, NULL, '2023-02-17 20:57:52.000000', '2023-02-17 20:58:04.000000');

-- ----------------------------
-- Table structure for pddou_movie
-- ----------------------------
DROP TABLE IF EXISTS `pddou_movie`;
CREATE TABLE `pddou_movie`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '电影id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电影名称',
  `poster` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电影海报',
  `director` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '导演',
  `actor` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主演',
  `movie_long` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电影片长',
  `language` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电影语言版本',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电影简介',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电影类型',
  `public_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电影上映时间',
  `wish_num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '想看人数',
  `score` decimal(4, 1) NULL DEFAULT NULL COMMENT '电影综合评分',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_movie
-- ----------------------------

-- ----------------------------
-- Table structure for pddou_user
-- ----------------------------
DROP TABLE IF EXISTS `pddou_user`;
CREATE TABLE `pddou_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif' COMMENT '用户头像',
  `password` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户密码',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户手机号码',
  `gender` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '保密' COMMENT '用户性别',
  `birthday` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户出生年月日',
  `sign` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户签名',
  `points` int NOT NULL DEFAULT 0 COMMENT '用户积分',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  `locked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '锁定（0-false-默认，1-true）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE,
  UNIQUE INDEX `uk_phone`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_user
-- ----------------------------
INSERT INTO `pddou_user` VALUES (1, 'end', 'https://pddou.oss-cn-chengdu.aliyuncs.com/AD7945F9-B4FD-4D23-A76B-237531BCC0F4.jpg', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13414850282', '男', '2003-08-12', '我命由我不由天', 20, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (2, '张三', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13423232323', '男', '2001-04-08', '66666', 0, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (3, '13478565555', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13478565555', '男', NULL, '加油', 5, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (4, '13877777766', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13877777766', '男', NULL, '生而无畏', 0, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (5, '13482638273', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13482638273', '女', NULL, '向前跑，用尽全部力气', 3, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (6, '13428372632', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13428372632', '女', NULL, '生活不止眼前的枸杞，还有诗和远方', 3, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (7, '小李', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13414232321', '男', NULL, '一起加油', 0, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (8, '王大锤', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13412121211', '男', '1990-06-16', '开心就好', 0, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);

-- ----------------------------
-- Table structure for sys_employee
-- ----------------------------
DROP TABLE IF EXISTS `sys_employee`;
CREATE TABLE `sys_employee`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `gender` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'SECRET' COMMENT '性别（男-MALE，女-FEMALE，保密-SECRET-默认）',
  `type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号类型（平台-ADMINISTRATION，商家-MERCHANT）',
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户类型（超级管理员-SUPERADMIN，普通管理员-ADMIN，商家-STORE，员工-STAFF）',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父账号Id',
  `locked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '锁定（0-false-默认，1-true）',
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif' COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE,
  UNIQUE INDEX `uk_email`(`email`) USING BTREE,
  UNIQUE INDEX `uk_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_employee
-- ----------------------------
INSERT INTO `sys_employee` VALUES (1, '2022-12-10 21:21:44.000000', '2022-12-10 21:21:59.000000', 'admin', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '超级管理员', '123456@qq.com', '18888888888', 'SECRET', 'ADMINISTRATION', 'SUPERADMIN', 0, 0, 'https://pddou.oss-cn-chengdu.aliyuncs.com/AD7945F9-B4FD-4D23-A76B-237531BCC0F4.jpg');
INSERT INTO `sys_employee` VALUES (3, '2022-12-10 21:21:44.000000', '2023-01-12 21:47:36.839857', 'end', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '管理员', '1234567@qq.com', '16666666666', 'SECRET', 'ADMINISTRATION', 'ADMIN', 0, 0, 'https://pddou.oss-cn-chengdu.aliyuncs.com/pkq.jpg');
INSERT INTO `sys_employee` VALUES (4, '2022-12-10 21:21:44.000000', '2023-01-12 21:47:36.839857', 'store', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '商家', '158663854@qq.com', '15983067120', 'MALE', 'MERCHANT', 'STORE', 0, 0, 'https://pddou.oss-cn-chengdu.aliyuncs.com/pkq.jpg');
INSERT INTO `sys_employee` VALUES (5, '2022-12-10 21:21:44.000000', '2023-02-17 16:04:29.600689', 'jack', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '员工', '16689361@qq.com', '15889364452', 'MALE', 'MERCHANT', 'STAFF', 4, 1, 'https://pddou.oss-cn-chengdu.aliyuncs.com/pkq.jpg');
INSERT INTO `sys_employee` VALUES (7, '2023-02-17 16:41:23.029926', '2023-02-17 16:41:23.029926', 'wflin', '$2a$10$s2Qw8VELEYhTvDMaOmj9J.TQctZzypzAXAfHWWFqsdmC/EsoUDexu', '小白', '1667908814@qq.com', '15998074452', 'SECRET', 'ADMINISTRATION', 'ADMIN', 0, 0, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif');
INSERT INTO `sys_employee` VALUES (8, '2023-02-17 16:46:06.515414', '2023-02-17 16:54:14.286573', 'ggg', '$2a$10$UYcHnjoNXL/vgYy.kkxpZ.WO4rRGLkQLxAkRxaerwNXJNxCnKNCKi', '李俊基', '8894858@qq.com', '13988095568', 'MALE', 'MERCHANT', 'STORE', 0, 0, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif');

-- ----------------------------
-- Table structure for sys_employee_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_employee_role`;
CREATE TABLE `sys_employee_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  `employee_id` bigint NOT NULL COMMENT '平台id',
  `role_id` int NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_employee_role
-- ----------------------------
INSERT INTO `sys_employee_role` VALUES (1, '2022-12-15 21:47:34.000000', '2022-12-15 21:47:38.000000', 1, 1);
INSERT INTO `sys_employee_role` VALUES (2, '2023-02-16 16:15:48.000000', '2023-02-16 16:15:51.000000', 3, 2);
INSERT INTO `sys_employee_role` VALUES (3, '2023-02-16 18:18:15.000000', '2023-02-16 18:18:18.000000', 4, 3);
INSERT INTO `sys_employee_role` VALUES (4, '2023-02-16 18:18:29.000000', '2023-02-16 18:18:32.000000', 5, 4);
INSERT INTO `sys_employee_role` VALUES (5, '2023-02-17 16:41:23.061820', '2023-02-17 16:41:23.061820', 7, 2);
INSERT INTO `sys_employee_role` VALUES (6, '2023-02-17 16:46:06.543051', '2023-02-17 16:46:06.543051', 8, 3);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  `parent_id` int NULL DEFAULT 0 COMMENT '父节点（默认为0）',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名',
  `router` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '路由路径',
  `perms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限表达式',
  `is_show` tinyint NOT NULL DEFAULT 1 COMMENT '1为展示（默认），0为不展示',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '类型   0：目录（默认）   1：菜单   2：按钮',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  `operation_id` bigint NOT NULL COMMENT '操作者id',
  `operation_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作者类型 PC：用户 ADMIN：后台',
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源路径',
  `params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求携带参数',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ip地址',
  `ip_addr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '具体地址',
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES (1, '2022-12-28 17:53:42.221908', '2022-12-28 17:53:42.221908', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (2, '2022-12-28 17:56:23.194452', '2022-12-28 17:56:23.194452', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (3, '2022-12-28 17:56:50.089464', '2022-12-28 17:56:50.089464', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (4, '2022-12-28 17:57:47.807043', '2022-12-28 17:57:47.807043', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (5, '2022-12-28 18:03:17.924541', '2022-12-28 18:03:17.925543', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (6, '2022-12-28 18:03:41.832025', '2022-12-28 18:03:41.832025', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (7, '2022-12-28 18:06:35.213542', '2022-12-28 18:06:35.213542', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (8, '2022-12-28 18:11:16.764031', '2022-12-28 18:11:16.764031', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (9, '2022-12-28 18:25:44.440766', '2022-12-28 18:25:44.440766', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (10, '2022-12-28 18:27:20.707009', '2022-12-28 18:27:20.708029', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (11, '2022-12-28 18:27:22.823425', '2022-12-28 18:27:22.823425', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (12, '2022-12-28 20:04:28.311771', '2022-12-28 20:04:28.311771', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (13, '2022-12-28 20:06:32.716676', '2022-12-28 20:06:32.716676', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (14, '2022-12-28 20:06:33.188502', '2022-12-28 20:06:33.188502', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (15, '2022-12-28 20:09:23.773998', '2022-12-28 20:09:23.773998', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (16, '2022-12-28 20:09:57.274251', '2022-12-28 20:09:57.274251', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (17, '2022-12-28 20:11:05.927003', '2022-12-28 20:11:05.927003', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (18, '2022-12-28 20:13:33.769920', '2022-12-28 20:13:33.770917', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (19, '2022-12-28 20:13:36.527033', '2022-12-28 20:13:36.527033', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (20, '2023-01-03 21:03:55.152328', '2023-01-03 21:03:55.152328', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (21, '2023-01-06 20:19:42.837057', '2023-01-06 20:19:42.837057', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (22, '2023-01-06 21:33:00.287226', '2023-01-06 21:33:00.288254', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (23, '2023-01-06 22:48:54.457787', '2023-01-06 22:48:54.458784', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (24, '2023-01-12 17:22:52.192554', '2023-01-12 17:22:52.192554', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (25, '2023-01-12 18:24:00.123019', '2023-01-12 18:24:00.123019', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (26, '2023-01-12 19:31:18.734154', '2023-01-12 19:31:18.734154', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (27, '2023-01-12 20:47:00.332683', '2023-01-12 20:47:00.333680', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (28, '2023-01-12 20:47:32.386944', '2023-01-12 20:47:32.386944', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (29, '2023-01-12 20:51:42.883272', '2023-01-12 20:51:42.883272', 1, 'ADMIN', 'http://localhost:7001/admin/auth/changePwd', '{}', '127.0.0.1', NULL, '修改密码');
INSERT INTO `sys_operation_log` VALUES (30, '2023-01-12 20:59:58.729282', '2023-01-12 20:59:58.729282', 1, 'ADMIN', 'http://localhost:7001/admin/auth/changePwd', '{}', '127.0.0.1', NULL, '修改密码');
INSERT INTO `sys_operation_log` VALUES (31, '2023-01-12 21:01:31.464814', '2023-01-12 21:01:31.464814', 1, 'ADMIN', 'http://localhost:7001/admin/auth/changePwd', '{}', '127.0.0.1', NULL, '修改密码');
INSERT INTO `sys_operation_log` VALUES (32, '2023-01-12 21:04:22.999343', '2023-01-12 21:04:22.999343', 1, 'ADMIN', 'http://localhost:7001/admin/auth/changePwd', '{}', '127.0.0.1', NULL, '修改密码');
INSERT INTO `sys_operation_log` VALUES (33, '2023-01-12 21:16:57.048259', '2023-01-12 21:16:57.048259', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (34, '2023-01-12 21:17:21.612794', '2023-01-12 21:17:21.612794', 3, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (35, '2023-01-12 21:22:16.932542', '2023-01-12 21:22:16.932542', 3, 'ADMIN', 'http://localhost:7001/admin/auth/changePwd', '{}', '127.0.0.1', NULL, '修改密码');
INSERT INTO `sys_operation_log` VALUES (36, '2023-01-12 21:24:55.411012', '2023-01-12 21:24:55.411012', 3, 'ADMIN', 'http://localhost:7001/admin/auth/changePwd', '{}', '127.0.0.1', NULL, '修改密码');
INSERT INTO `sys_operation_log` VALUES (37, '2023-01-12 21:26:45.029394', '2023-01-12 21:26:45.029394', 3, 'ADMIN', 'http://localhost:7001/admin/auth/changePwd', '{}', '127.0.0.1', NULL, '修改密码');
INSERT INTO `sys_operation_log` VALUES (38, '2023-01-12 21:31:22.535431', '2023-01-12 21:31:22.535431', 3, 'ADMIN', 'http://localhost:7001/admin/auth/changePwd', '{}', '127.0.0.1', NULL, '修改密码');
INSERT INTO `sys_operation_log` VALUES (39, '2023-01-12 21:33:35.635674', '2023-01-12 21:33:35.635674', 3, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (40, '2023-01-12 21:38:32.087430', '2023-01-12 21:38:32.087430', 3, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (41, '2023-01-12 21:38:54.751055', '2023-01-12 21:38:54.751055', 3, 'ADMIN', 'http://localhost:7001/admin/auth/changePwd', '{}', '127.0.0.1', NULL, '修改密码');
INSERT INTO `sys_operation_log` VALUES (42, '2023-01-12 21:47:15.013908', '2023-01-12 21:47:15.013908', 3, 'ADMIN', 'http://localhost:7001/admin/auth/changePwd', '{}', '127.0.0.1', NULL, '修改密码');
INSERT INTO `sys_operation_log` VALUES (43, '2023-01-12 21:47:36.463104', '2023-01-12 21:47:36.463104', 3, 'ADMIN', 'http://localhost:7001/admin/auth/changePwd', '{}', '127.0.0.1', NULL, '修改密码');
INSERT INTO `sys_operation_log` VALUES (44, '2023-01-12 21:48:14.526875', '2023-01-12 21:48:14.526875', 3, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (45, '2023-01-12 21:49:28.294104', '2023-01-12 21:49:28.294104', 3, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (46, '2023-02-16 14:46:54.067574', '2023-02-16 14:46:54.067574', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (47, '2023-02-16 14:50:49.661803', '2023-02-16 14:50:49.661803', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (48, '2023-02-16 14:53:04.238647', '2023-02-16 14:53:04.238647', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (49, '2023-02-16 14:53:14.011444', '2023-02-16 14:53:14.011444', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (50, '2023-02-16 19:19:04.124580', '2023-02-16 19:19:04.124580', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (51, '2023-02-16 21:37:39.762613', '2023-02-16 21:37:39.762613', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (52, '2023-02-16 22:10:23.823073', '2023-02-16 22:10:23.823073', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (53, '2023-02-16 22:10:46.907751', '2023-02-16 22:10:46.907751', 3, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (54, '2023-02-16 22:12:26.164140', '2023-02-16 22:12:26.164140', 3, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (55, '2023-02-16 22:12:40.958733', '2023-02-16 22:12:40.958733', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (56, '2023-02-16 22:14:47.730614', '2023-02-16 22:14:47.730614', 4, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (57, '2023-02-16 22:15:19.107978', '2023-02-16 22:15:19.107978', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (58, '2023-02-16 22:18:09.063809', '2023-02-16 22:18:09.063809', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (59, '2023-02-16 22:27:14.006191', '2023-02-16 22:27:14.006191', 4, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (60, '2023-02-16 22:27:20.331310', '2023-02-16 22:27:20.331310', 3, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (61, '2023-02-17 15:54:46.223146', '2023-02-17 15:54:46.223146', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (62, '2023-02-17 15:55:08.293933', '2023-02-17 15:55:08.293933', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (63, '2023-02-17 15:56:23.830867', '2023-02-17 15:56:23.830867', 5, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (64, '2023-02-17 15:56:48.252432', '2023-02-17 15:56:48.252432', 5, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (65, '2023-02-17 15:56:57.495880', '2023-02-17 15:56:57.495880', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (66, '2023-02-17 16:04:29.573928', '2023-02-17 16:04:29.573928', 1, 'ADMIN', 'http://localhost:7001/admin/employee/changeStatus', '{}', '127.0.0.1', NULL, '员工账号锁定操作');
INSERT INTO `sys_operation_log` VALUES (67, '2023-02-17 16:14:51.894237', '2023-02-17 16:14:51.894237', 1, 'ADMIN', 'http://localhost:7001/admin/employee/add', '{}', '127.0.0.1', NULL, '添加员工操作');
INSERT INTO `sys_operation_log` VALUES (68, '2023-02-17 16:23:01.090968', '2023-02-17 16:23:01.090968', 1, 'ADMIN', 'http://localhost:7001/admin/employee/add', '{}', '127.0.0.1', NULL, '添加员工操作');
INSERT INTO `sys_operation_log` VALUES (69, '2023-02-17 16:23:59.864247', '2023-02-17 16:23:59.864247', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (70, '2023-02-17 16:24:08.603723', '2023-02-17 16:24:08.603723', 6, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (71, '2023-02-17 16:24:41.131768', '2023-02-17 16:24:41.131768', 6, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (72, '2023-02-17 16:39:50.938896', '2023-02-17 16:39:50.938896', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (73, '2023-02-17 16:40:01.065133', '2023-02-17 16:40:01.065133', 1, 'ADMIN', 'http://localhost:7001/admin/employee/changeStatus', '{}', '127.0.0.1', NULL, '员工账号锁定操作');
INSERT INTO `sys_operation_log` VALUES (74, '2023-02-17 16:40:02.980233', '2023-02-17 16:40:02.980233', 1, 'ADMIN', 'http://localhost:7001/admin/employee/changeStatus', '{}', '127.0.0.1', NULL, '员工账号锁定操作');
INSERT INTO `sys_operation_log` VALUES (75, '2023-02-17 16:40:07.095841', '2023-02-17 16:40:07.095841', 1, 'ADMIN', 'http://localhost:7001/admin/employee/delete', '{\"employeeId\":[\"6\"]}', '127.0.0.1', NULL, '删除员工操作');
INSERT INTO `sys_operation_log` VALUES (76, '2023-02-17 16:41:22.860041', '2023-02-17 16:41:22.860041', 1, 'ADMIN', 'http://localhost:7001/admin/employee/add', '{}', '127.0.0.1', NULL, '添加员工操作');
INSERT INTO `sys_operation_log` VALUES (77, '2023-02-17 16:41:59.028754', '2023-02-17 16:41:59.028754', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (78, '2023-02-17 16:42:05.381354', '2023-02-17 16:42:05.381354', 7, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (79, '2023-02-17 16:46:06.391269', '2023-02-17 16:46:06.391269', 7, 'ADMIN', 'http://localhost:7001/admin/employee/add', '{}', '127.0.0.1', NULL, '添加员工操作');
INSERT INTO `sys_operation_log` VALUES (80, '2023-02-17 16:54:14.242240', '2023-02-17 16:54:14.243237', 7, 'ADMIN', 'http://localhost:7001/admin/employee/update', '{}', '127.0.0.1', NULL, '更新员工操作');
INSERT INTO `sys_operation_log` VALUES (81, '2023-02-17 17:04:09.952826', '2023-02-17 17:04:09.952826', 7, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (82, '2023-02-17 17:04:19.697603', '2023-02-17 17:04:19.697603', 8, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (83, '2023-02-17 17:05:28.330929', '2023-02-17 17:05:28.330929', 8, 'ADMIN', 'http://localhost:7001/admin/employee/add', '{}', '127.0.0.1', NULL, '添加员工操作');
INSERT INTO `sys_operation_log` VALUES (84, '2023-02-17 17:05:38.770618', '2023-02-17 17:05:38.770618', 8, 'ADMIN', 'http://localhost:7001/admin/employee/changeStatus', '{}', '127.0.0.1', NULL, '员工账号锁定操作');
INSERT INTO `sys_operation_log` VALUES (85, '2023-02-17 17:05:58.389906', '2023-02-17 17:05:58.389906', 8, 'ADMIN', 'http://localhost:7001/admin/employee/changeStatus', '{}', '127.0.0.1', NULL, '员工账号锁定操作');
INSERT INTO `sys_operation_log` VALUES (86, '2023-02-17 19:05:57.125537', '2023-02-17 19:05:57.125537', 8, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (87, '2023-02-17 19:06:13.171698', '2023-02-17 19:06:13.171698', 8, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (88, '2023-02-17 19:06:32.542838', '2023-02-17 19:06:32.542838', 7, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (89, '2023-02-17 19:06:44.312453', '2023-02-17 19:06:44.312453', 7, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (90, '2023-02-17 19:09:45.544821', '2023-02-17 19:09:45.544821', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (91, '2023-02-17 19:21:32.174360', '2023-02-17 19:21:32.174360', 1, 'ADMIN', 'http://localhost:7001/admin/employee/delete', '{\"employeeId\":[\"9\"]}', '127.0.0.1', NULL, '删除员工操作');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色描述',
  `role_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '2022-11-20 08:17:52.795388', '2022-11-20 08:17:52.795388', 'SUPERADMIN', '超级管理员', 'DEFAULT');
INSERT INTO `sys_role` VALUES (2, '2022-11-20 08:17:52.849945', '2022-11-20 08:17:52.849945', 'ADMIN', '普通管理员', 'DEFAULT');
INSERT INTO `sys_role` VALUES (3, '2022-11-20 08:17:52.904017', '2022-11-20 08:17:52.904017', 'STORE', '商家', 'BUSINESS');
INSERT INTO `sys_role` VALUES (4, '2022-11-20 08:17:52.952119', '2022-11-20 08:17:52.952119', 'STAFF', '员工', 'BUSINESS');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;