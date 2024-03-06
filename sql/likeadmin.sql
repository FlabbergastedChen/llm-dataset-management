/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : likeadmin

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 06/03/2024 13:35:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for la_album
-- ----------------------------
DROP TABLE IF EXISTS `la_album`;
CREATE TABLE `la_album`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '类目ID',
  `aid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `uid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `type` tinyint UNSIGNED NOT NULL DEFAULT 10 COMMENT '文件类型: [10=图片, 20=视频]',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `uri` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件路径',
  `ext` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件扩展',
  `size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `is_delete` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cid`(`cid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '相册管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_album
-- ----------------------------

-- ----------------------------
-- Table structure for la_album_cate
-- ----------------------------
DROP TABLE IF EXISTS `la_album_cate`;
CREATE TABLE `la_album_cate`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级ID',
  `type` tinyint UNSIGNED NOT NULL DEFAULT 10 COMMENT '类型: [10=图片, 20=视频]',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: [0=否, 1=是]',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '相册分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_album_cate
-- ----------------------------

-- ----------------------------
-- Table structure for la_article
-- ----------------------------
DROP TABLE IF EXISTS `la_article`;
CREATE TABLE `la_article`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cid` int UNSIGNED NOT NULL COMMENT '分类',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `intro` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '简介',
  `summary` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '摘要',
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `author` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `visit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览',
  `sort` int UNSIGNED NOT NULL DEFAULT 50 COMMENT '排序',
  `is_show` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否显示: 0=否, 1=是',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid_idx`(`cid` ASC) USING BTREE COMMENT '分类索引'
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章资讯表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_article
-- ----------------------------
INSERT INTO `la_article` VALUES (1, 1, '让生活更精致！五款居家好物推荐，实用性超高', '##好物推荐🔥', '随着当代生活节奏的忙碌，很多人在闲暇之余都想好好的享受生活。随着科技的发展，也出现了越来越多可以帮助我们提升幸福感，让生活变得更精致的产品，下面周周就给大家盘点五款居家必备的好物，都是实用性很高的产品，周周可以保证大家买了肯定会喜欢。', '/api/static/article01.png', '<p><img src=\"https://likeadmin-java.yixiangonline.com/api/uploads/image/20220916/46d29489-4260-4917-8eca-d0f6cba6af23.png\" alt=\"\" data-href=\"\" style=\"\"/></p><p>拥有一台投影仪，闲暇时可以在家里直接看影院级别的大片，光是想想都觉得超级爽。市面上很多投影仪大几千，其实周周觉得没必要，选泰捷这款一千多的足够了，性价比非常高。</p><p>泰捷的专业度很高，在电视TV领域研发已经十年，有诸多专利和技术创新，荣获国内外多项技术奖项，拿下了腾讯创新工场投资，打造的泰捷视频TV端和泰捷电视盒子都获得了极高评价。</p><p>这款投影仪的分辨率在3000元内无敌，做到了真1080P高分辨率，也就是跟市场售价三千DLP投影仪一样的分辨率，真正做到了分毫毕现，像桌布的花纹、天空的云彩等，这些细节都清晰可见。</p><p>亮度方面，泰捷达到了850ANSI流明，同价位一般是200ANSI。这是因为泰捷为了提升亮度和LCD技术透射率低的问题，首创高功率LED灯源，让其亮度做到同价位最好。专业媒体也进行了多次对比，效果与3000元价位投影仪相当。</p><p>操作系统周周也很喜欢，完全不卡。泰捷作为资深音视频品牌，在系统优化方面有十年的研发经验，打造出的“零极”系统是业内公认效率最高、速度最快的系统，用户也评价它流畅度能一台顶三台，而且为了解决行业广告多这一痛点，系统内不植入任何广告。</p>', '红花', 9, 0, 1, 0, 1663317759, 1663322726, 0);
INSERT INTO `la_article` VALUES (2, 1, '埋葬UI设计师的坟墓不是内卷，而是免费模式', '', '本文从另外一个角度，聊聊作者对UI设计师职业发展前景的担忧，欢迎从事UI设计的同学来参与讨论，会有赠书哦', '/api/static/article02.jpeg', '<p><br></p><p style=\"text-align: justify;\">一个职业，卷，根本就没什么大不了的，尤其是成熟且收入高的职业，不卷才不符合事物发展的规律。何况 UI 设计师的人力市场到今天也和 5 年前一样，还是停留在大型菜鸡互啄的场面。远不能和医疗、证券、教师或者演艺练习生相提并论。</p><p style=\"text-align: justify;\">真正会让我对 <a href=\"https://www.uisdc.com/tag/ui\" target=\"_blank\">UI</a> 设计师发展前景觉得悲观的事情就只有一件 —— 国内的互联网产品免费机制。这也是一个我一直以来想讨论的话题，就在这次写一写。</p><p style=\"text-align: justify;\">国内互联网市场的发展，是一部浩瀚的 “免费经济” 发展史。虽然今天免费已经是深入国内民众骨髓的认知，但最早的中文互联网也是需要付费的，网游也都是要花钱的。</p><p style=\"text-align: justify;\">只是自有国情在此，付费确实阻碍了互联网行业的扩张和普及，一批创业家就开始通过免费的模式为用户提供服务，从而扩大了自己的产品覆盖面和普及程度。</p><p style=\"text-align: justify;\">印象最深的就是免费急先锋周鸿祎，和现在鲜少出现在公众视野不同，一零年前他是当之无愧的互联网教主，因为他开发出了符合中国国情的互联网产品 “打法”，让 360 的发展如日中天。</p><p style=\"text-align: justify;\">就是他在自传中提到：</p><p style=\"text-align: justify;\">只要是在互联网上每个人都需要的服务，我们就认为它是基础服务，基础服务一定是免费的，这样的话不会形成价值歧视。就是说，只要这种服务是每个人都一定要用的，我一定免费提供，而且是无条件免费。增值服务不是所有人都需要的，这个比例可能会相当低，它只是百分之几甚至更少比例的人需要，所以这种服务一定要收费……</p><p style=\"text-align: justify;\">这就是互联网的游戏规则，它决定了要想建立一个有效的商业模式，就一定要有海量的用户基数……</p>', '一一', 23, 0, 1, 0, 1663320938, 1663322854, 0);
INSERT INTO `la_article` VALUES (3, 2, '金山电池公布“沪广深市民绿色生活方式”调查结果', '', '60%以上受访者认为高质量的10分钟足以完成“自我充电”', '/api/static/article03.png', '<p style=\"text-align: left;\"><strong>深圳，2021年10月22日）</strong>生活在一线城市的沪广深市民一向以效率见称，工作繁忙和快节奏的生活容易缺乏充足的休息。近日，一项针对沪广深市民绿色生活方式而展开的网络问卷调查引起了大家的注意。问卷的问题设定集中于市民对休息时间的看法，以及从对循环充电电池的使用方面了解其对绿色生活方式的态度。该调查采用随机抽样的模式，并对最终收集的1,500份有效问卷进行专业分析后发现，超过60%的受访者表示，在每天的工作时段能拥有10分钟高质量的休息时间，就可以高效“自我充电”。该调查结果反映出，在快节奏时代下，人们需要高质量的休息时间，也要学会利用高效率的休息方式和工具来应对快节奏的生活，以时刻保持“满电”状态。</p><p style=\"text-align: left;\">　　<strong>60%以上受访者认为高质量的10分钟足以完成“自我充电”</strong></p><p style=\"text-align: left;\">　　这次调查超过1,500人，主要聚焦18至85岁的沪广深市民，了解他们对于休息时间的观念及使用充电电池的习惯，结果发现：</p><p style=\"text-align: left;\">　　· 90%以上有工作受访者每天工作时间在7小时以上，平均工作时间为8小时，其中43%以上的受访者工作时间超过9小时</p><p style=\"text-align: left;\">　　· 70%受访者认为在工作期间拥有10分钟“自我充电”时间不是一件困难的事情</p><p style=\"text-align: left;\">　　· 60%受访者认为在工作期间有10分钟休息时间足以为自己快速充电</p><p style=\"text-align: left;\">　　临床心理学家黄咏诗女士在发布会上分享为自己快速充电的实用技巧，她表示：“事实上，只要选择正确的休息方法，10分钟也足以为自己充电。以喝咖啡为例，我们可以使用心灵休息法 ── 静观呼吸，慢慢感受咖啡的温度和气味，如果能配合着聆听流水或海洋的声音，能够有效放松大脑及心灵。”</p><p style=\"text-align: left;\">　　这次调查结果反映出沪广深市民的希望在繁忙的工作中适时停下来，抽出10分钟喝杯咖啡、聆听音乐或小睡片刻，为自己充电。金山电池全新推出的“绿再十分充”超快速充电器仅需10分钟就能充好电，喝一杯咖啡的时间既能完成“自我充电”，也满足设备使用的用电需求，为提升工作效率和放松身心注入新能量。</p><p style=\"text-align: left;\">　　<strong>金山电池推出10分钟超快电池充电器*绿再十分充，以创新科技为市场带来革新体验</strong></p><p style=\"text-align: left;\">　　该问卷同时从沪广深市民对循环充电电池的使用方面进行了调查，以了解其对绿色生活方式的态度：</p><p style=\"text-align: left;\">　　· 87%受访者目前没有使用充电电池，其中61%表示会考虑使用充电电池</p><p style=\"text-align: left;\">　　· 58%受访者过往曾使用过充电电池，却只有20%左右市民仍在使用</p><p style=\"text-align: left;\">　　· 60%左右受访者认为充电电池尚未被广泛使用，主要障碍来自于充电时间过长、缺乏相关教育</p><p style=\"text-align: left;\">　　· 90%以上受访者认为充电电池充满电需要1小时或更长的时间</p><p style=\"text-align: left;\">　　金山电池一直致力于为大众提供安全可靠的充电电池，并与消费者的需求和生活方式一起演变及进步。今天，金山电池宣布推出10分钟超快电池充电器*绿再十分充，只需10分钟*即可将4粒绿再十分充充电电池充好电，充电速度比其他品牌提升3倍**。充电器的LED灯可以显示每粒电池的充电状态和模式，并提示用户是否错误插入已损坏电池或一次性电池。尽管其体型小巧，却具备多项创新科技 ，如拥有独特的充电算法以优化充电电流，并能根据各个电池类型、状况和温度用最短的时间为充电电池充好电;绿再十分充内置横流扇，有效防止电池温度过热和提供低噪音的充电环境等。<br></p>', '中网资讯科技', 3, 0, 1, 0, 1663322665, 1663322665, 0);

-- ----------------------------
-- Table structure for la_article_category
-- ----------------------------
DROP TABLE IF EXISTS `la_article_category`;
CREATE TABLE `la_article_category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 50 COMMENT '排序',
  `is_show` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示: 0=否, 1=是',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_article_category
-- ----------------------------
INSERT INTO `la_article_category` VALUES (1, '文章资讯', 0, 1, 0, 1663317280, 1663317282, 0);
INSERT INTO `la_article_category` VALUES (2, '社会热点', 0, 1, 0, 1663321464, 1663321494, 0);

-- ----------------------------
-- Table structure for la_article_collect
-- ----------------------------
DROP TABLE IF EXISTS `la_article_collect`;
CREATE TABLE `la_article_collect`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `article_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章ID',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_article_collect
-- ----------------------------

-- ----------------------------
-- Table structure for la_decorate_page
-- ----------------------------
DROP TABLE IF EXISTS `la_decorate_page`;
CREATE TABLE `la_decorate_page`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `page_type` tinyint UNSIGNED NOT NULL DEFAULT 10 COMMENT '页面类型',
  `page_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '页面名称',
  `page_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '页面数据',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '页面装修表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_decorate_page
-- ----------------------------
INSERT INTO `la_decorate_page` VALUES (1, 1, '商城首页', '[{\"title\":\"搜索\",\"name\":\"search\",\"disabled\":1,\"content\":{},\"styles\":{}},{\"title\":\"首页轮播图\",\"name\":\"banner\",\"content\":{\"enabled\":1,\"data\":[{\"image\":\"/api/static/banner01.png\",\"name\":\"\",\"link\":{\"path\":\"/pages/index/index\",\"name\":\"商城首页\",\"type\":\"shop\"}},{\"image\":\"/api/static/banner02.png\",\"name\":\"\",\"link\":{}}]},\"styles\":{}},{\"title\":\"导航菜单\",\"name\":\"nav\",\"content\":{\"enabled\":1,\"data\":[{\"image\":\"/api/static/nav01.png\",\"name\":\"资讯中心\",\"link\":{\"path\":\"/pages/news/news\",\"name\":\"文章资讯\",\"type\":\"shop\"}},{\"image\":\"/api/static/nav02.png\",\"name\":\"我的收藏\",\"link\":{\"path\":\"/pages/collection/collection\",\"name\":\"我的收藏\",\"type\":\"shop\"}},{\"image\":\"/api/static/nav03.png\",\"name\":\"个人设置\",\"link\":{\"path\":\"/pages/user_set/user_set\",\"name\":\"个人设置\",\"type\":\"shop\"}},{\"image\":\"/api/static/nav04.png\",\"name\":\"联系客服\",\"link\":{\"path\":\"/pages/customer_service/customer_service\",\"name\":\"联系客服\",\"type\":\"shop\"}},{\"image\":\"/api/static/nav05.png\",\"name\":\"关于我们\",\"link\":{\"path\":\"/pages/as_us/as_us\",\"name\":\"关于我们\",\"type\":\"shop\"}}]},\"styles\":{}},{\"id\":\"l84almsk2uhyf\",\"title\":\"资讯\",\"name\":\"news\",\"disabled\":1,\"content\":{},\"styles\":{}}]', 1661757188, 1663321380);
INSERT INTO `la_decorate_page` VALUES (2, 2, '个人中心', '[{\"title\":\"用户信息\",\"name\":\"user-info\",\"disabled\":1,\"content\":{},\"styles\":{}},{\"title\":\"我的服务\",\"name\":\"my-service\",\"content\":{\"style\":2,\"title\":\"服务中心\",\"data\":[{\"image\":\"/api/static/user_collect.png\",\"name\":\"我的收藏\",\"link\":{\"path\":\"/pages/collection/collection\",\"name\":\"我的收藏\",\"type\":\"shop\"}},{\"image\":\"/api/static/user_setting.png\",\"name\":\"个人设置\",\"link\":{\"path\":\"/pages/user_set/user_set\",\"name\":\"个人设置\",\"type\":\"shop\"}},{\"image\":\"/api/static/user_kefu.png\",\"name\":\"联系客服\",\"link\":{\"path\":\"/pages/customer_service/customer_service\",\"name\":\"联系客服\",\"type\":\"shop\"}}]},\"styles\":{}},{\"title\":\"个人中心广告图\",\"name\":\"user-banner\",\"content\":{\"enabled\":1,\"data\":[{\"image\":\"/api/static/ad01.jpg\",\"name\":\"\",\"link\":{}}]},\"styles\":{}}]', 1661757188, 1663320728);
INSERT INTO `la_decorate_page` VALUES (3, 3, '客服设置', '[{\"title\":\"客服设置\",\"name\":\"customer-service\",\"content\":{\"title\":\"添加客服二维码\",\"time\":\"早上 9:00 - 22:00\",\"mobile\":\"13800138000\",\"qrcode\":\"\"},\"styles\":{}}]', 1661757188, 1662689155);

-- ----------------------------
-- Table structure for la_decorate_tabbar
-- ----------------------------
DROP TABLE IF EXISTS `la_decorate_tabbar`;
CREATE TABLE `la_decorate_tabbar`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '导航名称',
  `selected` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '未选图标',
  `unselected` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '已选图标',
  `link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接地址',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '底部装修表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_decorate_tabbar
-- ----------------------------
INSERT INTO `la_decorate_tabbar` VALUES (13, '首页', '/api/static/tabbar_home_sel.png', '/api/static/tabbar_home.png', '{\"path\":\"/pages/index/index\",\"name\":\"商城首页\",\"type\":\"shop\"}', 1662688157, 1662688157);
INSERT INTO `la_decorate_tabbar` VALUES (14, '资讯', '/api/static/tabbar_text_sel.png', '/api/static/tabbar_text.png', '{\"path\":\"/pages/news/news\",\"name\":\"文章资讯\",\"type\":\"shop\"}', 1662688157, 1662688157);
INSERT INTO `la_decorate_tabbar` VALUES (15, '我的', '/api/static/tabbar_me_sel.png', '/api/static/tabbar_me.png', '{\"path\":\"/pages/user/user\",\"name\":\"个人中心\",\"type\":\"shop\"}', 1662688157, 1662688157);

-- ----------------------------
-- Table structure for la_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `la_dict_data`;
CREATE TABLE `la_dict_data`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '键名',
  `value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数值',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '状态: 0=停用, 1=正常',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_dict_data
-- ----------------------------

-- ----------------------------
-- Table structure for la_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `la_dict_type`;
CREATE TABLE `la_dict_type`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典类型',
  `dict_remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典备注',
  `dict_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '字典状态: 0=停用, 1=正常',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_dict_type
-- ----------------------------

-- ----------------------------
-- Table structure for la_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `la_gen_table`;
CREATE TABLE `la_gen_table`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关联表名称',
  `sub_table_fk` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关联表外键',
  `author_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者的名称',
  `entity_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '实体的名称',
  `module_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '生成模块名',
  `function_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '生成功能名',
  `tree_primary` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '树主键字段',
  `tree_parent` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '树父级字段',
  `tree_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '树显示字段',
  `gen_tpl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'crud' COMMENT '生成模板方式: [crud=单表, tree=树表]',
  `gen_type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '生成代码方式: [0=zip压缩包, 1=自定义路径]',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/' COMMENT '生成代码路径: [不填默认项目路径]',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_gen_table
-- ----------------------------
INSERT INTO `la_gen_table` VALUES (2, 't_dataset_collection', '', '', '', '', 'TDatasetCollection', 'collection', '', '', '', '', 'crud', 0, '/', '', 1709601351, 1709601351);

-- ----------------------------
-- Table structure for la_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `la_gen_table_column`;
CREATE TABLE `la_gen_table_column`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '列主键',
  `table_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '表外键',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '列名称',
  `column_comment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '列描述',
  `column_length` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '列长度',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '列类型 ',
  `java_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'JAVA类型',
  `java_field` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'JAVA字段',
  `is_pk` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否主键: [1=是, 0=否]',
  `is_increment` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否自增: [1=是, 0=否]',
  `is_required` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否必填: [1=是, 0=否]',
  `is_insert` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否插入字段: [1=是, 0=否]',
  `is_edit` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否编辑字段: [1=是, 0=否]',
  `is_list` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否列表字段: [1=是, 0=否]',
  `is_query` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否查询字段: [1=是, 0=否]',
  `query_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'EQ' COMMENT '查询方式: [等于、不等于、大于、小于、范围]',
  `html_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '显示类型: [文本框、文本域、下拉框、复选框、单选框、日期控件]',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典类型',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序编号',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成字段表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_gen_table_column
-- ----------------------------
INSERT INTO `la_gen_table_column` VALUES (9, 2, 'id', '', '0', 'int', 'int', 'id', 1, 1, 1, 0, 1, 0, 0, '=', 'input', '', 1, 1709601351, 1709601351);
INSERT INTO `la_gen_table_column` VALUES (10, 2, 'dataset_name', '数据集名称', '255', 'varchar(255)', 'str', 'dataset_name', 0, 0, 1, 1, 1, 1, 1, 'LIKE', 'input', '', 2, 1709601351, 1709601351);
INSERT INTO `la_gen_table_column` VALUES (11, 2, 'dataset_type', '数据集类型(0:代码，1:文档)', '0', 'int', 'int', 'dataset_type', 0, 0, 1, 1, 1, 1, 1, '=', 'select', '', 3, 1709601351, 1709601351);
INSERT INTO `la_gen_table_column` VALUES (12, 2, 'dataset_source', '数据集来源', '255', 'varchar(255)', 'str', 'dataset_source', 0, 0, 1, 1, 1, 1, 1, '=', 'input', '', 4, 1709601351, 1709601351);
INSERT INTO `la_gen_table_column` VALUES (13, 2, 'size', '数据集大小', '0', 'double', 'int', 'size', 0, 0, 1, 1, 1, 1, 1, '=', 'input', '', 5, 1709601351, 1709601351);
INSERT INTO `la_gen_table_column` VALUES (14, 2, 'filepath', '文件路径\r\n', '255', 'varchar(255)', 'str', 'filepath', 0, 0, 1, 1, 1, 1, 1, '=', 'input', '', 6, 1709601351, 1709601351);
INSERT INTO `la_gen_table_column` VALUES (15, 2, 'description', '数据集描述', '255', 'varchar(255)', 'str', 'description', 0, 0, 1, 1, 1, 1, 1, '=', 'input', '', 7, 1709601351, 1709601351);

-- ----------------------------
-- Table structure for la_hot_search
-- ----------------------------
DROP TABLE IF EXISTS `la_hot_search`;
CREATE TABLE `la_hot_search`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '热门搜索配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_hot_search
-- ----------------------------

-- ----------------------------
-- Table structure for la_notice_setting
-- ----------------------------
DROP TABLE IF EXISTS `la_notice_setting`;
CREATE TABLE `la_notice_setting`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `scene` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '场景编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '场景名称',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '场景描述',
  `recipient` tinyint(1) NOT NULL DEFAULT 1 COMMENT '接收人员: [1=用户, 2=平台]',
  `type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '通知类型: [1=业务, 2=验证]',
  `system_notice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '系统的通知设置',
  `sms_notice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '短信的通知设置',
  `oa_notice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '公众号通知设置',
  `mnp_notice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '小程序通知设置',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息通知设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_notice_setting
-- ----------------------------
INSERT INTO `la_notice_setting` VALUES (1, 101, '登录验证码', '用户手机号码登录时发送', 1, 2, '{}', '{\"type\":\"sms\",\"templateId\":\"SMS_222458159\",\"content\":\"您正在登录，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"tips\":[\"可选变量 验证码:code\",\"示例：您正在登录，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"生效条件：1、管理后台完成短信设置。2、第三方短信平台申请模板。\"],\"status\":\"1\"}', '{}', '{}', 0, 1648696695, 1648696695, 0);
INSERT INTO `la_notice_setting` VALUES (2, 102, '绑定手机验证码', '用户绑定手机号码时发送', 1, 2, '{}', '{\"type\":\"sms\",\"templateId\":\"SMS_175615069\",\"content\":\"您正在绑定手机号，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"tips\":[\"可选变量 验证码:code\",\"示例：您正在绑定手机号，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"生效条件：1、管理后台完成短信设置。2、第三方短信平台申请模板。\"],\"status\":\"1\"}', '{}', '{}', 0, 1648696695, 1648696695, 0);
INSERT INTO `la_notice_setting` VALUES (3, 103, '变更手机验证码', '用户变更手机号码时发送', 1, 2, '{}', '{\"type\":\"sms\",\"templateId\":\"SMS_207952628\",\"content\":\"您正在变更手机号，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"tips\":[\"可选变量 验证码:code\",\"示例：您正在变更手机号，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"生效条件：1、管理后台完成短信设置。2、第三方短信平台申请模板。\"],\"status\":\"1\"}', '{}', '{}', 0, 1648696695, 1648696695, 0);
INSERT INTO `la_notice_setting` VALUES (4, 104, '找回登录密码验证码', '用户找回登录密码号码时发送', 1, 2, '{}', '{\"type\":\"sms\",\"templateId\":\"SMS_175615069\",\"content\":\"您正在找回登录密码，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"tips\":[\"可选变量 验证码:code\",\"示例：您正在找回登录密码，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"条验证码有效期5分钟。\"],\"status\":\"1\"}', '{}', '{}', 0, 1648696695, 1648696695, 0);

-- ----------------------------
-- Table structure for la_official_reply
-- ----------------------------
DROP TABLE IF EXISTS `la_official_reply`;
CREATE TABLE `la_official_reply`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名',
  `keyword` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `reply_type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复类型: [1=关注回复 2=关键字回复, 3=默认回复]',
  `matching_type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '匹配方式: [1=全匹配, 2=模糊匹配]',
  `content_type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '内容类型: [1=文本]',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '启动状态: [1=启动, 0=关闭]',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回复内容',
  `sort` int UNSIGNED NOT NULL DEFAULT 50 COMMENT '排序编号',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` int UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公众号的回复表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_official_reply
-- ----------------------------

-- ----------------------------
-- Table structure for la_system_auth_admin
-- ----------------------------
DROP TABLE IF EXISTS `la_system_auth_admin`;
CREATE TABLE `la_system_auth_admin`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色主键',
  `dept_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '部门ID',
  `post_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '岗位ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户账号',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '加密盐巴',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序编号',
  `is_multipoint` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '多端登录: 0=否, 1=是',
  `is_disable` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否禁用: 0=否, 1=是',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `last_login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统管理成员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_system_auth_admin
-- ----------------------------
INSERT INTO `la_system_auth_admin` VALUES (1, '0', '1', '', 'admin', 'admin', '7fac2474740becfaf1ecbdd6cc8fb076', '/api/static/backend_avatar.png', '5Xar0', 0, 1, 0, 0, '127.0.0.1', 1709686145, 1642321599, 1670376604, 0);

-- ----------------------------
-- Table structure for la_system_auth_dept
-- ----------------------------
DROP TABLE IF EXISTS `la_system_auth_dept`;
CREATE TABLE `la_system_auth_dept`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `duty` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '负责人名',
  `mobile` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序编号',
  `is_stop` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否禁用: 0=否, 1=是',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统部门管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_system_auth_dept
-- ----------------------------
INSERT INTO `la_system_auth_dept` VALUES (1, 0, '默认部门', '康明', '18327647788', 10, 0, 0, 1649841995, 1660190949, 0);

-- ----------------------------
-- Table structure for la_system_auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `la_system_auth_menu`;
CREATE TABLE `la_system_auth_menu`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级菜单',
  `menu_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限类型: M=目录，C=菜单，A=按钮',
  `menu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `menu_icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `menu_sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '菜单排序',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限标识',
  `paths` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '前端组件',
  `selected` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '选中路径',
  `params` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由参数',
  `is_cache` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否缓存: 0=否, 1=是',
  `is_show` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示: 0=否, 1=是',
  `is_disable` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否禁用: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 778 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_system_auth_menu
-- ----------------------------
INSERT INTO `la_system_auth_menu` VALUES (1, 0, 'C', '工作台', 'el-icon-Monitor', 50, 'index:console', 'workbench', 'workbench/index', '', '', 1, 1, 0, 1650341765, 1668672757);
INSERT INTO `la_system_auth_menu` VALUES (100, 0, 'M', '权限管理', 'el-icon-Lock', 44, '', 'permission', '', '', '', 0, 1, 0, 1650341765, 1662626201);
INSERT INTO `la_system_auth_menu` VALUES (101, 100, 'C', '管理员', 'local-icon-wode', 0, 'system:admin:list', 'admin', 'permission/admin/index', '', '', 1, 1, 0, 1650341765, 1663301404);
INSERT INTO `la_system_auth_menu` VALUES (102, 101, 'A', '管理员详情', '', 0, 'system:admin:detail', '', '', '', '', 0, 1, 0, 1650341765, 1660201785);
INSERT INTO `la_system_auth_menu` VALUES (103, 101, 'A', '管理员新增', '', 0, 'system:admin:add', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (104, 101, 'A', '管理员编辑', '', 0, 'system:admin:edit', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (105, 101, 'A', '管理员删除', '', 0, 'system:admin:del', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (106, 101, 'A', '管理员状态', '', 0, 'system:admin:disable', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (110, 100, 'C', '角色管理', 'el-icon-Female', 0, 'system:role:list', 'role', 'permission/role/index', '', '', 1, 1, 0, 1650341765, 1663301451);
INSERT INTO `la_system_auth_menu` VALUES (111, 110, 'A', '角色详情', '', 0, 'system:role:detail', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (112, 110, 'A', '角色新增', '', 0, 'system:role:add', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (113, 110, 'A', '角色编辑', '', 0, 'system:role:edit', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (114, 110, 'A', '角色删除', '', 0, 'system:role:del', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (120, 100, 'C', '菜单管理', 'el-icon-Operation', 0, 'system:menu:list', 'menu', 'permission/menu/index', '', '', 1, 1, 0, 1650341765, 1663301388);
INSERT INTO `la_system_auth_menu` VALUES (121, 120, 'A', '菜单详情', '', 0, 'system:menu:detail', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (122, 120, 'A', '菜单新增', '', 0, 'system:menu:add', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (123, 120, 'A', '菜单编辑', '', 0, 'system:menu:edit', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (124, 120, 'A', '菜单删除', '', 0, 'system:menu:del', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (130, 0, 'M', '组织管理', 'el-icon-OfficeBuilding', 45, '', 'organization', '', '', '', 0, 0, 0, 1650341765, 1709546121);
INSERT INTO `la_system_auth_menu` VALUES (131, 130, 'C', '部门管理', 'el-icon-Coordinate', 0, 'system:dept:list', 'department', 'organization/department/index', '', '', 1, 1, 0, 1650341765, 1660201994);
INSERT INTO `la_system_auth_menu` VALUES (132, 131, 'A', '部门详情', '', 0, 'system:dept:detail', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (133, 131, 'A', '部门新增', '', 0, 'system:dept:add', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (134, 131, 'A', '部门编辑', '', 0, 'system:dept:edit', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (135, 131, 'A', '部门删除', '', 0, 'system:dept:del', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (140, 130, 'C', '岗位管理', 'el-icon-PriceTag', 0, 'system:post:list', 'post', 'organization/post/index', '', '', 1, 1, 0, 1650341765, 1660202057);
INSERT INTO `la_system_auth_menu` VALUES (141, 140, 'A', '岗位详情', '', 0, 'system:post:detail', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (142, 140, 'A', '岗位新增', '', 0, 'system:post:add', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (143, 140, 'A', '岗位编辑', '', 0, 'system:post:edit', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (144, 140, 'A', '岗位删除', '', 0, 'system:post:del', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (200, 0, 'M', '其它管理', '', 0, '', '', '', '', '', 0, 0, 0, 1650341765, 1660636870);
INSERT INTO `la_system_auth_menu` VALUES (201, 200, 'M', '图库管理', '', 0, '', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (202, 201, 'A', '文件列表', '', 0, 'albums:albumList', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (203, 201, 'A', '文件命名', '', 0, 'albums:albumRename', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (204, 201, 'A', '文件移动', '', 0, 'albums:albumMove', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (205, 201, 'A', '文件删除', '', 0, 'albums:albumDel', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (206, 201, 'A', '分类列表', '', 0, 'albums:cateList', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (207, 201, 'A', '分类新增', '', 0, 'albums:cateAdd', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (208, 201, 'A', '分类命名', '', 0, 'albums:cateRename', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (209, 201, 'A', '分类删除', '', 0, 'albums:cateDel', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (215, 200, 'M', '上传管理', '', 0, '', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (216, 215, 'A', '上传图片', '', 0, 'upload:image', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (217, 215, 'A', '上传视频', '', 0, 'upload:video', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (500, 0, 'M', '系统设置', 'el-icon-Setting', 0, '', 'setting', '', '', '', 0, 1, 0, 1650341765, 1662626322);
INSERT INTO `la_system_auth_menu` VALUES (501, 500, 'M', '网站设置', 'el-icon-Basketball', 10, '', 'website', '', '', '', 0, 1, 0, 1650341765, 1663233572);
INSERT INTO `la_system_auth_menu` VALUES (502, 501, 'C', '网站信息', '', 0, 'setting:website:detail', 'information', 'setting/website/information', '', '', 0, 1, 0, 1650341765, 1660202218);
INSERT INTO `la_system_auth_menu` VALUES (503, 502, 'A', '保存配置', '', 0, 'setting:website:save', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (505, 501, 'C', '网站备案', '', 0, 'setting:copyright:detail', 'filing', 'setting/website/filing', '', '', 0, 1, 0, 1650341765, 1660202294);
INSERT INTO `la_system_auth_menu` VALUES (506, 505, 'A', '备案保存', '', 0, 'setting:copyright:save', '', 'setting/website/protocol', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (510, 501, 'C', '政策协议', '', 0, 'setting:protocol:detail', 'protocol', 'setting/website/protocol', '', '', 0, 1, 0, 1660027606, 1660202312);
INSERT INTO `la_system_auth_menu` VALUES (511, 510, 'A', '协议保存', '', 0, 'setting:protocol:save', '', '', '', '', 0, 0, 0, 1660027606, 1663670865);
INSERT INTO `la_system_auth_menu` VALUES (515, 600, 'C', '字典管理', 'el-icon-Box', 0, 'setting:dict:type:list', 'dict', 'setting/dict/type/index', '', '', 0, 1, 0, 1660035436, 1663226087);
INSERT INTO `la_system_auth_menu` VALUES (516, 515, 'A', '字典类型新增', '', 0, 'setting:dict:type:add', '', '', '', '', 0, 1, 0, 1660202761, 1660202761);
INSERT INTO `la_system_auth_menu` VALUES (517, 515, 'A', '字典类型编辑', '', 0, 'setting:dict:type:edit', '', '', '', '', 0, 1, 0, 1660202842, 1660202842);
INSERT INTO `la_system_auth_menu` VALUES (518, 515, 'A', '字典类型删除', '', 0, 'setting:dict:type:del', '', '', '', '', 0, 1, 0, 1660202903, 1660202903);
INSERT INTO `la_system_auth_menu` VALUES (519, 600, 'C', '字典数据管理', '', 0, 'setting:dict:data:list', 'dict/data', 'setting/dict/data/index', '/dev_tools/dict', '', 0, 0, 0, 1660202948, 1663309252);
INSERT INTO `la_system_auth_menu` VALUES (520, 515, 'A', '字典数据新增', '', 0, 'setting:dict:data:add', '', '', '', '', 0, 1, 0, 1660203117, 1660203117);
INSERT INTO `la_system_auth_menu` VALUES (521, 515, 'A', '字典数据编辑', '', 0, 'setting:dict:data:edit', '', '', '', '', 0, 1, 0, 1660203142, 1660203142);
INSERT INTO `la_system_auth_menu` VALUES (522, 515, 'A', '字典数据删除', '', 0, 'setting:dict:data:del', '', '', '', '', 0, 1, 0, 1660203159, 1660203159);
INSERT INTO `la_system_auth_menu` VALUES (550, 500, 'M', '系统维护', 'el-icon-SetUp', 0, '', 'system', '', '', '', 0, 1, 0, 1650341765, 1660202466);
INSERT INTO `la_system_auth_menu` VALUES (553, 550, 'C', '系统日志', '', 0, 'system:log:operate', 'journal', 'setting/system/journal', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (555, 500, 'C', '存储设置', 'el-icon-FolderOpened', 6, 'setting:storage:list', 'storage', 'setting/storage/index', '', '', 0, 1, 0, 1650341765, 1663312996);
INSERT INTO `la_system_auth_menu` VALUES (556, 555, 'A', '保存配置', '', 0, 'setting:storage:edit', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `la_system_auth_menu` VALUES (600, 0, 'M', '开发工具', 'el-icon-EditPen', 0, '', 'dev_tools', '', '', '', 0, 1, 0, 1660027606, 1664335701);
INSERT INTO `la_system_auth_menu` VALUES (610, 600, 'C', '代码生成器', 'el-icon-DocumentAdd', 0, 'gen:list', 'code', 'dev_tools/code/index', '', '', 0, 1, 0, 1660028954, 1660532510);
INSERT INTO `la_system_auth_menu` VALUES (611, 610, 'A', '导入数据表', '', 0, 'gen:importTable', '', '', '', '', 0, 1, 0, 1660532389, 1660532389);
INSERT INTO `la_system_auth_menu` VALUES (612, 610, 'A', '生成代码', '', 0, 'gen:genCode', '', '', '', '', 0, 1, 0, 1660532421, 1660532421);
INSERT INTO `la_system_auth_menu` VALUES (613, 610, 'A', '下载代码', '', 0, 'gen:downloadCode', '', '', '', '', 0, 1, 0, 1660532437, 1660532437);
INSERT INTO `la_system_auth_menu` VALUES (614, 610, 'A', '预览代码', '', 0, 'gen:previewCode', '', '', '', '', 0, 1, 0, 1660532549, 1660532549);
INSERT INTO `la_system_auth_menu` VALUES (616, 610, 'A', '同步表结构', '', 0, 'gen:syncTable', '', '', '', '', 0, 1, 0, 1660532781, 1660532781);
INSERT INTO `la_system_auth_menu` VALUES (617, 610, 'A', '删除数据表', '', 0, 'gen:delTable', '', '', '', '', 0, 1, 0, 1660532800, 1660532800);
INSERT INTO `la_system_auth_menu` VALUES (618, 610, 'A', '数据表详情', '', 0, 'gen:detail', '', '', '', '', 0, 1, 0, 1660532964, 1660532977);
INSERT INTO `la_system_auth_menu` VALUES (712, 0, 'M', '用户管理', 'el-icon-User', 48, '', 'consumer', '', '', '', 0, 1, 0, 1661832966, 1663294141);
INSERT INTO `la_system_auth_menu` VALUES (713, 712, 'C', '用户列表', 'el-icon-User', 0, 'user:list', 'lists', 'consumer/lists/index', '', '', 0, 1, 0, 1661839365, 1663301092);
INSERT INTO `la_system_auth_menu` VALUES (714, 714, 'A', '用户编辑', '', 0, 'user:edit', 'detail', 'consumer/lists/detail', '/consumer/lists', '', 0, 0, 0, 1661840502, 1662627718);
INSERT INTO `la_system_auth_menu` VALUES (715, 600, 'C', '编辑数据表', '', 0, 'gen:editTable', 'code/edit', 'dev_tools/code/edit', '/dev_tools/code', '', 0, 0, 0, 1661843525, 1661843615);
INSERT INTO `la_system_auth_menu` VALUES (720, 500, 'M', '消息通知', 'el-icon-Message', 9, '', 'message', '', '', '', 0, 1, 0, 1661848742, 1662626364);
INSERT INTO `la_system_auth_menu` VALUES (721, 720, 'C', '通知设置', '', 0, 'setting:notice:list', 'notice', 'message/notice/index', '', '', 0, 1, 0, 1661848772, 1662638112);
INSERT INTO `la_system_auth_menu` VALUES (722, 720, 'C', '通知详情', '', 0, 'setting:notice:detail', 'notice/edit', 'message/notice/edit', '/setting/message/notice', '', 0, 0, 0, 1661848944, 1663142853);
INSERT INTO `la_system_auth_menu` VALUES (723, 720, 'C', '短信设置', '', 0, 'setting:sms:list', 'short_letter', 'message/short_letter/index', '', '', 0, 1, 0, 1661848995, 1662638165);
INSERT INTO `la_system_auth_menu` VALUES (724, 500, 'M', '用户设置', 'local-icon-keziyuyue', 8, '', 'user', '', '', '', 0, 1, 0, 1662455407, 1663301570);
INSERT INTO `la_system_auth_menu` VALUES (725, 724, 'C', '用户设置', '', 0, 'setting:user:detail', 'setup', 'setting/user/setup', '', '', 0, 1, 0, 1662455555, 1663312225);
INSERT INTO `la_system_auth_menu` VALUES (726, 724, 'C', '登录注册', '', 0, 'setting:login:detail', 'login_register', 'setting/user/login_register', '', '', 0, 1, 0, 1662456475, 1663312263);
INSERT INTO `la_system_auth_menu` VALUES (739, 712, 'C', '用户详情', '', 0, 'user:detail', 'detail', 'consumer/lists/detail', '/consumer/lists', '', 0, 0, 0, 1662628049, 1662628049);
INSERT INTO `la_system_auth_menu` VALUES (740, 739, 'A', '用户编辑', '', 0, 'user:edit', '', '', '', '', 0, 1, 0, 1662628085, 1662628085);
INSERT INTO `la_system_auth_menu` VALUES (741, 721, 'A', '设置保存', '', 0, 'setting:notice:save', '', '', '', '', 0, 1, 0, 1662638049, 1662638049);
INSERT INTO `la_system_auth_menu` VALUES (742, 723, 'A', '短信详情', '', 0, 'setting:sms:detail', '', '', '', '', 0, 1, 0, 1662638180, 1662638180);
INSERT INTO `la_system_auth_menu` VALUES (743, 723, 'A', '保存设置', '', 0, 'setting:sms:save', '', '', '', '', 0, 1, 0, 1662638196, 1662638196);
INSERT INTO `la_system_auth_menu` VALUES (758, 725, 'A', '保存', '', 0, 'setting:user:save', '', '', '', '', 0, 1, 0, 1663312193, 1663312193);
INSERT INTO `la_system_auth_menu` VALUES (759, 726, 'A', '保存', '', 0, 'setting:login:save', '', '', '', '', 0, 1, 0, 1663312289, 1663312289);
INSERT INTO `la_system_auth_menu` VALUES (774, 610, 'A', '导入数据表列表', '', 0, 'gen:db', '', '', '', '', 1, 1, 0, 1665646316, 1665646316);
INSERT INTO `la_system_auth_menu` VALUES (776, 0, 'M', '数据管理', 'el-icon-TakeawayBox', 45, '', 'data_manage', '', '', '', 1, 1, 0, 1709545917, 1709546157);
INSERT INTO `la_system_auth_menu` VALUES (777, 776, 'C', '预训练数据集', 'el-icon-Magnet', 0, '', 'data_collect', 'data_manage/data_collect/index', '', '', 1, 1, 0, 1709546063, 1709696523);
INSERT INTO `la_system_auth_menu` VALUES (778, 776, 'C', '微调数据集', 'el-icon-SetUp', 0, '', '、、', '///', '', '', 1, 1, 0, 1709696442, 1709696621);

-- ----------------------------
-- Table structure for la_system_auth_perm
-- ----------------------------
DROP TABLE IF EXISTS `la_system_auth_perm`;
CREATE TABLE `la_system_auth_perm`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '主键',
  `role_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色ID',
  `menu_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_system_auth_perm
-- ----------------------------
INSERT INTO `la_system_auth_perm` VALUES ('05cd2137941d4c919b07e0b72ed39bc9', 2, 1);
INSERT INTO `la_system_auth_perm` VALUES ('0898463f1ac4467086f864419aa07856', 1, 776);
INSERT INTO `la_system_auth_perm` VALUES ('0b44b79eb2a544e981582a4d3a533f66', 1, 510);
INSERT INTO `la_system_auth_perm` VALUES ('0b477a8cacbd4ee5bfaa0b0c9e59fc92', 1, 618);
INSERT INTO `la_system_auth_perm` VALUES ('0cf8dd5aee6e44c59f97909c9fd9f3d2', 1, 110);
INSERT INTO `la_system_auth_perm` VALUES ('1189363b4e674de69cf7556eead11609', 1, 613);
INSERT INTO `la_system_auth_perm` VALUES ('11bd9e53d55e4694b2060788e04fa469', 1, 104);
INSERT INTO `la_system_auth_perm` VALUES ('1bb533f3b54f447698d648eecea86a94', 1, 723);
INSERT INTO `la_system_auth_perm` VALUES ('1bee9507eb97401dbdd28b2c8a411592', 1, 612);
INSERT INTO `la_system_auth_perm` VALUES ('1c1b1e457af8436da848845a42f9c440', 1, 209);
INSERT INTO `la_system_auth_perm` VALUES ('1c6b1096216d4decb1f12382527fa7f1', 1, 515);
INSERT INTO `la_system_auth_perm` VALUES ('21f8595621ab47749445f6f52e33e80f', 1, 720);
INSERT INTO `la_system_auth_perm` VALUES ('231528ea639345b091611ccab1a54fbe', 1, 743);
INSERT INTO `la_system_auth_perm` VALUES ('2c4c1218e1cb4efd8757bd81fd798b35', 1, 114);
INSERT INTO `la_system_auth_perm` VALUES ('301fd1883d6443f290e4436b3d29f5ed', 1, 200);
INSERT INTO `la_system_auth_perm` VALUES ('30e79945fa9e4a9b82955a29740549c0', 1, 505);
INSERT INTO `la_system_auth_perm` VALUES ('357a768eb87b47aaaf35053cc0619b0a', 1, 741);
INSERT INTO `la_system_auth_perm` VALUES ('381411b38cd94f0e8578ed6c380e41b8', 1, 611);
INSERT INTO `la_system_auth_perm` VALUES ('38b6c9a9dc594100aa505dafc4f49da8', 1, 774);
INSERT INTO `la_system_auth_perm` VALUES ('3b46b26332ef4a378530b65ee0a9b6b2', 1, 141);
INSERT INTO `la_system_auth_perm` VALUES ('3d6d0de72ee94b4f8042603fc808c782', 1, 205);
INSERT INTO `la_system_auth_perm` VALUES ('3e68ad8d38514eddb8aa5f147975d887', 1, 111);
INSERT INTO `la_system_auth_perm` VALUES ('405b25958aa643bfbbc8970c0f05d3b3', 1, 112);
INSERT INTO `la_system_auth_perm` VALUES ('40cbed6df04e482db35acae7517ffbb2', 1, 215);
INSERT INTO `la_system_auth_perm` VALUES ('44f504939ade47a19336ad9dfdd9853d', 1, 122);
INSERT INTO `la_system_auth_perm` VALUES ('46ba9d9691f24e88aa20d13eaa068bc2', 1, 739);
INSERT INTO `la_system_auth_perm` VALUES ('47de48c41d174c2d9eb8150b59e29ce0', 1, 120);
INSERT INTO `la_system_auth_perm` VALUES ('48f1e113b9c84b45abeb0577e1fcaadd', 1, 740);
INSERT INTO `la_system_auth_perm` VALUES ('49480a1d08c84a5daa754c0434d70720', 1, 550);
INSERT INTO `la_system_auth_perm` VALUES ('49e8bbe76f33457596bf85811585abb5', 1, 207);
INSERT INTO `la_system_auth_perm` VALUES ('4a581cb7e53e4ac98d372a5cb37b9655', 1, 103);
INSERT INTO `la_system_auth_perm` VALUES ('4d3fba9820f8418398ddd2401be760b1', 1, 759);
INSERT INTO `la_system_auth_perm` VALUES ('4e18e1736cd44fd9ae94f2c48e3bd358', 1, 614);
INSERT INTO `la_system_auth_perm` VALUES ('4ee8d821a7b6462d829dbea66d47f930', 1, 100);
INSERT INTO `la_system_auth_perm` VALUES ('526f589668b4419295365902ff7b59e8', 1, 712);
INSERT INTO `la_system_auth_perm` VALUES ('55069a0dadef410fb2d4a34ff3b49bd6', 1, 511);
INSERT INTO `la_system_auth_perm` VALUES ('57caa2c90812413198ea616288afb18a', 1, 758);
INSERT INTO `la_system_auth_perm` VALUES ('5851a1afed05438cb7da650030d8699c', 1, 517);
INSERT INTO `la_system_auth_perm` VALUES ('5af4ae6e213b47d4a763bc6160b1757a', 1, 208);
INSERT INTO `la_system_auth_perm` VALUES ('5f070f461ca947758b9bde85e41c4993', 1, 724);
INSERT INTO `la_system_auth_perm` VALUES ('5f68cd1e04aa44a7be4acd6f54544bbe', 1, 610);
INSERT INTO `la_system_auth_perm` VALUES ('637a39675c3a4861bb755840f60691f0', 1, 726);
INSERT INTO `la_system_auth_perm` VALUES ('6e3ef65b2637499ca9fe19f72e3a3cac', 1, 204);
INSERT INTO `la_system_auth_perm` VALUES ('6fb8963649ec44208b65a879f302aa43', 2, 776);
INSERT INTO `la_system_auth_perm` VALUES ('7132878d26f2417dbecf8ed58dd3739f', 1, 131);
INSERT INTO `la_system_auth_perm` VALUES ('722c10afb9e64d55a63a4affcbb1e79a', 1, 123);
INSERT INTO `la_system_auth_perm` VALUES ('72ef71046fa24cc9ac6c4924f7af3af7', 1, 617);
INSERT INTO `la_system_auth_perm` VALUES ('742c7ea48bce44bfbd41507a7576e6e7', 1, 715);
INSERT INTO `la_system_auth_perm` VALUES ('761a93b8daa7458c98e4ba0169ee0d4c', 1, 553);
INSERT INTO `la_system_auth_perm` VALUES ('7a881ebe713240f086bdea9300b3151e', 1, 134);
INSERT INTO `la_system_auth_perm` VALUES ('7ac7812d7cf24e26b4016adfe3e5c704', 1, 102);
INSERT INTO `la_system_auth_perm` VALUES ('7b71f3e6badb4ce9877eac1d0a7a576c', 1, 555);
INSERT INTO `la_system_auth_perm` VALUES ('7db84c47b0c7442f865386743ed8feb7', 1, 503);
INSERT INTO `la_system_auth_perm` VALUES ('869cb6efa10746e1b74201fe5bae6b2e', 1, 556);
INSERT INTO `la_system_auth_perm` VALUES ('882805326d3d4772aafdb18b952c523f', 1, 519);
INSERT INTO `la_system_auth_perm` VALUES ('8aaadc9acd5c4a90bd5f5f5fcf9f632d', 1, 516);
INSERT INTO `la_system_auth_perm` VALUES ('8b0b5359a4bf48c1a4b7f49c48d11ef3', 1, 133);
INSERT INTO `la_system_auth_perm` VALUES ('8dd4f1f4e9e242029f218ff4562b30f3', 1, 140);
INSERT INTO `la_system_auth_perm` VALUES ('8e1b2359d2aa4a1f8b94cc35ea115e2a', 1, 132);
INSERT INTO `la_system_auth_perm` VALUES ('8fa4206d316e44bea339afe934144912', 1, 143);
INSERT INTO `la_system_auth_perm` VALUES ('917d30e5f7594fc5b638f5d12456e280', 1, 101);
INSERT INTO `la_system_auth_perm` VALUES ('9af7a41a32164cdeae3e128332cb262d', 1, 135);
INSERT INTO `la_system_auth_perm` VALUES ('9f9eabd3416840a79e61816a9eb0ec1f', 1, 777);
INSERT INTO `la_system_auth_perm` VALUES ('a237bab7ca254139aa8d3b7feb54a5b7', 1, 521);
INSERT INTO `la_system_auth_perm` VALUES ('a4218a0fa04349398c69e01419be4f8d', 1, 105);
INSERT INTO `la_system_auth_perm` VALUES ('a5c1e274208e40f1ad1f84e494e81b28', 1, 206);
INSERT INTO `la_system_auth_perm` VALUES ('a5f03d7b33bb4fc898e35e6bfe651773', 1, 130);
INSERT INTO `la_system_auth_perm` VALUES ('a65cb28d281743cd9c08241b5af43d4b', 1, 216);
INSERT INTO `la_system_auth_perm` VALUES ('a7506032af934492ad70cc1622aeb9a5', 1, 106);
INSERT INTO `la_system_auth_perm` VALUES ('a7a00bcf69244ff7a146f85ef16cc158', 2, 777);
INSERT INTO `la_system_auth_perm` VALUES ('a7c7871217674c228e63f76bcd010539', 1, 124);
INSERT INTO `la_system_auth_perm` VALUES ('aa9139503be7408ea632887ae2086bae', 1, 113);
INSERT INTO `la_system_auth_perm` VALUES ('aaff4883806444f78d1322f00711676e', 1, 518);
INSERT INTO `la_system_auth_perm` VALUES ('ada1c5333f3c45d3893d0d924e2e63be', 1, 501);
INSERT INTO `la_system_auth_perm` VALUES ('b3ae172ec3904959ab0dcac51b359b33', 1, 506);
INSERT INTO `la_system_auth_perm` VALUES ('b8e5e14fb04e4b3f98f652f12f1df684', 1, 121);
INSERT INTO `la_system_auth_perm` VALUES ('b9e3a260b4e74b8fb189a84dcf92c34f', 1, 1);
INSERT INTO `la_system_auth_perm` VALUES ('bc525b9ab94c47ae91369983eaee3747', 1, 600);
INSERT INTO `la_system_auth_perm` VALUES ('bfb0d18a6dd74965b677e40bbf517a3d', 1, 522);
INSERT INTO `la_system_auth_perm` VALUES ('c9d71c45ad3e4cb2b222bcc03281cfb7', 1, 142);
INSERT INTO `la_system_auth_perm` VALUES ('cc3ce261c831481a812758838d17680c', 1, 201);
INSERT INTO `la_system_auth_perm` VALUES ('d1cf4403967e44bab69e9d485f96bad7', 1, 502);
INSERT INTO `la_system_auth_perm` VALUES ('d324e2b0e749400989666f708e1b339c', 1, 203);
INSERT INTO `la_system_auth_perm` VALUES ('d5d8683c868b4b35bfff1fba5a445d89', 1, 616);
INSERT INTO `la_system_auth_perm` VALUES ('db0c8ee644484b5294cd10f28a028eb8', 1, 721);
INSERT INTO `la_system_auth_perm` VALUES ('ddf0ac20de3f4d5b99b04efce59cb60a', 1, 713);
INSERT INTO `la_system_auth_perm` VALUES ('e0902f82d2644fceb725303d12d21e58', 1, 520);
INSERT INTO `la_system_auth_perm` VALUES ('e185cd4e70724d9ab7bbbe2904bbe8c6', 1, 742);
INSERT INTO `la_system_auth_perm` VALUES ('e5a1d420233c46f0acfbbc6ac7ee2d9c', 1, 202);
INSERT INTO `la_system_auth_perm` VALUES ('ebb36e5b32bf4a87bc8c0d513e9316db', 1, 500);
INSERT INTO `la_system_auth_perm` VALUES ('edc4f200d5cb4832a8268204e1275e1d', 1, 144);
INSERT INTO `la_system_auth_perm` VALUES ('f1c6b3fdf3864d30b377c57fad2e32c7', 1, 217);
INSERT INTO `la_system_auth_perm` VALUES ('f4c5d11679ab490a84121a9fd3cd2c9d', 1, 722);
INSERT INTO `la_system_auth_perm` VALUES ('f57ed3f3ae70484a82c288b762aa714a', 1, 725);

-- ----------------------------
-- Table structure for la_system_auth_post
-- ----------------------------
DROP TABLE IF EXISTS `la_system_auth_post`;
CREATE TABLE `la_system_auth_post`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '岗位编码',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '岗位名称',
  `remarks` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '岗位备注',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '岗位排序',
  `is_stop` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否停用: 0=否, 1=是',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统岗位管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_system_auth_post
-- ----------------------------

-- ----------------------------
-- Table structure for la_system_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `la_system_auth_role`;
CREATE TABLE `la_system_auth_role`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色排序',
  `is_disable` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否禁用: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_system_auth_role
-- ----------------------------
INSERT INTO `la_system_auth_role` VALUES (1, '审核员', '审核数据', 0, 0, 1668679451, 1709618557);
INSERT INTO `la_system_auth_role` VALUES (2, '数据集录入', '主要负责数据集录入', 0, 0, 1709618503, 1709618533);

-- ----------------------------
-- Table structure for la_system_config
-- ----------------------------
DROP TABLE IF EXISTS `la_system_config`;
CREATE TABLE `la_system_config`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类型',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '键',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '值',
  `create_time` int UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统全局配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_system_config
-- ----------------------------
INSERT INTO `la_system_config` VALUES (1, 'storage', 'default', 'local', 1660620367, 1662620927);
INSERT INTO `la_system_config` VALUES (2, 'storage', 'local', '{\"name\":\"本地存储\"}', 1660620367, 1662620927);
INSERT INTO `la_system_config` VALUES (3, 'storage', 'qiniu', '{\"name\":\"七牛云存储\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\"}', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (4, 'storage', 'aliyun', '{\"name\":\"阿里云存储\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\"}', 1660620367, 1662620071);
INSERT INTO `la_system_config` VALUES (5, 'storage', 'qcloud', '{\"name\":\"腾讯云存储\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\",\"region\":\"\"}', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (6, 'sms', 'default', 'aliyun', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (7, 'sms', 'aliyun', '{\"name\":\"阿里云短信\",\"alias\":\"aliyun\",\"sign\":\"\",\"appKey\":\"\",\"secretKey\":\"\"}', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (8, 'sms', 'tencent', '{\"name\":\"腾讯云短信\",\"alias\":\"tencent\",\"sign\":\"\",\"appId\":\"\",\"secretId\":\"\",\"secretKey\":\"\"}', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (9, 'sms', 'huawei', '{\"name\":\"华为云短信\",\"alias\":\"huawei\"}', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (10, 'website', 'name', '数据集后台', 1660620367, 1709545450);
INSERT INTO `la_system_config` VALUES (11, 'website', 'logo', '/api/static/backend_logo.png', 1660620367, 1709545450);
INSERT INTO `la_system_config` VALUES (12, 'website', 'favicon', '/api/static/backend_favicon.ico', 1660620367, 1709545450);
INSERT INTO `la_system_config` VALUES (13, 'website', 'backdrop', '/api/static/backend_backdrop.png', 1660620367, 1709545450);
INSERT INTO `la_system_config` VALUES (14, 'website', 'copyright', '[{\"name\":\"LikeAdmin开源系统\",\"link\":\"http://www.beian.gov.cn\"}]', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (15, 'website', 'shopName', 'LikeAdmin开源系统', 1631255140, 1709545450);
INSERT INTO `la_system_config` VALUES (16, 'website', 'shopLogo', '/api/static/shop_logo.png', 1631255140, 1709545450);
INSERT INTO `la_system_config` VALUES (17, 'protocol', 'service', '{\"name\":\"服务协议\",\"content\":\"\"}', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (18, 'protocol', 'privacy', '{\"name\":\"隐私协议\",\"content\":\"\"}', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (19, 'tabbar', 'style', '{\"defaultColor\":\"#4A5DFF\",\"selectedColor\":\"#EA5455\"}', 1660620367, 1662544900);
INSERT INTO `la_system_config` VALUES (20, 'search', 'isHotSearch', '0', 1660620367, 1662546997);
INSERT INTO `la_system_config` VALUES (30, 'h5_channel', 'status', '1', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (31, 'h5_channel', 'close', '0', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (32, 'h5_channel', 'url', '', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (40, 'mp_channel', 'name', '', 1660620367, 1662551403);
INSERT INTO `la_system_config` VALUES (41, 'mp_channel', 'primaryId', '', 1660620367, 1662551403);
INSERT INTO `la_system_config` VALUES (42, 'mp_channel', 'appId', '', 1660620367, 1662551403);
INSERT INTO `la_system_config` VALUES (43, 'mp_channel', 'appSecret', '', 1660620367, 1662551403);
INSERT INTO `la_system_config` VALUES (44, 'mp_channel', 'qrCode', '', 1660620367, 1662551403);
INSERT INTO `la_system_config` VALUES (50, 'wx_channel', 'appId', '', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (51, 'wx_channel', 'appSecret', '', 1660620367, 1660620367);
INSERT INTO `la_system_config` VALUES (55, 'oa_channel', 'name', '', 1660620367, 1662551337);
INSERT INTO `la_system_config` VALUES (56, 'oa_channel', 'primaryId', ' ', 1660620367, 1662551337);
INSERT INTO `la_system_config` VALUES (57, 'oa_channel', 'qrCode', '', 1662551337, 1662551337);
INSERT INTO `la_system_config` VALUES (58, 'oa_channel', 'appId', '', 1660620367, 1662551337);
INSERT INTO `la_system_config` VALUES (59, 'oa_channel', 'appSecret', '', 1660620367, 1662551337);
INSERT INTO `la_system_config` VALUES (60, 'oa_channel', 'url', '', 1660620367, 1662551337);
INSERT INTO `la_system_config` VALUES (61, 'oa_channel', 'token', '', 1660620367, 1662551337);
INSERT INTO `la_system_config` VALUES (62, 'oa_channel', 'encodingAesKey', '', 1660620367, 1662551337);
INSERT INTO `la_system_config` VALUES (63, 'oa_channel', 'encryptionType', '1', 1660620367, 1662551337);
INSERT INTO `la_system_config` VALUES (64, 'oa_channel', 'menus', '[]', 1631255140, 1663118712);
INSERT INTO `la_system_config` VALUES (70, 'login', 'loginWay', '1,2', 1660620367, 1662538771);
INSERT INTO `la_system_config` VALUES (71, 'login', 'forceBindMobile', '0', 1660620367, 1662538771);
INSERT INTO `la_system_config` VALUES (72, 'login', 'openAgreement', '1', 1660620367, 1662538771);
INSERT INTO `la_system_config` VALUES (73, 'login', 'openOtherAuth', '1', 1660620367, 1662538771);
INSERT INTO `la_system_config` VALUES (74, 'login', 'autoLoginAuth', '1,2', 1660620367, 1662538771);
INSERT INTO `la_system_config` VALUES (80, 'user', 'defaultAvatar', '/api/static/default_avatar.png', 1660620367, 1662535156);

-- ----------------------------
-- Table structure for la_system_log_login
-- ----------------------------
DROP TABLE IF EXISTS `la_system_log_login`;
CREATE TABLE `la_system_log_login`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '注解',
  `admin_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录账号',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录地址',
  `os` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '操作状态: 1=成功, 2=失败',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统登录日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_system_log_login
-- ----------------------------
INSERT INTO `la_system_log_login` VALUES (1, 1, 'admin', '127.0.0.1', 'Windows', 'Chrome', 0, 1709544180);
INSERT INTO `la_system_log_login` VALUES (2, 1, 'admin', '127.0.0.1', 'Windows', 'Chrome', 1, 1709544278);
INSERT INTO `la_system_log_login` VALUES (3, 1, 'admin', '127.0.0.1', 'Windows', 'Chrome', 1, 1709546789);
INSERT INTO `la_system_log_login` VALUES (4, 1, 'admin', '127.0.0.1', 'Windows', 'Chrome', 1, 1709599549);
INSERT INTO `la_system_log_login` VALUES (5, 1, 'admin', '127.0.0.1', 'Windows', 'Chrome', 1, 1709605820);
INSERT INTO `la_system_log_login` VALUES (6, 1, 'admin', '127.0.0.1', 'Windows', 'Chrome', 1, 1709610874);
INSERT INTO `la_system_log_login` VALUES (7, 1, 'admin', '127.0.0.1', 'Windows', 'Chrome', 0, 1709624093);
INSERT INTO `la_system_log_login` VALUES (8, 1, 'admin', '127.0.0.1', 'Windows', 'Chrome', 0, 1709624105);
INSERT INTO `la_system_log_login` VALUES (9, 1, 'admin', '127.0.0.1', 'Windows', 'Chrome', 0, 1709624246);
INSERT INTO `la_system_log_login` VALUES (10, 1, 'admin', '127.0.0.1', 'Windows', 'Chrome', 0, 1709624316);
INSERT INTO `la_system_log_login` VALUES (11, 1, 'admin', '127.0.0.1', 'Windows', 'Chrome', 1, 1709624481);
INSERT INTO `la_system_log_login` VALUES (12, 1, 'admin', '127.0.0.1', 'Windows', 'Chrome', 1, 1709686145);

-- ----------------------------
-- Table structure for la_system_log_operate
-- ----------------------------
DROP TABLE IF EXISTS `la_system_log_operate`;
CREATE TABLE `la_system_log_operate`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `admin_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作人ID',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求类型: GET/POST/PUT',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作标题',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求IP',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求接口',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求方法',
  `args` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误信息',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '执行状态: 1=成功, 2=失败',
  `start_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
  `task_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行耗时',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_system_log_operate
-- ----------------------------
INSERT INTO `la_system_log_operate` VALUES (1, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 703}]', '请先删除子菜单再操作！', 2, 1709544947, 1709544947, 3, 1709544947);
INSERT INTO `la_system_log_operate` VALUES (2, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 704}]', '请先删除子菜单再操作！', 2, 1709544953, 1709544953, 1, 1709544953);
INSERT INTO `la_system_log_operate` VALUES (3, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 775}]', '', 1, 1709544956, 1709544956, 6, 1709544956);
INSERT INTO `la_system_log_operate` VALUES (4, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 737}]', '', 1, 1709544964, 1709544964, 4, 1709544964);
INSERT INTO `la_system_log_operate` VALUES (5, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 716}]', '', 1, 1709544967, 1709544967, 9, 1709544967);
INSERT INTO `la_system_log_operate` VALUES (6, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 734}]', '', 1, 1709544968, 1709544968, 9, 1709544968);
INSERT INTO `la_system_log_operate` VALUES (7, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 735}]', '', 1, 1709544970, 1709544970, 8, 1709544970);
INSERT INTO `la_system_log_operate` VALUES (8, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 736}]', '', 1, 1709544972, 1709544972, 7, 1709544972);
INSERT INTO `la_system_log_operate` VALUES (9, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 705}]', '', 1, 1709544975, 1709544975, 10, 1709544975);
INSERT INTO `la_system_log_operate` VALUES (10, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 730}]', '', 1, 1709544979, 1709544979, 10, 1709544979);
INSERT INTO `la_system_log_operate` VALUES (11, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 732}]', '', 1, 1709544981, 1709544981, 7, 1709544981);
INSERT INTO `la_system_log_operate` VALUES (12, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 733}]', '', 1, 1709544983, 1709544983, 7, 1709544983);
INSERT INTO `la_system_log_operate` VALUES (13, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 738}]', '', 1, 1709544985, 1709544985, 8, 1709544985);
INSERT INTO `la_system_log_operate` VALUES (14, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 755}]', '', 1, 1709544988, 1709544988, 5, 1709544988);
INSERT INTO `la_system_log_operate` VALUES (15, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 704}]', '', 1, 1709545002, 1709545002, 11, 1709545002);
INSERT INTO `la_system_log_operate` VALUES (16, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 703}]', '', 1, 1709545005, 1709545005, 4, 1709545005);
INSERT INTO `la_system_log_operate` VALUES (17, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 754}]', '', 1, 1709545025, 1709545025, 6, 1709545025);
INSERT INTO `la_system_log_operate` VALUES (18, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 719}]', '', 1, 1709545028, 1709545028, 9, 1709545028);
INSERT INTO `la_system_log_operate` VALUES (19, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 753}]', '', 1, 1709545030, 1709545030, 6, 1709545030);
INSERT INTO `la_system_log_operate` VALUES (20, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 718}]', '', 1, 1709545033, 1709545033, 9, 1709545033);
INSERT INTO `la_system_log_operate` VALUES (21, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 717}]', '', 1, 1709545036, 1709545036, 8, 1709545036);
INSERT INTO `la_system_log_operate` VALUES (22, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 710}]', '请先删除子菜单再操作！', 2, 1709545048, 1709545048, 1, 1709545048);
INSERT INTO `la_system_log_operate` VALUES (23, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 701}]', '', 1, 1709545076, 1709545076, 9, 1709545076);
INSERT INTO `la_system_log_operate` VALUES (24, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 700}]', '', 1, 1709545079, 1709545079, 3, 1709545079);
INSERT INTO `la_system_log_operate` VALUES (25, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 707}]', '请先删除子菜单再操作！', 2, 1709545087, 1709545087, 3, 1709545087);
INSERT INTO `la_system_log_operate` VALUES (26, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 746}]', '', 1, 1709545253, 1709545253, 13, 1709545253);
INSERT INTO `la_system_log_operate` VALUES (27, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 711}]', '', 1, 1709545255, 1709545255, 15, 1709545255);
INSERT INTO `la_system_log_operate` VALUES (28, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 745}]', '', 1, 1709545260, 1709545260, 17, 1709545260);
INSERT INTO `la_system_log_operate` VALUES (29, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 710}]', '', 1, 1709545262, 1709545262, 10, 1709545262);
INSERT INTO `la_system_log_operate` VALUES (30, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 744}]', '', 1, 1709545269, 1709545269, 6, 1709545269);
INSERT INTO `la_system_log_operate` VALUES (31, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 707}]', '', 1, 1709545271, 1709545271, 8, 1709545271);
INSERT INTO `la_system_log_operate` VALUES (32, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 773}]', '', 1, 1709545277, 1709545277, 16, 1709545277);
INSERT INTO `la_system_log_operate` VALUES (33, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 772}]', '', 1, 1709545279, 1709545279, 8, 1709545279);
INSERT INTO `la_system_log_operate` VALUES (34, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 771}]', '', 1, 1709545281, 1709545281, 5, 1709545281);
INSERT INTO `la_system_log_operate` VALUES (35, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 770}]', '', 1, 1709545284, 1709545284, 8, 1709545284);
INSERT INTO `la_system_log_operate` VALUES (36, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 752}]', '', 1, 1709545287, 1709545287, 15, 1709545287);
INSERT INTO `la_system_log_operate` VALUES (37, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 751}]', '请先删除子菜单再操作！', 2, 1709545301, 1709545301, 4, 1709545301);
INSERT INTO `la_system_log_operate` VALUES (38, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 766}]', '', 1, 1709545303, 1709545303, 19, 1709545303);
INSERT INTO `la_system_log_operate` VALUES (39, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 767}]', '', 1, 1709545306, 1709545306, 5, 1709545306);
INSERT INTO `la_system_log_operate` VALUES (40, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 768}]', '', 1, 1709545308, 1709545308, 6, 1709545308);
INSERT INTO `la_system_log_operate` VALUES (41, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 769}]', '', 1, 1709545310, 1709545310, 16, 1709545310);
INSERT INTO `la_system_log_operate` VALUES (42, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 751}]', '', 1, 1709545313, 1709545313, 14, 1709545313);
INSERT INTO `la_system_log_operate` VALUES (43, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 765}]', '', 1, 1709545316, 1709545316, 5, 1709545316);
INSERT INTO `la_system_log_operate` VALUES (44, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 764}]', '', 1, 1709545318, 1709545318, 2, 1709545318);
INSERT INTO `la_system_log_operate` VALUES (45, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 763}]', '', 1, 1709545320, 1709545320, 15, 1709545320);
INSERT INTO `la_system_log_operate` VALUES (46, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 762}]', '', 1, 1709545322, 1709545322, 7, 1709545322);
INSERT INTO `la_system_log_operate` VALUES (47, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 750}]', '', 1, 1709545325, 1709545325, 9, 1709545325);
INSERT INTO `la_system_log_operate` VALUES (48, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 757}]', '', 1, 1709545330, 1709545330, 8, 1709545330);
INSERT INTO `la_system_log_operate` VALUES (49, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 756}]', '', 1, 1709545333, 1709545333, 4, 1709545333);
INSERT INTO `la_system_log_operate` VALUES (50, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 748}]', '', 1, 1709545335, 1709545335, 8, 1709545335);
INSERT INTO `la_system_log_operate` VALUES (51, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 747}]', '', 1, 1709545338, 1709545338, 7, 1709545338);
INSERT INTO `la_system_log_operate` VALUES (52, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 709}]', '', 1, 1709545340, 1709545340, 18, 1709545340);
INSERT INTO `la_system_log_operate` VALUES (53, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 708}]', '', 1, 1709545344, 1709545344, 8, 1709545344);
INSERT INTO `la_system_log_operate` VALUES (54, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 706}]', '', 1, 1709545346, 1709545346, 6, 1709545346);
INSERT INTO `la_system_log_operate` VALUES (55, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 760}]', '', 1, 1709545539, 1709545539, 12, 1709545539);
INSERT INTO `la_system_log_operate` VALUES (56, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 728}]', '', 1, 1709545542, 1709545542, 8, 1709545542);
INSERT INTO `la_system_log_operate` VALUES (57, 1, 'GET', '服务监控', '127.0.0.1', '/api/monitor/server', 'like.admin.routers.monitor.monitor_server()', '', '\'scputimes\' object has no attribute \'nice\'', 2, 1709545559, 1709545559, 1, 1709545559);
INSERT INTO `la_system_log_operate` VALUES (58, 1, 'GET', '服务监控', '127.0.0.1', '/api/monitor/server', 'like.admin.routers.monitor.monitor_server()', '', '\'scputimes\' object has no attribute \'nice\'', 2, 1709545559, 1709545559, 0, 1709545559);
INSERT INTO `la_system_log_operate` VALUES (59, 1, 'GET', '服务监控', '127.0.0.1', '/api/monitor/server', 'like.admin.routers.monitor.monitor_server()', '', '\'scputimes\' object has no attribute \'nice\'', 2, 1709545560, 1709545560, 0, 1709545560);
INSERT INTO `la_system_log_operate` VALUES (60, 1, 'GET', '缓存监控', '127.0.0.1', '/api/monitor/cache', 'like.admin.routers.monitor.monitor_cache()', '', '', 1, 1709545565, 1709545565, 20, 1709545565);
INSERT INTO `la_system_log_operate` VALUES (61, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 552}]', '', 1, 1709545604, 1709545604, 5, 1709545604);
INSERT INTO `la_system_log_operate` VALUES (62, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'like.admin.routers.system.menu_del()', '[{\"id\": 551}]', '', 1, 1709545607, 1709545607, 6, 1709545607);
INSERT INTO `la_system_log_operate` VALUES (63, 1, 'GET', '角色列表', '127.0.0.1', '/api/system/role/list', 'like.admin.routers.system.role_list()', 'pageNo=1&pageSize=15', '', 1, 1709545622, 1709545622, 7, 1709545622);
INSERT INTO `la_system_log_operate` VALUES (64, 1, 'POST', '菜单新增', '127.0.0.1', '/api/system/menu/add', 'like.admin.routers.system.menu_add()', '[{\"id\": \"\", \"pid\": 0, \"menuType\": \"M\", \"menuIcon\": \"el-icon-TakeawayBox\", \"menuName\": \"数据管理\", \"menuSort\": 0, \"paths\": \"/data_collection\", \"perms\": \"\", \"component\": \"\", \"selected\": \"\", \"params\": \"\", \"isCache\": 1, \"isShow\": 1, \"isDisable\": 0}]', '', 1, 1709545917, 1709545917, 4, 1709545917);
INSERT INTO `la_system_log_operate` VALUES (65, 1, 'POST', '菜单编辑', '127.0.0.1', '/api/system/menu/edit', 'like.admin.routers.system.menu_edit()', '[{\"id\": 776, \"pid\": 0, \"menuType\": \"M\", \"menuIcon\": \"el-icon-TakeawayBox\", \"menuName\": \"数据管理\", \"menuSort\": 0, \"paths\": \"data_manage\", \"perms\": \"\", \"component\": \"\", \"selected\": \"\", \"params\": \"\", \"isCache\": 1, \"isShow\": 1, \"isDisable\": 0}]', '', 1, 1709545971, 1709545971, 4, 1709545971);
INSERT INTO `la_system_log_operate` VALUES (66, 1, 'POST', '菜单新增', '127.0.0.1', '/api/system/menu/add', 'like.admin.routers.system.menu_add()', '[{\"id\": \"\", \"pid\": 776, \"menuType\": \"M\", \"menuIcon\": \"el-icon-Magnet\", \"menuName\": \"数据采集\", \"menuSort\": 0, \"paths\": \"/data_manage/data_collect/index\", \"perms\": \"\", \"component\": \"\", \"selected\": \"\", \"params\": \"\", \"isCache\": 1, \"isShow\": 1, \"isDisable\": 0}]', '', 1, 1709546063, 1709546063, 7, 1709546063);
INSERT INTO `la_system_log_operate` VALUES (67, 1, 'POST', '菜单编辑', '127.0.0.1', '/api/system/menu/edit', 'like.admin.routers.system.menu_edit()', '[{\"id\": 130, \"pid\": 0, \"menuType\": \"M\", \"menuIcon\": \"el-icon-OfficeBuilding\", \"menuName\": \"组织管理\", \"menuSort\": 45, \"paths\": \"organization\", \"perms\": \"\", \"component\": \"\", \"selected\": \"\", \"params\": \"\", \"isCache\": 0, \"isShow\": 0, \"isDisable\": 0}]', '', 1, 1709546121, 1709546121, 14, 1709546121);
INSERT INTO `la_system_log_operate` VALUES (68, 1, 'POST', '菜单编辑', '127.0.0.1', '/api/system/menu/edit', 'like.admin.routers.system.menu_edit()', '[{\"id\": 776, \"pid\": 0, \"menuType\": \"M\", \"menuIcon\": \"el-icon-TakeawayBox\", \"menuName\": \"数据管理\", \"menuSort\": 3, \"paths\": \"data_manage\", \"perms\": \"\", \"component\": \"\", \"selected\": \"\", \"params\": \"\", \"isCache\": 1, \"isShow\": 1, \"isDisable\": 0}]', '', 1, 1709546135, 1709546135, 13, 1709546135);
INSERT INTO `la_system_log_operate` VALUES (69, 1, 'POST', '菜单编辑', '127.0.0.1', '/api/system/menu/edit', 'like.admin.routers.system.menu_edit()', '[{\"id\": 776, \"pid\": 0, \"menuType\": \"M\", \"menuIcon\": \"el-icon-TakeawayBox\", \"menuName\": \"数据管理\", \"menuSort\": 45, \"paths\": \"data_manage\", \"perms\": \"\", \"component\": \"\", \"selected\": \"\", \"params\": \"\", \"isCache\": 1, \"isShow\": 1, \"isDisable\": 0}]', '', 1, 1709546157, 1709546157, 11, 1709546157);
INSERT INTO `la_system_log_operate` VALUES (70, 1, 'POST', '菜单编辑', '127.0.0.1', '/api/system/menu/edit', 'like.admin.routers.system.menu_edit()', '[{\"id\": 777, \"pid\": 776, \"menuType\": \"M\", \"menuIcon\": \"el-icon-Magnet\", \"menuName\": \"数据采集\", \"menuSort\": 0, \"paths\": \"data_manage/data_collect/index\", \"perms\": \"\", \"component\": \"\", \"selected\": \"\", \"params\": \"\", \"isCache\": 1, \"isShow\": 1, \"isDisable\": 0}]', '', 1, 1709546457, 1709546457, 8, 1709546457);
INSERT INTO `la_system_log_operate` VALUES (71, 1, 'POST', '菜单编辑', '127.0.0.1', '/api/system/menu/edit', 'like.admin.routers.system.menu_edit()', '[{\"id\": 777, \"pid\": 776, \"menuType\": \"C\", \"menuIcon\": \"el-icon-Magnet\", \"menuName\": \"数据采集\", \"menuSort\": 0, \"paths\": \"1111\", \"perms\": \"\", \"component\": \"data_manage/data_collect/index\", \"selected\": \"\", \"params\": \"\", \"isCache\": 1, \"isShow\": 1, \"isDisable\": 0}]', '', 1, 1709546952, 1709546952, 8, 1709546952);
INSERT INTO `la_system_log_operate` VALUES (72, 1, 'POST', '菜单编辑', '127.0.0.1', '/api/system/menu/edit', 'like.admin.routers.system.menu_edit()', '[{\"id\": 777, \"pid\": 776, \"menuType\": \"C\", \"menuIcon\": \"el-icon-Magnet\", \"menuName\": \"数据采集\", \"menuSort\": 0, \"paths\": \"data_collect\", \"perms\": \"\", \"component\": \"data_manage/data_collect/index\", \"selected\": \"\", \"params\": \"\", \"isCache\": 1, \"isShow\": 1, \"isDisable\": 0}]', '', 1, 1709546971, 1709546971, 9, 1709546971);
INSERT INTO `la_system_log_operate` VALUES (73, 1, 'GET', '角色列表', '127.0.0.1', '/api/system/role/list', 'like.admin.routers.system.role_list()', 'pageNo=1&pageSize=15', '', 1, 1709618442, 1709618442, 4, 1709618442);
INSERT INTO `la_system_log_operate` VALUES (74, 1, 'POST', '角色新增', '127.0.0.1', '/api/system/role/add', 'like.admin.routers.system.role_add()', '[{\"id\": \"\", \"name\": \"数据集录入\", \"remark\": \"主要负责数据集录入\", \"sort\": 0, \"isDisable\": 0, \"menus\": [], \"menuIds\": \"\"}]', '', 1, 1709618503, 1709618503, 14, 1709618503);
INSERT INTO `la_system_log_operate` VALUES (75, 1, 'GET', '角色列表', '127.0.0.1', '/api/system/role/list', 'like.admin.routers.system.role_list()', 'pageNo=1&pageSize=15', '', 1, 1709618503, 1709618503, 7, 1709618503);
INSERT INTO `la_system_log_operate` VALUES (76, 1, 'GET', '角色详情', '127.0.0.1', '/api/system/role/detail', 'like.admin.routers.system.role_detail()', 'id=2', '', 1, 1709618507, 1709618507, 16, 1709618507);
INSERT INTO `la_system_log_operate` VALUES (77, 1, 'POST', '角色编辑', '127.0.0.1', '/api/system/role/edit', 'like.admin.routers.system.role_edit()', '[{\"id\": 2, \"name\": \"数据集录入\", \"remark\": \"主要负责数据集录入\", \"sort\": 0, \"isDisable\": 0, \"menus\": [1, 776, 777], \"menuIds\": \"1,776,777\"}]', '', 1, 1709618533, 1709618533, 12, 1709618533);
INSERT INTO `la_system_log_operate` VALUES (78, 1, 'GET', '角色列表', '127.0.0.1', '/api/system/role/list', 'like.admin.routers.system.role_list()', 'pageNo=1&pageSize=15', '', 1, 1709618533, 1709618533, 7, 1709618533);
INSERT INTO `la_system_log_operate` VALUES (79, 1, 'GET', '角色详情', '127.0.0.1', '/api/system/role/detail', 'like.admin.routers.system.role_detail()', 'id=1', '', 1, 1709618542, 1709618542, 6, 1709618542);
INSERT INTO `la_system_log_operate` VALUES (80, 1, 'POST', '角色编辑', '127.0.0.1', '/api/system/role/edit', 'like.admin.routers.system.role_edit()', '[{\"id\": 1, \"name\": \"审核员\", \"remark\": \"审核数据\", \"sort\": 0, \"isDisable\": 0, \"menus\": [1, 712, 713, 739, 740, 130, 131, 132, 133, 134, 135, 140, 141, 142, 143, 144, 776, 777, 100, 101, 102, 103, 104, 105, 106, 110, 111, 112, 113, 114, 120, 121, 122, 123, 124, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 215, 216, 217, 500, 501, 502, 503, 505, 506, 510, 511, 720, 721, 741, 722, 723, 742, 743, 724, 725, 758, 726, 759, 555, 556, 550, 553, 600, 515, 516, 517, 518, 520, 521, 522, 519, 610, 611, 612, 613, 614, 616, 617, 618, 774, 715], \"menuIds\": \"1,712,713,739,740,130,131,132,133,134,135,140,141,142,143,144,776,777,100,101,102,103,104,105,106,110,111,112,113,114,120,121,122,123,124,200,201,202,203,204,205,206,207,208,209,215,216,217,500,501,502,503,505,506,510,511,720,721,741,722,723,742,743,724,725,758,726,759,555,556,550,553,600,515,516,517,518,520,521,522,519,610,611,612,613,614,616,617,618,774,715\"}]', '', 1, 1709618557, 1709618557, 24, 1709618557);
INSERT INTO `la_system_log_operate` VALUES (81, 1, 'GET', '角色列表', '127.0.0.1', '/api/system/role/list', 'like.admin.routers.system.role_list()', 'pageNo=1&pageSize=15', '', 1, 1709618557, 1709618557, 7, 1709618557);
INSERT INTO `la_system_log_operate` VALUES (82, 1, 'GET', '角色详情', '127.0.0.1', '/api/system/role/detail', 'like.admin.routers.system.role_detail()', 'id=2', '', 1, 1709618559, 1709618559, 6, 1709618559);
INSERT INTO `la_system_log_operate` VALUES (83, 1, 'GET', '角色列表', '127.0.0.1', '/api/system/role/list', 'like.admin.routers.system.role_list()', 'pageNo=1&pageSize=15', '', 1, 1709618683, 1709618683, 6, 1709618683);
INSERT INTO `la_system_log_operate` VALUES (84, 1, 'POST', '菜单新增', '127.0.0.1', '/api/system/menu/add', 'like.admin.routers.system.menu_add()', '[{\"id\": \"\", \"pid\": 100, \"menuType\": \"M\", \"menuIcon\": \"\", \"menuName\": \"微调数据集\", \"menuSort\": 0, \"paths\": \"、、\", \"perms\": \"\", \"component\": \"\", \"selected\": \"\", \"params\": \"\", \"isCache\": 1, \"isShow\": 1, \"isDisable\": 0}]', '', 1, 1709696442, 1709696442, 18, 1709696442);
INSERT INTO `la_system_log_operate` VALUES (85, 1, 'POST', '菜单编辑', '127.0.0.1', '/api/system/menu/edit', 'like.admin.routers.system.menu_edit()', '[{\"id\": 778, \"pid\": 776, \"menuType\": \"C\", \"menuIcon\": \"\", \"menuName\": \"微调数据集\", \"menuSort\": 0, \"paths\": \"、、\", \"perms\": \"\", \"component\": \"///\", \"selected\": \"\", \"params\": \"\", \"isCache\": 1, \"isShow\": 1, \"isDisable\": 0}]', '', 1, 1709696478, 1709696478, 15, 1709696478);
INSERT INTO `la_system_log_operate` VALUES (86, 1, 'POST', '菜单编辑', '127.0.0.1', '/api/system/menu/edit', 'like.admin.routers.system.menu_edit()', '[{\"id\": 777, \"pid\": 776, \"menuType\": \"C\", \"menuIcon\": \"el-icon-Magnet\", \"menuName\": \"预训练数据集\", \"menuSort\": 0, \"paths\": \"data_collect\", \"perms\": \"\", \"component\": \"data_manage/data_collect/index\", \"selected\": \"\", \"params\": \"\", \"isCache\": 1, \"isShow\": 1, \"isDisable\": 0}]', '', 1, 1709696523, 1709696523, 8, 1709696523);
INSERT INTO `la_system_log_operate` VALUES (87, 1, 'POST', '菜单编辑', '127.0.0.1', '/api/system/menu/edit', 'like.admin.routers.system.menu_edit()', '[{\"id\": 778, \"pid\": 776, \"menuType\": \"C\", \"menuIcon\": \"el-icon-SetUp\", \"menuName\": \"微调数据集\", \"menuSort\": 0, \"paths\": \"、、\", \"perms\": \"\", \"component\": \"///\", \"selected\": \"\", \"params\": \"\", \"isCache\": 1, \"isShow\": 1, \"isDisable\": 0}]', '', 1, 1709696621, 1709696621, 7, 1709696621);

