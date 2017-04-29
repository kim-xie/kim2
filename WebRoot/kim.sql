/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.6.26 : Database - kim
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kim` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kim`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `article_id` varchar(32) NOT NULL COMMENT '内容id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `article_channel_id` varchar(32) DEFAULT NULL COMMENT '栏目id',
  `article_category_id` varchar(32) DEFAULT NULL COMMENT '分类id',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `subTitle` varchar(100) DEFAULT NULL COMMENT '子标题',
  `description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `article` longtext COMMENT '内容',
  `thumnail` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `image` varchar(100) DEFAULT NULL COMMENT '封面图片',
  `width` int(100) DEFAULT NULL COMMENT '封面图片的宽度',
  `height` int(100) DEFAULT NULL COMMENT '封面图片的高度',
  `static_link` varchar(200) DEFAULT NULL COMMENT '静态页面链接',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tag` varchar(50) DEFAULT NULL COMMENT '标签',
  `is_top` int(1) DEFAULT NULL COMMENT '1置顶0未置顶',
  `is_delete` int(1) DEFAULT NULL COMMENT '1删除0未删除',
  `is_comment` int(1) DEFAULT NULL COMMENT '1允许0不允许',
  `comments` int(255) DEFAULT NULL COMMENT '评论数据',
  `hits` int(255) DEFAULT NULL COMMENT '点击数',
  `status` int(1) DEFAULT NULL COMMENT '1发布0未发布',
  `push` int(1) DEFAULT NULL COMMENT '1精华0未精华',
  `collections` int(255) DEFAULT NULL COMMENT '收藏数量',
  `loves` int(255) DEFAULT NULL COMMENT '喜欢数量',
  `type` varchar(100) DEFAULT NULL COMMENT '类型',
  `keyword` varchar(1000) DEFAULT NULL COMMENT '关键字',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`article_id`,`user_id`,`article_channel_id`,`article_category_id`,`title`,`subTitle`,`description`,`article`,`thumnail`,`image`,`width`,`height`,`static_link`,`create_time`,`update_time`,`tag`,`is_top`,`is_delete`,`is_comment`,`comments`,`hits`,`status`,`push`,`collections`,`loves`,`type`,`keyword`) values ('0b52d49fee984502bbc52cb9e888c6ad','991836cc46424212aed16d38964f22cd',NULL,NULL,'谈谈jQuery中的事件',NULL,'jQuery事件','#总结\n####鼠标事件\n1. click与dbclick事件\n   $ele.click()\n   $ele.click(handler(eventObject))\n   $ele.click([eventData],handler(eventObject))\n\n2. mousedown,mouseover\n\n3. mouseover,mouseout\n\n4. mouseenter,mouseleave\n\n5. hover\n\n6. focusin,focusout\n\n####表单事件\n1.blur,focus\n\n2.change\n\n3.select\n\n4.submit\n\n####键盘事件\n1.keydown()\n\n2.keyup()\n\n3.keypress()\n\n####多事件\n1.on()\n\n2.off()\n\n3.event\n\n4.event.type\n\n5.event.pageX,event.pageY\n\n6.event.preventDefault()\n\n7.event.stopPropagation()\n\n8.event.which\n\n9.this,event.target\n\n####自定义事件\n1.trigger\n\n2.triggerHandler\n\n##jQuery鼠标事件之click与dbclick事件\n\n用交互操作中，最简单直接的操作就是点击操作。jQuery提供了两个方法一个是click方法用于监听用户单击操作，另一个方法是dbclick方法用于监听用户双击操作。这两个方法的用法是类似的，下面以click()事件为例\n使用上非常简单：\n方法一：$ele.click()\n	`绑定$ele元素，不带任何参数一般是用来指定触发一个事件，用的比较少\n	<div id=\"test\">点击触发<div>\n	$(\"ele\").click(function(){\n		alert(\'触发指定事件\')\n	})\n	$(\"#test\").click(function(){\n		 $(\"ele\").click()  //手动指定触发事件 \n	});`\n\n方法二：$ele.click( handler(eventObject) )\n绑定$ele元素，每次$ele元素触发点击操作会执行回调 handler函数，这样可以针对事件的反馈做很多操作了，方法中的this是指向了绑定事件的元素\n	`<div id=\"test\">点击触发<div>\n$(\"#test\").click(11111,function(e) {\n    //this指向 div元素\n    //e.data  => 11111 传递数据\n});`\n\ndblclick()的用法和click()的用法是类似的，可以参考以上click()的用法。\ndbclick与click事件不同的是：\nclick事件触发需要以下几点：\n	1. click事件其实是由mousedown与mouseup 2个动作构成，所以点击的动作只有在松手后才触发\n\ndblclick事件触发需要以下几点：\n	1. dblclick又是由2个click叠加而来的，所以dblclick事件只有在满足以下条件的情况下才能被触发\n	2. 鼠标指针在元素里面时点击。\n	3. 鼠标指针在元素里面时释放。\n	4. 鼠标指针在元素里面时再次点击，点击间隔时间，是系统而定。\n	5. 鼠标指针在元素里面时再次释放。\n注意：在同一元素上同时绑定 click 和 dblclick 事件是不可取的。各个浏览器事件触发的顺序是不同的，一些浏览器在dblclick之前接受两个 click 事件 ，而一些浏览器只接受一个 click 事件。用户往往可通过不同的操作系统和浏览器配置双击灵敏度\n例子：\n	`$(“button:eq(0)”).click(function(){\n    alert(this)\n})\n结果：this指向button元素`\n\n	`[object HTMLButtonElement]\n\n$(‘p’).click(function(e){\n    alert(e.target.textContent)\n})               //取了p元素的文字部分\n$(“button:eq(1)”).click(function(){\n    $(‘p’).click()   //手动指定触发事件\n})`\n\n	`function data(e) {\n    alert(e.data)\n}\nfunction a() {\n    $(“button:eq(2)”).click(1111,data)\n}\na();`\n\nfunction a() {} 是自定义一个a()方法 , 如果在你上下文中不调用是不会执行a()中方法的， 结尾处写一个函数a()是调用a()方法体。\n\n\n',NULL,'http://localhost:8080/kim/resources/imgs/contentImg/201704242131185.jpg',NULL,NULL,NULL,'2017-04-24 21:31:23','2017-04-26 21:50:55','jquery事件',1,0,1,0,0,1,1,0,0,NULL,NULL);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `feedback_content` varchar(100) DEFAULT NULL,
  `app_version` varchar(100) DEFAULT NULL,
  `feedback_description` varchar(100) DEFAULT NULL,
  `feedback_status` int(1) NOT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

