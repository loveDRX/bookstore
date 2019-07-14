/*
Navicat MySQL Data Transfer

Source Server         : 图书
Source Server Version : 50641
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50641
File Encoding         : 65001

Date: 2019-07-14 19:45:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` varchar(10) NOT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `book_author` varchar(255) DEFAULT NULL,
  `money` decimal(10,0) DEFAULT NULL COMMENT '现价',
  `original_price` decimal(10,0) DEFAULT NULL COMMENT '原价',
  `book_printer` varchar(255) DEFAULT NULL COMMENT '出版社',
  `book_date` date DEFAULT NULL COMMENT '上架时间',
  `book_image` varchar(255) DEFAULT NULL,
  `browse_count` int(11) DEFAULT NULL COMMENT '浏览次数',
  `recommend_value` int(11) DEFAULT NULL COMMENT '推荐值，越大越靠前',
  `sales` int(11) DEFAULT NULL COMMENT '销量',
  `book_inventory` int(11) DEFAULT NULL COMMENT '库存',
  `book_state` varchar(1) NOT NULL DEFAULT '1' COMMENT '0为未上架，1为上架，2为下架',
  `book_description` text,
  `book_type` int(255) DEFAULT NULL COMMENT '图书类型，假外键',
  PRIMARY KEY (`book_id`),
  KEY `book_type` (`book_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('11', '追风筝的人', '[美]卡勒德·胡赛尼（Khaled Hosseini）', '10', '17', '上海人民出版社', '2006-05-01', '12.jpg', '10', '10', '1000', '10', '1', '中文版，快乐大本营高圆圆感动推荐，奥巴马送给女儿的新年礼物。为你，千千万万遍！', '3');
INSERT INTO `book` VALUES ('12', '从你的全世界路过', '张嘉佳', '10', '190', '湖南文艺出版社', '2019-04-20', '13.jpg', '30', '10', null, '10', '1', '<div id=\"feature\" class=\"section\"><div class=\"descrip\"><img src=\"http://img57.ddimg.cn/99999990001447547.jpg\"></div></div><div id=\"abstract\" class=\"section\"><div class=\"title\"><span>编辑推荐</span></div><div class=\"descrip\"><span id=\"abstract-all\"></span><p><b></b></p><div><b>6</b><b>个月，畅销200万册，超会讲故事的人张嘉佳，献给你的心动故事！</b></div><p>14亿次阅读，1500万次转发，全国巡回9城10场63小时签售，10万粉丝“路过”张嘉佳，&nbsp;</p>这些都是你们为《从你的全世界路过》筑起的成绩单。从上架到现在，每一天，每一分钟，都有人在故事里看到自己。张嘉佳的33个睡前故事，有泪点，也有笑点，三分钟可以读完一篇，或许你会静静回味一整年。这样一本温暖、明亮、疯狂甚至有点儿胡说八道的书，你可以留在枕边，放进书架，送给重要的那个人，或者让它留在你身边。<br><p><strong>重磅推荐：</strong></p><p><span>&nbsp;</span><strong><span>&nbsp;</span><a target=\"_blank\" href=\"http://product.dangdang.com/23468233.html\"><span>《</span></a></strong><a target=\"_blank\" href=\"http://product.dangdang.com/23468233.html\"><strong><span>从你的全世界路过(精装升级版)》</span></strong><span>：增加9个故事，诞生10部电影，独自拥有的第8夜，6个月，200万册畅销，完美纪念</span></a></p><p>&nbsp;<strong><span>&nbsp;</span><a target=\"_blank\" href=\"http://product.dangdang.com/23476758.html\"><span>《</span></a></strong><a target=\"_blank\" href=\"http://product.dangdang.com/23476758.html\"><span><span><strong><span>我希望有个如你一般的人》</span></strong>&nbsp;<span>：</span></span></span><span>张嘉佳随身携带记事本：独家珍藏1.0版，晨曦蓝软皮轻奢精装，全彩内页任意书写</span></a></p>&nbsp;</div></div>', '36');
INSERT INTO `book` VALUES ('13', '解忧杂货店', '(日)东野圭吾', '10', '27', '南海出版公司', '2019-04-20', '14.jpg', '30', '10', null, '10', '1', '<p><img src=\"http://img52.ddimg.cn/99999990001147782.jpg\"></p>', '35');
INSERT INTO `book` VALUES ('14', '小王子', '(法) 圣-埃克苏佩里', '10', '110', '辽宁少年儿童出版社', '2019-04-20', '15.jpg', '20', '10', null, '10', '1', '<div class=\"pro_content\" id=\"detail_describe\" ddt-area=\"010\"><ul class=\"key clearfix\"><li>开 本：大32开</li><li>纸 张：轻型纸</li><li>包 装：平装-胶订</li><li>是否套装：否</li><li>国际标准书号ISBN：9787531569138</li><li class=\"clearfix fenlei\" dd_name=\"详情所属分类\" id=\"detail-category-path\"><label>所属分类：</label><span class=\"lie\"><a target=\"_bland\" href=\"http://category.dangdang.com/cp01.00.00.00.00.00.html\" class=\"green\" data-category-id=\"1805\">图书</a>&gt;<a target=\"_bland\" href=\"http://category.dangdang.com/cp01.41.00.00.00.00.html\" class=\"green\" data-category-id=\"11943\">童书</a>&gt;<a target=\"_bland\" href=\"http://category.dangdang.com/cp01.41.27.00.00.00.html\" class=\"green\" data-category-id=\"50015\">外国儿童文学</a>&gt;<a target=\"_bland\" href=\"http://category.dangdang.com/cp01.41.27.11.00.00.html\" class=\"green\" data-category-id=\"50021\">经典名著少儿版</a></span><span class=\"lie\"><a target=\"_bland\" href=\"http://category.dangdang.com/cp01.00.00.00.00.00.html\" class=\"green\" data-category-id=\"1805\">图书</a>&gt;<a target=\"_bland\" href=\"http://category.dangdang.com/cp01.41.00.00.00.00.html\" class=\"green\" data-category-id=\"11943\">童书</a>&gt;<a target=\"_bland\" href=\"http://category.dangdang.com/cp01.41.03.00.00.00.html\" class=\"green\" data-category-id=\"11963\">7-10岁</a>&gt;<a target=\"_bland\" href=\"http://category.dangdang.com/cp01.41.03.11.00.00.html\" class=\"green\" data-category-id=\"11974\">文学</a></span></li></ul></div><div class=\"book_operation book_operation_fix\" id=\"operation-fix\" dd_name=\"快速直达\"><ul id=\"navigation-labels\"><li class=\"title\">快速直达</li><li data-idx=\"abstract\" dd_name=\"导航-编辑推荐\" class=\"hover\"><a><span class=\"icon\"></span>编辑推荐</a></li><li data-idx=\"content\" dd_name=\"导航-内容简介\"><a><span class=\"icon\"></span>内容简介</a></li><li data-idx=\"authorIntroduction\" dd_name=\"导航-作者简介\"><a><span class=\"icon\"></span>作者简介</a></li><li data-idx=\"mediaFeedback\" dd_name=\"导航-媒体评论\"><a><span class=\"icon\"></span>媒体评论</a></li><li data-idx=\"attachImage\" dd_name=\"导航-书摘插画\"><a><span class=\"icon\"></span>书摘插画</a></li></ul><div class=\"erwei_dz\"><a id=\"eBook-download\" dd_name=\"电子书推广\"><span style=\"text-align: center;\">下载免费当当读书</span></a></div></div><p><a name=\"operation_point2\" id=\"operation_point2\" class=\"browser browser_op\"></a></p><div class=\"section\" id=\"detail\"><div id=\"abstract\" class=\"section\"><div class=\"title\"><span>编辑推荐</span></div><div class=\"descrip\"><span id=\"abstract-all\"></span><p><img src=\"http://img56.ddimg.cn/99999990001988596.jpg\"></p><p>★独家栏目介绍《小王子》背后的伟大飞行家安东尼的人生故事</p><p>&nbsp;</p><p>★儿童文学大师梅子涵主编，其女儿梅思繁翻译，父女共情《小王子》</p><p>&nbsp;</p><p>★《小王子》是一个奇迹：它被翻译成250多种语言，全球发行量超5亿册。</p><p>&nbsp;</p><p>★它被誉为阅读量仅次于《圣经》的*读物</p><p>&nbsp;</p><p>★艺术家列夫·康斯坦丁诺维奇·柯尼帕和Riccardo Cocciante分别用交响乐和歌剧致敬《小王子》</p></div></div></div>', '30');
INSERT INTO `book` VALUES ('16', '阳明心学的力量', '北京知行合一阳明教育研究院', '10', '35', '机械工业出版社', '2019-04-20', '17.jpg', null, '10', null, '10', '1', '<div id=\"abstract\" class=\"section\"><div class=\"descrip\">1、国学的复兴，传统文化的弘扬。<br>2、以阳明教育研究创始人白立新、北大教授文东茅、奥康集团董事长王振滔等强烈推荐。<br>白立新，阳明教育研究院创始人，IBM首席商业首席顾问。<br>文东茅，北京大学教育学院教授，北京大学社会科学学部副主任，中国教育发展战略学会副会长，北京阳明教育研究院常务理事。他也是著名的教育政策研究专家，曾参与《民办教育促进法实施条例》、《教育改革和发展中长期规划纲要》、考试招生制度改革等国家重大教育政策的研制工作。他发起并建立了“传习路”计划，目前正在扶持修文一中和井冈山中学的良知教育。<br>3、王阳明传奇经历以及阳明心学在日本的经久不衰<br>王阳明是旷世哲人，有人说：中国历史上能做到立德、立功、立言三不朽的圣人，只有两个半：孔子、王阳明，加半个曾国藩。有人说：五百年来，能把学问在事业上表现出来者，只有两人：一是明朝王守仁，一是清朝曾国藩。<br>阳明心学是日本，上至社会精英，下至贩夫走卒，都在学习阳明心学。是日本全社会的生存智慧，也是以稻盛为代表的企业家的经营哲学。<br>日本的幕府运动以及明治维新都是离不开阳明心学的推动，而以稻盛和夫、孙正义为代表的企业家，更是阳明心学的商业实践者。<br>4、当下的国人为什么这么多焦虑和不快乐<br>人生不痛快、生命不舒展；焦虑、痛苦、烦恼等，都需要我们向自己，向传统文化寻求解决之道，解决我们心力乏力的问题。<br><img src=\"http://img54.ddimg.cn/99999990001261114.jpg\"><br>&nbsp;</div></div><div id=\"content\" class=\"section\"><div class=\"title\"><span>内容简介</span></div><div class=\"descrip\"><span id=\"content-all\"></span>以康恩贝集团董事长胡季强、奥康集团董事长王振滔、金蝶国际软件集团董事长徐少春、正和岛创始人刘东华等企业家，自2012年11月起，潜心学习阳明心学、践行致良知。本书记录的是他们四年多来学习阳明心学的心路历程，以及致良知的商业实践。他们在企业的股权设置、员工薪酬、客户服务、企业传承、社会责任等各个方面所秉持的人生哲学、所体现的管理智慧。他们既是在弘扬中华文化的传统，建设员工幸福、客户满意，有良知、有担当的企业。也是在新的时代环境下，把阳明心学的智慧拓展到商业和管理上。<br>把企业做好、做大、做强，推动人心向善和社会进步，为中华民族的崛起和中华文化的复兴做出重要贡献。</div></div>', '37');
INSERT INTO `book` VALUES ('18', '丝绸之路：一部全新的世界史', '彼得.弗兰科潘 (Peter Frankopan)', '10', '92', '浙江大学出版社', '2019-04-20', '18.jpg', null, '10', null, '10', '1', '<div id=\"feature\" class=\"section\"><div class=\"descrip\"><img src=\"http://img52.ddimg.cn/99999990002133612.jpg\"><div></div><div></div></div></div><div id=\"abstract\" class=\"section\"><div class=\"title\"><span>编辑推荐</span></div><div class=\"descrip\"><span id=\"abstract-all\"></span><div></div><p>◆牛津大学历史教授解读中国为什么打造“一带一路”，揭示倡议逻辑！</p><p>◆丝绸之路主宰了人类的过去，也必将决定世界的未来！</p><p>◆央视10分钟重磅推荐！《人民日报》4度推荐！</p><p>◆第十二届文津图书奖推荐书目！新浪2016年度十大好书！豆瓣2016年度十大历史好书！《21世纪经济报》2016年度十大好书！</p><p>◆巴曙松、梁小民、吴晓波、陈功、葛剑雄、荣新江、许纪霖、樊登、鲍达民等国内外政商学文界巨擘联袂推荐！</p><p>◆《光明日报》《解放日报》《环球时报》《文汇报》《国际先驱导报》好评如潮！</p><p>◆英国电商世界历史类榜单、美国电商历史地理类榜单、印度非虚构榜单，皆名列前茅！</p><p>◆席卷英国、美国、德国、意大利、荷兰、西班牙、波兰、土耳其、印度、韩国等23个国家！</p><p>◆《纽约时报》畅销书，《泰晤士报》《卫报》《每日邮报》《观察者》《彭博商业》《历史今日》2015年度图书、彭博社2015年度历史图书！</p><p><strong>推荐您购买读客其他畅销书：</strong></p><table nowrap=\"nowrap\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\" class=\"layui-table\"><tbody><tr><td nowrap=\"nowrap\" width=\"25%\"><a href=\"http://product.dangdang.com/25309905.html\"><img src=\"http://img61.ddimg.cn/topic_img/gys_0014951/KK_BXS.jpg\" width=\"100%\"></a></td><td nowrap=\"nowrap\" width=\"25%\"><a href=\"http://product.dangdang.com/25307781.html\"><img src=\"http://img61.ddimg.cn/topic_img/gys_0014951/KK_LM.jpg\" width=\"100%\"></a></td><td nowrap=\"nowrap\" width=\"25%\"><a href=\"http://product.dangdang.com/23492793.html\"><img src=\"http://img60.ddimg.cn/topic_img/gys_0014951/KK_WYM.jpg\" width=\"100%\"></a></td><td nowrap=\"nowrap\" width=\"25%\"><a href=\"http://product.dangdang.com/24017630.html\"><img src=\"http://img60.ddimg.cn/topic_img/gys_0014951/KK_SC.jpg\" width=\"100%\"></a></td></tr><tr><td nowrap=\"nowrap\" width=\"25%\"><a href=\"http://product.dangdang.com/23709763.html\"><img src=\"http://img63.ddimg.cn/topic_img/gys_0014951/kk_SZBF.jpg\" width=\"100%\"></a></td><td nowrap=\"nowrap\" width=\"25%\"><a href=\"http://product.dangdang.com/25189938.html\"><img src=\"http://img62.ddimg.cn/topic_img/gys_0014951/KK_CS.jpg\" width=\"100%\"></a></td><td nowrap=\"nowrap\" width=\"25%\"><a href=\"http://product.dangdang.com/23969722.html\"><img src=\"http://img62.ddimg.cn/topic_img/gys_0014951/KK_ZGF.jpg\" width=\"100%\"></a></td><td nowrap=\"nowrap\" width=\"25%\"><a href=\"http://product.dangdang.com/25263098.html\"><img src=\"http://img63.ddimg.cn/topic_img/gys_0014951/KK_GD.jpg\" width=\"100%\"></a></td></tr></tbody></table>&nbsp;</div></div><div id=\"content\" class=\"section\"><div class=\"title\"><span>内容简介</span></div><div class=\"descrip\"><span id=\"content-all\"></span><p>　　两千年来，丝绸之路始终主宰着人类文明的进程。不同种族、不同信仰、不同文化背景的帝王、军队、商人、学者、僧侣、奴隶，往来在这条道路上，创造并传递着财富、智慧、宗教、艺术、战争、疾病和灾难。</p><p>　　丝绸之路让中国的丝绸和文明风靡世界；罗马和波斯在路边缔造了各自的帝国；佛教、基督教和伊斯兰教沿着丝绸之路迅速崛起并传遍世界，融汇出耶路撒冷三千年的历史；成吉思汗的蒙古铁蹄一路向西，在带来杀戮的同时促进了东西方文明的交融；大英帝国通过搜刮丝绸之路上的财富，铸就了日不落的辉煌；希特勒为了丝绸之路上的资源，将世界推入了战争和屠杀的深渊。时至今日，丝绸之路上的难民与恐怖主义ISIS，依然是欧洲与美国挥之不去的梦魇。</p><p>　　丝绸之路的历史就是一部浓缩的世界史，丝绸之路就是人类文明耀眼的舞台。它不仅主宰了人类的过去，更将决定世界的未来。翻开这部包罗万象的史诗巨著，“一带一路”倡议将变得一目了然。</p></div></div>', '33');
INSERT INTO `book` VALUES ('19', '全球通史', '斯塔夫里阿诺斯', '10', '87', '北京大学出版社', '2006-10-01', '19.jpg', null, '10', null, '10', '1', '从史前史到21世纪', '0');
INSERT INTO `book` VALUES ('20', '史记', '司马迁', '10', '75', '岳麓书社', '2011-07-01', '20.jpg', null, '10', null, '10', '1', '(精装全三册)', '3');
INSERT INTO `book` VALUES ('21', '月亮和六便士', '毛姆', '10', '30', '上海译文出版社', '2015-03-10', '21.jpg', null, '10', null, '10', '1', '(译文经典.精）', '3');
INSERT INTO `book` VALUES ('22', '苏菲的世界', '乔斯坦.贾德', '10', '23', '作家出版社', '2007-07-07', '22.jpg', null, '10', null, '10', '1', '热售榜前50', '0');
INSERT INTO `book` VALUES ('23', '悲惨世界', '[法]维克多·雨果', '10', '67', '作家出版社', '2016-06-14', '23.jpg', null, '10', null, '10', '1', '销量遥遥领先', '0');
INSERT INTO `book` VALUES ('24', '海底两万里', '儒勒.凡尔纳 ', '10', '32', '国际文化出版公司', '2017-01-17', '24.jpg', null, '10', null, '10', '1', '（中小学新课标必读名著）', '0');
INSERT INTO `book` VALUES ('25', '钢铁是怎样炼成的', '奥斯特洛夫斯基 ', '10', '29', '西安交通大学出版社', '2016-11-11', '25.jpg', null, '10', null, '10', '1', '俄中直译全译本', '0');
INSERT INTO `book` VALUES ('26', '百年孤独', '加西亚·马尔克斯', '10', '38', '南海出版公司', '2011-06-27', '26.jpg', null, '10', null, '10', '1', '加西亚马尔克斯代表作', '0');
INSERT INTO `book` VALUES ('27', '了不起的盖茨比', '菲茨杰拉德', '10', '26', '浙江文艺出版社', '2017-03-15', '27.jpg', null, '10', null, '10', '1', '【作家榜推荐】', '0');
INSERT INTO `book` VALUES ('28', '三毛：撒哈拉的故事', '三毛', '10', '17', '北京十月文艺出版社', '2013-05-15', '28.jpg', null, '10', null, '10', '1', '满100减50', '0');
INSERT INTO `book` VALUES ('29', '鲁迅全集', '鲁迅', '10', '370', '北京日报出版社（原同心出版社）', '2014-10-15', '29.jpg', null, '10', null, '10', '1', '（全20卷，纪念鲁迅先生逝世80周年！）', '3');
INSERT INTO `book` VALUES ('30', '斯坦福极简经济学', '[美]泰勒', '10', '37', '湖南人民出版社', '2016-08-01', '30.jpg', null, '10', null, '10', '1', '（当当全国独家精装升级版）', '0');
INSERT INTO `book` VALUES ('31', '天才在左疯子在右', '高铭', '10', '28', '北京联合出版公司', '2016-01-20', '31.jpg', null, '10', null, '10', '1', '（完整版）', '0');
INSERT INTO `book` VALUES ('32', '社会心理学', '（美） 戴维·迈尔斯', '10', '111', '人民邮电出版社', '2016-01-14', '32.jpg', null, '10', null, '10', '1', '（第11版）', '0');
INSERT INTO `book` VALUES ('33', '与孤独为友', '和田秀树', '10', '29', '北京联合出版公司', '2017-04-12', '33.jpg', null, '10', null, '10', '1', '如何获得内心世界的轻松和愉悦', '0');
INSERT INTO `book` VALUES ('34', '摄影入门', '乔旭亮', '10', '38', '化学工业出版社', '2016-06-06', '34.jpg', null, '10', null, '10', '1', '拍出美照超简单', '0');
INSERT INTO `book` VALUES ('35', '艺术的疗效', '（英）德波顿', '10', '116', '广西美术出版社', '2014-07-12', '35.jpg', null, '10', null, '10', '1', '治愈了赵薇的书！——赵薇在来往上推荐的治愈系图书。', '0');
INSERT INTO `book` VALUES ('36', '胜者思维', '金一南', '10', '35', '北京联合出版公司', '2019-04-20', '36.jpg', null, '10', null, '10', '1', '危机领导战略，思维制胜之道，决策核心思考。', '34');
INSERT INTO `book` VALUES ('37', '学习关键词', '人民日报海外版“学习小组”', '10', '38', '人民出版社', '2016-11-21', '37.jpg', null, '10', null, '10', '1', '社科值得看的好书', '0');
INSERT INTO `book` VALUES ('38', '必然', '凯文·凯利', '10', '50', '电子工业出版社', '2016-01-16', '38.jpg', null, '10', null, '10', '1', '尼古拉·尼葛洛庞帝互联网启蒙读物《数字化生存》20周年再版', '0');
INSERT INTO `book` VALUES ('39', '晚学盲言', '钱穆', '10', '87', '生活.读书.新知三联书店', '2019-05-14', 'C:/apache-tomcat-9.0.8/tempFile/QQ截图20190507125607.jpg', null, '10', null, '10', '1', '（全两册，第二版）', '25');
INSERT INTO `book` VALUES ('40', '江村经济', '费孝通', '10', '29', '北京大学出版社', '2016-07-08', '40.jpg', null, '10', null, '10', '1', '销售榜前茅', '0');
INSERT INTO `book` VALUES ('41', '精通Python网络爬虫', '韦玮', '10', '61', '机械工业出版社', '2017-04-04', '41.jpg', null, '10', null, '10', '1', '资深专家，以实战为导向，讲透Python网络爬虫各项核心技术和主流框架，深度讲解网络爬虫的抓取技术与反爬攻关技巧', '2');
INSERT INTO `book` VALUES ('42', 'Android高级进阶', '顾浩鑫', '10', '84', '电子工业出版社', '2016-09-18', '42.jpg', null, '10', null, '10', '1', '满50减10', '2');
INSERT INTO `book` VALUES ('43', 'Python大战机器学习', '华校专，王正林', '10', '61', '电子工业出版社', '2017-02-16', '43.jpg', null, '10', null, '10', '1', '数据科学家的第一个小目标', '2');

-- ----------------------------
-- Table structure for `book_type`
-- ----------------------------
DROP TABLE IF EXISTS `book_type`;
CREATE TABLE `book_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(36) NOT NULL COMMENT '名称',
  `grade` int(11) DEFAULT '0' COMMENT '级别 0 是一级分类 1 是二级分类',
  `parent_id` int(11) NOT NULL COMMENT '父ID',
  `number` int(5) DEFAULT NULL COMMENT '序号(显示的先后序号）',
  `logo` varchar(255) DEFAULT NULL COMMENT '列表logo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='商品类别表';

-- ----------------------------
-- Records of book_type
-- ----------------------------
INSERT INTO `book_type` VALUES ('24', '计算机', '0', '0', '1', '');
INSERT INTO `book_type` VALUES ('25', 'java', '1', '24', '0', '');
INSERT INTO `book_type` VALUES ('26', 'python', '1', '24', '2', '');
INSERT INTO `book_type` VALUES ('28', '小说', '0', '0', '0', '');
INSERT INTO `book_type` VALUES ('29', '武侠', '1', '28', '1', '');
INSERT INTO `book_type` VALUES ('30', '童话', '1', '28', '0', '');
INSERT INTO `book_type` VALUES ('31', '经济', '0', '0', '4', '');
INSERT INTO `book_type` VALUES ('32', '历史', '0', '0', '6', '');
INSERT INTO `book_type` VALUES ('33', '中国经济', '1', '31', '1', '');
INSERT INTO `book_type` VALUES ('34', '中国历史', '1', '32', '10', '');
INSERT INTO `book_type` VALUES ('35', '悬疑', '1', '28', '1', '');
INSERT INTO `book_type` VALUES ('36', '青春', '1', '28', '2', '');
INSERT INTO `book_type` VALUES ('37', '闲聊', '1', '28', '2', '');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `customer_id` varchar(255) DEFAULT '' COMMENT '用户id',
  `book_id` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` varchar(50) NOT NULL COMMENT '用户id',
  `username` varchar(11) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` char(10) DEFAULT '0' COMMENT '0 男 1 女',
  `address` varchar(50) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1559108956487', 'admin', '2808F05000AF0A8A95EB28F879560A06', '248717239@qq.com', '2019-02-12', '0', '河南省周口市', '2019-05-29', '18749669210');

-- ----------------------------
-- Table structure for `order_item`
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `product_id` varchar(255) DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL,
  `product_money` decimal(10,0) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('11', '追风筝的人', '12.jpg', '2', '17', '2747ad77-7a07-4c25-9aca-2690e83602c0');
INSERT INTO `order_item` VALUES ('12', '从你的全世界路过', '13.jpg', '1', '190', '20190507130356');
INSERT INTO `order_item` VALUES ('12', '从你的全世界路过', '13.jpg', '1', '190', '20190515013135');
INSERT INTO `order_item` VALUES ('13', '解忧杂货店', '14.jpg', '2', '27', '20190524140557');
INSERT INTO `order_item` VALUES ('13', '解忧杂货店', '14.jpg', '2', '27', '20190524140712');
INSERT INTO `order_item` VALUES ('14', '小王子', '15.jpg', '1', '110', '20190530224731');
INSERT INTO `order_item` VALUES ('13', '解忧杂货店', '14.jpg', '1', '27', '20190530225203');
INSERT INTO `order_item` VALUES ('14', '小王子', '15.jpg', '1', '110', '20190531170620');
INSERT INTO `order_item` VALUES ('14', '小王子', '15.jpg', '1', '110', '20190531175456');

-- ----------------------------
-- Table structure for `order1`
-- ----------------------------
DROP TABLE IF EXISTS `order1`;
CREATE TABLE `order1` (
  `id` varchar(255) NOT NULL,
  `total_money` decimal(10,0) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `reciver_name` varchar(255) DEFAULT NULL,
  `reciver_address` varchar(255) DEFAULT NULL,
  `reciver_phone` varchar(11) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL COMMENT '0未支付，1支付完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order1
-- ----------------------------
INSERT INTO `order1` VALUES ('20190507130356', '110', '1555755757649', 'admin', '', '', '2019-05-07', '0');
INSERT INTO `order1` VALUES ('20190515013135', '190', '1555755757649', 'admin', '', '', '2019-05-15', '0');
INSERT INTO `order1` VALUES ('20190524140557', '54', '1555755757649', 'admin', '', '', '2019-05-24', '0');
INSERT INTO `order1` VALUES ('20190524140712', '54', '1555755757649', 'admin', '', '', '2019-05-24', '0');
INSERT INTO `order1` VALUES ('20190530224731', '110', '1559108956487', 'admin', '河南省周口市', '18749669210', '2019-05-30', '0');
INSERT INTO `order1` VALUES ('20190530225203', '27', '1559108956487', 'admin', '河南省周口市', '18749669210', '2019-05-30', '0');
INSERT INTO `order1` VALUES ('20190531170620', '110', '1559108956487', 'admin', '河南省周口市', '18749669210', '2019-05-31', '0');
INSERT INTO `order1` VALUES ('20190531175456', '110', '1559108956487', 'admin', '河南省周口市', '18749669210', '2019-05-31', '0');

-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` varchar(36) NOT NULL COMMENT '主键 id',
  `name` varchar(128) DEFAULT NULL COMMENT '资源名称',
  `type` varchar(32) DEFAULT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` varchar(36) DEFAULT '0' COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('0421e1c4b7664ecdb3f47cefc6e4a46d', '添加机构', 'button', '/groupRebate/addOrgSkip04', '&#xe614', '3d1d58bce7c94d2cb88b9039254ba31a', null, null, null);
INSERT INTO `sys_permission` VALUES ('0f2d94cef9d2462d921a3a3d54a7787f', '管理员列表', 'menu', '/adminSystem/adminList?type=1&currentPage=1&size=10&userName=&userCode=', '&#xe614', '373fe87fe1204316ac577d6d9c927526', null, null, null);
INSERT INTO `sys_permission` VALUES ('12', '用户管理', 'menu', '/member/manage', '&#xe614', '0', null, null, null);
INSERT INTO `sys_permission` VALUES ('189d2adb0bd341dbaea233679070ed36', '用户列表', 'menu', '/member/memberList', null, '12', null, null, null);
INSERT INTO `sys_permission` VALUES ('2e9f166a8d014522bbeaf96ab844da47', '添加代理公司', 'button', '/groupRebate/goAddAgent04', '&#xe614', '890c964b94bd47a2a71e35dea8172f08', null, null, null);
INSERT INTO `sys_permission` VALUES ('2f275b54c55c4e8da86ea1d92e018775', '添加机构', 'button', '/adminSystem/addOrgSkip', '&#xe614', 'ea4da769a2be41a6ad2c100acefac844', null, null, null);
INSERT INTO `sys_permission` VALUES ('300844c776874e7a9162f655bb93d18e', '商户列表', 'menu', '/marketing/orgList', '&#xe614', 'e9c1b163eec64d72b518c47b83e9df5d', null, null, null);
INSERT INTO `sys_permission` VALUES ('33367d2545914f81891a5af8b6febb60', '活动管理', 'menu', '/groupActives/activeList?currentPage=1', '&#xe614', '3fc25caf41e949d69232e987d5bebb72', null, null, null);
INSERT INTO `sys_permission` VALUES ('373fe87fe1204316ac577d6d9c927526', '管理员管理', 'menu', '/admin/manage', '&#xe614', '0', null, null, null);
INSERT INTO `sys_permission` VALUES ('4ed1a9b0ee2947c7b8f6535a89da17d1', '上传图片', 'button', '/adminSystem/ossUpload', '&#xe614', '3d1d58bce7c94d2cb88b9039254ba31a', null, null, null);
INSERT INTO `sys_permission` VALUES ('6158f1b2411249699680ab836e2f9b55', '关闭立即制作', 'button', '/marketing/closeQc', null, '300844c776874e7a9162f655bb93d18e', null, null, null);
INSERT INTO `sys_permission` VALUES ('7e210a815a664b3b87ecbc6a98f991bc', '商城订单', 'menu', '/order/shopPayList', null, 'b7b597f3f43542eaa752d50acd3e248b', null, null, null);
INSERT INTO `sys_permission` VALUES ('8198366b27434c9da2f2d7e6a6863c5b', '数据统计', 'menu', '/marketing/statistics', null, 'e9c1b163eec64d72b518c47b83e9df5d', null, null, null);
INSERT INTO `sys_permission` VALUES ('871e6a33705a4ae58b70dfb75f603691', '删除机构', 'button', '/groupRebate/delOrg04', '&#xe614', '3d1d58bce7c94d2cb88b9039254ba31a', null, null, null);
INSERT INTO `sys_permission` VALUES ('8786b63420ae4f37b9a9b539248a793f', '机构列表', 'menu', '/adminSystem/orgList', '&#xe614', '3f21913f20934b39ae6b51cbdbbe211d', null, null, null);
INSERT INTO `sys_permission` VALUES ('88adfb0e88eb4a94813796fafc179ebb', '商品分类', 'menu', '/shop/shopClassList', null, 'afddb27a8aac43c3b06369bddd1b94ff', null, null, null);
INSERT INTO `sys_permission` VALUES ('92c200115d34481094ee588f3550e78a', '角色管理', 'menu', '/adminSystem/roleList?currentPage=1&size=10', '&#xe614', '373fe87fe1204316ac577d6d9c927526', null, null, null);
INSERT INTO `sys_permission` VALUES ('9555b5feba7e49e2b7f4a56f0fd23d45', '商户订单', 'button', '/marketing/goOrgOrder', null, 'acb6ccc3afa6484c9fd8d71469ef8299', null, null, null);
INSERT INTO `sys_permission` VALUES ('9702dfd29e7247709d4f384be93d1041', '订单', 'button', '/groupRebate/orderListByActivity04', '&#xe614', 'a90f861a17fc4221ae12b911b7de2055', null, null, null);
INSERT INTO `sys_permission` VALUES ('9baef9615046421db9350074e7d16b4e', '商品列表', 'menu', '/shop/commodityList', '&#xe614', 'afddb27a8aac43c3b06369bddd1b94ff', null, null, null);
INSERT INTO `sys_permission` VALUES ('a750a591833b4b0faafe25f7c338e137', '权限管理', 'menu', '/adminSystem/adminRuleList?type=&name=&url=&currentPage=1&limit=10', '&#xe614', '373fe87fe1204316ac577d6d9c927526', null, null, null);
INSERT INTO `sys_permission` VALUES ('acb6ccc3afa6484c9fd8d71469ef8299', '商户活动', 'menu', '/marketing/goOrgActivityList', null, 'e9c1b163eec64d72b518c47b83e9df5d', null, null, null);
INSERT INTO `sys_permission` VALUES ('adbeb4e66fff48a6bf1717699162c68e', '上传图片', 'button', '/adminSystem/ossUpload', '&#xe614', 'ea4da769a2be41a6ad2c100acefac844', null, null, null);
INSERT INTO `sys_permission` VALUES ('afddb27a8aac43c3b06369bddd1b94ff', '商城管理', 'menu', '/commodity/top', '&#xe614', '0', null, null, null);
INSERT INTO `sys_permission` VALUES ('b08af120e31a4775939eafc43041c072', '数据统计', 'menu', '/group/dataStatistics', '&#xe614', '9f2a77ccc5f8406d96f812b57645b7a9', null, null, null);
INSERT INTO `sys_permission` VALUES ('b117149701704c9c83456dcc097ea71f', '活动详情', 'menu', '/groupActives/activesDetail?currentPage=1', '&#xe614', '3fc25caf41e949d69232e987d5bebb72', null, null, null);
INSERT INTO `sys_permission` VALUES ('b7b597f3f43542eaa752d50acd3e248b', '订单管理', 'menu', '/order/manage', '&#xe614', '0', null, null, null);
INSERT INTO `sys_permission` VALUES ('bcf4aba02739476681293e68801d4b03', '商家信息', 'menu', '/marketing/goOrgInfo', null, 'e9c1b163eec64d72b518c47b83e9df5d', null, null, null);
INSERT INTO `sys_permission` VALUES ('d98af90eac654e7db97c7063fba49c76', '活动详情', 'menu', '/adminSystem/activityList', '&#xe614', '0a8bdf4fca0340b0ae2284289144d90b', null, null, null);
INSERT INTO `sys_permission` VALUES ('dd0fd12bd6b5429d95644a11a11c9b08', '商家列表', 'menu', '/group/groupOrgList', null, '9f2a77ccc5f8406d96f812b57645b7a9', null, null, null);
INSERT INTO `sys_permission` VALUES ('dd20b280f6b54437918efb62b3f4f484', '修改机构信息', 'button', '/groupActives/toUpdateOrgById06', '&#xe614', '33367d2545914f81891a5af8b6febb60', null, null, null);
INSERT INTO `sys_permission` VALUES ('e1dfd6d1c9b743979e64dcefd22f2493', '提现记录', 'button', '/adminSystem/withDrawRecord', '&#xe614', 'd98af90eac654e7db97c7063fba49c76', null, null, null);
INSERT INTO `sys_permission` VALUES ('ea4da769a2be41a6ad2c100acefac844', '活动管理', 'menu', '/adminSystem/agentActiveList?name=&principal=&principalTel=', '&#xe614', '0a8bdf4fca0340b0ae2284289144d90b', null, null, null);
INSERT INTO `sys_permission` VALUES ('f0688671afa9462cb71364c8aa21cdd1', '删除机构', 'button', '/adminSystem/delOrg', '&#xe614', 'ea4da769a2be41a6ad2c100acefac844', null, null, null);

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `adminUserId` varchar(36) DEFAULT NULL COMMENT '管理ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('28000c7966e94528aa201d634544701d', '代金券模式店家', '1', '2018-10-11 15:54:07', '00f881a69f60421d86a61e4fd11c7afe');
INSERT INTO `sys_role` VALUES ('50480a4b48be46ca9608ecd6cc6262c5', '拼团模式店家', '1', '2018-11-05 16:55:30', '00f881a69f60421d86a61e4fd11c7afe');
INSERT INTO `sys_role` VALUES ('73dffd41c44045ef9384f423d84cf480', '店家1', '1', '2018-09-17 13:02:51', 'd21b5d63ad954958b47152f83dcf5773');
INSERT INTO `sys_role` VALUES ('9be47b32a7994aeebfa82883ba31e0f5', '管理员1', '1', '2019-05-30 15:51:13', '1');

-- ----------------------------
-- Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `sys_role_id` varchar(32) NOT NULL COMMENT '角色id',
  `sys_permission_id` varchar(32) NOT NULL COMMENT '权限id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-权限表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('65a1cac1de034324930a15587317ce0b', '99206d4e118c4e59ab27155f094c47ed');
INSERT INTO `sys_role_permission` VALUES ('65a1cac1de034324930a15587317ce0b', '0a8bdf4fca0340b0ae2284289144d90b');
INSERT INTO `sys_role_permission` VALUES ('5786c79cc0704eb38e8b30d271a8a105', '92c200115d34481094ee588f3550e78a');
INSERT INTO `sys_role_permission` VALUES ('5786c79cc0704eb38e8b30d271a8a105', 'b005f861cb9d4cf9a134fb7e6d6cdf0d');
INSERT INTO `sys_role_permission` VALUES ('5786c79cc0704eb38e8b30d271a8a105', '373fe87fe1204316ac577d6d9c927526');
INSERT INTO `sys_role_permission` VALUES ('5786c79cc0704eb38e8b30d271a8a105', '7c8ee5d985704817b11793d18a78a5ab');
INSERT INTO `sys_role_permission` VALUES ('5786c79cc0704eb38e8b30d271a8a105', '89992fa6f448490ab50af3a8843ec95d');
INSERT INTO `sys_role_permission` VALUES ('73dffd41c44045ef9384f423d84cf480', '7c8ee5d985704817b11793d18a78a5ab');
INSERT INTO `sys_role_permission` VALUES ('73dffd41c44045ef9384f423d84cf480', 'e9c1b163eec64d72b518c47b83e9df5d');
INSERT INTO `sys_role_permission` VALUES ('5786c79cc0704eb38e8b30d271a8a105', 'acb6ccc3afa6484c9fd8d71469ef8298');
INSERT INTO `sys_role_permission` VALUES ('5786c79cc0704eb38e8b30d271a8a105', 'e67a8c6283e34a279e8d466645fb83fa');
INSERT INTO `sys_role_permission` VALUES ('73dffd41c44045ef9384f423d84cf480', 'e67a8c6283e34a279e8d466645fb83fa');
INSERT INTO `sys_role_permission` VALUES ('73dffd41c44045ef9384f423d84cf480', 'acb6ccc3afa6484c9fd8d71469ef8298');
INSERT INTO `sys_role_permission` VALUES ('73dffd41c44045ef9384f423d84cf480', 'bcf4aba02739476681293e68801d4b03');
INSERT INTO `sys_role_permission` VALUES ('73dffd41c44045ef9384f423d84cf480', '8198366b27434c9da2f2d7e6a6863c5b');
INSERT INTO `sys_role_permission` VALUES ('28000c7966e94528aa201d634544701d', 'e9c1b163eec64d72b518c47b83e9df5d');
INSERT INTO `sys_role_permission` VALUES ('28000c7966e94528aa201d634544701d', 'bcf4aba02739476681293e68801d4b03');
INSERT INTO `sys_role_permission` VALUES ('28000c7966e94528aa201d634544701d', '300844c776874e7a9162f655bb93d18e');
INSERT INTO `sys_role_permission` VALUES ('28000c7966e94528aa201d634544701d', '8198366b27434c9da2f2d7e6a6863c5b');
INSERT INTO `sys_role_permission` VALUES ('28000c7966e94528aa201d634544701d', 'acb6ccc3afa6484c9fd8d71469ef8299');
INSERT INTO `sys_role_permission` VALUES ('5786c79cc0704eb38e8b30d271a8a105', '9f2a77ccc5f8406d96f812b57645b7a9');
INSERT INTO `sys_role_permission` VALUES ('5786c79cc0704eb38e8b30d271a8a105', 'dd0fd12bd6b5429d95644a11a11c9b08');
INSERT INTO `sys_role_permission` VALUES ('50480a4b48be46ca9608ecd6cc6262c5', 'acb6ccc3afa6484c9fd8d71469ef8299');
INSERT INTO `sys_role_permission` VALUES ('50480a4b48be46ca9608ecd6cc6262c5', '8198366b27434c9da2f2d7e6a6863c5b');
INSERT INTO `sys_role_permission` VALUES ('50480a4b48be46ca9608ecd6cc6262c5', 'bcf4aba02739476681293e68801d4b03');
INSERT INTO `sys_role_permission` VALUES ('50480a4b48be46ca9608ecd6cc6262c5', '9f2a77ccc5f8406d96f812b57645b7a9');
INSERT INTO `sys_role_permission` VALUES ('50480a4b48be46ca9608ecd6cc6262c5', 'dd0fd12bd6b5429d95644a11a11c9b08');
INSERT INTO `sys_role_permission` VALUES ('50480a4b48be46ca9608ecd6cc6262c5', 'b08af120e31a4775939eafc43041c072');
INSERT INTO `sys_role_permission` VALUES ('5786c79cc0704eb38e8b30d271a8a105', 'b08af120e31a4775939eafc43041c072');
INSERT INTO `sys_role_permission` VALUES ('9be47b32a7994aeebfa82883ba31e0f5', '12');
INSERT INTO `sys_role_permission` VALUES ('9be47b32a7994aeebfa82883ba31e0f5', '373fe87fe1204316ac577d6d9c927526');
INSERT INTO `sys_role_permission` VALUES ('9be47b32a7994aeebfa82883ba31e0f5', 'afddb27a8aac43c3b06369bddd1b94ff');
INSERT INTO `sys_role_permission` VALUES ('9be47b32a7994aeebfa82883ba31e0f5', 'b7b597f3f43542eaa752d50acd3e248b');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `userCode` varchar(32) NOT NULL COMMENT '账号',
  `userName` varchar(64) NOT NULL COMMENT '姓名',
  `password` varchar(1025) NOT NULL COMMENT '密码',
  `salt` varchar(64) DEFAULT NULL COMMENT '盐',
  `locked` char(1) DEFAULT NULL COMMENT '账号是否锁定，1：锁定，0未锁定',
  `type` varchar(10) DEFAULT NULL COMMENT '0  超级管理员  1 管理员 2 普通用户 ',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号',
  `adminUserId` varchar(36) DEFAULT NULL COMMENT '管理员ID',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orgNumber` int(11) DEFAULT '0' COMMENT '可开通机构数量',
  `openId` varchar(36) DEFAULT '' COMMENT '个人微信openId  (微信公众号康微客)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', '6c10e020a68cb87f7b675ad8a2bf6367', '6000872019238', '0', '0', '13083690563', '1', '2018-08-18 18:29:02', '100', 'oyMFp002RTNla_B5xn-AgzfZq9xU');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(36) NOT NULL,
  `sys_user_id` varchar(32) NOT NULL,
  `sys_role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('04a09c1419a54ea4a43e4a4f4b1d79db', 'b29e4ca19aeb460c9c0dcc0466eaca83', '50480a4b48be46ca9608ecd6cc6262c5');
INSERT INTO `sys_user_role` VALUES ('188c4e0a6bca4d26898f1e5cd80872da', '17fdedeb59654f84868d91d40b898a4', '5786c79cc0704eb38e8b30d271a8a105');
INSERT INTO `sys_user_role` VALUES ('272c99573843486c96bbbebb3b088d5c', 'd21b5d63ad954958b47152f83dcf5773', '5786c79cc0704eb38e8b30d271a8a105');
INSERT INTO `sys_user_role` VALUES ('2e518d49124143b09148fff0573d6b67', '3f7b605a974545ffb993c81802f58403', '28000c7966e94528aa201d634544701d');
INSERT INTO `sys_user_role` VALUES ('31489a48fab8448dadcc048be059f6eb', '773bb72a8dfe41e48f1a8fb68b6a7e26', '73dffd41c44045ef9384f423d84cf480');
INSERT INTO `sys_user_role` VALUES ('4c5fd1aa9dee4975bab958c6b305dcdf', '01a96aa8c25c4b209252aa311a36cb63', '');
INSERT INTO `sys_user_role` VALUES ('4ea6b1dc771f4ff5bcfbcc07bd828583', '00f881a69f60421d86a61e4fd11c7afe', '5786c79cc0704eb38e8b30d271a8a105');
INSERT INTO `sys_user_role` VALUES ('5286478d9f0f45dba3aa2c3cac97d3e6', '32954af26a82470e92062e1b4397639d', '02d99463ba394d0b80155676c490ce5a');
INSERT INTO `sys_user_role` VALUES ('52a9c11c012d448bbd35a53de4c5fdee', 'dab2b79949574beaae1287f0557f35b5', '9abf77ad3f5d41d6958dc684e172cd9d');
INSERT INTO `sys_user_role` VALUES ('5cd1ddb9ea4e48c8b5d8fe6b72dd2cb4', '17fdedeb59654f84868d91d40b898ad2', '28000c7966e94528aa201d634544701d');
INSERT INTO `sys_user_role` VALUES ('684728b7e03b4f6a96eafac034c72357', 'c259866ed47a4960a7355342dcad00ef', '5786c79cc0704eb38e8b30d271a8a105');
INSERT INTO `sys_user_role` VALUES ('77b2408d77324e9680391ef5ee5c5c2e', '32954af26a82470e92062e1b4397639d', '5786c79cc0704eb38e8b30d271a8a105');
INSERT INTO `sys_user_role` VALUES ('7a422dd00c1f48d690c71fc852c54064', '32954af26a82470e92062e1b4397639d', '2208c1cdbad1400e8390f539db583558');
INSERT INTO `sys_user_role` VALUES ('7ba2780bad1347a38bfa9e05a397ce1a', 'd89efb23911540e9bdb15b8febbf7b02', '28000c7966e94528aa201d634544701d');
INSERT INTO `sys_user_role` VALUES ('7cb2f690579e473ab65e0617cecab23b', '6ab0f2acb22148468bbf29d52e969452', '5786c79cc0704eb38e8b30d271a8a105');
INSERT INTO `sys_user_role` VALUES ('82c5370c1e3d4c0d9b43204ddde4a796', 'a0104b2306d548e9a83b7046d7792c29', '28000c7966e94528aa201d634544701d');
INSERT INTO `sys_user_role` VALUES ('961e766cbaa341a3bb917b2bfb8ad640', '1', '9be47b32a7994aeebfa82883ba31e0f5');
INSERT INTO `sys_user_role` VALUES ('abfa3c162ff346f0be06a1b4fb6771f6', '3e712a8e6e0d4f419d943bc9ac837b2b', '28000c7966e94528aa201d634544701d');
INSERT INTO `sys_user_role` VALUES ('b9d0eeacf20849aba2b14494f8402334', 'cb26bb359e604cda9d338ea47afb533d', '28000c7966e94528aa201d634544701d');
INSERT INTO `sys_user_role` VALUES ('c0549f381810418a95229fedb227caea', 'a70a4fd6e2b6461a999b866fa4622f0f', '');
INSERT INTO `sys_user_role` VALUES ('d3be381b10e547bdbc5fc46d164962e8', '1da2de7dd3ab43a59db6c186ff1234da', '50480a4b48be46ca9608ecd6cc6262c5');
INSERT INTO `sys_user_role` VALUES ('f3f02774fad64370bd02054b8e76919d', '89ebbe81c44a4ca799c2db37076368ed', '5786c79cc0704eb38e8b30d271a8a105');