-- ----------------------------
-- Table structure for la_system_log_sms
-- ----------------------------
DROP TABLE IF EXISTS `la_system_log_sms`;
CREATE TABLE `la_system_log_sms`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `scene` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '场景编号',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发送内容',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '发送状态：[0=发送中, 1=发送成功, 2=发送失败]',
  `results` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '短信结果',
  `send_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '发送时间',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统短信日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_system_log_sms
-- ----------------------------

-- ----------------------------
-- Table structure for la_t_dataset_collection
-- ----------------------------
DROP TABLE IF EXISTS `la_t_dataset_collection`;
CREATE TABLE `la_t_dataset_collection`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `dataset_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集名称',
  `dataset_type` int NULL DEFAULT NULL COMMENT '数据集类型(0:代码，1:文档)',
  `dataset_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集来源',
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集大小',
  `filepath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径\r\n',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集描述',
  `is_deleted` int NULL DEFAULT NULL COMMENT '是否删除',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2019 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of la_t_dataset_collection
-- ----------------------------
INSERT INTO `la_t_dataset_collection` VALUES (2001, 'Lok Wing Suen', 0, 'http://www.rd19.us/AppsGames', '403.41', 'C:\\Users\\Administrator\\Pictures\\img_123651.png', 'r1NLZHsTCt', 0, '2024-03-06 10:09:13', '2024-03-06 10:09:16');
INSERT INTO `la_t_dataset_collection` VALUES (2002, 'Sit Ka Man', 1, 'http://video.wklia4.jp/SportsOutdoor', '346.47', '/Users/Administrator/Pictures/img_388174.jpg', 'lakkpoI8mT', 0, '2024-03-06 10:09:13', '2024-03-06 10:09:32');
INSERT INTO `la_t_dataset_collection` VALUES (2003, 'Au Sze Kwan', 0, 'http://video.yulan.biz/ClothingShoesandJewelry', '285.54', 'C:\\Users\\Administrator\\Pictures\\img_137649.png', 'BifDGMkXiw', 0, '2024-03-06 10:09:13', '2024-03-06 10:09:32');
INSERT INTO `la_t_dataset_collection` VALUES (2004, 'Wu Lu', 0, 'http://video.lgu.co.jp/ToolsHomeDecoration', '458.15', '/home/Administrator/Pictures/img_328763.png', 'XGizaYH7zr', 0, '2024-03-06 10:09:13', '2024-03-06 10:09:32');
INSERT INTO `la_t_dataset_collection` VALUES (2005, 'Donna Collins', 1, 'http://drive.takuya3.cn/PetSupplies', '904.4', '/home/Administrator/Pictures/img_519765.jpg', 'gUEoGerixx', 1, '2024-03-06 10:09:13', '2024-03-06 10:09:32');
INSERT INTO `la_t_dataset_collection` VALUES (2006, 'Matthew Scott1', 1, 'http://drive.malarr1995.co.jp/HouseholdKitchenAppliances', '460.65', '/Users/Administrator/Pictures/img_664888.jpg', 'vBIkmIrqAT', 1, '2024-03-06 10:09:13', '2024-03-06 11:29:06');
INSERT INTO `la_t_dataset_collection` VALUES (2007, 'Cho Ho Yin', 1, 'http://auth.shihanz.com/CellPhonesAccessories', '139.47', 'C:\\Users\\Administrator\\Pictures\\img_278095.jpg', '0o75ojJtW1', 1, '2024-03-06 10:09:13', '2024-03-06 10:09:32');
INSERT INTO `la_t_dataset_collection` VALUES (2008, 'Zeng Zhennan', 0, 'https://drive.cwkong920.biz/BaggageTravelEquipment', '27.73', '/Users/Administrator/Pictures/img_118915.png', 'XBjV8IxAUz', 1, '2024-03-06 10:09:13', '2024-03-06 10:09:32');
INSERT INTO `la_t_dataset_collection` VALUES (2009, 'Jacqueline Ferguson', 1, 'http://drive.hanzh.co.jp/AppsGames', '925', 'C:\\Users\\Administrator\\Pictures\\img_634338.png', '这是一个测试数据集这是一个测试数据集这是一个测试数据集这是一个测试数据集', 1, '2024-03-06 10:09:13', '2024-03-06 10:09:32');
INSERT INTO `la_t_dataset_collection` VALUES (2019, '111122222', 0, '1111', '1111', '1111', '1111111', 1, '2024-03-06 11:29:48', '2024-03-06 11:30:04');

-- ----------------------------
-- Table structure for la_user
-- ----------------------------
DROP TABLE IF EXISTS `la_user`;
CREATE TABLE `la_user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sn` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '编号',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `real_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户电话',
  `salt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '加密盐巴',
  `sex` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户性别: [1=男, 2=女]',
  `channel` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册渠道: [1=微信小程序, 2=微信公众号, 3=手机H5, 4=电脑PC, 5=苹果APP, 6=安卓APP]',
  `is_disable` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否禁用: [0=否, 1=是]',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: [0=否, 1=是]',
  `last_login_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_user
-- ----------------------------

-- ----------------------------
-- Table structure for la_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `la_user_auth`;
CREATE TABLE `la_user_auth`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `openid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Openid',
  `unionid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Unionid',
  `client` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '客户端类型: [1=微信小程序, 2=微信公众号, 3=手机H5, 4=电脑PC, 5=苹果APP, 6=安卓APP]',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `openid`(`openid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户授权表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of la_user_auth
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