insert  into `feedback`(`feedback_id`,`user_id`,`feedback_content`,`app_version`,`feedback_description`,`feedback_status`,`is_delete`,`create_time`,`update_time`) values ('187EB5C15F4F4F98B34CBEF11AD0017F','17AD94A9493547D490AD1A3C4DC75F96','测试数据','1.0.0',NULL,0,0,'2017-04-17 21:03:56','2017-04-17 21:03:56'),('1CDF096473554C3BA26F6DFC940F4D2C','17AD94A9493547D490AD1A3C4DC75F96','好阿红啊玩','1.0.0',NULL,0,0,'2017-04-17 21:29:31','2017-04-17 21:29:31'),('301EA7BD7F7C42719C00B1E3540F5036','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/cj_thumb.gif\" title=\"[吃惊]\">','1.0.0',NULL,0,0,'2017-04-19 19:33:51','2017-04-19 19:33:51'),('314B159ECF054897B5A12B47DFC1C713','17AD94A9493547D490AD1A3C4DC75F96','呵呵呵','1.0.0',NULL,0,0,'2017-04-17 21:15:24','2017-04-17 21:15:24'),('3C7C78B0CDC243A8B3F7DDAFBE9EDFD3','17AD94A9493547D490AD1A3C4DC75F96','12345678','1.0.0',NULL,0,0,'2017-04-17 21:32:09','2017-04-17 21:32:09'),('3D2F20679BD648C992478AE95A87242D','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/x_thumb.gif\" title=\"[嘘]\">','1.0.0',NULL,0,0,'2017-04-19 19:05:40','2017-04-19 19:05:40'),('40A17D2CB8874F92BEF8453F0AAA6815','17AD94A9493547D490AD1A3C4DC75F96','214325253253','1.0.0',NULL,0,0,'2017-04-17 21:31:08','2017-04-17 21:31:08'),('5327CF9E738045C8846511661639C173','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/sad_thumb.gif\" title=\"[弱]\">','1.0.0',NULL,0,0,'2017-04-19 19:49:54','2017-04-19 19:49:54'),('64B5B03A79AD448C940CA8094FEFE524','17AD94A9493547D490AD1A3C4DC75F96','酷酷的呀','1.0.0',NULL,0,0,'2017-04-17 21:19:56','2017-04-17 21:19:56'),('66AFCE37D94D463CB577A9D78CE5AF7D','17AD94A9493547D490AD1A3C4DC75F96','发表反馈','1.0.0',NULL,0,0,'2017-04-17 21:28:39','2017-04-17 21:28:39'),('66CFFC1A1A6241CE8434F34EC1A373BF','991836cc46424212aed16d38964f22cd','测试表情<img src=\"http://localhost:8080/kim/resources/imgs/face/laugh.gif\" title=\"[哈哈]\">','1.0.0',NULL,0,0,'2017-04-18 22:32:57','2017-04-18 22:32:57'),('6A751B7EA2204C4E9D716566F61C4B76','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/wg_thumb.gif\" title=\"[围观]\">','1.0.0',NULL,0,0,'2017-04-19 19:42:30','2017-04-19 19:42:30'),('6E8D4F3D5B5C4EDBA130086E37251252','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/horse2_thumb.gif\" title=\"[神马]\">','1.0.0',NULL,0,0,'2017-04-19 19:31:35','2017-04-19 19:31:35'),('6F8E874EBC2A43F98E592ECF3CBDC331','17AD94A9493547D490AD1A3C4DC75F96','哈坎HDKHDKAHDKAHSD','1.0.0',NULL,0,0,'2017-04-17 21:29:48','2017-04-17 21:29:48'),('79DB6242A6D5470F9F1C09E38A72648A','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/j_thumb.gif\" title=\"[囧]\">','1.0.0',NULL,0,0,'2017-04-19 19:48:42','2017-04-19 19:48:42'),('83F1F4F8770444DB85458F5A9812E746','17AD94A9493547D490AD1A3C4DC75F96','差不多了','1.0.0',NULL,0,0,'2017-04-17 21:16:23','2017-04-17 21:16:23'),('876C8F4782DF46E3B624ABF27BFE63A3','17AD94A9493547D490AD1A3C4DC75F96','呵呵呵呵','1.0.0',NULL,0,0,'2017-04-17 21:16:03','2017-04-17 21:16:03'),('8D3F65F0A65A424CB3FE6DF06A2E8C09','991836cc46424212aed16d38964f22cd','反馈','1.0.0',NULL,0,0,'2017-04-18 22:18:23','2017-04-18 22:18:23'),('8E3FEFCBA4394B6382DFA388D6173325','17AD94A9493547D490AD1A3C4DC75F96','123特意打电话','1.0.0',NULL,0,0,'2017-04-17 21:33:42','2017-04-17 21:33:42'),('8EE82242913E46838F6AF85241848A94','17AD94A9493547D490AD1A3C4DC75F96','13插入WRV','1.0.0',NULL,0,0,'2017-04-17 21:34:55','2017-04-17 21:34:55'),('906F17B43C7D4C3FBA46F57276452A88','17AD94A9493547D490AD1A3C4DC75F96','拉斯加福禄寿解答老师解放路附近','1.0.0',NULL,0,0,'2017-04-17 21:30:44','2017-04-17 21:30:44'),('9A70BEC7B56D432586FEAA50C9A06329','991836cc46424212aed16d38964f22cd','测试刚刚发布的数据','1.0.0',NULL,0,0,'2017-04-18 22:29:54','2017-04-18 22:29:54'),('9FEB5D8D34BE4DB784D60C3CCE8D4DD0','17AD94A9493547D490AD1A3C4DC75F96','酷酷的','1.0.0',NULL,0,0,'2017-04-17 21:19:11','2017-04-17 21:19:11'),('A3E4E75427D8453BB6E6C96837AC7880','17AD94A9493547D490AD1A3C4DC75F96','额外热瓦被淘汰','1.0.0',NULL,0,0,'2017-04-17 21:33:15','2017-04-17 21:33:15'),('A970E5E936394787901AFDCFF88C2A8A','17AD94A9493547D490AD1A3C4DC75F96','测试layer控件','1.0.0',NULL,0,0,'2017-04-17 21:12:57','2017-04-17 21:12:57'),('A99AC5C8639A4D008740EC915254F14F','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/geili_thumb.gif\" title=\"[给力]\">','1.0.0',NULL,0,0,'2017-04-19 19:04:04','2017-04-19 19:04:04'),('B8BD53BE0972496889B4FE3F579C078B','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/geili_thumb.gif\" title=\"[给力]\">','1.0.0',NULL,0,0,'2017-04-19 19:33:28','2017-04-19 19:33:28'),('C74FF1D5BA5C41E68AD000FDF491C6F3','17AD94A9493547D490AD1A3C4DC75F96','哈哈哈','1.0.0',NULL,0,0,'2017-04-17 21:15:02','2017-04-17 21:15:02'),('C875F4AC22CF4927A4640273BF01F4D7','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/geili_thumb.gif\" title=\"[给力]\">','1.0.0',NULL,0,0,'2017-04-19 19:49:07','2017-04-19 19:49:07'),('D8A56EDD7D8944C1B17AD14DB7DB33B0','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/vw_thumb.gif\" title=\"[威武]\">','1.0.0',NULL,0,0,'2017-04-19 19:46:00','2017-04-19 19:46:00'),('DC337B6FF2834C338137D9456135A55E','991836cc46424212aed16d38964f22cd','刚刚发布','1.0.0',NULL,0,0,'2017-04-18 22:23:30','2017-04-18 22:23:30'),('DDE8DEA9743A4E028DDE142C845A3DE1','17AD94A9493547D490AD1A3C4DC75F96','测试layer的loading组件','1.0.0',NULL,0,0,'2017-04-17 21:14:00','2017-04-17 21:14:00'),('DF8EC12C1D3F49CA85FA23AA533A0754','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/good_thumb.gif\" title=\"[good]\">','1.0.0',NULL,0,0,'2017-04-19 19:02:22','2017-04-19 19:02:22'),('E52CCD062F76402C88A8EAA14600F4AA','17AD94A9493547D490AD1A3C4DC75F96','哈哈哈哈！','1.0.0',NULL,0,0,'2017-04-17 21:23:04','2017-04-17 21:23:04'),('EEC72D3B8936463F9C7C2DBD545EDAFB','17AD94A9493547D490AD1A3C4DC75F96','213456789','1.0.0',NULL,0,0,'2017-04-17 21:31:34','2017-04-17 21:31:34'),('FB0CBABB3EFD4EECAC7B6EB7E99963BB','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/z2_thumb.gif\" title=\"[赞]\">','1.0.0',NULL,0,0,'2017-04-19 19:01:29','2017-04-19 19:01:29'),('FCE7902B74BF45A0A2D5AEDBBC5B80FE','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/geili_thumb.gif\" title=\"[给力]\">','1.0.0',NULL,0,0,'2017-04-19 19:41:55','2017-04-19 19:41:55'),('FF27B14126CC4391AE281B5AB9CE72D7','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/tza_thumb.gif\" title=\"[可爱]\">','1.0.0',NULL,0,0,'2017-04-19 18:58:34','2017-04-19 18:58:34');

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `log_id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `className` varchar(100) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `ipAddress` varchar(100) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `log` */

insert  into `log`(`log_id`,`user_id`,`user_name`,`description`,`model`,`className`,`method`,`time`,`ip`,`ipAddress`,`is_delete`,`create_time`) values ('149a5e72ef11461ba3a16f8a333c4fef','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',3,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:11:11'),('15cb327a2d014d0a8998bc4439295c84','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',1,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-29 22:38:17'),('192cc41b1408418880f968291c8a3353','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',23,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-25 22:40:08'),('285340415a49443293b9700c125c21c7','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',23,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-26 14:56:00'),('297c87f1c6fc4b879cc9aaf547bfaeb9','991836cc46424212aed16d38964f22cd','kim','kim调用了saveArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','saveArticle',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-23 10:36:18'),('343e1978f03f49a2a57ba59f138b7d59','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',3,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:11:08'),('350082b128b24575b63b258d903b9dbe','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',6,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:09:06'),('4011217da8f04ec99e66a1612b19ec13','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',0,'127.0.0.1','广东省 深圳市 南山区',0,'2017-04-09 22:42:32'),('40b792dfff064e0fafa7b3c616f34fe9','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',1,'127.0.0.1','广东省 深圳市 南山区',NULL,'2017-03-23 10:18:41'),('4c36df4073cd46a8829cffbba843fc38','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',4,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:10:49'),('4db3764797a940f88edee447fbdd8b65','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-29 22:30:56'),('54f1f48f8f7d4ab293b3c9d3eb42cee8','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:13:01'),('55fb9591426d4e05bf735429c3a4c95a','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:16:49'),('5634a903ed7f4c52b393a91d61f24287','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',1,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-25 22:57:13'),('58449c8d4ff7434aaba31a31c566c570','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',7,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:10:33'),('5956f17f03ff46bf903d21d8bcef7689','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',1,'127.0.0.1','本地 ',0,'2017-03-23 10:27:40'),('598a7cdfc0f1478390721ec673e8e417','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-26 15:06:49'),('5e993cd774804017971a4d2d2aa0fac0','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',3,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:12:34'),('6614a18d71a74476928a6a93e9d951d6','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',4,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:12:32'),('6663f918c3274cf8a8dd55874a1d6eec','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',84,'127.0.0.1','广东省 深圳市 南山区',0,'2017-04-09 22:42:32'),('69d860092ff74a3292db67491242023f','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',1,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-26 15:06:49'),('6c3265c877a6471299b77d5ee1104c5a','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',22,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:06:15'),('72e95240f9284b2fb80c21f0d2351e7f','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:16:38'),('857d019803a748f7a9552ffeca6de8ba','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',5,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:09:16'),('85bd4ea087064377a421badf703daf9c','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-29 22:34:37'),('90a61480445d4b1cba0b803430fa6650','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',4,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:10:53'),('94df0e988fa5494caea93f62eb052e61','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',1,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-25 22:57:13'),('959e5cd4a141496f861a2da4217b5d0d','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',4,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:12:43'),('9aa6e7d360b7432dbd8230d336c7eda3','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',0,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:12:56'),('a9932319770740d1905d1958d3f8fb9e','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',4,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:10:43'),('b61eeb74485045089890b70708d770e7','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:06:15'),('b96ed1bda1a4427c8954dce3096f9ab6','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',3,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:09:22'),('c2d00644026c435d99e66904c50ce01f','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',5,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:16:26'),('cb1bc261319841c0b8aca0b71ae37a6f','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',39,'127.0.0.1','本地 ',0,'2017-03-23 10:27:40'),('d86830c66dc3490bbe8ba624541beec8','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',35,'127.0.0.1','广东省 深圳市 南山区',NULL,'2017-03-23 10:18:41'),('dc6882745632448eb20ce877000db0f6','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',1,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-25 22:40:08'),('e950b6995037441f8dfaf5d1faa4a7cb','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:09:44'),('eb1d8696db1a403897eccbc4ad1c2279','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',4,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:12:38'),('ee63794e91554198be5205aa8ee7d08e','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:09:37'),('ee9b071726eb467bbb6ee1342c7d0bc9','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',1,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-26 14:56:00'),('f29f80a0ab1b4b63beac27ccf17459f8','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-29 22:38:13');

/*Table structure for table `lookup` */

DROP TABLE IF EXISTS `lookup`;

CREATE TABLE `lookup` (
  `lookup_id` varchar(32) NOT NULL,
  `lookupdf_id` varchar(32) DEFAULT NULL,
  `lookup_code` varchar(100) DEFAULT NULL,
  `lookup_name` varchar(100) DEFAULT NULL,
  `lookup_description` varchar(100) DEFAULT NULL,
  `lookup_status` int(1) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lookup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lookup` */

