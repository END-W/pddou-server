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

 Date: 06/03/2023 22:23:37
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
  `cinema_phone` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '影院电话',
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
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_cinema
-- ----------------------------
INSERT INTO `pddou_cinema` VALUES (1, '横店电影城(庆丰店)', '023-87987490', '广东省', '广州', '白云区', '白云区庆丰广场路财智广场2楼', 4, 0, 'ON_ACTIVITY', 1, '2023-02-25 22:55:56.438091', '2023-02-17 20:57:52.000000', '2023-02-25 22:55:56.446069', '商家', 113.269054, 22.993812, '15983067120');
INSERT INTO `pddou_cinema` VALUES (2, '尚影影院', '023-86678533', '广东省', '佛山市', '白云区', '白云区石夏路288号金铂广场7楼', 8, 1, 'HAVING_APPLY', NULL, NULL, '2023-02-17 20:57:52.000000', '2023-02-28 22:38:26.324687', '李俊基', 113.101506, 23.052214, '13988095568');
INSERT INTO `pddou_cinema` VALUES (3, '太平洋影城(蜀西店)', '028-87718221', '四川省', '成都市', NULL, '高新西区蜀西路399号中海国际购物公园B1-301', 11, 0, 'ON_ACTIVITY', 1, '2023-03-01 20:50:42.074652', '2023-02-28 16:08:34.000000', '2023-03-01 20:50:42.077644', '吴起', 103.979593, 30.722622, '15993046978');
INSERT INTO `pddou_cinema` VALUES (5, '太平洋影城(金泉店)', '028-87592998', '四川省', '成都市', NULL, '金牛区两河西二路300号附301号3、4层', 14, 0, 'ON_ACTIVITY', 3, '2023-02-28 22:35:58.871874', '2023-02-28 22:31:28.589712', '2023-02-28 22:35:58.874901', '梦琪', 103.982045, 30.715903, '13558097745');
INSERT INTO `pddou_cinema` VALUES (6, '太平洋影城金辉店', '028-87991489', '四川省', '成都市', NULL, '郫都区百草路777号', 15, 0, 'HAVING_APPLY', NULL, NULL, '2023-03-01 16:11:38.128551', '2023-03-01 16:11:38.128551', '李超', 103.962148, 30.745178, '15889074553');
INSERT INTO `pddou_cinema` VALUES (7, '金逸影城（成都后花园爱琴海IMAX店）', '028-86126811', '四川省', '成都市', NULL, '郫都区犀浦国宁东路919号1栋1单元5楼26号', 16, 0, 'HAVING_APPLY', NULL, NULL, '2023-03-01 20:47:28.307626', '2023-03-01 20:47:28.307626', '张建', 103.990915, 30.737410, '13469878633');

-- ----------------------------
-- Table structure for pddou_comment
-- ----------------------------
DROP TABLE IF EXISTS `pddou_comment`;
CREATE TABLE `pddou_comment`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `movie_id` int NOT NULL COMMENT '电影id',
  `user_score` decimal(3, 1) NOT NULL DEFAULT 0.0 COMMENT '用户评分',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户评论内容',
  `comment_date` datetime NOT NULL COMMENT '评论日期',
  `support_num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',
  `is_pass` tinyint(1) NOT NULL DEFAULT 0 COMMENT '评论是否通过审核（默认0）',
  `parent_id` int NOT NULL DEFAULT 0 COMMENT '父id（默认0）',
  `support_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '点赞用户数组',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id_movie_id`(`user_id`, `movie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_comment
