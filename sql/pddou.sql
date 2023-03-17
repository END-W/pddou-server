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

 Date: 17/03/2023 18:24:20
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
INSERT INTO `pddou_cinema` VALUES (6, '太平洋影城金辉店', '028-87991489', '四川省', '成都市', NULL, '郫都区百草路777号', 15, 0, 'ON_ACTIVITY', 3, '2023-03-07 19:55:42.039992', '2023-03-01 16:11:38.128551', '2023-03-07 19:55:42.041995', '李超', 103.962148, 30.745178, '15889074553');
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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_comment
-- ----------------------------
INSERT INTO `pddou_comment` VALUES (1, 1, 1, 8.0, '心里难受，还要再看两遍，以后再也没机会在荧幕上看到无牙仔和小咯咯了', '2023-03-07 20:59:53', 3, 1, 0, '[2,3,1]');
INSERT INTO `pddou_comment` VALUES (2, 2, 3, 9.0, '很好看，挺悲伤的，让我哭一会！', '2023-02-21 21:20:14', 3, 1, 0, '[1,2,4]');
INSERT INTO `pddou_comment` VALUES (4, 1, 2, 9.0, '夏目真是太温暖了，每次看都会给我最温柔坚定的力量，这次剧场版也是一如既往地美好，带给我一整天好心情。', '2023-03-06 14:49:37', 0, 1, 0, NULL);
INSERT INTO `pddou_comment` VALUES (5, 2, 1, 8.0, '饱满的结局，但不是完美的谢幕，剧情太规整了，这个反派太老套，甚至连个配菜都不如...\n优点是视效升级以及最后结局的处理，让你失望了，现在我们可能还是不值得与龙共存。', '2023-03-06 17:31:33', 1, 1, 0, '[1]');
INSERT INTO `pddou_comment` VALUES (6, 1, 6, 9.0, '这是一个恢宏的故事，罕见的通过三条叙事线展开。叙事节奏相当牛批，全程无尿点，特效顶级，脑洞大开，同时也对在极端环境下的人性展开探索。总之，电影在流浪地球1基础上升华了。', '2023-03-07 21:33:59', 0, 1, 0, NULL);
INSERT INTO `pddou_comment` VALUES (7, 1, 7, 8.0, '整部电影画面色彩很唯美，音乐是充满了力量的，或忧郁、或彷徨、或自备，它总能精准的表达歌唱者的情绪，同样的，表演者的情绪也能够传达给听众，那些鼓舞着人心的、令人动容的、叫人向上的，会给予你我更多的勇气！', '2023-03-07 21:35:29', 0, 1, 0, NULL);
INSERT INTO `pddou_comment` VALUES (8, 1, 10, 7.0, '传统的港片节奏，搭配新颖的黑客题材，新老结合，视觉呈现上有了新的感觉，节奏感和紧张感又有传统的港片味道，枪战，追逐，打斗，通通给到，看男神对决非常精彩。', '2023-03-07 21:36:27', 0, 1, 0, NULL);
INSERT INTO `pddou_comment` VALUES (9, 1, 8, 7.0, '本来是冲着梁朝伟周迅去的，没想到被王一博给惊到了。以前一直对流量小鲜肉没啥好感，名字听过，这次还以为他就是来蹭的。没想到啊，竟然和影帝的对手戏接住了。还这 年轻，关键是确实长得帅啊。看好他未来发展， 宣布以后有王一博的影视，我会去看。', '2023-03-07 21:37:24', 0, 1, 0, NULL);
INSERT INTO `pddou_comment` VALUES (10, 1, 11, 8.0, '这应该是复联四以后最好看的的漫威电影了，特效感觉炸裂，而且剧本充实，新老演员看的出都在为这个电影付出', '2023-03-07 21:38:50', 0, 1, 0, NULL);
INSERT INTO `pddou_comment` VALUES (11, 1, 13, 7.0, '不看你真的会后悔！\n一部非常贴近生活的影片，讲义气的人为了做自己认为对的事情遇到了一系列的困难，过程中闹出了很多笑话，也承担了相应的后果，就算是这样也不影响真情的存在，电影结尾有一些催泪，还有小小的彩蛋哦，值得推荐的好电影。', '2023-03-07 21:41:04', 0, 1, 0, NULL);
INSERT INTO `pddou_comment` VALUES (12, 1, 14, 6.0, '东野圭吾的悬疑本，日剧拍过，内地也拍过，这次影版千呼万唤始出来，还是很期待的\n在小小的回廊亭上演的命案，牵出\"钱\"与\"情\"的纠葛，抛开原著还是不错的，围绕着原著里的几点线索拼图，打乱了布局，又是一出复仇剧本！\n这次的侯雯元，还是挺帅气的', '2023-03-07 21:42:31', 0, 1, 0, NULL);
INSERT INTO `pddou_comment` VALUES (13, 2, 6, 8.0, '很满意，之前一直担心第二部会不如第一部，看完很震撼，看得出来那些场景下功夫了，花钱了', '2023-03-17 15:16:42', 0, 1, 0, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_hall
-- ----------------------------
INSERT INTO `pddou_hall` VALUES (1, '1号激光厅', 1);
INSERT INTO `pddou_hall` VALUES (8, '1号激光厅', 2);
INSERT INTO `pddou_hall` VALUES (30, '1号激光厅', 3);
INSERT INTO `pddou_hall` VALUES (24, '1号激光厅', 5);
INSERT INTO `pddou_hall` VALUES (20, '1号激光厅', 6);
INSERT INTO `pddou_hall` VALUES (28, '2号四川银行厅', 5);
INSERT INTO `pddou_hall` VALUES (2, '2号激光厅', 1);
INSERT INTO `pddou_hall` VALUES (9, '2号激光厅', 2);
INSERT INTO `pddou_hall` VALUES (19, '2号激光厅', 6);
INSERT INTO `pddou_hall` VALUES (3, '3号激光厅', 1);
INSERT INTO `pddou_hall` VALUES (27, '3号激光厅', 5);
INSERT INTO `pddou_hall` VALUES (21, '3号激光厅', 6);
INSERT INTO `pddou_hall` VALUES (25, '4号亲子厅', 5);
INSERT INTO `pddou_hall` VALUES (6, '4号激光厅', 1);
INSERT INTO `pddou_hall` VALUES (31, '4号激光厅', 3);
INSERT INTO `pddou_hall` VALUES (22, '4号激光厅', 6);
INSERT INTO `pddou_hall` VALUES (23, '5号厅全景声激光厅', 6);
INSERT INTO `pddou_hall` VALUES (7, '5号激光厅', 1);
INSERT INTO `pddou_hall` VALUES (26, '5号激光厅', 5);
INSERT INTO `pddou_hall` VALUES (29, '6号luxe巨幕厅', 5);
INSERT INTO `pddou_hall` VALUES (34, '6号激光厅', 3);
INSERT INTO `pddou_hall` VALUES (11, '兔兔高升-五号激光厅', 7);
INSERT INTO `pddou_hall` VALUES (18, '兔气扬眉-一号儿童厅', 7);
INSERT INTO `pddou_hall` VALUES (14, '兔气扬眉-六号IMAX厅', 7);
INSERT INTO `pddou_hall` VALUES (15, '兔飞猛进-四号激光厅', 7);
INSERT INTO `pddou_hall` VALUES (33, '全兴大曲厅', 3);
INSERT INTO `pddou_hall` VALUES (17, '前兔似锦-七号激光厅', 7);
INSERT INTO `pddou_hall` VALUES (16, '前兔似锦-二号床厅', 7);
INSERT INTO `pddou_hall` VALUES (12, '玉兔迎春-三号激光厅', 7);
INSERT INTO `pddou_hall` VALUES (13, '玉兔迎春-八号激光厅', 7);
INSERT INTO `pddou_hall` VALUES (32, '红色电影厅', 3);

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
  `score` decimal(3, 1) NULL DEFAULT NULL COMMENT '电影综合评分',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否上映（0-false，1-true-默认）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_movie
-- ----------------------------
INSERT INTO `pddou_movie` VALUES (1, '驯龙高手3', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/676110c423df4c429f78dc0b68435937.jpg', '迪恩·德布洛斯', '刘昊然', '130分钟', '英语', '统领伯克岛的酋长嗝嗝（刘昊然 配音），与阿丝翠德（亚美莉卡·费雷拉 配音）共同打造了一个奇妙而热闹的飞龙乌托邦。一只雌性光煞飞龙的意外出现，加上一个前所未有的威胁的到来，令嗝嗝和没牙仔不得不离开自己唯一的家园，前往他们本以为只存在于神话之中的隐秘之境。在发现自己真正的命运之后，飞龙与骑士将携手殊死奋战，保护他们所珍爱的一切。', '动漫', '2018-12-11', 0, 8.0, '2023-02-19 16:43:15.977763', '2023-02-19 17:36:06.421665', 0);
INSERT INTO `pddou_movie` VALUES (2, '夏目友人帐', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/c401b18212244ff88894be26f3b59718.jpg', '大森贵弘', '村濑步', '105分钟', '日语', '唱片制作人张哲凯（刘以豪 饰）和王牌作词人宋媛媛（陈意涵 饰）相依为命，两人自幼身世坎坷只有彼此为伴，他们是亲人、是朋友，也彷佛是命中注定的另一半。父亲罹患遗传重症而被母亲抛弃的哲凯，深怕自己随时会发病不久人世，始终没有跨出友谊的界线对媛媛展露爱意。眼见哲凯的病情加重，他暗自决定用剩余的生命完成他们之间的终曲，再为媛媛找个可以托付一生的好男人。这时，事业有成温柔体贴的医生（张书豪 饰）适时的出现让他成为照顾媛媛的最佳人选，二人按部就班发展着关系。一切看似都在哲凯的计划下进行。然而，故事远比这里所写更要悲伤', '言情', '2018-11-13', 12, 8.3, '2023-02-19 17:47:41.974124', '2023-02-22 15:43:45.653284', 0);
INSERT INTO `pddou_movie` VALUES (3, '比悲伤更悲伤的故事', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/dec50b4e94ce45ce96fccfb8fbd50368.jpg', '林孝谦', '陈庭妮', '105分钟', '国语', '唱片制作人张哲凯（刘以豪 饰）和王牌作词人宋媛媛（陈意涵 饰）相依为命，两人自幼身世坎坷只有彼此为伴，他们是亲人、是朋友，也彷佛是命中注定的另一半。父亲罹患遗传重症而被母亲抛弃的哲凯，深怕自己随时会发病不久人世，始终没有跨出友谊的界线对媛媛展露爱意。眼见哲凯的病情加重，他暗自决定用剩余的生命完成他们之间的终曲，再为媛媛找个可以托付一生的好男人。这时，事业有成温柔体贴的医生（张书豪 饰）适时的出现让他成为照顾媛媛的最佳人选，二人按部就班发展着关系。一切看似都在哲凯的计划下进行。然而，故事远比这里所写更要悲伤', '言情', '2018-09-01', 178, 9.0, '2023-02-19 22:51:36.000000', '2023-02-19 22:51:36.000000', 0);
INSERT INTO `pddou_movie` VALUES (4, '惊奇队长', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/e5b3623128424e3e85d2d683825e30e8.jpg', '瑞安·弗雷克', '本·门德尔森', '108分钟', '英语', '卡罗尔·丹弗斯（布丽·拉尔森 饰）是克里人的精英部队一员，但她挣扎着回忆过去，对于怎么获得超能力、以及之前的人生等超能力之前的人生，她只在梦中有片段不成章的记忆，这层困扰引起的情绪波动也进而影响她对超能力的掌控。所幸，在星际战队指挥官（裘德·洛 饰）的调教之下，卡罗尔·丹弗斯学会如何控制自己的超能力。一次外星任务中，卡罗尔·丹弗斯因故来到了地球，并遇到还是低阶探员的尼克·弗瑞（塞缪尔·杰克逊 饰），卡罗尔·丹弗斯与尼克·弗瑞一起追捕在地球惹事的变形人塔罗斯（本·门德尔森 饰），同时，也发现自己如何获得超能力。', '爱情', '2018-07-03', 0, NULL, '2023-02-19 23:04:01.000000', '2023-02-19 23:04:01.000000', 0);
INSERT INTO `pddou_movie` VALUES (5, '我的英雄学院', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/02/19/8a76aeed433d4707aba376577e4f331a.jpg', '长崎健司', '生濑胜久', '96分钟', '日语', '讲述在绝大多数人都有超能力的未来时代，没有天赋的异能少年，如何凭努力与坚持打破绝境，成长为最强英雄，守卫世界和平的故事。 剧场版以移动科研都市“我之岛”为舞台，描绘正反两派的殊死激战。在第一英雄被困之际，少年与英雄科同学拼死克敌，却在无意中探得隐秘真相，剧情随之反转', '科幻', '2018-08-13', 0, NULL, '2023-02-19 23:10:36.000000', '2023-02-19 23:11:06.523690', 0);
INSERT INTO `pddou_movie` VALUES (6, '流浪地球2', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/03/07/2f92ebce8a4342a7bca621399bf9fbf4.jpg', '郭帆', '吴京 / 刘德华 ', '173分钟', '国语', '太阳即将毁灭，人类在地球表面建造出巨大的推进器，寻找新的家园。然而宇宙之路危机四伏，为了拯救地球，流浪地球时代的年轻人再次挺身而出，展开争分夺秒的生死之战。', '科幻', '2023-01-22', 1, 9.0, '2023-03-07 16:50:49.822242', '2023-03-07 22:03:00.388243', 1);
INSERT INTO `pddou_movie` VALUES (7, '满江红', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/03/07/cb7ef6941ca4410c9b557015d59bb4bd.jpg', '张艺谋', ' 沈腾 / 易烊千玺 / 张译', '159分钟', '国语', '南宋绍兴年间，岳飞死后四年，秦桧率兵与金国会谈。会谈前夜，金国使者死在宰相驻地，所携密信也不翼而飞。小兵张大（沈腾 饰）与亲兵营副统领孙均（易烊千玺 饰）机缘巧合被裹挟进这巨大阴谋之中，宰相秦桧（雷佳音 饰）命两人限一个时辰之内找到凶手。伴随危机四伏的深入调查，宰相府总管何立（张译 饰）、副总管武义淳（岳云鹏 饰）、舞姬瑶琴（王佳怡 饰）等人卷入局中，案件的背后似乎隐藏着一场更大的阴谋。局中有局、人心叵测，一夜之间风云变幻，各方势力暗流涌动……', '剧情', '2023-01-22', 1, 8.0, '2023-03-07 16:54:30.488537', '2023-03-07 22:03:00.439093', 1);
INSERT INTO `pddou_movie` VALUES (8, '无名', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/03/07/e9e132b21fdc45abb8a4f584345f9c4e.jpg', '程耳', '梁朝伟', '128分钟', '国语', '影片通过对上世纪二十年代开始奋斗在上海的中国共产党领导下的中共特科，在隐蔽战线与各方势力殊死较量过程的再现，表现了在走向胜利过程中不可或缺的党的秘密战线上那些无名英雄，他们不可取代的贡献。全面抗战爆发后，中国共产党领导的中共特科在上海周旋于重庆、汪伪、日本间谍机构之间，通过错综复杂的敌后情报系统，策反敌人，获取情报，诛杀汉奸，建立更广泛的统一战线，直至抗战胜利的前夜…...', '剧情', '2023-01-22', 0, 7.0, '2023-03-07 16:57:16.836011', '2023-03-07 22:03:00.483771', 1);
INSERT INTO `pddou_movie` VALUES (9, '毒舌律师', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/03/07/431a8cd2977b4aefa38bfac5da50607e.jpg', '吴炜伦', '黄子华', '133分钟', '粤语', '一宗国际名模涉嫌虐待女儿的冤案，竟成了法律界、权贵与名媛之间的角力场！社会金字塔顶层的钟氏家族，如何用尽权力与资源去自保？以林凉水（黄子华 饰）为代表的律师们又如何在重重困难下伸张正义？', '剧情', '2023-02-24', 0, NULL, '2023-03-07 17:04:09.909582', '2023-03-07 17:04:09.909582', 1);
INSERT INTO `pddou_movie` VALUES (10, '断网', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/03/07/18bc3f787dff4f3497e9f3415a6c58b0.jpg', '黄庆勋', '郭富城 / 任达华', '110分钟', '国语', '故事讲述郭富城饰演的程序专家意外陷入一起网络金融犯罪的巨大阴谋中，为了活下去，不得不在有限的时间与黑白两道展开一场实力悬殊的暗网对决……', '剧情', '2023-03-03', 0, 7.0, '2023-03-07 17:08:49.039715', '2023-03-07 22:03:00.555268', 1);
INSERT INTO `pddou_movie` VALUES (11, '蚁人与黄蜂女：量子狂潮', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/03/07/91204bf702504bbbab877a81a0518db3.jpg', '佩顿·里德', '保罗·路德', '125分钟', '英语', '影片是《蚁人》系列的第三部作品，同时也是漫威电影宇宙第五阶段的揭幕之作。故事发生于《复仇者联盟4：终局之战》之后，“蚁人”斯科特·朗（保罗·路德 Paul Rudd 饰）和“黄蜂女”霍普·凡·戴恩（伊万杰琳·莉莉 Evangeline Lilly 饰）成了拯救世界的英雄人物，皮姆博士与久违归来的珍妮特 也享受着平静的半退休生活，然而因为意外他们和斯科特的女儿凯茜（凯瑟琳·纽 顿 Kathryn Newton 饰）一起误入量子领域，在这个充满危险的未知世界遭遇了漫威电影宇宙最强反派——征服者康（乔纳森·梅杰斯 Jonathan Majors 饰），开始了一场超越他们想象极限的冒险。', '科幻', '2023-02-17', 1, 8.0, '2023-03-07 17:13:19.994408', '2023-03-07 22:03:00.599923', 1);
INSERT INTO `pddou_movie` VALUES (12, '深海', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/03/07/7d87511638a949ec84c337d8c9493eeb.jpg', '田晓鹏', '苏鑫 ', '112分钟', '国语', '在大海的最深处，藏着所有秘密。一位现代少女（参宿）误入梦幻的深海世界，却因此邂逅了一段独特的生命旅程。', '动漫', '2023-01-22', 0, NULL, '2023-03-07 17:17:40.783384', '2023-03-07 17:17:40.783384', 1);
INSERT INTO `pddou_movie` VALUES (13, '保你平安', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/03/07/cda3c45591a841e4b5f253a91b8e9bf6.jpg', '大鹏', '大鹏', '112分钟', '国语', '落魄中年魏平安（大鹏 饰）以直播带货卖墓地为生，他的客户韩露过世后被造谣抹黑，魏平安路见不平，辟谣跑断腿，笑料频出，反转不断，而他自己也因此陷入到新的谣言和网暴之中。', '喜剧', '2023-03-10', 1, 7.0, '2023-03-07 17:20:16.630649', '2023-03-07 22:03:00.668842', 1);
INSERT INTO `pddou_movie` VALUES (14, '回廊亭', 'http://pddou.oss-cn-chengdu.aliyuncs.com/movie/2023/03/07/febd1507827a45ccb11eee1a4b1afd0c.jpg', '来牧宽', '任素汐', '95分钟', '国语', '影片根据东野圭吾畅销悬疑小说《长长的回廊》改编。回廊亭大宅中暗藏无数秘密，绝望女人为爱复仇的欲望纷争正在上演！\n富商病逝，他的亲属们聚集在回廊亭等待数十亿遗产将会如何分配，众人各怀鬼胎。关键时刻，律师周扬带着遗嘱和一本神秘日记而来，更牵扯出⼀场发生在一年前的火灾凶杀案，死者是富商流落在外的私生子，更是全部遗产的第⼀顺位继承人！凶手，似乎就隐藏在众人之中……', '爱情', '2023-03-10', 0, 6.0, '2023-03-07 19:46:25.775894', '2023-03-07 22:03:00.710187', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_movie_cinema
-- ----------------------------
INSERT INTO `pddou_movie_cinema` VALUES (1, 1, 1, 39.90, 0);
INSERT INTO `pddou_movie_cinema` VALUES (2, 3, 1, 37.80, 0);
INSERT INTO `pddou_movie_cinema` VALUES (3, 2, 1, 43.90, 0);
INSERT INTO `pddou_movie_cinema` VALUES (7, 5, 1, 49.90, 0);
INSERT INTO `pddou_movie_cinema` VALUES (8, 4, 1, 57.80, 0);
INSERT INTO `pddou_movie_cinema` VALUES (9, 2, 2, 40.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (10, 4, 2, 39.80, 1);
INSERT INTO `pddou_movie_cinema` VALUES (11, 6, 1, 42.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (12, 10, 1, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (13, 8, 1, 27.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (14, 7, 1, 36.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (15, 12, 1, 40.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (16, 6, 7, 43.80, 1);
INSERT INTO `pddou_movie_cinema` VALUES (17, 9, 7, 27.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (18, 13, 7, 38.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (19, 7, 7, 43.80, 1);
INSERT INTO `pddou_movie_cinema` VALUES (20, 10, 7, 42.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (21, 8, 7, 48.80, 1);
INSERT INTO `pddou_movie_cinema` VALUES (22, 11, 7, 39.80, 1);
INSERT INTO `pddou_movie_cinema` VALUES (23, 12, 7, 43.80, 1);
INSERT INTO `pddou_movie_cinema` VALUES (24, 10, 6, 37.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (25, 14, 6, 37.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (26, 13, 6, 34.80, 1);
INSERT INTO `pddou_movie_cinema` VALUES (27, 11, 6, 27.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (28, 7, 6, 36.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (30, 9, 6, 22.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (31, 12, 6, 33.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (32, 8, 6, 27.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (33, 14, 7, 42.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (34, 10, 5, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (35, 7, 5, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (36, 11, 5, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (37, 6, 5, 42.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (38, 9, 5, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (39, 8, 5, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (40, 13, 5, 37.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (41, 14, 5, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (42, 10, 3, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (43, 6, 3, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (44, 11, 3, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (45, 9, 3, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (46, 7, 3, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (47, 12, 3, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (48, 12, 5, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (49, 14, 3, 38.00, 1);
INSERT INTO `pddou_movie_cinema` VALUES (50, 6, 6, 34.90, 1);
INSERT INTO `pddou_movie_cinema` VALUES (51, 13, 3, 38.00, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_schedule
-- ----------------------------
INSERT INTO `pddou_schedule` VALUES (1, 1, 1, '1号激光厅', '2023-02-24', '20:05', '[25,26,35]');
INSERT INTO `pddou_schedule` VALUES (2, 2, 2, '1号激光厅', '2023-02-24', '16:05', '[35,26,24,25,15,14,45,46,36]');
INSERT INTO `pddou_schedule` VALUES (3, 3, 1, '1号激光厅', '2023-01-19', '15:30', '[31,32,33,34,35]');
INSERT INTO `pddou_schedule` VALUES (4, 4, 1, '2号激光厅', '2023-02-26', '10:00', NULL);
INSERT INTO `pddou_schedule` VALUES (7, 3, 1, '3号激光厅', '2023-02-27', '15:50', NULL);
INSERT INTO `pddou_schedule` VALUES (8, 4, 2, '2号激光厅', '2023-02-26', '10:35', NULL);
INSERT INTO `pddou_schedule` VALUES (9, 6, 3, '全兴大曲厅', '2023-03-13', '14:40', NULL);
INSERT INTO `pddou_schedule` VALUES (10, 10, 3, '红色电影厅', '2023-03-13', '13:30', NULL);
INSERT INTO `pddou_schedule` VALUES (11, 7, 3, '全兴大曲厅', '2023-03-13', '16:00', NULL);
INSERT INTO `pddou_schedule` VALUES (12, 9, 3, '红色电影厅', '2023-03-12', '20:00', NULL);
INSERT INTO `pddou_schedule` VALUES (13, 6, 5, '2号四川银行厅', '2023-03-13', '19:50', NULL);
INSERT INTO `pddou_schedule` VALUES (14, 8, 5, '4号亲子厅', '2023-03-13', '18:10', NULL);
INSERT INTO `pddou_schedule` VALUES (15, 11, 5, '5号激光厅', '2023-03-13', '21:20', NULL);
INSERT INTO `pddou_schedule` VALUES (16, 10, 5, '3号激光厅', '2023-03-13', '19:40', NULL);
INSERT INTO `pddou_schedule` VALUES (17, 13, 5, '1号激光厅', '2023-03-13', '14:10', NULL);
INSERT INTO `pddou_schedule` VALUES (18, 13, 5, '6号luxe巨幕厅', '2023-03-13', '17:50', NULL);
INSERT INTO `pddou_schedule` VALUES (19, 13, 5, '1号激光厅', '2023-03-13', '19:00', NULL);
INSERT INTO `pddou_schedule` VALUES (20, 13, 5, '6号luxe巨幕厅', '2023-03-13', '20:00', NULL);
INSERT INTO `pddou_schedule` VALUES (21, 13, 5, '1号激光厅', '2023-03-13', '21:10', NULL);
INSERT INTO `pddou_schedule` VALUES (22, 14, 5, '5号激光厅', '2023-03-13', '19:20', NULL);
INSERT INTO `pddou_schedule` VALUES (23, 14, 5, '5号激光厅', '2023-03-14', '15:00', NULL);
INSERT INTO `pddou_schedule` VALUES (24, 14, 5, '5号激光厅', '2023-03-14', '19:20', NULL);
INSERT INTO `pddou_schedule` VALUES (25, 14, 5, '3号激光厅', '2023-03-14', '21:50', NULL);
INSERT INTO `pddou_schedule` VALUES (26, 13, 5, '1号激光厅', '2023-03-14', '14:20', NULL);
INSERT INTO `pddou_schedule` VALUES (27, 13, 5, '6号luxe巨幕厅', '2023-03-14', '15:30', NULL);
INSERT INTO `pddou_schedule` VALUES (28, 13, 5, '1号激光厅', '2023-03-14', '19:00', NULL);
INSERT INTO `pddou_schedule` VALUES (29, 9, 5, '4号亲子厅', '2023-03-13', '20:40', NULL);
INSERT INTO `pddou_schedule` VALUES (30, 6, 5, '2号四川银行厅', '2023-03-14', '20:20', NULL);
INSERT INTO `pddou_schedule` VALUES (31, 10, 5, '5号激光厅', '2023-03-14', '17:00', NULL);
INSERT INTO `pddou_schedule` VALUES (32, 10, 5, '3号激光厅', '2023-03-14', '19:40', NULL);
INSERT INTO `pddou_schedule` VALUES (33, 11, 5, '4号亲子厅', '2023-03-14', '17:30', NULL);
INSERT INTO `pddou_schedule` VALUES (34, 11, 5, '5号激光厅', '2023-03-14', '21:20', NULL);
INSERT INTO `pddou_schedule` VALUES (35, 12, 5, '2号四川银行厅', '2023-03-14', '18:10', NULL);
INSERT INTO `pddou_schedule` VALUES (36, 7, 5, '3号激光厅', '2023-03-13', '16:00', NULL);
INSERT INTO `pddou_schedule` VALUES (37, 14, 3, '1号激光厅', '2023-03-13', '18:00', NULL);
INSERT INTO `pddou_schedule` VALUES (38, 14, 3, '6号激光厅', '2023-03-13', '19:00', NULL);
INSERT INTO `pddou_schedule` VALUES (39, 9, 3, '6号激光厅', '2023-03-14', '15:40', NULL);
INSERT INTO `pddou_schedule` VALUES (40, 9, 3, '6号激光厅', '2023-03-13', '20:20', NULL);
INSERT INTO `pddou_schedule` VALUES (41, 6, 3, '1号激光厅', '2023-03-14', '19:20', NULL);
INSERT INTO `pddou_schedule` VALUES (42, 10, 3, '红色电影厅', '2023-03-14', '18:10', NULL);
INSERT INTO `pddou_schedule` VALUES (43, 14, 6, '2号激光厅', '2023-03-12', '19:00', NULL);
INSERT INTO `pddou_schedule` VALUES (44, 14, 6, '2号激光厅', '2023-03-12', '21:00', NULL);
INSERT INTO `pddou_schedule` VALUES (45, 14, 6, '2号激光厅', '2023-03-12', '22:55', NULL);
INSERT INTO `pddou_schedule` VALUES (46, 14, 6, '1号激光厅', '2023-03-13', '14:00', NULL);
INSERT INTO `pddou_schedule` VALUES (47, 14, 6, '2号激光厅', '2023-03-13', '21:00', NULL);
INSERT INTO `pddou_schedule` VALUES (48, 14, 6, '2号激光厅', '2023-03-13', '22:55', NULL);
INSERT INTO `pddou_schedule` VALUES (49, 14, 6, '1号激光厅', '2023-03-14', '10:10', NULL);
INSERT INTO `pddou_schedule` VALUES (50, 14, 6, '2号激光厅', '2023-03-14', '19:00', NULL);
INSERT INTO `pddou_schedule` VALUES (51, 13, 6, '1号激光厅', '2023-03-12', '20:00', NULL);
INSERT INTO `pddou_schedule` VALUES (52, 13, 6, '5号厅全景声激光厅', '2023-03-12', '20:40', NULL);
INSERT INTO `pddou_schedule` VALUES (53, 13, 6, '2号激光厅', '2023-03-13', '12:45', NULL);
INSERT INTO `pddou_schedule` VALUES (54, 13, 6, '2号激光厅', '2023-03-13', '14:50', NULL);
INSERT INTO `pddou_schedule` VALUES (55, 13, 6, '1号激光厅', '2023-03-13', '20:00', NULL);
INSERT INTO `pddou_schedule` VALUES (56, 13, 6, '2号激光厅', '2023-03-14', '10:40', NULL);
INSERT INTO `pddou_schedule` VALUES (57, 13, 6, '2号激光厅', '2023-03-14', '14:50', NULL);
INSERT INTO `pddou_schedule` VALUES (58, 11, 6, '4号激光厅', '2023-03-12', '19:50', NULL);
INSERT INTO `pddou_schedule` VALUES (59, 11, 6, '4号激光厅', '2023-03-13', '16:40', NULL);
INSERT INTO `pddou_schedule` VALUES (60, 11, 6, '4号激光厅', '2023-03-13', '21:10', NULL);
INSERT INTO `pddou_schedule` VALUES (61, 11, 6, '4号激光厅', '2023-03-14', '11:30', NULL);
INSERT INTO `pddou_schedule` VALUES (62, 11, 6, '4号激光厅', '2023-03-14', '16:20', NULL);
INSERT INTO `pddou_schedule` VALUES (63, 10, 6, '4号激光厅', '2023-03-12', '22:55', NULL);
INSERT INTO `pddou_schedule` VALUES (64, 10, 6, '5号厅全景声激光厅', '2023-03-13', '12:20', NULL);
INSERT INTO `pddou_schedule` VALUES (65, 9, 6, '4号激光厅', '2023-03-12', '20:30', NULL);
INSERT INTO `pddou_schedule` VALUES (66, 9, 6, '4号激光厅', '2023-03-13', '13:50', NULL);
INSERT INTO `pddou_schedule` VALUES (67, 9, 6, '4号激光厅', '2023-03-13', '18:40', NULL);
INSERT INTO `pddou_schedule` VALUES (68, 7, 6, '5号厅全景声激光厅', '2023-03-13', '14:25', NULL);
INSERT INTO `pddou_schedule` VALUES (69, 7, 6, '5号厅全景声激光厅', '2023-03-14', '14:25', NULL);
INSERT INTO `pddou_schedule` VALUES (70, 12, 6, '3号激光厅', '2023-03-13', '13:10', NULL);
INSERT INTO `pddou_schedule` VALUES (71, 12, 6, '3号激光厅', '2023-03-14', '13:10', NULL);
INSERT INTO `pddou_schedule` VALUES (72, 6, 6, '5号厅全景声激光厅', '2023-03-12', '19:45', NULL);
INSERT INTO `pddou_schedule` VALUES (73, 6, 6, '5号厅全景声激光厅', '2023-03-13', '17:20', NULL);
INSERT INTO `pddou_schedule` VALUES (74, 6, 6, '5号厅全景声激光厅', '2023-03-14', '17:20', NULL);
INSERT INTO `pddou_schedule` VALUES (75, 6, 6, '5号厅全景声激光厅', '2023-03-15', '17:20', NULL);
INSERT INTO `pddou_schedule` VALUES (76, 13, 3, '全兴大曲厅', '2023-03-17', '17:20', NULL);
INSERT INTO `pddou_schedule` VALUES (77, 13, 3, '全兴大曲厅', '2023-03-17', '19:40', NULL);
INSERT INTO `pddou_schedule` VALUES (78, 13, 3, '4号激光厅', '2023-03-17', '20:20', NULL);
INSERT INTO `pddou_schedule` VALUES (79, 14, 3, '红色电影厅', '2023-03-17', '17:40', NULL);
INSERT INTO `pddou_schedule` VALUES (80, 14, 3, '6号激光厅', '2023-03-17', '21:00', NULL);
INSERT INTO `pddou_schedule` VALUES (81, 14, 3, '全兴大曲厅', '2023-03-18', '13:10', NULL);
INSERT INTO `pddou_schedule` VALUES (82, 14, 3, '6号激光厅', '2023-03-18', '17:00', NULL);
INSERT INTO `pddou_schedule` VALUES (83, 14, 3, '6号激光厅', '2023-03-18', '21:00', NULL);
INSERT INTO `pddou_schedule` VALUES (84, 13, 3, '4号激光厅', '2023-03-18', '14:00', NULL);
INSERT INTO `pddou_schedule` VALUES (85, 13, 3, '全兴大曲厅', '2023-03-18', '15:10', NULL);
INSERT INTO `pddou_schedule` VALUES (86, 13, 3, '全兴大曲厅', '2023-03-18', '17:20', NULL);
INSERT INTO `pddou_schedule` VALUES (87, 13, 3, '4号激光厅', '2023-03-18', '20:20', NULL);
INSERT INTO `pddou_schedule` VALUES (88, 13, 5, '2号四川银行厅', '2023-03-17', '17:00', NULL);
INSERT INTO `pddou_schedule` VALUES (89, 13, 5, '2号四川银行厅', '2023-03-17', '21:50', NULL);
INSERT INTO `pddou_schedule` VALUES (90, 13, 5, '2号四川银行厅', '2023-03-18', '14:40', NULL);
INSERT INTO `pddou_schedule` VALUES (91, 13, 5, '2号四川银行厅', '2023-03-18', '17:00', NULL);
INSERT INTO `pddou_schedule` VALUES (92, 13, 5, '2号四川银行厅', '2023-03-18', '19:40', NULL);
INSERT INTO `pddou_schedule` VALUES (93, 6, 5, '5号激光厅', '2023-03-17', '20:40', NULL);
INSERT INTO `pddou_schedule` VALUES (94, 6, 5, '5号激光厅', '2023-03-18', '15:20', NULL);
INSERT INTO `pddou_schedule` VALUES (95, 6, 5, '5号激光厅', '2023-03-18', '20:40', NULL);
INSERT INTO `pddou_schedule` VALUES (96, 14, 5, '3号激光厅', '2023-03-17', '19:20', NULL);
INSERT INTO `pddou_schedule` VALUES (97, 14, 5, '4号亲子厅', '2023-03-18', '13:45', NULL);
INSERT INTO `pddou_schedule` VALUES (98, 14, 5, '3号激光厅', '2023-03-18', '19:20', NULL);
INSERT INTO `pddou_schedule` VALUES (99, 7, 5, '3号激光厅', '2023-03-17', '21:15', NULL);
INSERT INTO `pddou_schedule` VALUES (100, 13, 6, '2号激光厅', '2023-03-17', '18:05', NULL);
INSERT INTO `pddou_schedule` VALUES (101, 13, 6, '1号激光厅', '2023-03-17', '20:10', NULL);
INSERT INTO `pddou_schedule` VALUES (102, 13, 6, '1号激光厅', '2023-03-18', '13:50', NULL);
INSERT INTO `pddou_schedule` VALUES (103, 13, 6, '1号激光厅', '2023-03-18', '19:40', NULL);
INSERT INTO `pddou_schedule` VALUES (104, 14, 6, '2号激光厅', '2023-03-17', '20:30', NULL);
INSERT INTO `pddou_schedule` VALUES (105, 14, 6, '1号激光厅', '2023-03-18', '15:55', NULL);
INSERT INTO `pddou_schedule` VALUES (106, 12, 6, '3号激光厅', '2023-03-17', '17:40', NULL);
INSERT INTO `pddou_schedule` VALUES (107, 8, 6, '3号激光厅', '2023-03-17', '22:15', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pddou_wish_movie
-- ----------------------------
INSERT INTO `pddou_wish_movie` VALUES (2, 1, 2, 0);
INSERT INTO `pddou_wish_movie` VALUES (3, 1, 1, 0);
INSERT INTO `pddou_wish_movie` VALUES (4, 2, 1, 0);
INSERT INTO `pddou_wish_movie` VALUES (5, 1, 6, 0);
INSERT INTO `pddou_wish_movie` VALUES (6, 1, 7, 0);
INSERT INTO `pddou_wish_movie` VALUES (7, 1, 11, 0);
INSERT INTO `pddou_wish_movie` VALUES (8, 1, 13, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_employee_role` VALUES (14, '2023-03-07 20:22:05.000000', '2023-03-07 20:22:02.000000', 11, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 175 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES (1, '2023-03-07 15:48:46.909100', '2023-03-07 15:48:46.910123', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (2, '2023-03-07 15:58:58.802617', '2023-03-07 15:58:58.802617', 1, 'ADMIN', '/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (3, '2023-03-07 15:59:03.835788', '2023-03-07 15:59:03.835788', 3, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (4, '2023-03-07 16:50:49.980887', '2023-03-07 16:50:49.980887', 3, 'ADMIN', '/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (5, '2023-03-07 16:54:30.531901', '2023-03-07 16:54:30.531901', 3, 'ADMIN', '/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (6, '2023-03-07 16:57:16.873932', '2023-03-07 16:57:16.873932', 3, 'ADMIN', '/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (7, '2023-03-07 17:03:06.761619', '2023-03-07 17:03:06.761619', 3, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (8, '2023-03-07 17:04:09.945427', '2023-03-07 17:04:09.945427', 3, 'ADMIN', '/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (9, '2023-03-07 17:08:49.076739', '2023-03-07 17:08:49.077728', 3, 'ADMIN', '/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (10, '2023-03-07 17:13:20.038834', '2023-03-07 17:13:20.038834', 3, 'ADMIN', '/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (11, '2023-03-07 17:17:40.848522', '2023-03-07 17:17:40.848522', 3, 'ADMIN', '/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (12, '2023-03-07 17:20:16.679422', '2023-03-07 17:20:16.679422', 3, 'ADMIN', '/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (13, '2023-03-07 19:45:22.974418', '2023-03-07 19:45:22.974418', 3, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (14, '2023-03-07 19:46:25.831745', '2023-03-07 19:46:25.831745', 3, 'ADMIN', '/admin/movie/add', '{}', '127.0.0.1', NULL, '添加电影操作');
INSERT INTO `sys_operation_log` VALUES (15, '2023-03-07 19:47:35.160595', '2023-03-07 19:47:35.160595', 4, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (16, '2023-03-07 19:48:22.104591', '2023-03-07 19:48:22.104591', 4, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (17, '2023-03-07 19:48:50.285295', '2023-03-07 19:48:50.285295', 4, 'ADMIN', '/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (18, '2023-03-07 19:48:54.845660', '2023-03-07 19:48:54.845660', 4, 'ADMIN', '/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (19, '2023-03-07 19:48:58.221276', '2023-03-07 19:48:58.221276', 4, 'ADMIN', '/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (20, '2023-03-07 19:49:01.874754', '2023-03-07 19:49:01.874754', 4, 'ADMIN', '/admin/movie/storeChangeStatus', '{}', '127.0.0.1', NULL, '商家电影上映/下映操作');
INSERT INTO `sys_operation_log` VALUES (21, '2023-03-07 19:49:49.066634', '2023-03-07 19:49:49.066634', 4, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (22, '2023-03-07 19:50:29.859346', '2023-03-07 19:50:29.859346', 4, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (23, '2023-03-07 19:51:09.544643', '2023-03-07 19:51:09.544643', 4, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (24, '2023-03-07 19:51:38.384289', '2023-03-07 19:51:38.384289', 4, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (25, '2023-03-07 19:52:17.664503', '2023-03-07 19:52:17.664503', 4, 'ADMIN', '/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (26, '2023-03-07 19:54:23.938050', '2023-03-07 19:54:23.938050', 16, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (27, '2023-03-07 19:54:53.007041', '2023-03-07 19:54:53.007041', 16, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (28, '2023-03-07 19:55:42.064916', '2023-03-07 19:55:42.064916', 3, 'ADMIN', '/admin/cinema/examineCinema', '{}', '127.0.0.1', NULL, '审核影院操作');
INSERT INTO `sys_operation_log` VALUES (29, '2023-03-07 19:56:25.624180', '2023-03-07 19:56:25.624180', 16, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (30, '2023-03-07 19:57:22.169968', '2023-03-07 19:57:22.169968', 16, 'ADMIN', '/admin/movie/updateByStore', '{}', '127.0.0.1', NULL, '商家更新电影操作');
INSERT INTO `sys_operation_log` VALUES (31, '2023-03-07 19:58:04.275072', '2023-03-07 19:58:04.275072', 16, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (32, '2023-03-07 19:58:33.246903', '2023-03-07 19:58:33.246903', 16, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (33, '2023-03-07 19:59:09.565917', '2023-03-07 19:59:09.565917', 16, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (34, '2023-03-07 19:59:58.887579', '2023-03-07 19:59:58.887579', 16, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (35, '2023-03-07 20:00:27.343596', '2023-03-07 20:00:27.344593', 16, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (36, '2023-03-07 20:00:47.603876', '2023-03-07 20:00:47.603876', 16, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (37, '2023-03-07 20:01:13.780011', '2023-03-07 20:01:13.780011', 16, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (38, '2023-03-07 20:02:09.195198', '2023-03-07 20:02:09.195198', 16, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (39, '2023-03-07 20:02:42.577606', '2023-03-07 20:02:42.577606', 16, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (40, '2023-03-07 20:02:58.400192', '2023-03-07 20:02:58.400192', 16, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (41, '2023-03-07 20:04:29.935209', '2023-03-07 20:04:29.935209', 16, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (42, '2023-03-07 20:05:02.147090', '2023-03-07 20:05:02.147090', 16, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (43, '2023-03-07 20:05:31.421459', '2023-03-07 20:05:31.421459', 16, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (44, '2023-03-07 20:05:54.129732', '2023-03-07 20:05:54.129732', 16, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (45, '2023-03-07 20:06:05.969037', '2023-03-07 20:06:05.969037', 16, 'ADMIN', '/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (46, '2023-03-07 20:06:35.543242', '2023-03-07 20:06:35.543242', 15, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (47, '2023-03-07 20:07:09.518057', '2023-03-07 20:07:09.518057', 15, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (48, '2023-03-07 20:07:27.471835', '2023-03-07 20:07:27.471835', 15, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (49, '2023-03-07 20:07:53.956003', '2023-03-07 20:07:53.956003', 15, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (50, '2023-03-07 20:08:19.024444', '2023-03-07 20:08:19.024444', 15, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (51, '2023-03-07 20:08:29.988101', '2023-03-07 20:08:29.988101', 15, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (52, '2023-03-07 20:08:36.476925', '2023-03-07 20:08:36.477929', 15, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (53, '2023-03-07 20:08:42.559872', '2023-03-07 20:08:42.559872', 15, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (54, '2023-03-07 20:09:01.186619', '2023-03-07 20:09:01.186619', 15, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (55, '2023-03-07 20:09:24.017783', '2023-03-07 20:09:24.017783', 15, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (56, '2023-03-07 20:10:02.006919', '2023-03-07 20:10:02.006919', 15, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (57, '2023-03-07 20:10:46.938714', '2023-03-07 20:10:46.938714', 15, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (58, '2023-03-07 20:11:14.094889', '2023-03-07 20:11:14.094889', 15, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (59, '2023-03-07 20:11:38.686911', '2023-03-07 20:11:38.686911', 15, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (60, '2023-03-07 20:11:52.002111', '2023-03-07 20:11:52.002111', 15, 'ADMIN', '/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (61, '2023-03-07 20:12:08.501095', '2023-03-07 20:12:08.501095', 16, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (62, '2023-03-07 20:12:36.339530', '2023-03-07 20:12:36.339530', 16, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (63, '2023-03-07 20:12:44.957119', '2023-03-07 20:12:44.957119', 16, 'ADMIN', '/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (64, '2023-03-07 20:13:02.688120', '2023-03-07 20:13:02.688120', 14, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (65, '2023-03-07 20:13:43.550068', '2023-03-07 20:13:43.550068', 14, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (66, '2023-03-07 20:14:00.007823', '2023-03-07 20:14:00.007823', 14, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (67, '2023-03-07 20:14:26.231604', '2023-03-07 20:14:26.231604', 14, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (68, '2023-03-07 20:16:31.671148', '2023-03-07 20:16:31.671148', 14, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (69, '2023-03-07 20:16:48.137045', '2023-03-07 20:16:48.137045', 14, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (70, '2023-03-07 20:17:17.135903', '2023-03-07 20:17:17.135903', 14, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (71, '2023-03-07 20:17:31.465043', '2023-03-07 20:17:31.465043', 14, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (72, '2023-03-07 20:17:49.409580', '2023-03-07 20:17:49.409580', 14, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (73, '2023-03-07 20:18:10.087382', '2023-03-07 20:18:10.087382', 14, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (74, '2023-03-07 20:18:36.791148', '2023-03-07 20:18:36.791148', 14, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (75, '2023-03-07 20:19:02.862796', '2023-03-07 20:19:02.862796', 14, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (76, '2023-03-07 20:19:27.664006', '2023-03-07 20:19:27.664006', 14, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (77, '2023-03-07 20:19:44.800372', '2023-03-07 20:19:44.800372', 14, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (78, '2023-03-07 20:20:10.078989', '2023-03-07 20:20:10.078989', 14, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (79, '2023-03-07 20:20:15.980974', '2023-03-07 20:20:15.980974', 14, 'ADMIN', '/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (80, '2023-03-07 20:20:34.283912', '2023-03-07 20:20:34.283912', 11, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (81, '2023-03-07 20:20:38.767014', '2023-03-07 20:20:38.767014', 11, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (82, '2023-03-07 20:22:30.185355', '2023-03-07 20:22:30.185355', 11, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (83, '2023-03-07 20:23:00.553616', '2023-03-07 20:23:00.553616', 11, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (84, '2023-03-07 20:23:11.964588', '2023-03-07 20:23:11.964588', 11, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (85, '2023-03-07 20:23:34.229977', '2023-03-07 20:23:34.229977', 11, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (86, '2023-03-07 20:23:45.086524', '2023-03-07 20:23:45.086524', 11, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (87, '2023-03-07 20:24:02.811548', '2023-03-07 20:24:02.811548', 11, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (88, '2023-03-07 20:24:20.059675', '2023-03-07 20:24:20.059675', 11, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (89, '2023-03-07 20:24:32.320730', '2023-03-07 20:24:32.320730', 11, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (90, '2023-03-07 20:24:44.024799', '2023-03-07 20:24:44.024799', 11, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (91, '2023-03-07 20:25:03.446041', '2023-03-07 20:25:03.446041', 11, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (92, '2023-03-07 20:25:18.908878', '2023-03-07 20:25:18.908878', 11, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (93, '2023-03-07 20:25:47.232755', '2023-03-07 20:25:47.232755', 11, 'ADMIN', '/admin/hall/addByStore', '{}', '127.0.0.1', NULL, '商家添加影厅操作');
INSERT INTO `sys_operation_log` VALUES (94, '2023-03-12 15:50:13.432542', '2023-03-12 15:50:13.432542', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (95, '2023-03-12 15:52:16.189948', '2023-03-12 15:52:16.189948', 11, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (96, '2023-03-12 15:53:52.366010', '2023-03-12 15:53:52.366010', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (97, '2023-03-12 15:55:13.447563', '2023-03-12 15:55:13.447563', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (98, '2023-03-12 15:55:48.655372', '2023-03-12 15:55:48.655372', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (99, '2023-03-12 15:56:36.860665', '2023-03-12 15:56:36.860665', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (100, '2023-03-12 15:56:51.816827', '2023-03-12 15:56:51.816827', 11, 'ADMIN', '/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (101, '2023-03-12 15:57:16.635074', '2023-03-12 15:57:16.635074', 14, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (102, '2023-03-12 15:57:45.904350', '2023-03-12 15:57:45.904350', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (103, '2023-03-12 15:58:39.092718', '2023-03-12 15:58:39.092718', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (104, '2023-03-12 15:59:07.515959', '2023-03-12 15:59:07.515959', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (105, '2023-03-12 15:59:37.787342', '2023-03-12 15:59:37.787342', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (106, '2023-03-12 16:00:16.384156', '2023-03-12 16:00:16.384156', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (107, '2023-03-12 16:00:59.326630', '2023-03-12 16:00:59.326630', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (108, '2023-03-12 16:01:21.088796', '2023-03-12 16:01:21.088796', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (109, '2023-03-12 16:01:46.606535', '2023-03-12 16:01:46.606535', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (110, '2023-03-12 16:02:07.526085', '2023-03-12 16:02:07.526085', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (111, '2023-03-12 16:57:51.997951', '2023-03-12 16:57:51.997951', 14, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (112, '2023-03-12 16:59:44.315072', '2023-03-12 16:59:44.315072', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (113, '2023-03-12 17:00:13.099043', '2023-03-12 17:00:13.099043', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (114, '2023-03-12 17:00:35.638273', '2023-03-12 17:00:35.638273', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (115, '2023-03-12 17:00:54.196352', '2023-03-12 17:00:54.196352', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (116, '2023-03-12 17:01:35.647701', '2023-03-12 17:01:35.647701', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (117, '2023-03-12 17:01:56.595279', '2023-03-12 17:01:56.595279', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (118, '2023-03-12 17:02:12.194782', '2023-03-12 17:02:12.194782', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (119, '2023-03-12 17:03:03.689607', '2023-03-12 17:03:03.689607', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (120, '2023-03-12 17:03:30.640526', '2023-03-12 17:03:30.640526', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (121, '2023-03-12 17:04:02.247956', '2023-03-12 17:04:02.247956', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (122, '2023-03-12 17:04:21.479759', '2023-03-12 17:04:21.479759', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (123, '2023-03-12 17:04:58.778160', '2023-03-12 17:04:58.778160', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (124, '2023-03-12 17:05:15.044171', '2023-03-12 17:05:15.044171', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (125, '2023-03-12 17:05:59.622719', '2023-03-12 17:05:59.622719', 14, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (126, '2023-03-12 17:06:23.882019', '2023-03-12 17:06:23.882019', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (127, '2023-03-12 17:07:10.542208', '2023-03-12 17:07:10.542208', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (128, '2023-03-12 17:07:19.571704', '2023-03-12 17:07:19.571704', 14, 'ADMIN', '/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (129, '2023-03-12 17:07:31.674349', '2023-03-12 17:07:31.674349', 11, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (130, '2023-03-12 17:08:15.900269', '2023-03-12 17:08:15.900269', 11, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (131, '2023-03-12 17:08:47.335922', '2023-03-12 17:08:47.335922', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (132, '2023-03-12 17:09:29.864758', '2023-03-12 17:09:29.864758', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (133, '2023-03-12 17:10:09.023562', '2023-03-12 17:10:09.023562', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (134, '2023-03-12 17:10:40.048114', '2023-03-12 17:10:40.048114', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (135, '2023-03-12 17:15:53.106993', '2023-03-12 17:15:53.106993', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (136, '2023-03-12 17:16:23.943931', '2023-03-12 17:16:23.943931', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (137, '2023-03-12 17:16:57.881099', '2023-03-12 17:16:57.881099', 11, 'ADMIN', '/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (138, '2023-03-12 17:17:31.795870', '2023-03-12 17:17:31.795870', 15, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (139, '2023-03-12 17:21:09.491429', '2023-03-12 17:21:09.491429', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (140, '2023-03-12 17:21:27.900665', '2023-03-12 17:21:27.900665', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (141, '2023-03-12 17:21:45.573514', '2023-03-12 17:21:45.573514', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (142, '2023-03-12 17:22:30.473169', '2023-03-12 17:22:30.473169', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (143, '2023-03-12 17:22:58.092603', '2023-03-12 17:22:58.092603', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (144, '2023-03-12 17:23:12.656400', '2023-03-12 17:23:12.656400', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (145, '2023-03-12 17:23:34.944740', '2023-03-12 17:23:34.944740', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (146, '2023-03-12 17:23:57.504343', '2023-03-12 17:23:57.504343', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (147, '2023-03-12 17:24:25.666737', '2023-03-12 17:24:25.666737', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (148, '2023-03-12 17:24:44.514962', '2023-03-12 17:24:44.514962', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (149, '2023-03-12 17:25:19.334054', '2023-03-12 17:25:19.334054', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (150, '2023-03-12 17:25:36.189423', '2023-03-12 17:25:36.189423', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (151, '2023-03-12 17:25:54.138572', '2023-03-12 17:25:54.138572', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (152, '2023-03-12 17:26:13.913202', '2023-03-12 17:26:13.913202', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (153, '2023-03-12 17:26:38.197298', '2023-03-12 17:26:38.197298', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (154, '2023-03-12 17:27:08.724990', '2023-03-12 17:27:08.724990', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (155, '2023-03-12 17:27:37.311889', '2023-03-12 17:27:37.311889', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (156, '2023-03-12 17:27:53.230458', '2023-03-12 17:27:53.230458', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (157, '2023-03-12 17:28:15.757709', '2023-03-12 17:28:15.757709', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (158, '2023-03-12 17:28:28.715966', '2023-03-12 17:28:28.715966', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (159, '2023-03-12 17:28:59.293394', '2023-03-12 17:28:59.293394', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (160, '2023-03-12 17:29:25.049503', '2023-03-12 17:29:25.049503', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (161, '2023-03-12 17:29:56.306242', '2023-03-12 17:29:56.306242', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (162, '2023-03-12 17:30:22.347255', '2023-03-12 17:30:22.347255', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (163, '2023-03-12 17:30:39.668990', '2023-03-12 17:30:39.668990', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (164, '2023-03-12 17:31:20.549849', '2023-03-12 17:31:20.549849', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (165, '2023-03-12 17:31:40.625667', '2023-03-12 17:31:40.625667', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (166, '2023-03-12 17:32:03.943865', '2023-03-12 17:32:03.943865', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (167, '2023-03-12 17:32:28.774550', '2023-03-12 17:32:28.774550', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (168, '2023-03-12 17:33:03.285077', '2023-03-12 17:33:03.285077', 15, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (169, '2023-03-12 17:33:26.018398', '2023-03-12 17:33:26.018398', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (170, '2023-03-12 17:33:55.563932', '2023-03-12 17:33:55.563932', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (171, '2023-03-12 17:34:11.201173', '2023-03-12 17:34:11.201173', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (172, '2023-03-12 17:34:27.647788', '2023-03-12 17:34:27.647788', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (173, '2023-03-17 14:49:28.478425', '2023-03-17 14:49:28.478425', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (174, '2023-03-17 14:50:16.413875', '2023-03-17 14:50:16.413875', 1, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (175, '2023-03-17 14:52:17.330880', '2023-03-17 14:52:17.330880', 11, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (176, '2023-03-17 14:54:32.003807', '2023-03-17 14:54:32.003807', 11, 'ADMIN', '/admin/movie/addByStore', '{}', '127.0.0.1', NULL, '商家添加电影操作');
INSERT INTO `sys_operation_log` VALUES (177, '2023-03-17 14:55:40.190571', '2023-03-17 14:55:40.190571', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (178, '2023-03-17 14:56:12.289009', '2023-03-17 14:56:12.289009', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (179, '2023-03-17 14:56:28.810111', '2023-03-17 14:56:28.810111', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (180, '2023-03-17 14:57:15.199311', '2023-03-17 14:57:15.199311', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (181, '2023-03-17 14:57:34.898099', '2023-03-17 14:57:34.898099', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (182, '2023-03-17 14:58:09.671871', '2023-03-17 14:58:09.671871', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (183, '2023-03-17 14:58:29.488941', '2023-03-17 14:58:29.488941', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (184, '2023-03-17 14:58:43.886608', '2023-03-17 14:58:43.886608', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (185, '2023-03-17 14:59:17.670366', '2023-03-17 14:59:17.670366', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (186, '2023-03-17 14:59:38.716070', '2023-03-17 14:59:38.716070', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (187, '2023-03-17 14:59:56.051453', '2023-03-17 14:59:56.051453', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (188, '2023-03-17 15:00:17.998206', '2023-03-17 15:00:17.998206', 11, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (189, '2023-03-17 15:00:21.837268', '2023-03-17 15:00:21.837268', 11, 'ADMIN', '/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (190, '2023-03-17 15:00:45.640696', '2023-03-17 15:00:45.640696', 14, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (191, '2023-03-17 15:01:18.380161', '2023-03-17 15:01:18.380161', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (192, '2023-03-17 15:01:41.889609', '2023-03-17 15:01:41.889609', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (193, '2023-03-17 15:02:17.888535', '2023-03-17 15:02:17.888535', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (194, '2023-03-17 15:02:32.408622', '2023-03-17 15:02:32.408622', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (195, '2023-03-17 15:02:51.649910', '2023-03-17 15:02:51.649910', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (196, '2023-03-17 15:03:18.140652', '2023-03-17 15:03:18.140652', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (197, '2023-03-17 15:03:46.848388', '2023-03-17 15:03:46.848388', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (198, '2023-03-17 15:04:03.826639', '2023-03-17 15:04:03.826639', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (199, '2023-03-17 15:04:26.847021', '2023-03-17 15:04:26.847021', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (200, '2023-03-17 15:05:14.488073', '2023-03-17 15:05:14.488073', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (201, '2023-03-17 15:05:32.485741', '2023-03-17 15:05:32.485741', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (202, '2023-03-17 15:06:08.556939', '2023-03-17 15:06:08.556939', 14, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (203, '2023-03-17 15:06:30.661803', '2023-03-17 15:06:30.661803', 14, 'ADMIN', '/admin/auth/logout', '{}', '127.0.0.1', NULL, '注销操作');
INSERT INTO `sys_operation_log` VALUES (204, '2023-03-17 15:06:41.315128', '2023-03-17 15:06:41.315128', 15, 'ADMIN', 'http://localhost:7001/admin/auth/login', '{}', '127.0.0.1', NULL, '登录操作');
INSERT INTO `sys_operation_log` VALUES (205, '2023-03-17 15:07:21.877352', '2023-03-17 15:07:21.877352', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (206, '2023-03-17 15:07:47.536636', '2023-03-17 15:07:47.536636', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (207, '2023-03-17 15:08:54.683549', '2023-03-17 15:08:54.683549', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (208, '2023-03-17 15:09:09.423046', '2023-03-17 15:09:09.423046', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (209, '2023-03-17 15:09:47.513305', '2023-03-17 15:09:47.513305', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (210, '2023-03-17 15:10:15.594280', '2023-03-17 15:10:15.594280', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (211, '2023-03-17 15:10:41.330245', '2023-03-17 15:10:41.330245', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');
INSERT INTO `sys_operation_log` VALUES (212, '2023-03-17 15:11:48.813429', '2023-03-17 15:11:48.813429', 15, 'ADMIN', '/admin/schedule/addByStore', '{}', '127.0.0.1', NULL, '商家添加场次操作');

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
