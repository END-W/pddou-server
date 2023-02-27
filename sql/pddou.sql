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

 Date: 27/02/2023 21:08:36
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
  `county` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '影院所在区县',
  `specified_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '影院详细地址',
  `employee_id` bigint NOT NULL COMMENT '员工ID（法定代表人）',
  `is_block` tinyint(1) NOT NULL DEFAULT 0 COMMENT '影院是否被拉黑（0-false，1-true）',
  `is_examine` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'HAVING_APPLY' COMMENT '审核（HAVING_APPLY-审核中，FAIL-审核失败，ON_ACTIVITY-审核通过）',
  `check_employee_id` bigint NULL DEFAULT NULL COMMENT '审核人ID',
  `check_time` datetime(6) NULL DEFAULT NULL COMMENT '审核时间',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  `legal_person` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '法定代表人',
  `lng` decimal(10, 6) NOT NULL COMMENT '经度',
  `lat` decimal(10, 6) NOT NULL COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_employee_id_cinema_phone`(`employee_id`, `cinema_phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_cinema
-- ----------------------------
INSERT INTO `pddou_cinema` VALUES (1, '横店电影城(庆丰店)', '13498476301', '广东', '广州', '白云区', '白云区庆丰广场路财智广场2楼', 4, 0, 'ON_ACTIVITY', 1, '2023-02-25 22:55:56.438091', '2023-02-17 20:57:52.000000', '2023-02-25 22:55:56.446069', '商家', 113.269054, 22.993812);
INSERT INTO `pddou_cinema` VALUES (2, '尚影影院', '13745454545', '广东', '广州', '白云区', '白云区石夏路288号金铂广场7楼', 8, 1, 'HAVING_APPLY', NULL, NULL, '2023-02-17 20:57:52.000000', '2023-02-25 22:56:24.756918', '李俊基', 113.101506, 23.052214);

-- ----------------------------
-- Table structure for pddou_comment
-- ----------------------------
DROP TABLE IF EXISTS `pddou_comment`;
CREATE TABLE `pddou_comment`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `movie_id` int NOT NULL COMMENT '电影id',
  `user_score` tinyint NOT NULL DEFAULT 0 COMMENT '用户评分',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户评论内容',
  `comment_date` datetime NOT NULL COMMENT '评论日期',
  `support_num` int NOT NULL COMMENT '点赞数',
  `is_pass` tinyint(1) NOT NULL DEFAULT 0 COMMENT '评论是否通过审核（默认0）',
  `parent_id` int NOT NULL DEFAULT 0 COMMENT '父id（默认0）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id_movie_id`(`user_id`, `movie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_comment
-- ----------------------------
INSERT INTO `pddou_comment` VALUES (1, 1, 1, 8, '很好看，有一起的吗？', '2023-02-21 21:17:27', 28, 1, 0);
INSERT INTO `pddou_comment` VALUES (2, 2, 3, 9, '很好看，挺悲伤的，让我哭一会！', '2023-02-21 21:20:14', 78, 1, 0);

-- ----------------------------
-- Table structure for pddou_hall
-- ----------------------------
DROP TABLE IF EXISTS `pddou_hall`;
CREATE TABLE `pddou_hall`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '影厅名称',
  `cinema_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name_cinema_id`(`name`, `cinema_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_hall
-- ----------------------------
INSERT INTO `pddou_hall` VALUES (1, '1号激光厅', 1);
INSERT INTO `pddou_hall` VALUES (8, '1号激光厅', 2);
INSERT INTO `pddou_hall` VALUES (2, '2号激光厅', 1);
INSERT INTO `pddou_hall` VALUES (9, '2号激光厅', 2);
INSERT INTO `pddou_hall` VALUES (3, '3号激光厅', 1);
INSERT INTO `pddou_hall` VALUES (6, '4号激光厅', 1);
INSERT INTO `pddou_hall` VALUES (7, '5号激光厅', 1);

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
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否上映（0-false，1-true-默认）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_movie
-- ----------------------------
INSERT INTO `pddou_movie` VALUES (1, '驯龙高手3', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/676110c423df4c429f78dc0b68435937.jpg', '迪恩·德布洛斯', '刘昊然', '130分钟', '英语', '统领伯克岛的酋长嗝嗝（刘昊然 配音），与阿丝翠德（亚美莉卡·费雷拉 配音）共同打造了一个奇妙而热闹的飞龙乌托邦。一只雌性光煞飞龙的意外出现，加上一个前所未有的威胁的到来，令嗝嗝和没牙仔不得不离开自己唯一的家园，前往他们本以为只存在于神话之中的隐秘之境。在发现自己真正的命运之后，飞龙与骑士将携手殊死奋战，保护他们所珍爱的一切。', '动漫', '2018-12-11', 0, 8.0, '2023-02-19 16:43:15.977763', '2023-02-19 17:36:06.421665', 1);
INSERT INTO `pddou_movie` VALUES (2, '夏目友人帐', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/c401b18212244ff88894be26f3b59718.jpg', '大森贵弘', '村濑步', '105分钟', '日语', '唱片制作人张哲凯（刘以豪 饰）和王牌作词人宋媛媛（陈意涵 饰）相依为命，两人自幼身世坎坷只有彼此为伴，他们是亲人、是朋友，也彷佛是命中注定的另一半。父亲罹患遗传重症而被母亲抛弃的哲凯，深怕自己随时会发病不久人世，始终没有跨出友谊的界线对媛媛展露爱意。眼见哲凯的病情加重，他暗自决定用剩余的生命完成他们之间的终曲，再为媛媛找个可以托付一生的好男人。这时，事业有成温柔体贴的医生（张书豪 饰）适时的出现让他成为照顾媛媛的最佳人选，二人按部就班发展着关系。一切看似都在哲凯的计划下进行。然而，故事远比这里所写更要悲伤', '言情', '2018-11-13', 12, 8.3, '2023-02-19 17:47:41.974124', '2023-02-22 15:43:45.653284', 0);
INSERT INTO `pddou_movie` VALUES (3, '比悲伤更悲伤的故事', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/dec50b4e94ce45ce96fccfb8fbd50368.jpg', '林孝谦', '陈庭妮', '105分钟', '国语', '唱片制作人张哲凯（刘以豪 饰）和王牌作词人宋媛媛（陈意涵 饰）相依为命，两人自幼身世坎坷只有彼此为伴，他们是亲人、是朋友，也彷佛是命中注定的另一半。父亲罹患遗传重症而被母亲抛弃的哲凯，深怕自己随时会发病不久人世，始终没有跨出友谊的界线对媛媛展露爱意。眼见哲凯的病情加重，他暗自决定用剩余的生命完成他们之间的终曲，再为媛媛找个可以托付一生的好男人。这时，事业有成温柔体贴的医生（张书豪 饰）适时的出现让他成为照顾媛媛的最佳人选，二人按部就班发展着关系。一切看似都在哲凯的计划下进行。然而，故事远比这里所写更要悲伤', '言情', '2018-09-01', 178, 9.0, '2023-02-19 22:51:36.000000', '2023-02-19 22:51:36.000000', 1);
INSERT INTO `pddou_movie` VALUES (4, '惊奇队长', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/e5b3623128424e3e85d2d683825e30e8.jpg', '瑞安·弗雷克', '本·门德尔森', '108分钟', '英语', '卡罗尔·丹弗斯（布丽·拉尔森 饰）是克里人的精英部队一员，但她挣扎着回忆过去，对于怎么获得超能力、以及之前的人生等超能力之前的人生，她只在梦中有片段不成章的记忆，这层困扰引起的情绪波动也进而影响她对超能力的掌控。所幸，在星际战队指挥官（裘德·洛 饰）的调教之下，卡罗尔·丹弗斯学会如何控制自己的超能力。一次外星任务中，卡罗尔·丹弗斯因故来到了地球，并遇到还是低阶探员的尼克·弗瑞（塞缪尔·杰克逊 饰），卡罗尔·丹弗斯与尼克·弗瑞一起追捕在地球惹事的变形人塔罗斯（本·门德尔森 饰），同时，也发现自己如何获得超能力。', '爱情', '2018-07-03', 0, NULL, '2023-02-19 23:04:01.000000', '2023-02-19 23:04:01.000000', 1);
INSERT INTO `pddou_movie` VALUES (5, '我的英雄学院', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/8a76aeed433d4707aba376577e4f331a.jpg', '长崎健司', '生濑胜久', '96分钟', '日语', '讲述在绝大多数人都有超能力的未来时代，没有天赋的异能少年，如何凭努力与坚持打破绝境，成长为最强英雄，守卫世界和平的故事。 剧场版以移动科研都市“我之岛”为舞台，描绘正反两派的殊死激战。在第一英雄被困之际，少年与英雄科同学拼死克敌，却在无意中探得隐秘真相，剧情随之反转', '科幻', '2018-08-13', 0, NULL, '2023-02-19 23:10:36.000000', '2023-02-19 23:11:06.523690', 1);

-- ----------------------------
-- Table structure for pddou_movie_cinema
-- ----------------------------
DROP TABLE IF EXISTS `pddou_movie_cinema`;
CREATE TABLE `pddou_movie_cinema`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` bigint NOT NULL COMMENT '电影ID',
  `cinema_id` bigint NOT NULL COMMENT '影院ID',
  `price` decimal(4, 2) NOT NULL COMMENT '票价',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否上映（0-false，1-true-默认）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_movie_id_cinema_id`(`movie_id`, `cinema_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_movie_cinema
-- ----------------------------
INSERT INTO `pddou_movie_cinema` VALUES (1, 1, 1, 39.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (2, 3, 1, 37.80, 1);
INSERT INTO `pddou_movie_cinema` VALUES (3, 2, 1, 43.90, 0);
INSERT INTO `pddou_movie_cinema` VALUES (7, 5, 1, 49.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (8, 4, 1, 57.80, 1);
INSERT INTO `pddou_movie_cinema` VALUES (9, 2, 2, 40.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (10, 4, 2, 39.80, 1);

-- ----------------------------
-- Table structure for pddou_order
-- ----------------------------
DROP TABLE IF EXISTS `pddou_order`;
CREATE TABLE `pddou_order`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `schedule_id` int UNSIGNED NOT NULL COMMENT '场次id',
  `order_num` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `order_date` datetime(6) NOT NULL COMMENT '订单日期',
  `ticket_num` tinyint UNSIGNED NOT NULL COMMENT '票数',
  `ticket_total_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '总票价',
  `order_seat_info` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '座位号',
  `pay_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NO_PAID' COMMENT '支付类型（NO_PAID-未支付-默认，PAID-已支付，FAILED-支付失败，RETURN-退票）',
  `ticket_code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '取票码',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '商家（0-false-默认，1-true）',
  `is_delete2` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户（0-false-默认，1-true）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_order
-- ----------------------------
INSERT INTO `pddou_order` VALUES (1, 1, 1, '13414850282', '2023-02-23 18:00:00.000000', 3, 119.70, '[25,26,35]', 'PAID', '341593', 0, 0);
INSERT INTO `pddou_order` VALUES (2, 2, 2, '13414865812', '2023-02-23 19:00:00.000000', 3, 113.40, '[26,25,35]', 'PAID', '612368', 0, 0);
INSERT INTO `pddou_order` VALUES (3, 3, 3, '13415667789', '2023-01-19 00:00:00.000000', 2, 75.60, '[32,33]', 'NO_PAID', '566712', 0, 0);

-- ----------------------------
-- Table structure for pddou_schedule
-- ----------------------------
DROP TABLE IF EXISTS `pddou_schedule`;
CREATE TABLE `pddou_schedule`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` int UNSIGNED NOT NULL COMMENT '电影id',
  `cinema_id` int UNSIGNED NOT NULL COMMENT '影院id',
  `hall_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '影厅名',
  `show_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '放映日期',
  `show_time` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '放映时间',
  `seat_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '座位信息',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_movie_id_cinema_id_show_date_time`(`movie_id`, `cinema_id`, `show_date`, `show_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_schedule
-- ----------------------------
INSERT INTO `pddou_schedule` VALUES (1, 1, 1, '1号激光厅', '2023-02-24', '20:05', '[25,26,35]');
INSERT INTO `pddou_schedule` VALUES (2, 2, 2, '1号激光厅', '2023-02-24', '16:05', '[35,26,24,25,15,14,45,46,36]');
INSERT INTO `pddou_schedule` VALUES (3, 3, 1, '1号激光厅', '2023-01-19', '15:30', '[31,32,33,34,35]');
INSERT INTO `pddou_schedule` VALUES (4, 4, 1, '2号激光厅', '2023-02-26', '10:00', NULL);
INSERT INTO `pddou_schedule` VALUES (7, 3, 1, '3号激光厅', '2023-02-27', '15:50', NULL);
INSERT INTO `pddou_schedule` VALUES (8, 4, 2, '2号激光厅', '2023-02-26', '10:35', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_user
-- ----------------------------
INSERT INTO `pddou_user` VALUES (1, 'end', 'https://pddou.oss-cn-chengdu.aliyuncs.com/AD7945F9-B4FD-4D23-A76B-237531BCC0F4.jpg', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13414850282', '男', '2003-08-12', '我命由我不由天', 20, '2023-02-17 20:00:12.000000', '2023-02-18 15:15:07.379144', 0);
INSERT INTO `pddou_user` VALUES (2, '张三', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13423232323', '男', '2001-04-08', '66666', 0, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (3, '13478565555', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13478565555', '男', NULL, '加油', 5, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (4, '13877777766', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13877777766', '男', NULL, '生而无畏', 0, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (5, '13482638273', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13482638273', '女', NULL, '向前跑，用尽全部力气', 3, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (6, '13428372632', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13428372632', '女', NULL, '生活不止眼前的枸杞，还有诗和远方', 3, '2023-02-17 20:00:12.000000', '2023-02-18 15:15:15.334073', 1);
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
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_employee
-- ----------------------------
INSERT INTO `sys_employee` VALUES (1, '2022-12-10 21:21:44.000000', '2022-12-10 21:21:59.000000', 'admin', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '超级管理员', '123456@qq.com', '18888888888', 'SECRET', 'ADMINISTRATION', 'SUPERADMIN', 0, 0, 'https://pddou.oss-cn-chengdu.aliyuncs.com/AD7945F9-B4FD-4D23-A76B-237531BCC0F4.jpg');
INSERT INTO `sys_employee` VALUES (3, '2022-12-10 21:21:44.000000', '2023-01-12 21:47:36.839857', 'end', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '管理员', '1234567@qq.com', '16666666666', 'SECRET', 'ADMINISTRATION', 'ADMIN', 0, 0, 'https://pddou.oss-cn-chengdu.aliyuncs.com/pkq.jpg');
INSERT INTO `sys_employee` VALUES (4, '2022-12-10 21:21:44.000000', '2023-01-12 21:47:36.839857', 'store', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '商家', '158663854@qq.com', '15983067120', 'MALE', 'MERCHANT', 'STORE', 0, 0, 'https://pddou.oss-cn-chengdu.aliyuncs.com/pkq.jpg');
INSERT INTO `sys_employee` VALUES (5, '2022-12-10 21:21:44.000000', '2023-02-17 16:04:29.600689', 'jack', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '员工', '16689361@qq.com', '15889364452', 'MALE', 'MERCHANT', 'STAFF', 4, 0, 'https://pddou.oss-cn-chengdu.aliyuncs.com/pkq.jpg');
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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 289 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_operation_log` VALUES (92, '2023-02-18 15:04:08.595974', '2023-02-18 15:04:08.595974', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (93, '2023-02-18 15:04:12.601322', '2023-02-18 15:04:12.601322', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (94, '2023-02-18 15:14:57.338467', '2023-02-18 15:14:57.338467', 1, 'ADMIN', 'http://localhost:7001/admin/user/changeStatus', '{}', '127.0.0.1', NULL, '用户账号锁定操作');
INSERT INTO `sys_operation_log` VALUES (95, '2023-02-18 15:15:07.348742', '2023-02-18 15:15:07.348742', 1, 'ADMIN', 'http://localhost:7001/admin/user/changeStatus', '{}', '127.0.0.1', NULL, '用户账号锁定操作');
INSERT INTO `sys_operation_log` VALUES (96, '2023-02-18 15:15:15.306391', '2023-02-18 15:15:15.306391', 1, 'ADMIN', 'http://localhost:7001/admin/user/changeStatus', '{}', '127.0.0.1', NULL, '用户账号锁定操作');
INSERT INTO `sys_operation_log` VALUES (97, '2023-02-18 15:23:39.195382', '2023-02-18 15:23:39.195382', 1, 'ADMIN', 'http://localhost:7001/admin/user/delete', '{\"userId\":[\"9\"]}', '127.0.0.1', NULL, '删除用户操作');
INSERT INTO `sys_operation_log` VALUES (98, '2023-02-18 15:25:30.351588', '2023-02-18 15:25:30.351588', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (99, '2023-02-18 15:25:40.913281', '2023-02-18 15:25:40.913281', 7, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (100, '2023-02-18 15:31:59.941047', '2023-02-18 15:31:59.941047', 7, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (101, '2023-02-18 15:32:12.826330', '2023-02-18 15:32:12.826330', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (102, '2023-02-18 15:32:23.378184', '2023-02-18 15:32:23.378184', 4, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (103, '2023-02-18 15:33:18.215207', '2023-02-18 15:33:18.215207', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (104, '2023-02-18 20:52:24.408689', '2023-02-18 20:52:24.408689', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (105, '2023-02-18 22:29:31.441737', '2023-02-18 22:29:31.441737', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (106, '2023-02-19 14:20:19.271426', '2023-02-19 14:20:19.271426', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (107, '2023-02-19 16:37:28.423308', '2023-02-19 16:37:28.423308', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (108, '2023-02-19 16:43:15.750515', '2023-02-19 16:43:15.750515', 1, 'ADMIN', 'http://localhost:7001/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (109, '2023-02-19 17:32:11.327665', '2023-02-19 17:32:11.327665', 1, 'ADMIN', 'http://localhost:7001/admin/movie/changeStatus', '{}', '127.0.0.1', NULL, '电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (110, '2023-02-19 17:36:06.315843', '2023-02-19 17:36:06.315843', 1, 'ADMIN', 'http://localhost:7001/admin/movie/changeStatus', '{}', '127.0.0.1', NULL, '电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (111, '2023-02-19 17:41:10.230557', '2023-02-19 17:41:10.230557', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (112, '2023-02-19 17:41:21.166085', '2023-02-19 17:41:21.166085', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (113, '2023-02-19 17:47:41.833284', '2023-02-19 17:47:41.833284', 1, 'ADMIN', 'http://localhost:7001/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (114, '2023-02-19 22:27:29.959754', '2023-02-19 22:27:29.959754', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (115, '2023-02-19 22:51:36.304014', '2023-02-19 22:51:36.304014', 1, 'ADMIN', 'http://localhost:7001/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (116, '2023-02-19 22:52:12.716940', '2023-02-19 22:52:12.716940', 1, 'ADMIN', 'http://localhost:7001/admin/movie/update', '{}', '127.0.0.1', NULL, '更新电影操作');
INSERT INTO `sys_operation_log` VALUES (117, '2023-02-19 23:04:01.351335', '2023-02-19 23:04:01.351335', 1, 'ADMIN', 'http://localhost:7001/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (118, '2023-02-19 23:04:57.348905', '2023-02-19 23:04:57.348905', 1, 'ADMIN', 'http://localhost:7001/admin/movie/update', '{}', '127.0.0.1', NULL, '更新电影操作');
INSERT INTO `sys_operation_log` VALUES (119, '2023-02-19 23:10:36.282931', '2023-02-19 23:10:36.282931', 1, 'ADMIN', 'http://localhost:7001/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (120, '2023-02-19 23:11:06.493273', '2023-02-19 23:11:06.493273', 1, 'ADMIN', 'http://localhost:7001/admin/movie/update', '{}', '127.0.0.1', NULL, '更新电影操作');
INSERT INTO `sys_operation_log` VALUES (121, '2023-02-20 15:07:05.340313', '2023-02-20 15:07:05.340313', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (122, '2023-02-20 15:07:17.772353', '2023-02-20 15:07:17.772353', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (123, '2023-02-20 15:07:20.288461', '2023-02-20 15:07:20.288461', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (124, '2023-02-20 15:12:43.817734', '2023-02-20 15:12:43.817734', 1, 'ADMIN', 'http://localhost:7001/admin/movie/changeStatus', '{}', '127.0.0.1', NULL, '电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (125, '2023-02-20 19:31:16.822328', '2023-02-20 19:31:16.822328', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (126, '2023-02-20 19:40:54.665480', '2023-02-20 19:40:54.665480', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (127, '2023-02-20 19:41:04.078545', '2023-02-20 19:41:04.078545', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (128, '2023-02-20 20:04:48.679928', '2023-02-20 20:04:48.679928', 4, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (129, '2023-02-20 20:04:51.556719', '2023-02-20 20:04:51.556719', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (130, '2023-02-20 20:05:03.341282', '2023-02-20 20:05:03.341282', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (131, '2023-02-20 20:05:09.125567', '2023-02-20 20:05:09.125567', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (132, '2023-02-20 20:29:48.460386', '2023-02-20 20:29:48.460386', 4, 'ADMIN', 'http://localhost:7001/admin/movie/updateByStore', '{}', '127.0.0.1', NULL, '商家更新电影操作');
INSERT INTO `sys_operation_log` VALUES (133, '2023-02-20 20:54:43.959318', '2023-02-20 20:54:43.959318', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (134, '2023-02-20 20:54:53.462681', '2023-02-20 20:54:53.462681', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (135, '2023-02-20 20:54:58.923786', '2023-02-20 20:54:58.923786', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (136, '2023-02-20 21:24:16.443235', '2023-02-20 21:24:16.443235', 4, 'ADMIN', 'http://localhost:7001/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (137, '2023-02-20 21:29:18.925287', '2023-02-20 21:29:18.925287', 4, 'ADMIN', 'http://localhost:7001/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (138, '2023-02-20 21:29:38.060078', '2023-02-20 21:29:38.060078', 4, 'ADMIN', 'http://localhost:7001/admin/movie/updateByStore', '{}', '127.0.0.1', NULL, '商家更新电影操作');
INSERT INTO `sys_operation_log` VALUES (139, '2023-02-20 21:30:01.138351', '2023-02-20 21:30:01.138351', 4, 'ADMIN', 'http://localhost:7001/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (140, '2023-02-20 21:30:30.926778', '2023-02-20 21:30:30.926778', 4, 'ADMIN', 'http://localhost:7001/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (141, '2023-02-20 21:31:00.705764', '2023-02-20 21:31:00.705764', 4, 'ADMIN', 'http://localhost:7001/admin/movie/deleteByStore', '{\"id\":[\"5\"]}', '127.0.0.1', NULL, '商家删除电影操作');
INSERT INTO `sys_operation_log` VALUES (142, '2023-02-20 21:34:16.647002', '2023-02-20 21:34:16.647002', 4, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (143, '2023-02-20 21:34:22.914377', '2023-02-20 21:34:22.914377', 7, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (144, '2023-02-20 21:34:36.663935', '2023-02-20 21:34:36.663935', 7, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (145, '2023-02-20 21:35:23.716153', '2023-02-20 21:35:23.716153', 8, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (146, '2023-02-20 21:35:41.260896', '2023-02-20 21:35:41.260896', 8, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (147, '2023-02-20 21:35:57.459054', '2023-02-20 21:35:57.459054', 5, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (148, '2023-02-20 21:36:36.244860', '2023-02-20 21:36:36.244860', 5, 'ADMIN', 'http://localhost:7001/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (149, '2023-02-20 21:37:02.497288', '2023-02-20 21:37:02.497288', 5, 'ADMIN', 'http://localhost:7001/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (150, '2023-02-21 17:44:29.144144', '2023-02-21 17:44:29.144144', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (151, '2023-02-21 18:50:53.414228', '2023-02-21 18:50:53.414228', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (152, '2023-02-21 18:51:00.320599', '2023-02-21 18:51:00.320599', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (153, '2023-02-21 18:51:11.476807', '2023-02-21 18:51:11.476807', 5, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (154, '2023-02-21 20:02:49.770013', '2023-02-21 20:02:49.770013', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (155, '2023-02-21 20:02:55.756591', '2023-02-21 20:02:55.756591', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (156, '2023-02-21 20:03:01.529012', '2023-02-21 20:03:01.530009', 5, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (157, '2023-02-21 20:05:54.999021', '2023-02-21 20:05:54.999021', 5, 'ADMIN', 'http://localhost:7001/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (158, '2023-02-21 20:06:28.715627', '2023-02-21 20:06:28.715627', 5, 'ADMIN', 'http://localhost:7001/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (159, '2023-02-21 20:14:48.720018', '2023-02-21 20:14:48.720018', 5, 'ADMIN', 'http://localhost:7001/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (160, '2023-02-21 20:15:32.521270', '2023-02-21 20:15:32.521270', 5, 'ADMIN', 'http://localhost:7001/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (161, '2023-02-21 20:15:39.156336', '2023-02-21 20:15:39.156336', 5, 'ADMIN', 'http://localhost:7001/admin/hall/deleteByStore', '{\"id\":[\"4\"]}', '127.0.0.1', NULL, '商家删除影厅操作');
INSERT INTO `sys_operation_log` VALUES (162, '2023-02-21 20:15:51.485831', '2023-02-21 20:15:51.485831', 5, 'ADMIN', 'http://localhost:7001/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (163, '2023-02-21 20:16:33.132469', '2023-02-21 20:16:33.132469', 5, 'ADMIN', 'http://localhost:7001/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (164, '2023-02-21 20:16:43.902578', '2023-02-21 20:16:43.902578', 5, 'ADMIN', 'http://localhost:7001/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (165, '2023-02-21 20:16:54.270477', '2023-02-21 20:16:54.270477', 5, 'ADMIN', 'http://localhost:7001/admin/hall/updateByStore', '{}', '127.0.0.1', NULL, '商家更新影厅操作');
INSERT INTO `sys_operation_log` VALUES (166, '2023-02-21 20:17:07.927823', '2023-02-21 20:17:07.927823', 5, 'ADMIN', 'http://localhost:7001/admin/hall/updateByStore', '{}', '127.0.0.1', NULL, '商家更新影厅操作');
INSERT INTO `sys_operation_log` VALUES (167, '2023-02-21 20:18:41.536494', '2023-02-21 20:18:41.537491', 5, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (168, '2023-02-21 20:18:48.310815', '2023-02-21 20:18:48.310815', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (169, '2023-02-21 20:19:23.306761', '2023-02-21 20:19:23.306761', 4, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (170, '2023-02-21 20:19:29.758183', '2023-02-21 20:19:29.758183', 7, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (171, '2023-02-21 22:39:53.550697', '2023-02-21 22:39:53.550697', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (172, '2023-02-21 23:07:53.588057', '2023-02-21 23:07:53.588057', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (173, '2023-02-21 23:08:00.530299', '2023-02-21 23:08:00.531331', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (174, '2023-02-22 12:39:26.238788', '2023-02-22 12:39:26.238788', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (175, '2023-02-22 12:39:38.629659', '2023-02-22 12:39:38.629659', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (176, '2023-02-22 12:39:59.419062', '2023-02-22 12:39:59.419062', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (177, '2023-02-22 13:01:45.110404', '2023-02-22 13:01:45.110404', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (178, '2023-02-22 13:11:50.107022', '2023-02-22 13:11:50.107022', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (179, '2023-02-22 13:12:42.630179', '2023-02-22 13:12:42.630179', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (180, '2023-02-22 13:16:17.041070', '2023-02-22 13:16:17.041070', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (181, '2023-02-22 13:17:02.672058', '2023-02-22 13:17:02.672058', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (182, '2023-02-22 13:18:06.168029', '2023-02-22 13:18:06.168029', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (183, '2023-02-22 13:19:12.041936', '2023-02-22 13:19:12.041936', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (184, '2023-02-22 13:19:50.665100', '2023-02-22 13:19:50.665100', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (185, '2023-02-22 13:20:35.941360', '2023-02-22 13:20:35.941360', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (186, '2023-02-22 15:20:07.203048', '2023-02-22 15:20:07.203048', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (187, '2023-02-22 15:20:15.849302', '2023-02-22 15:20:15.849302', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (188, '2023-02-22 15:20:29.429001', '2023-02-22 15:20:29.429001', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (189, '2023-02-22 15:21:45.809284', '2023-02-22 15:21:45.809284', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (190, '2023-02-22 15:21:57.555905', '2023-02-22 15:21:57.555905', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (191, '2023-02-22 15:22:47.446789', '2023-02-22 15:22:47.446789', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (192, '2023-02-22 15:23:07.464613', '2023-02-22 15:23:07.464613', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (193, '2023-02-22 15:24:00.082742', '2023-02-22 15:24:00.082742', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (194, '2023-02-22 15:24:41.632262', '2023-02-22 15:24:41.632262', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (195, '2023-02-22 15:25:06.588887', '2023-02-22 15:25:06.588887', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (196, '2023-02-22 15:25:13.433649', '2023-02-22 15:25:13.433649', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (197, '2023-02-22 15:25:17.929728', '2023-02-22 15:25:17.929728', 4, 'ADMIN', 'http://localhost:7001/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (198, '2023-02-22 15:25:57.072862', '2023-02-22 15:25:57.072862', 4, 'ADMIN', 'http://localhost:7001/admin/movie/updateByStore', '{}', '127.0.0.1', NULL, '商家更新电影操作');
INSERT INTO `sys_operation_log` VALUES (199, '2023-02-22 15:26:05.195191', '2023-02-22 15:26:05.195191', 4, 'ADMIN', 'http://localhost:7001/admin/movie/deleteByStore', '{\"id\":[\"4\"]}', '127.0.0.1', NULL, '商家删除电影操作');
INSERT INTO `sys_operation_log` VALUES (200, '2023-02-22 15:26:56.342671', '2023-02-22 15:26:56.342671', 4, 'ADMIN', 'http://localhost:7001/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (201, '2023-02-22 15:29:58.557431', '2023-02-22 15:29:58.557431', 4, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (202, '2023-02-22 15:30:01.714539', '2023-02-22 15:30:01.714539', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (203, '2023-02-22 15:31:00.370772', '2023-02-22 15:31:00.370772', 1, 'ADMIN', 'http://localhost:7001/admin/movie/changeStatus', '{}', '127.0.0.1', NULL, '电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (204, '2023-02-22 15:31:22.644473', '2023-02-22 15:31:22.644473', 1, 'ADMIN', 'http://localhost:7001/admin/movie/changeStatus', '{}', '127.0.0.1', NULL, '电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (205, '2023-02-22 15:43:42.191274', '2023-02-22 15:43:42.191274', 1, 'ADMIN', 'http://localhost:7001/admin/movie/changeStatus', '{}', '127.0.0.1', NULL, '电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (206, '2023-02-22 15:43:45.629348', '2023-02-22 15:43:45.629348', 1, 'ADMIN', 'http://localhost:7001/admin/movie/changeStatus', '{}', '127.0.0.1', NULL, '电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (207, '2023-02-22 15:55:42.449919', '2023-02-22 15:55:42.449919', 1, 'ADMIN', 'http://localhost:7001/admin/comment/changeStatus', '{}', '127.0.0.1', NULL, '评论审核-通过/未通过操作');
INSERT INTO `sys_operation_log` VALUES (208, '2023-02-22 15:55:50.465514', '2023-02-22 15:55:50.465514', 1, 'ADMIN', 'http://localhost:7001/admin/comment/changeStatus', '{}', '127.0.0.1', NULL, '评论审核-通过/未通过操作');
INSERT INTO `sys_operation_log` VALUES (209, '2023-02-22 15:55:58.159997', '2023-02-22 15:55:58.159997', 1, 'ADMIN', 'http://localhost:7001/admin/comment/changeStatus', '{}', '127.0.0.1', NULL, '评论审核-通过/未通过操作');
INSERT INTO `sys_operation_log` VALUES (210, '2023-02-22 15:56:37.004574', '2023-02-22 15:56:37.004574', 1, 'ADMIN', 'http://localhost:7001/admin/comment/changeStatus', '{}', '127.0.0.1', NULL, '评论审核-通过/未通过操作');
INSERT INTO `sys_operation_log` VALUES (211, '2023-02-22 15:58:16.292733', '2023-02-22 15:58:16.292733', 1, 'ADMIN', 'http://localhost:7001/admin/comment/changeStatus', '{}', '127.0.0.1', NULL, '评论审核-通过/未通过操作');
INSERT INTO `sys_operation_log` VALUES (212, '2023-02-22 15:58:49.579730', '2023-02-22 15:58:49.579730', 1, 'ADMIN', 'http://localhost:7001/admin/comment/delete', '{\"commentId\":[\"3\"]}', '127.0.0.1', NULL, '删除用户影评操作');
INSERT INTO `sys_operation_log` VALUES (213, '2023-02-22 16:12:08.134635', '2023-02-22 16:12:08.134635', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (214, '2023-02-22 16:12:14.955914', '2023-02-22 16:12:14.955914', 5, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (215, '2023-02-22 16:12:20.764065', '2023-02-22 16:12:20.764065', 5, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (216, '2023-02-22 16:12:24.854245', '2023-02-22 16:12:24.854245', 3, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (217, '2023-02-23 15:42:16.648169', '2023-02-23 15:42:16.648169', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (218, '2023-02-23 15:56:30.523957', '2023-02-23 15:56:30.523957', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (219, '2023-02-23 15:56:37.605032', '2023-02-23 15:56:37.605032', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (220, '2023-02-23 15:56:50.542977', '2023-02-23 15:56:50.542977', 4, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (221, '2023-02-23 15:56:55.145157', '2023-02-23 15:56:55.145157', 8, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (222, '2023-02-23 15:57:18.122958', '2023-02-23 15:57:18.122958', 8, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (223, '2023-02-23 15:57:30.704627', '2023-02-23 15:57:30.704627', 5, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (224, '2023-02-23 15:58:10.504615', '2023-02-23 15:58:10.504615', 5, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (225, '2023-02-23 15:58:16.197928', '2023-02-23 15:58:16.197928', 3, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (226, '2023-02-23 15:58:27.304931', '2023-02-23 15:58:27.304931', 3, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (227, '2023-02-23 15:58:33.443988', '2023-02-23 15:58:33.443988', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (228, '2023-02-23 15:58:51.174674', '2023-02-23 15:58:51.174674', 4, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (229, '2023-02-23 16:04:46.340707', '2023-02-23 16:04:46.340707', 8, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (230, '2023-02-23 16:05:04.337730', '2023-02-23 16:05:04.337730', 8, 'ADMIN', 'http://localhost:7001/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (231, '2023-02-23 16:05:13.940303', '2023-02-23 16:05:13.940303', 8, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (232, '2023-02-23 16:05:20.161173', '2023-02-23 16:05:20.161173', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (233, '2023-02-23 16:34:32.721876', '2023-02-23 16:34:32.721876', 4, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (234, '2023-02-23 16:34:34.454704', '2023-02-23 16:34:34.454704', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (235, '2023-02-23 17:40:31.495036', '2023-02-23 17:40:31.495036', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (236, '2023-02-23 17:40:48.354966', '2023-02-23 17:40:48.354966', 1, 'ADMIN', 'http://localhost:7001/admin/order/returnTicket', '{}', '127.0.0.1', NULL, '退票操作');
INSERT INTO `sys_operation_log` VALUES (237, '2023-02-23 17:43:17.618224', '2023-02-23 17:43:17.618224', 1, 'ADMIN', 'http://localhost:7001/admin/order/returnTicket', '{}', '127.0.0.1', NULL, '退票操作');
INSERT INTO `sys_operation_log` VALUES (238, '2023-02-23 17:45:03.815840', '2023-02-23 17:45:03.815840', 1, 'ADMIN', 'http://localhost:7001/admin/order/returnTicket', '{}', '127.0.0.1', NULL, '退票操作');
INSERT INTO `sys_operation_log` VALUES (239, '2023-02-23 17:47:11.812880', '2023-02-23 17:47:11.812880', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (240, '2023-02-23 17:47:18.947661', '2023-02-23 17:47:18.947661', 5, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (241, '2023-02-23 17:54:28.426663', '2023-02-23 17:54:28.426663', 5, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (242, '2023-02-23 17:54:33.197140', '2023-02-23 17:54:33.197140', 8, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (243, '2023-02-23 17:55:06.533562', '2023-02-23 17:55:06.533562', 8, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (244, '2023-02-23 17:55:11.402928', '2023-02-23 17:55:11.402928', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (245, '2023-02-23 17:55:24.476289', '2023-02-23 17:55:24.476289', 4, 'ADMIN', 'http://localhost:7001/admin/order/deleteByStore', '{\"orderId\":[\"4\"]}', '127.0.0.1', NULL, '商家删除订单操作');
INSERT INTO `sys_operation_log` VALUES (246, '2023-02-23 17:55:50.304550', '2023-02-23 17:55:50.304550', 4, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (247, '2023-02-23 17:55:52.641192', '2023-02-23 17:55:52.641192', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (248, '2023-02-24 14:49:02.753413', '2023-02-24 14:49:02.753413', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (249, '2023-02-24 14:52:10.987920', '2023-02-24 14:52:10.987920', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (250, '2023-02-24 14:52:16.995977', '2023-02-24 14:52:16.995977', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (251, '2023-02-24 17:11:14.783101', '2023-02-24 17:11:14.783101', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (252, '2023-02-24 17:30:46.440761', '2023-02-24 17:30:46.440761', 4, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (253, '2023-02-24 17:30:52.584362', '2023-02-24 17:30:52.584362', 8, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (254, '2023-02-24 22:26:46.887539', '2023-02-24 22:26:46.887539', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (255, '2023-02-24 22:26:52.212166', '2023-02-24 22:26:52.212166', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (256, '2023-02-24 22:26:59.822811', '2023-02-24 22:26:59.822811', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (257, '2023-02-25 15:35:52.650118', '2023-02-25 15:35:52.650118', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (258, '2023-02-25 15:37:10.828654', '2023-02-25 15:37:10.828654', 1, 'ADMIN', 'http://localhost:7001/admin/employee/add', '{}', '127.0.0.1', NULL, '添加员工操作');
INSERT INTO `sys_operation_log` VALUES (259, '2023-02-25 15:37:23.786402', '2023-02-25 15:37:23.786402', 1, 'ADMIN', 'http://localhost:7001/admin/employee/delete', '{\"employeeId\":[\"10\"],\"userType\":[\"SUPERADMIN\"]}', '127.0.0.1', NULL, '删除员工操作');
INSERT INTO `sys_operation_log` VALUES (260, '2023-02-25 15:38:39.773383', '2023-02-25 15:38:39.773383', 1, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (261, '2023-02-25 15:38:46.948978', '2023-02-25 15:38:46.948978', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (262, '2023-02-25 15:57:07.276202', '2023-02-25 15:57:07.276202', 4, 'ADMIN', 'http://localhost:7001/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (263, '2023-02-25 15:57:46.278451', '2023-02-25 15:57:46.278451', 4, 'ADMIN', 'http://localhost:7001/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (264, '2023-02-25 15:58:04.774464', '2023-02-25 15:58:04.774464', 4, 'ADMIN', 'http://localhost:7001/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (265, '2023-02-25 15:59:54.431383', '2023-02-25 15:59:54.431383', 4, 'ADMIN', 'http://localhost:7001/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (266, '2023-02-25 16:00:08.062894', '2023-02-25 16:00:08.062894', 4, 'ADMIN', 'http://localhost:7001/admin/schedule/deleteByStore', '{\"scheduleId\":[\"6\"]}', '127.0.0.1', NULL, '商家删除电场次操作');
INSERT INTO `sys_operation_log` VALUES (267, '2023-02-25 16:00:14.225270', '2023-02-25 16:00:14.225270', 4, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (268, '2023-02-25 16:00:19.423265', '2023-02-25 16:00:19.423265', 8, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (269, '2023-02-25 16:02:06.364873', '2023-02-25 16:02:06.364873', 8, 'ADMIN', 'http://localhost:7001/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (270, '2023-02-25 16:02:39.976418', '2023-02-25 16:02:39.976418', 8, 'ADMIN', 'http://localhost:7001/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (271, '2023-02-25 16:02:59.272935', '2023-02-25 16:02:59.272935', 8, 'ADMIN', 'http://localhost:7001/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (272, '2023-02-25 16:03:08.034125', '2023-02-25 16:03:08.034125', 5, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (273, '2023-02-25 21:40:16.913555', '2023-02-25 21:40:16.913555', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (274, '2023-02-25 22:53:19.452628', '2023-02-25 22:53:19.452628', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (275, '2023-02-25 22:53:19.490834', '2023-02-25 22:53:19.490834', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (276, '2023-02-25 22:53:39.583887', '2023-02-25 22:53:39.583887', 1, 'ADMIN', 'http://localhost:7001/admin/cinema/examineCinema', '{}', '127.0.0.1', NULL, '审核影院操作');
INSERT INTO `sys_operation_log` VALUES (277, '2023-02-25 22:55:41.008578', '2023-02-25 22:55:41.008578', 1, 'ADMIN', 'http://localhost:7001/admin/cinema/examineCinema', '{}', '127.0.0.1', NULL, '审核影院操作');
INSERT INTO `sys_operation_log` VALUES (278, '2023-02-25 22:55:53.825625', '2023-02-25 22:55:53.825625', 1, 'ADMIN', 'http://localhost:7001/admin/cinema/examineCinema', '{}', '127.0.0.1', NULL, '审核影院操作');
INSERT INTO `sys_operation_log` VALUES (279, '2023-02-25 22:56:24.734903', '2023-02-25 22:56:24.734903', 1, 'ADMIN', 'http://localhost:7001/admin/cinema/blockCinema', '{\"cinemaId\":[\"2\"]}', '127.0.0.1', NULL, '拉黑影院操作');
INSERT INTO `sys_operation_log` VALUES (280, '2023-02-26 18:45:18.684051', '2023-02-26 18:45:18.684051', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (281, '2023-02-26 18:45:52.362357', '2023-02-26 18:45:52.362357', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (282, '2023-02-26 18:58:50.248632', '2023-02-26 18:58:50.248632', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (283, '2023-02-26 19:08:36.484074', '2023-02-26 19:08:36.484074', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (284, '2023-02-26 20:14:05.543902', '2023-02-26 20:14:05.543902', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (285, '2023-02-26 20:14:17.756244', '2023-02-26 20:14:17.757242', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (286, '2023-02-26 20:17:38.530094', '2023-02-26 20:17:38.530094', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (287, '2023-02-26 21:38:01.042235', '2023-02-26 21:38:01.042235', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (288, '2023-02-26 22:38:41.254980', '2023-02-26 22:38:41.254980', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (289, '2023-02-27 16:47:31.645603', '2023-02-27 16:47:31.645603', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (290, '2023-02-27 18:01:25.341841', '2023-02-27 18:01:25.341841', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (291, '2023-02-27 19:40:42.117457', '2023-02-27 19:40:42.117457', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (292, '2023-02-27 20:44:41.771179', '2023-02-27 20:44:41.771179', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');

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