-- ----------------------------
INSERT INTO `pddou_comment` VALUES (1, 1, 1, 8.0, '心里难受，还要再看两遍，以后再也没机会在荧幕上看到无牙仔和小咯咯了。', '2023-03-06 22:09:52', 3, 0, 0, NULL);
INSERT INTO `pddou_comment` VALUES (2, 2, 3, 9.0, '很好看，挺悲伤的，让我哭一会！', '2023-02-21 21:20:14', 3, 1, 0, '[1,2,4]');
INSERT INTO `pddou_comment` VALUES (4, 1, 2, 9.0, '夏目真是太温暖了，每次看都会给我最温柔坚定的力量，这次剧场版也是一如既往地美好，带给我一整天好心情。', '2023-03-06 14:49:37', 0, 1, 0, NULL);
INSERT INTO `pddou_comment` VALUES (5, 2, 1, 8.0, '饱满的结局，但不是完美的谢幕，剧情太规整了，这个反派太老套，甚至连个配菜都不如...\n优点是视效升级以及最后结局的处理，让你失望了，现在我们可能还是不值得与龙共存。', '2023-03-06 17:31:33', 1, 1, 0, '[1]');

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
INSERT INTO `pddou_movie` VALUES (1, '驯龙高手3', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/676110c423df4c429f78dc0b68435937.jpg', '迪恩·德布洛斯', '刘昊然', '130分钟', '英语', '统领伯克岛的酋长嗝嗝（刘昊然 配音），与阿丝翠德（亚美莉卡·费雷拉 配音）共同打造了一个奇妙而热闹的飞龙乌托邦。一只雌性光煞飞龙的意外出现，加上一个前所未有的威胁的到来，令嗝嗝和没牙仔不得不离开自己唯一的家园，前往他们本以为只存在于神话之中的隐秘之境。在发现自己真正的命运之后，飞龙与骑士将携手殊死奋战，保护他们所珍爱的一切。', '动漫', '2018-12-11', 0, 8.0, '2023-02-19 16:43:15.977763', '2023-02-19 17:36:06.421665', 0);
INSERT INTO `pddou_movie` VALUES (2, '夏目友人帐', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/c401b18212244ff88894be26f3b59718.jpg', '大森贵弘', '村濑步', '105分钟', '日语', '唱片制作人张哲凯（刘以豪 饰）和王牌作词人宋媛媛（陈意涵 饰）相依为命，两人自幼身世坎坷只有彼此为伴，他们是亲人、是朋友，也彷佛是命中注定的另一半。父亲罹患遗传重症而被母亲抛弃的哲凯，深怕自己随时会发病不久人世，始终没有跨出友谊的界线对媛媛展露爱意。眼见哲凯的病情加重，他暗自决定用剩余的生命完成他们之间的终曲，再为媛媛找个可以托付一生的好男人。这时，事业有成温柔体贴的医生（张书豪 饰）适时的出现让他成为照顾媛媛的最佳人选，二人按部就班发展着关系。一切看似都在哲凯的计划下进行。然而，故事远比这里所写更要悲伤', '言情', '2018-11-13', 12, 8.3, '2023-02-19 17:47:41.974124', '2023-02-22 15:43:45.653284', 0);
INSERT INTO `pddou_movie` VALUES (3, '比悲伤更悲伤的故事', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/dec50b4e94ce45ce96fccfb8fbd50368.jpg', '林孝谦', '陈庭妮', '105分钟', '国语', '唱片制作人张哲凯（刘以豪 饰）和王牌作词人宋媛媛（陈意涵 饰）相依为命，两人自幼身世坎坷只有彼此为伴，他们是亲人、是朋友，也彷佛是命中注定的另一半。父亲罹患遗传重症而被母亲抛弃的哲凯，深怕自己随时会发病不久人世，始终没有跨出友谊的界线对媛媛展露爱意。眼见哲凯的病情加重，他暗自决定用剩余的生命完成他们之间的终曲，再为媛媛找个可以托付一生的好男人。这时，事业有成温柔体贴的医生（张书豪 饰）适时的出现让他成为照顾媛媛的最佳人选，二人按部就班发展着关系。一切看似都在哲凯的计划下进行。然而，故事远比这里所写更要悲伤', '言情', '2018-09-01', 178, 9.0, '2023-02-19 22:51:36.000000', '2023-02-19 22:51:36.000000', 0);
INSERT INTO `pddou_movie` VALUES (4, '惊奇队长', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/e5b3623128424e3e85d2d683825e30e8.jpg', '瑞安·弗雷克', '本·门德尔森', '108分钟', '英语', '卡罗尔·丹弗斯（布丽·拉尔森 饰）是克里人的精英部队一员，但她挣扎着回忆过去，对于怎么获得超能力、以及之前的人生等超能力之前的人生，她只在梦中有片段不成章的记忆，这层困扰引起的情绪波动也进而影响她对超能力的掌控。所幸，在星际战队指挥官（裘德·洛 饰）的调教之下，卡罗尔·丹弗斯学会如何控制自己的超能力。一次外星任务中，卡罗尔·丹弗斯因故来到了地球，并遇到还是低阶探员的尼克·弗瑞（塞缪尔·杰克逊 饰），卡罗尔·丹弗斯与尼克·弗瑞一起追捕在地球惹事的变形人塔罗斯（本·门德尔森 饰），同时，也发现自己如何获得超能力。', '爱情', '2018-07-03', 0, NULL, '2023-02-19 23:04:01.000000', '2023-02-19 23:04:01.000000', 0);
INSERT INTO `pddou_movie` VALUES (5, '我的英雄学院', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/8a76aeed433d4707aba376577e4f331a.jpg', '长崎健司', '生濑胜久', '96分钟', '日语', '讲述在绝大多数人都有超能力的未来时代，没有天赋的异能少年，如何凭努力与坚持打破绝境，成长为最强英雄，守卫世界和平的故事。 剧场版以移动科研都市“我之岛”为舞台，描绘正反两派的殊死激战。在第一英雄被困之际，少年与英雄科同学拼死克敌，却在无意中探得隐秘真相，剧情随之反转', '科幻', '2018-08-13', 0, NULL, '2023-02-19 23:10:36.000000', '2023-02-19 23:11:06.523690', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_order
-- ----------------------------
INSERT INTO `pddou_order` VALUES (1, 1, 1, '13414850282', '2023-02-23 18:00:00.000000', 3, 119.70, '[25,26,35]', 'PAID', '341593', 0, 0);
INSERT INTO `pddou_order` VALUES (2, 2, 2, '13414865812', '2023-02-23 19:00:00.000000', 3, 113.40, '[26,25,35]', 'PAID', '612368', 0, 0);
INSERT INTO `pddou_order` VALUES (3, 3, 3, '13415667789', '2023-01-19 00:00:00.000000', 2, 75.60, '[32,33]', 'NO_PAID', '566712', 0, 0);
INSERT INTO `pddou_order` VALUES (5, 1, 2, '13414865856', '2023-02-23 19:00:00.000000', 3, 113.40, '[21,22,23]', 'PAID', '613458', 0, 0);
INSERT INTO `pddou_order` VALUES (6, 1, 3, '13415690789', '2023-01-19 00:00:00.000000', 1, 37.80, '[34]', 'RETURN', '566552', 0, 0);

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
INSERT INTO `pddou_user` VALUES (1, 'end', 'http://pddou.oss-cn-chengdu.aliyuncs.com/avatar/2023/03/04/36500f4316934256b0b2526fb6be0768.jpg', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '19982067190', '男', '2003-10-1', '我命由我不由天', 20, '2023-02-17 20:00:12.000000', '2023-03-04 18:56:11.836693', 0);
INSERT INTO `pddou_user` VALUES (2, '张三', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13423232323', '男', '2001-04-08', '66666', 0, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (3, '13478565555', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13478565555', '男', NULL, '加油', 5, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (4, '13877777766', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13877777766', '男', NULL, '生而无畏', 0, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (5, '13482638273', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13482638273', '女', NULL, '向前跑，用尽全部力气', 3, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (6, '13428372632', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13428372632', '女', NULL, '生活不止眼前的枸杞，还有诗和远方', 3, '2023-02-17 20:00:12.000000', '2023-02-18 15:15:15.334073', 1);
INSERT INTO `pddou_user` VALUES (7, '小李', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13414232321', '男', NULL, '一起加油', 0, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);
INSERT INTO `pddou_user` VALUES (8, '王大锤', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '13412121211', '男', '1990-06-16', '开心就好', 0, '2023-02-17 20:00:12.000000', '2023-02-17 20:00:16.000000', 0);

-- ----------------------------
-- Table structure for pddou_wish_movie
-- ----------------------------
DROP TABLE IF EXISTS `pddou_wish_movie`;
CREATE TABLE `pddou_wish_movie`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `movie_id` int NOT NULL COMMENT '电影id',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除（0-false-默认，1-true）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_wish_movie
-- ----------------------------
INSERT INTO `pddou_wish_movie` VALUES (2, 1, 2, 0);
INSERT INTO `pddou_wish_movie` VALUES (3, 1, 1, 0);
INSERT INTO `pddou_wish_movie` VALUES (4, 2, 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_employee
-- ----------------------------
INSERT INTO `sys_employee` VALUES (1, '2022-12-10 21:21:44.000000', '2022-12-10 21:21:59.000000', 'admin', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '超级管理员', '123456@qq.com', '18888888888', 'SECRET', 'ADMINISTRATION', 'SUPERADMIN', 0, 0, 'https://pddou.oss-cn-chengdu.aliyuncs.com/AD7945F9-B4FD-4D23-A76B-237531BCC0F4.jpg');
INSERT INTO `sys_employee` VALUES (3, '2022-12-10 21:21:44.000000', '2023-01-12 21:47:36.839857', 'end', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '管理员', '1234567@qq.com', '16666666666', 'SECRET', 'ADMINISTRATION', 'ADMIN', 0, 0, 'https://pddou.oss-cn-chengdu.aliyuncs.com/pkq.jpg');
INSERT INTO `sys_employee` VALUES (4, '2022-12-10 21:21:44.000000', '2023-01-12 21:47:36.839857', 'store', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '商家', '158663854@qq.com', '15983067120', 'MALE', 'MERCHANT', 'STORE', 0, 0, 'https://pddou.oss-cn-chengdu.aliyuncs.com/pkq.jpg');
INSERT INTO `sys_employee` VALUES (5, '2022-12-10 21:21:44.000000', '2023-02-17 16:04:29.600689', 'jack', '$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq', '员工', '16689361@qq.com', '15889364452', 'MALE', 'MERCHANT', 'STAFF', 4, 0, 'https://pddou.oss-cn-chengdu.aliyuncs.com/pkq.jpg');
INSERT INTO `sys_employee` VALUES (7, '2023-02-17 16:41:23.029926', '2023-02-17 16:41:23.029926', 'wflin', '$2a$10$s2Qw8VELEYhTvDMaOmj9J.TQctZzypzAXAfHWWFqsdmC/EsoUDexu', '小白', '1667908814@qq.com', '15998074452', 'SECRET', 'ADMINISTRATION', 'ADMIN', 0, 0, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif');
INSERT INTO `sys_employee` VALUES (8, '2023-02-17 16:46:06.515414', '2023-02-17 16:54:14.286573', 'ggg', '$2a$10$UYcHnjoNXL/vgYy.kkxpZ.WO4rRGLkQLxAkRxaerwNXJNxCnKNCKi', '李俊基', '8894858@qq.com', '13988095568', 'MALE', 'MERCHANT', 'STORE', 0, 0, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif');
INSERT INTO `sys_employee` VALUES (11, '2023-02-28 16:02:54.000000', '2023-02-28 16:02:57.000000', '15993046978', '$2a$10$UYcHnjoNXL/vgYy.kkxpZ.WO4rRGLkQLxAkRxaerwNXJNxCnKNCKi', '吴起', '', '15993046978', 'SECRET', 'MERCHANT', 'STORE', 0, 0, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif');
INSERT INTO `sys_employee` VALUES (14, '2023-02-28 22:31:28.534017', '2023-02-28 22:31:28.534017', '13558097745', '$2a$10$UYcHnjoNXL/vgYy.kkxpZ.WO4rRGLkQLxAkRxaerwNXJNxCnKNCKi', '梦琪', NULL, '13558097745', 'SECRET', 'MERCHANT', 'STORE', 0, 0, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif');
INSERT INTO `sys_employee` VALUES (15, '2023-03-01 16:11:38.065168', '2023-03-01 16:11:38.065168', '15889074553', '$2a$10$UYcHnjoNXL/vgYy.kkxpZ.WO4rRGLkQLxAkRxaerwNXJNxCnKNCKi', '李超', NULL, '15889074553', 'SECRET', 'MERCHANT', 'STORE', 0, 0, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif');
INSERT INTO `sys_employee` VALUES (16, '2023-03-01 20:47:28.251419', '2023-03-01 20:47:28.251419', '13469878633', '$2a$10$UYcHnjoNXL/vgYy.kkxpZ.WO4rRGLkQLxAkRxaerwNXJNxCnKNCKi', '张建', NULL, '13469878633', 'SECRET', 'MERCHANT', 'STORE', 0, 0, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif');

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_employee_role
-- ----------------------------
INSERT INTO `sys_employee_role` VALUES (1, '2022-12-15 21:47:34.000000', '2022-12-15 21:47:38.000000', 1, 1);
INSERT INTO `sys_employee_role` VALUES (2, '2023-02-16 16:15:48.000000', '2023-02-16 16:15:51.000000', 3, 2);
INSERT INTO `sys_employee_role` VALUES (3, '2023-02-16 18:18:15.000000', '2023-02-16 18:18:18.000000', 4, 3);
INSERT INTO `sys_employee_role` VALUES (4, '2023-02-16 18:18:29.000000', '2023-02-16 18:18:32.000000', 5, 4);
INSERT INTO `sys_employee_role` VALUES (5, '2023-02-17 16:41:23.061820', '2023-02-17 16:41:23.061820', 7, 2);
INSERT INTO `sys_employee_role` VALUES (6, '2023-02-17 16:46:06.543051', '2023-02-17 16:46:06.543051', 8, 3);
INSERT INTO `sys_employee_role` VALUES (11, '2023-02-28 22:31:28.569505', '2023-02-28 22:31:28.569505', 14, 3);
INSERT INTO `sys_employee_role` VALUES (12, '2023-03-01 16:11:38.097327', '2023-03-01 16:11:38.097327', 15, 3);
INSERT INTO `sys_employee_role` VALUES (13, '2023-03-01 20:47:28.288440', '2023-03-01 20:47:28.288440', 16, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------

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