/*Table structure for table `lookupdf` */

DROP TABLE IF EXISTS `lookupdf`;

CREATE TABLE `lookupdf` (
  `lookupdf_id` varchar(32) NOT NULL,
  `lookupdf_code` varchar(100) DEFAULT NULL,
  `lookupdf_name` varchar(100) DEFAULT NULL,
  `lookupdf_description` varchar(100) DEFAULT NULL,
  `lookupdf_status` int(1) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lookupdf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lookupdf` */

/*Table structure for table `music` */

DROP TABLE IF EXISTS `music`;

CREATE TABLE `music` (
  `music_id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `music_ategory_id` varchar(32) DEFAULT NULL,
  `singer` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `album` varchar(100) DEFAULT NULL,
  `size` text,
  `time` varchar(10) DEFAULT NULL,
  `playSrc` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `lrc` text,
  `is_delete` int(1) DEFAULT NULL,
  `listens` int(11) DEFAULT NULL,
  `loves` int(11) DEFAULT NULL,
  `collections` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `descriptions` varchar(1000) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`music_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `music` */

/*Table structure for table `music_category` */

DROP TABLE IF EXISTS `music_category`;

CREATE TABLE `music_category` (
  `music_category_id` varchar(32) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`music_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `music_category` */

insert  into `music_category`(`music_category_id`,`code`,`type`,`is_delete`,`create_time`,`update_time`) values ('231e6ef1ea374a099b93f84d0b4e84e5',5,'重金属',0,'2016-11-06 00:41:43','2017-03-22 10:51:48'),('3575af4380b34d928b1af8574bd71fd0',6,'轻音乐',0,'2016-11-06 00:42:00','2017-03-22 10:52:07'),('44b5ef4cfcc74dbb8c384e16e07a4b17',7,'黑暗',0,'2016-11-06 00:42:18','2017-03-22 10:52:22'),('53dd2cd1d4f04719ba18e107e154cda1',3,'民谣',0,'2016-11-06 00:40:28','2017-03-22 10:51:22'),('9e72002288f54a43a6b017562f7968e1',8,'爵士',0,'2016-11-06 00:42:41','2017-03-22 10:52:40'),('a271a99167a34097b9a0a916a1de8e2b',9,'乡村',0,'2016-11-06 00:42:52','2017-03-22 10:52:45'),('a4cafaee1d9542dcb9f58f2429f8a4e0',4,'名族风',0,'2016-11-06 00:41:08','2017-03-22 10:51:36'),('a730ed359f2143faaffb23b1bfe9feea',11,'拉丁',0,'2016-11-06 00:43:17','2017-03-22 10:50:14'),('ceb57470cded4a3db2421a403f6c2da0',13,'迷幻',0,'2016-11-06 00:43:36','2017-03-22 10:50:49'),('d289c6bdb187406bb677df7929a67c00',10,'古典',0,'2016-11-06 00:43:02','2017-03-22 10:49:59'),('eaced10ac7f44b0fadb1a14f04b2f162',12,'儿童',0,'2016-11-06 00:43:23','2017-03-22 10:50:31'),('f2d994bee79e4140bcaa02629cc7d064',1,'流行',0,'2016-11-06 00:40:36','2017-03-22 10:49:45'),('f38cc30569e4482588f09ad4d05af62d',2,'摇滚',0,'2016-11-06 00:40:41','2017-03-22 10:51:03');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `ip` varchar(100) DEFAULT NULL COMMENT 'IP',
  `ipAddress` varchar(100) DEFAULT NULL COMMENT 'IP地址',
  `header_pic` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `address` varchar(200) DEFAULT NULL COMMENT '用户地址',
  `activeCode` char(32) DEFAULT NULL COMMENT '激活码',
  `level` int(3) DEFAULT NULL COMMENT '用户级别',
  `is_active` int(1) DEFAULT NULL COMMENT '是否已激活  1--已激活 0--未激活',
  `is_forbid` int(1) DEFAULT NULL COMMENT '是否已禁用  1--已禁用 0--未禁用',
  `is_delete` int(1) DEFAULT NULL COMMENT '是否已删除  1--已删除 0--未删除',
  `sex` int(1) DEFAULT NULL COMMENT '性别  0--女 1--男 3--保密',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `tel` varchar(100) DEFAULT NULL COMMENT '电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `qq` int(11) DEFAULT NULL COMMENT 'qq',
  `weixin` varchar(100) DEFAULT NULL COMMENT '微信',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `description` varchar(1000) DEFAULT NULL COMMENT '个人简介',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `role_id` int(100) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`name`,`password`,`ip`,`ipAddress`,`header_pic`,`address`,`activeCode`,`level`,`is_active`,`is_forbid`,`is_delete`,`sex`,`age`,`tel`,`email`,`qq`,`weixin`,`birthday`,`description`,`create_time`,`update_time`,`role_id`) values ('17AD94A9493547D490AD1A3C4DC75F96','kimi','4QrcOUm6Wau+VuBX8g+IPg==','127.0.0.1','本地 ','/resources/imgs/user/small.png',NULL,'6EFE933965BF4FB1A84E67FBF3457DB5',NULL,1,0,0,NULL,NULL,NULL,'2053868842@qq.com',NULL,NULL,NULL,NULL,'2017-04-10 23:31:49','2017-04-11 09:16:40',1),('991836cc46424212aed16d38964f22cd','kim','4QrcOUm6Wau+VuBX8g+IPg==','127.0.0.1','广东省 深圳市 南山区','/resources/imgs/user/small.png','广东省 深圳市 南山区',NULL,NULL,1,0,0,1,23,'18378311282','1134771121@qq.com',1134771121,'xdj1888',NULL,NULL,'2016-09-04 11:13:16','2017-04-12 22:46:58',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
