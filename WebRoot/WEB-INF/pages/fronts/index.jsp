<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>首页</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<meta name="Author" content="kim">
		<meta name="Keywords" content="Keywords1,Keywords2,Keywords3">
		<meta name="Description" content="This is my page">
		<%@include file="/WEB-INF/pages/common/common.jsp"%>
	</head>
	<style>
		/* 内容区域  start */
		.wpn { width: 1180px; margin: 0 auto; }  
		.mtw {margin-top: 20px !important;}
		.mtn {margin-top: 5px !important;}
		.z { float: left !important; }
		.y { float: right !important; }
		.cl:before, .cl:after{ content:" "; display: table }
		.cl:after { clear: both }
		.cl { *zoom: 1 }
		.show { display: block !important; }
		.hide { display: none !important; }
		.pos { position: relative; }
		.block { display: block; margin-left: auto; margin-right: auto; }
		.inblock { display: inline-block; }
		#mainWrap{width:100%;height:100%;}
		.slider-wrapper { position: relative; overflow: hidden; margin-top:70px;}

/* The Nivo Slider styles */
.nivoSlider {
	position:relative;
	width:1180px;
	height:350px;
	margin: 0 auto;
}
.nivoSlider img {
	position:absolute;
	top:0px;
	left:0px;
	max-width: none;
}
.nivo-main-image {
	display: block !important;
	position: relative !important;
	width: 100% !important;
}

/* If an image is wrapped in a link */
.nivoSlider a.nivo-imageLink {
	position:absolute;
	top:0px;
	left:0px;
	width:100%;
	height:100%;
	border:0;
	padding:0;
	margin:0;
	z-index:6;
	display:none;
	background:white;
	filter:alpha(opacity=0);
	opacity:0;
}
/* The slices and boxes in the Slider */
.nivo-slice {
	display:block;
	position:absolute;
	z-index:5;
	height:100%;
	top:0;
}
.nivo-box {
	display:block;
	position:absolute;
	z-index:5;
	overflow:hidden;
}
.nivo-box img { display:block; }


/* Direction nav styles (e.g. Next & Prev) */
.nivo-directionNav a {
	opacity: 0;
	transition: opacity .3s;
	position:absolute;
	top: 0;
	bottom: 0;
	z-index:9;
	cursor:pointer;
	width: 65px;
	text-indent: -99px;
	overflow: hidden;
}
.slider-wrapper:hover .nivo-directionNav a { opacity: 1; }

.nivo-prevNav {
	background: url("../../img/global/slide-btnl.jpg") no-repeat center center;
	left: -65px;
}
.nivo-nextNav {
	background: url("../../img/global/slide-btnr.jpg") no-repeat center center;
	right: -65px;
}

.nivo-controlNav {
	opacity: 0;
	transition: opacity .3s;
	position: absolute;
	bottom: 10px;
	left: 50%;
	z-index: 10;
  margin-left: -100px;
	padding: 4px 16px;
	border-radius: 20px;
	background-color: rgba(0,0,0,.15);
	filter:alpha(opacity=15);
	font-size: 0;
}
.nivo-controlNav a {
	padding: 5px;
	display: inline-block;
	cursor: pointer;
}
.nivo-controlNav a span {
	display: block;
	width: 12px;
	height: 12px;
	border-radius: 6px;
	background-color: rgba(255,255,255,.4);
	filter:alpha(opacity=40);
	transition: width .3s ease-out;
}
.nivo-controlNav a.active span {
	width: 30px; 
}
.slider-wrapper:hover .nivo-controlNav {
	opacity: 1;
}	
 a {color: #2c3e50; }
 a:hover {color: #2980b9;}

 .btn-fixed-100 { width: 100px; padding-left: 0; padding-right: 0; }

 .bg-gray2 { background-color: #eaeef1; overflow: hidden; zoom: 1;}
 .bg-gray3 { background: url("../../img/home/h-bg.jpg") repeat-x left top #eff3f5; width: 100%; height: auto; overflow: hidden; zoom: 1;}
 .txt-gray1 { color: #b8c4ce!important;}
 .txt-orange { color: #f39c12!important;}
 .txt-normal { color: #2c3e50!important;}
 .f24 { font-size: 24px!important; }

 .bg-blue { background-color: #3498db!important; }
 .bg-purple { background-color: #9b59b6!important; }
 .bg-red { background-color: #e74c3c!important; }

 .main { float: left; width: 940px;}
 .aside { float: right; width: 220px; }

 .msg span { margin-right: 10px;}
 .msg span i { font-size: 18px; color: #9aabb8; margin-right: 5px; }
 .msg span em { font-size: 14px; color: #9aabb8; }

 .w280 { width: 280px; }
 .w820 { width: 820px; }
 
 .mbw {margin-bottom: 20px !important;}

 .h-screen { float: left; margin-top: 15px; }
 .h-screen li { position: relative; float: left; }
 .h-screen li a {display: block; height: 40px; margin-right: 25px; padding: 0 20px; font-size: 14px; color: #7c7c7c; line-height: 40px; text-align: center; }
 .h-screen li a:hover { color: #3498db; }
 .h-screen li a .num { position: relative; display: inline-block; height: 18px; line-height: 18px; margin-left: 10px; padding: 0 3px; background-color: #3498db; font-size: 12px; color: #fff; }
 .h-screen li a .num:after,
 .h-screen li a .num:before { content:""; width: 0; height: 0; position: absolute; border-style: solid; border-color: ;}
 .h-screen li a .num:before { top: 0; left: -6px; border-color: transparent #3498db transparent transparent; border-width: 9px 6px 9px 0; }
 .h-screen li a .num:after { top: 0; right: -6px; border-color: transparent transparent transparent #3498db; border-width: 9px 0 9px 6px; }
 .h-screen li.on a { border: 1px solid #3498db; border-radius: 20px; font-weight: bold; color: #3498db; }
 .h-screen li.on a:hover { border-color: #3498db; }
 .h-screen li.on a .num { display: none; }
 .h-soup { position: relative; float: right; width: auto; height: 40px; margin-top: 15px; padding: 0 110px 0 20px; background-color: #fff7e7; border-radius: 20px; box-shadow: 1px 1px 2px rgba(0,0,0,.2); }
 .h-soup li { float: right; }
 .h-soup li i { position: absolute; top: 8px; font-size: 28px; color: #eae1d0; cursor: pointer; }
 .h-soup li.open i { color: #e67e22; }
 .h-soup li i.icon-star1 { right: 7px; }
 .h-soup li i.icon-heart-round { right: 41px; }
 .h-soup li i.icon-warn { right: 75px; }
 .h-soup li .txt { display: none; font-size: 14px; color: #6b3612; line-height: 40px; white-space: nowrap;  display: none;white-space: nowrap;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;max-width:550px; }
 .h-soup li.open .txt { display: block; }
 .h-follow { }
 .h-follow .tit1 { margin-top: 38px; font-size: 24px; color: #34495e; text-align: center; font-weight: bold; }
 .h-follow .tit2 { margin-bottom: 38px; font-size: 20px; color: #34495e; text-align: center; }
 .h-follow-box { border: 3px solid #e2e6ea; }
 .h-follow-box ul { margin: 0 -6px 60px 0;}
 .h-follow-box .item { float: left; width: 220px; margin: 0 8px; }
 .h-follow-box .avatar-sm { display: block; margin: 0 auto; margin-top: 45px; }
 .h-follow-box .name { display: block; margin: 6px 0 3px; font-size: 12px; color: #3498db; text-align: center; }
 .h-follow-box .intro { font-size: 12px; height: 36px; overflow: hidden; margin-bottom: 25px; color: #7f8c8d; text-align: center;}
 .h-follow-check { width: 70px; margin: 0 auto; }
 .h-follow-check .check { float: left; width: 12px; height: 12px; margin: 4px 10px; background-color: #fff; border: 1px solid #bac1c2; cursor: pointer; }
 .h-follow-check .check em { display: block; margin-left: -1px; background: url("../../img/home/h-check.png") no-repeat left top; width: 18px; height: 12px; }
 .h-follow-check p { float: left; font-size: 14px; color: #e67e22; font-weight: bold; }
 .h-follow-btn { width: 1174px;  border-top: 1px solid #e0e7eb;}
 .h-follow-btn a { display: block; width: 220px; height: 40px; margin: 20px auto 30px; font-size: 14px; color: #e67e22; line-height: 38px; text-align: center; border: 1px solid #e67e22; border-radius: 20px; }
 .h-novice { float: left; width: 280px; background-color: #fff; }
 .h-novice .cover { display: block; width: 280px; height: 210px; }
 .h-novice .info { padding: 15px; height: 92px; overflow: hidden; }
 .h-novice .info:before { content: ""; position: absolute; top: 195px; left: 20px; width: 0; height: 0;
 border-color: transparent transparent #fff transparent;
 border-style: solid;
 border-width: 0 15px 15px; }
 .h-novice .info h1 { max-height: 48px; overflow: hidden; font-size: 0;}
 .h-novice .info h1 a { display: inline-block; font-size: 16px; font-weight: bold; }
 .h-novice .info p.txt { height: 44px; margin-top: 5px; overflow: hidden; font-size: 14px; color: #7c7c7c; }
 .h-novice .author { padding: 0 15px; height: 88px; }
 .h-novice .author .avatar { width: 50px; height: 50px; margin-right: 10px; }
 .h-novice .author .name { margin-top: 5px; }
 .h-novice .author .name { font-size: 14px; font-weight: bold; }

 .h-novice-first { float: left; width: 334px; height: 624px; border: 3px solid #3498db; }
 .h-novice-first .cover { width: 334px; height: 134px; }
 .h-novice-first .list { padding: 12px 20px 0; }
 .h-novice-first .list li { }
 .h-novice-first .list li:before { content: ""; float: left; width: 6px; height: 6px; margin: 13px 0; background-color: #3498db; border-radius: 50%;}
 .h-novice-first .list li a { display: block; height: 32px; font-size: 14px; color: #7c7c7c; line-height: 32px; text-indent: 10px; }
 .h-novice-first .list li a:hover { color: #2980b9; }
 .h-novice-first .more { display: block; width: 100%; height: 50px; margin-top: 12px; font-size: 14px; color: #7c7c7c; line-height: 50px; text-indent: 40px; background-color: #ecf0f1; }

 .h-novice-tag { position: absolute; top: 3px; left: 0; height: 36px; line-height: 36px; font-size: 86px; color: #f39c12; }
 .h-novice-tag .txt { position: absolute; top: 0; left: 0; width: 75px; font-family: "Microsoft Yahei"; font-size: 16px; color: #fff; text-align: center;
 -webkit-text-stroke-width: initial;}
 .h-novice-tag.purple { color: #8e44ad; }
 .h-novice-big { height: 54px; line-height: 54px; font-size: 130px; color: #8e44ad;  }
 .h-novice-big .cont { position: absolute; top: 0; left: 0; }
 .h-novice-big .t1 { font-size: 20px; color: #fff; font-weight: bold; }
 .h-novice-big .t2 { font-size: 14px; color: #fff; font-weight: bold; font-style: italic; }
 .h-novice-big .t3 { font-size: 12px; color: #fff; font-style: italic;  }

 .h-novice-study { position: absolute; top: 3px; left: 0; width: 100px; height: 31px; padding: 31px 0 0 24px; background: url("../../img/home/h-novice-study.png") no-repeat left top; font-size: 14px; color: #fff; font-weight: bold; font-style: italic;}

 .h-tit { height: 42px; line-height: 42px;padding-bottom: 5px; }
 .h-tit a { float: left; height: 40px; margin-right: 25px; padding: 0 20px; font-size: 14px; color: #7c7c7c; line-height: 40px; text-align: center; transition: all 0s;}
 .h-tit a:hover { color: #3498db; }
 .h-tit a.on { border: 1px solid #3498db; border-radius: 20px; font-weight: bold; color: #3498db; }
 .h-tit2 { font-size: 14px; color: #34495e; height: 40px; line-height: 40px; margin: 28px 0 10px; }
 .h-article-list { width: 100%; }
 .h-article-list li { padding: 20px 0; border-bottom: 1px solid #e0e7eb; position: relative;}
 .h-article-list li.on h1 a{color:#2980b9}
 .h-article-list li.on{border-bottom:1px solid #fff;}
 .h-article-list li.oe{border-bottom:1px solid #fff;}
 .h-article-list li.on .shade{opacity: 1;transition:all .2s;}
 .h-article-list li .shade{opacity: 0; filter:alpha(opacity=0); position:absolute; z-index: 1; top:0px; right: -25px; bottom: 0; left: -23px; background-color: #fff; box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);transition:all .2s;}
 .h-article-list li .shade:after { content:""; position: absolute; top: -1px; right: -1px; bottom: -1px; left: -1px; border: 3px solid #3498db; }
 .h-article-list li .showd{position: relative;z-index: 2;}
 .h-article-list .cover { float: left; display: block; width: 160px; height: 120px; }
 
.h-article-list li .cover img {
-webkit-transform: scale(1);
-moz-transform: scale(1);
-ms-transform: scale(1);
transform: scale(1);
-webkit-transition: -webkit-transform 0.2s;
-moz-transition: -moz-transform 0.2s;
-ms-transition: -moz-transform 0.2s
transition: transform 0.2s;
}
.h-article-list li.on .cover img { 
-webkit-transform: scale(1.05);
-moz-transform: scale(1.05);
-ms-transform: scale(1.05);
transform: scale(1.05);}


 .h-article-info { position: relative; float: left; width: 640px; margin-left: 20px; }
 .h-article-info h1 { margin: 2px 0; }
 .h-article-info h1 span { float: left; display: block; max-width: 450px; font-size: 18px; font-weight: bold;}
 .h-article-info .tag { float: left; height: 25px; margin: 1px 5px 1px 0; padding: 0 10px; font-size: 12px; color: #fff; border-radius: 2px; line-height: 25px; }
 .h-article-info p { max-height: 44px; overflow: hidden; margin-top: 5px; color: #7f8c8d; }
 .h-article-info .avatar img { width: 20px; height: 20px; }
 .h-article-info .avatar .name { padding: 0 15px; vertical-align: middle; font-size: 12px; color: #394a58; font-weight: bold; line-height: 21px;}
 .h-article-info .avatar .name img{border-radius:0;}
 .h-article-info .avatar .name:after { content:""; float: right; height: 14px; margin: 3px 20px 3px 0; border-right: 1px solid #e0e7eb; }
 .h-article-info .data { position: absolute; top: 5px; right: 0; color: #bdbdbd; }
 .h-article-info .data i { margin-right: 10px; color: #bdbdbd; font-size: 14px;}

 .h-article-info .icon-certified2{font-size: 12px;color: #e74c3c;vertical-align: middle;line-height: 21px;}
 .h-list-more { display: block; margin: 0 auto; width: 220px; height: 40px; font-size: 14px; line-height: 40px; text-align: center;  border: 1px solid #bdc3c7; border-radius: 30px;margin-top: 24px; }
 .h-list-more:hover { border-color: #3498db; }
 .more-border { width: 100%; border-top: 1px solid #e0e7eb;   min-height: 90px!important;}

 .h-tit-aside { height: 40px; margin-bottom: 17px; font-size: 14px; color: #7c7c7c; line-height: 40px; }
 .h-aside-list { box-shadow: 0 1px 4px rgba(0,0,0,.5); }
 .h-aside-list li > a { display: block; width: 280px; height: 125px; }
 .h-aside-list .cover { width: 280px; height: 125px; }
 .h-aside-list + .more { display: block; margin: 0 auto; width: 43px; height: 36px; background: url("../../img/home/arrow3.png") no-repeat center top; font-size: 12px; color: #7f8c8d; text-align: center; line-height: 28px;}
 .h-aside-show { opacity: 0; visibility: hidden; padding: 18px 50px 18px 25px; position: absolute; top: 0; right: 0; bottom: 0; left: 0; background-color: rgba(0,0,0,.6); transition: all .3s;}
 .h-aside-show .item { position: absolute; font-size: 14px; color: #fff; }
 .h-aside-show .item:nth-child(1) { bottom: 18px;}
 .h-aside-show .item:nth-child(2) { bottom: 40px;}
 .h-aside-show .item:nth-child(3) { bottom: 62px;}
 .h-aside-show .item:nth-child(4) { bottom: 84px;}
 .h-aside-show .tip { position: absolute; right: 20px; bottom: 14px; font-size: 12px; color: rgba(255,255,255,.5); text-align: center; }
 .h-aside-show .tip .num { display: block; width: 34px; height: 38px; font-size: 44px; line-height: 38px; text-align: left; font-style: italic; font-weight: bold;  }
 .h-aside-show .tip .txt { font-size: 22px; font-weight: bold; }
 .h-aside-list li > a:hover .h-aside-show { opacity: 1; visibility: visible; }

 .h-member-btn { border-top: 1px solid #e0e7eb;}
 .h-member { width: 1200px; }
 .h-member li { float: left; width: 300px; padding-top: 20px; min-height: 82px; }
 .h-member li a.avatar-sm { float: left; margin-right: 10px; }
/*.h-member li a.avatar-sm img {
  -webkit-transition: -webkit-transform 0.3s;
  -moz-transition: -moz-transform 0.3s;
  -ms-transition: -moz-transform 0.3s
  transition: transform 0.3s;
}
.h-member li a.avatar-sm:hover img {
-webkit-transform: rotate(360deg);
-moz-transform: rotate(360deg);
-ms-transform: rotate(360deg);
transform: rotate(360deg);
}*/
.h-member .cont { float: left; width: 210px; }
.h-member .cont .user { font-weight: normal; }
.h-member .cont .user a { color: #3498db; font-size: 14px; }
.h-member .cont .user a i{color: #e74c3c;font-size: 12px;}
.h-member .cont .text { max-height: 40px; overflow: hidden; color: #7f8c8d; font-size: 14px; line-height: 20px; }
.h-member .cont .date { white-space: nowrap; overflow: hidden; color: #D9E1E5; font-size: 14px; line-height: 20px; color: #2c3e50; opacity: .3; filter:alpha(opacity=30); }
.h-member-box + .line { border-top: 1px solid #e0e7eb; margin-top: 5px; }

/*åˆä½œä¼™ä¼´*/
.h-partners .logo { margin: 0 -10px; }
.h-partners .logo li { float: left; }
.h-partners .logo li a { display: block; width: 150px; height: 50px; text-align: center; margin: 0 10px; }
.h-partners .text { margin: 20px -15px 40px; }
.h-partners .text li { float: left; }
.h-partners .text li a { display: block; font-size: 16px; margin: 0 15px; }

/*ä½œå“æ–‡ç« åˆ—è¡¨ç®€å•åˆ†é¡µ*/
.h_page { display: table; margin: 0 auto; width: auto; height: 40px; }
.h_page ul { }
.h_page ul li { float: left; }
.h_page ul li a { display: block; width: 40px; height: 40px; margin: 0 10px; border: 1px solid #bdc3c7; border-radius: 50%; font-size: 20px; color: #bdc3c7; text-align: center; line-height: 38px;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;}
  .h_page ul li a:hover,
.h_page ul li a.on { color: #2d3e4f; border-color: #2d3e4f; font-weight: bold; }
.h_page ul li:last-child a { line-height: 25px; }


/*
 *
 * è¯¦æƒ…é¡µ
 *
 */
 .works-main { /*margin-top: 30px;*/ background-color: #fff; box-shadow: 0 0 3px rgba(0,0,0,.1); }
 .works-top { padding: 20px;}
 .works-top .left h1 { height: 34px; }
 .works-top .left h1 strong { display: inline-block; max-width: 640px; white-space: nowrap; overflow: hidden; font-size: 20px; color: #2c3e50; font-weight: bold; height: 30px; }
 .works-top .left h1 .edit { margin-left: 10px; vertical-align: super; }
 .works-top .left { float: left; width: 700px; }
 .works-top .left .det { margin-top: 5px; font-size: 14px; height: 22px; line-height: 22px; }
 .works-top .left .det .tag { float: left; padding: 0 5px; height: 20px; font-size: 12px; color: #9aabbf; line-height: 20px; background-color: #dfe5e9; border-radius: 2px;}
 .works-top .left .det span { float: left; }
 .works-top .left .det .txt-gray1 { margin-left: 25px; }
 .works-top .left .det .time { margin-left: 20px; }
 .works-top .left .det .time i { float: left; height: 21px; line-height: 21px; margin-right: 5px; color: #9aabb8; }
 .works-top .left .det .time em { float: left; height: 21px; line-height: 21px; color: #9aabb8;}
 .works-top .left .det .disabled { color: #b8c4ce; cursor: not-allowed; }
 .works-top .left .det .disabled:hover { text-decoration: none; }
 .works-top { }
 .works-top { }
 .works-top { }

 .copyright { float: left; }
 .copyright i { font-size: 22px; cursor: pointer; }
 .copyright i.on { color: #3498db; }
 .copyright .text { opacity: 0; position: absolute; top: 25px; left: -78px; width: 180px; background-color: #3498db; color: #fff; padding: 10px 0; line-height: 14px; font-size: 14px; text-align: center; border-radius: 2px;
  -webkit-transition: all .5s;
  -moz-transition: all .5s;
  -ms-transition: all .5s;
  -o-transition: all .5s;
  transition: all .5s; }
  .copyright .text:before { content: ""; position: absolute; top: -6px; left: 50%; margin-left: -8px; border-color: transparent transparent #3498db transparent; border-style: solid; border-width:  0 7px 8px 7px; height: 0; width: 0;}
  .copyright i:hover + .text { opacity: 1; top: 30px;}

  .works-top .right { float: left; width: 200px; }
  .works-top .right h3 { position: absolute; right: 20px; margin-top: 3px; width: 500px; overflow: hidden; white-space: nowrap; text-align: right; }
  .works-top .right h3 a { font-size: 14px; color: #16a085; transition: all .2s;}
  .works-top .right h3 a:hover { text-decoration: underline; }
  .works-top .hot { text-align: right; margin-top: 15px; margin-right: 12px; height: 45px; }
  .works-top .hot i { font-size: 30px; color: #acbbc6; vertical-align: super; }
  .works-top .hot .num { font-size: 30px; color: #acbbc6; font-weight: bold; font-style: italic;}
  .works-top .hot .num em { font-size: 18px; font-style: italic;}
  .works-top .hot .num strong { position: absolute; right: 5px; top: 25px; font-size: 22px; }
  .works-top .tag-star { position: absolute; top: -6px; right: -6px; }
  /*åˆ é™¤ä½œå“æŒ‰é’®å¼¹å±‚*/
  .modal-delet{width: 700px;margin:0 auto;z-index: 101;text-align:center;}
  .modal-delet .icon-close{position: absolute;top:0;right: 0;width:60px;height: 60px;background-color: #e74c3c;font-size: 25px;color:rgba(255,255,255,0.5); line-height: 60px;text-align: center; }
  .modal-delet .title{width: 100%;height: 60px;line-height: 60px;text-align:left;border-bottom: 1px solid #e9ecee;padding-left:25px;box-sizing: border-box;font-size: 20px;color: #34495e;}
  .modal-delet .tip{padding-top: 20px;line-height: 30px;font-size:14px;color: #34495e; }
  .modal-delet .tip em{width: 95px;height: 30px;line-height:30px;font-size:16px;display: inline-block;margin:0 10px; color: #fff;font-weight: bold;background-color:#e74c3c;border-radius:30px;  }
  .modal-delet .tit{font-weight: bold;font-size: 20px;color: #e74c3c;padding-top:15px;}
  .modal-delet .sent{font-size: 15px;color: #34495e;padding-top: 10px;}
  .modal-delet .contents{padding-top: 10px;}
  .modal-delet .contents p{font-size: 14px;color: #34495e;padding-bottom:5px;}
  .modal-delet .contents p em{width:77px;display: inline-block;text-align: center; color:#e74c3c;font-weight: bold; }
  .modal-delet .still{width: 553px;height: 30px;display: inline-block;border-bottom:1px solid #ecf0f1;position: relative; }
  .modal-delet .still em{width: 180px;display: inline-block;text-align: center;background: #fff;height: 30px;line-height: 30px; font-weight: bold;font-size: 18px;color: #e74c3c;position: absolute;top:15px;left:50%;margin-left:-90px;z-index: 1;}
  .modal-delet .mobtn{padding-top:40px; padding-bottom: 30px;}
  .modal-delet .mobtn p{display: inline-block;}
  .modal-delet .mobtn a{width:220px;height: 70px;line-height: 70px;font-size: 18px;color: #fff; }
  .modal-delet .mobtn a.yes{background-color: #95a5a6;}
  .modal-delet .mobtn a.no{background-color: #e74c3c;margin-left: 80px;}
  
  /*ä½œå“å†…å®¹*/
  .works-cont { padding: 30px 20px  30px 20px; border-top: 1px solid #eff3f5;  border-bottom: 1px solid #eff3f5; }
  .works-cont p{font-size: 16px; line-height: 2;width: 600px;text-align: left !important;}

  .works-cont img { display: block !important;padding:0; margin: 0 0 20px 0; max-width: 900px; overflow: hidden;width: auto;height: auto;position: relative;left: 50%;transform: translateX(-50%); 
  -ms-transform: translateX(-50%);-moz-transform: translateX(-50%);-webkit-transform: translateX(-50%);-o-transform: translateX(-50%);}



  .works-cont .video-box { width: 720px; height: 540px; margin: 0 auto;}

  /*ä½œå“æ ‡ç­¾*/
  .works-tag { padding: 0 20px; }
  .works-tag li {display: inline-block; height: 20px; margin-right: 20px; margin-top: 10px; }
  .works-tag li i { padding-right: 5px; color: #b8c4ce; font-size: 14px; }
  .works-tag li span { color: #b8c4ce;}
  /*ä½œå“åˆ†äº«ã€ä¸‹è½½ã€ç‚¹èµž*/
  .works-bottom { width: 900px; height: 140px; padding: 0 20px; }
  .works-bottom .share {}
  .works-bottom .share { position: relative; float: left; margin-top: 32px; }
  .works-bottom .share > a { float: left; margin-right: 10px; }
  .works-bottom .share > a > i { display: inline-block; width: 40px; height: 40px; font-size: 24px; color: #34495e; text-align: center; line-height: 40px; background-color: #fff; border-radius: 50%; border: 1px solid #34495e;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;}
    .works-bottom .share > a > i.icon-huaban { font-size: 21px; }
    .works-bottom .share > a > i.icon-douban1 { font-size: 19px; }
    .works-bottom .share > a.on > .icon-weixin1 { background-color: #3fb743; color: #fff; border-color: #3fb743; }
    .works-bottom .share > a:hover > i { color: #fff;}
    .works-bottom .share > a:hover > .icon-sina { background-color: #EE4B4B; border-color: #EE4B4B;}
    .works-bottom .share > a:hover > .icon-weixin1 { background-color: #3fb743; border-color: #3fb743;}
    .works-bottom .share > a:hover > .icon-huaban { background-color: #EA5075; border-color: #EA5075;}
    .works-bottom .share > a:hover > .icon-douban1 { background-color: #1ABC9C; border-color: #1ABC9C;}
    .works-bottom .share .weixin-box { display: none; position: absolute; left: 5px; top: -160px; bottom: initial; width: 270px; padding: 18px; background-color: #fff; box-shadow: 0 0 5px rgba(0,0,0,.1); border-radius: 2px; }
    .works-bottom .share .weixin-box:before { content:""; width: 10px; height: 10px; position: absolute; left: 60px; bottom: -5px; background-color: #fff; box-shadow: 0 0 5px rgba(0,0,0,.1);
    -webkit-transform: rotate(45deg);
    -moz-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    -o-transform: rotate(45deg);
    transform: rotate(45deg);}
    .works-bottom .share .weixin-box img { float: left; width: 111px; height: 111px; position: relative; z-index: 1;}
    .works-bottom .share .weixin-box p { display: inline-block; width: 100px; margin-left: 15px; padding-top: 22px; font-size: 14px; position: relative; z-index: 1;}
    .works-bottom .share .weixin-box .icon-close { position: absolute; right: 8px; top: 8px; color: #34495e; z-index: 1; }
    /*ä½œå“ç‚¹èµž*/
    .works-zan { display: block; width: 190px; margin: 20px auto 0; }
    .works-zan .iconfont{background:url(../../img/bgz.png) no-repeat center;background: -webkit-image-set(url("../../img/bgz1.png") 1x,url("../../img/bgz2.png") 2x) no-repeat center top; background-size: 190px;width: 190px;height: 65px;display: inline-block;}
    /*.works-zan .iconfont{background:url(../../img/bg-blue.png) no-repeat 0 0; background-size: 190px;width: 190px;height: 66px;display: inline-block;}
    .works-zan .award{background:url(../../img/bg-green.png) no-repeat 0 0; background-size: 190px;width: 190px;height: 66px;display: inline-block;}*/
    .works-zan .cont { position: absolute; top: 0; left: 0; width: 190px; }
    .works-zan .cont i { float: left; margin-left: 32px; font-size: 30px; color: #fff; line-height: 66px; margin-top: -2px;}
    .works-zan .cont .txt { float: left; margin-left: 8px; font-family: "Microsoft Yahei"; font-size: 18px; color: #fff; line-height: 65px;
    -webkit-text-stroke-width: initial;}
    .works-zan .cont2 i { float: left; margin-left: 32px; font-size: 30px; color: #fff; line-height: 66px;margin-top: -4px; }
    .works-zan .cont2 .txt { float: left; margin-left: 8px; font-family: "Microsoft Yahei"; font-size: 18px; color: #fff; line-height: 65px;
    -webkit-text-stroke-width: initial;}
    .works-zan .cont .num { float: right; margin-right: 32px; font-size: 12px; color: rgba(255,255,255,.5); text-align: right; line-height: 65px; }

    /*ä½œå“ä¸‹è½½ã€æ”¶è—*/
    .works-bottom .oper { float: right; margin-top: 32px; }
    .works-bottom .oper li { float: left; margin-left: 20px; }
    .works-bottom .oper li a { display: block; width: 120px; height: 38px; font-size: 14px; color: #2c3e50; line-height: 38px; text-align: center; border-radius: 20px; border: 1px solid #4f5f6e; }
    .works-bottom .oper li a i { margin-right: 5px; font-size: 18px; color: #2c3e50; line-height: 35px; }
    .works-bottom .oper li a.on { color: #fcab2b; border-color: #fcab2b;}
    .works-bottom .oper li a.on i { color: #fcab2b; }
    .works-bottom .oper li a:hover { color: #3498db; border-color: #3498db;}
    .works-bottom .oper li a:hover i { color: #3498db; }
    .works-bottom .tip { font-size: 12px; color: #9dacb9; line-height: 28px; }

    /*ä½œå“ä½œè€…ä¿¡æ¯*/
    .works-author { width: 900px; padding: 20px 20px; background-color: #f6f9fa; border-top: 1px solid #eff3f5; border-bottom: 1px solid #eff3f5;}
    .works-author .avatar-md { margin: 10px 0; }
    .works-author .info { display: table;  width: 245px; overflow: hidden; margin: 10px 15px; }
    .works-author .info > div { display: table-cell; vertical-align: middle; height: 100px; }
    .works-author .info h1 { height: 30px; line-height: 30px; }
    .works-author .info .name { display: inline-block; width: 245px; font-size: 20px; color: #2c3e50; font-weight: bold; }
    .works-author .info .name i{font-size: 14px;color: #e74c3c;}
    .works-author .info .name:hover { color: #3498db; }
    .works-author .info .intro { width: 245px; color: #bdc3c7; }
    .works-author .info .num { width: 245px; color: #34495e; }
    .works-author .info .medal img { width: 26px; height: 26px; }

    /*å…³æ³¨ã€ç§ä¿¡æŒ‰é’®ç»„*/
    .works-author .btn-group { float: left; width: 90px; padding: 40px 0; }
    .works-author .btn-group .btn-item { float: left; width: 88px; height: 28px; margin: 5px 0; border: 1px solid #bdc3c7; border-radius: 20px; font-size: 12px; color: #34495e; line-height: 28px; text-align: center; }
    .works-author .btn-group .btn-item i { margin-right: 5px; font-size: 14px; color: #34495e; }
    .works-author .btn-group .btn-item i.icon-add-bold,
    .works-author .btn-group .btn-item i.icon-close-bold { font-size: 12px; }
    .works-author .btn-group .btn-item:hover { color: #3498db; border-color: #3498db;}
    .works-author .btn-group .btn-item:hover i { color: #3498db; }

.myfollow i:before { content: "\e6cf"; }
.havefollow i:before { content: "\e6d1"; }
.unfollow i:before { content: "\e6d0"; }
.mutualfollow i:before { content: "\e6d2"; }

.works-author .more { float: right; width: 340px; }
.works-author .more .item { float: right; width: 160px; height: 120px; margin-left: 10px; }
.works-author .more .item:hover { opacity: .9; }

.works-nothing { display: block; width: 160px; margin: 0 auto; }
.works-nothing img { display: block; width: 108px; height: 65px; margin: 10px auto 0; }
.works-nothing span { display: block; font-size: 14px; color: #bdc3c7; text-align: center; line-height: 16px; margin-top: -5px; }
.works-nothing strong { display: block; font-size: 17px; color: #bdc3c7; text-align: center; line-height: 18px; font-weight: bold; }
.comment-login-box { margin: 20px; }
.comment-login { width: 100%; height: 86px; padding: 22px 30px; background-color: #fff7e7; border: 1px solid #ded6c5;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;}
  .comment-login p { float: left; font-size:14px; color: #6b3612; line-height: 40px; }
  .comment-login .btn { border-radius: 0; }
  /* è¯„è®ºè¾“å…¥æ¡† */
  .comment-form { margin: 20px; }
  .comment-form textarea { width: 100%; height: 115px; padding: 18px; color: #6d6d6d; margin: 0; font-size: 14px;  border: 1px solid #e4e9ed;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;}
    .comment-form textarea:focus { border: 1px solid #3da2e3; }
    .comment-warn { position: absolute; right: 15px; top: 85px; font-size: 12px; color: #bdc3c7; }
    .comment-warn span { color: #f39c12; font-weight: bold; }
    .comment-tip { margin-right: 15px; font-size: 14px; color: #bdc3c7; line-height: 40px; }
    .comment-form .btn { padding: 0; border-radius: 0; width: 100px; height: 40px; line-height: 40px; }

    .comment-form-inner { margin: 20px -70px 0 0; }
    /*éªŒè¯ç */
    .comment-code { width: 148px; height: 40px; overflow: hidden; }
    /*.comment-code img { width: 100%; height: 100%; }*/
    .comment-code-input { width: 100px; height: 28px; margin-left: 15px; margin-right: 10px; border: 1px solid #ccc;padding: 5px 10px;font-size: 14px; }
    .comment-code-input:focus { border-color: #3da2e3;}

    /*ç²¾å½©è¯„è®º*/
    .comment-main .tag { position: absolute; top: 45px; right: -5px; background: url("../../img/home/ribbon.png") no-repeat; width: 61px; height: 28px; font-size: 12px; color: #fff; text-indent: 20px; line-height: 20px; }
    .comment-main + .all { position: relative; margin: 20px 0; border-top: 1px solid #eff3f5; clear: both;}
    .comment-main + .all:before { content: "å…¨éƒ¨è¯„è®º"; font-family: "Microsoft Yahei"; position: absolute; top: -14px; left: 50%; margin-left: -50px; width: 100px; background-color: #fff; font-size: 16px; color: #9dacb9; text-align: center; }
    /*è¯„è®ºåˆ—è¡¨*/
    .comment-main {}
    .comment-main > li { position: relative; min-height: 90px; padding: 20px 0; transition: all .2s;}
    .comment-main > li:hover { background-color: #f6f9fa; }
  .comment-num { position: relative; float: left; width: 43px; height: 73px; margin: 0 20px 0 42px; /*overflow: hidden;*/ }
  .comment-num i { float: left; position: relative; font-size: 43px; color: #eff3f5; cursor: pointer; overflow: hidden;
  /*color: #fff; */}
  /*  ç²¾å½©è¯„è®º top ç‚¹èµžup åå¯¹down  */
  .comment-num .top .num { top: 17px; }
  .comment-num .top { cursor: default; }
  .comment-num .up { height: 43px; }
  .comment-num .down { height: 24px; margin-top: 6px; }
  .comment-num .up:after,
  .comment-num .down:after { content:""; position: absolute; border-style: solid; transition: all .2s;}
  .comment-num .up:after { top: 10px; left: 15px; border-color: transparent transparent #bdc3c7 transparent; border-width: 0 6px 6px 6px; }
  .comment-num .down:after { top: 7px; left: 15px; border-color: #bdc3c7 transparent transparent transparent; border-width: 6px 6px 0 6px;}
  .comment-num .num { position: absolute; top: 24px; left: 0; width: 43px; font-size: 12px; color: #bdc3c7; text-align: center; }

  .comment-num .up:hover:after { border-bottom-color: #3498db;}
  .comment-num .down:hover:after { border-top-color: #3498db;}
  .comment-num .up:hover .num { color: #3498db; }

  .comment-num i.on { color: #3498db; }
  .comment-num .up.on:after { border-bottom-color: #fff; }
  .comment-num .down.on:after { border-top-color: #fff; }
  .comment-num .on:hover .num,
  .comment-num .on .num { color: #fff; }

  .comment-num-down { position: absolute; top: 75px; left: 0; width: 43px; font-size: 12px; color: #e74c3c; text-align: center; opacity: 0;

  }
  .comment-num-down.on {
    -webkit-animation: oppose 1s linear;
    -moz-animation: oppose 1s linear;
    -o-animation: oppose 1s linear;
    animation: oppose 1s linear;
  }
  @-webkit-keyframes oppose
  {
    0% {opacity: 0; top: 60px;}
    70% {opacity: 1; top: 75px;
      -webkit-transform: scale(1.2);
      transform: scale(1.2);
    }
    100% {opacity: 0; top: 75px;}
  }
  @-moz-keyframes oppose
  {
    0% {opacity: 0; top: 60px;}
    70% {opacity: 1; top: 75px;}
    100% {opacity: 0; top: 75px;}
  }
  @-o-keyframes oppose
  {
    0% {opacity: 0; top: 60px;}
    70% {opacity: 1; top: 75px;}
    100% {opacity: 0; top: 75px;}
  }
  @keyframes oppose
  {
    0% {opacity: 0; top: 60px;}
    70% {opacity: 1; top: 75px;}
    100% {opacity: 0; top: 75px;}
  }

  .comment-cont { float: left; width: 670px; margin-left: 20px; }
  .comment-cont .user { margin-bottom: 2px; }
  .comment-cont .user a { font-size: 14px; color: #95a5a6; font-weight: bold;}
  .comment-cont .user a:hover { color: #3498db; text-decoration: underline; }
  .comment-cont .user time { margin-left: 15px; font-size: 12px; color: #bdbdbd; }
  .comment-cont .text { font-size: 16px; color: #34495e; line-height: 26px;overflow: hidden; }
  .comment-cont .retext { border-left: 3px solid #3498db; padding-left: 12px;}
  .comment-cont .retext p { font-size: 14px; color: #bdc3c7;overflow: hidden; }

  .comment-cont .oper { margin-top: 15px; height: 30px; line-height: 30px; }
  .comment-cont .oper a { float: left; padding: 0 22px; font-size: 12px; color: #34495e; }
  .comment-cont .oper a.comment-toggle {  line-height: 28px; }
  .comment-cont .oper a.p-replay{padding-left:0;}
  .comment-cont .oper a.comment-toggle i { display: inline-block; margin-right: 5px; color:  #34495e; line-height: 30px; float: left; }
  .comment-cont .oper a:hover,
  .comment-cont .oper a:hover i { color: #3498db; border-color: #3498db;}
  .comment-cont .oper-hide { display: none; }
  .comment-cont .oper:hover .oper-hide { display: block; }


  /*è¯¦æƒ…é¡µè¯„è®º*/
  /*.works-comment { padding: 20px; }*/


  /*å³ä¾§æ»‘åŠ¨*/
  #portamento_container { float: right; position: relative; }
  #portamento_container #sidebar {float:none; position:absolute;}
  #portamento_container #sidebar.fixed { position:fixed; }

  /*ä½œå“è¯¦æƒ…é¡µä¾§è¾¹æ */
  .works-author-aside .info { width: 150px; margin-left: 10px; }
  .works-author-aside .info h1 { height: 22px; line-height: 22px; }
  .works-author-aside .info .name { display: inline-block; font-size: 16px; color: #2c3e50; font-weight: bold; line-height: 22px; }
  .works-author-aside .info .name:hover{}
  .works-author-aside .info .intro { font-size: 14px; color: #bdc3c7; line-height: 20px; }
  .works-author-aside .btn-group { }
  .works-author-aside .btn-item { float: left; margin-right: 10px; font-size: 12px; color: #34495e; }
  .works-author-aside .btn-item i { margin-right: 5px; font-size: 14px; color: #34495e;}
  .works-author-aside .btn-item i.icon-add-bold,
  .works-author-aside .btn-item i.icon-close-bold { font-size: 12px; }
  .works-author-aside .btn-item:hover { color: #3498db; }
  .works-author-aside .btn-item:hover i { color: #3498db; }
/*å…³æ³¨.icon-add-bold:before { content: "\e66e"; }
å·²å…³æ³¨.icon-ok-sign:before { content: "\e627"; }
ç›¸äº’å…³æ³¨.icon-relating-bold:before { content: "\e670"; }
å–æ¶ˆå…³æ³¨.icon-close-bold:before { content: "\e66c"; }*/

/*æ›´å¤šä½œå“æŽ¨è*/
.works-look-aside  {}
.works-look-aside h3 { margin-top: 20px; font-size: 14px; color: #9dacb9; line-height: 26px; }
.works-look-aside h3 .more { float: right; font-size: 12px; color: #acbbc6; }
.works-look-aside>li { float: left; position: relative; }
.works-look-aside>li>a { display: block; width: 110px; height: 83px; overflow: hidden; }


/*.works-look-aside .overlay { visibility: hidden; opacity: 0; position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(255,255,255,.5); transition: all .2s;}
.works-look-aside li a:hover .overlay { visibility: visible; opacity: 1; }
.works-look-aside .overlay i { font-size: 50px; color: #34495e; line-height: 83px; }
.works-look-aside .overlay span {display: block; text-align: center; font-size: 14px; color: #34495e; line-height: 83px; }*/

/*å¿«æ·ç‚¹èµžè¯„è®º*/
.works-oper-aside { margin-top: 20px; }
.works-oper-aside .hexagon-btn { position: relative; float: left; overflow: hidden; width: 100px; height: 40px; }
.works-oper-aside .hexagon-btn i { font-size: 100px; line-height: 40px; color: #bdc3c7; transition: color .2s;}
.works-oper-aside .hexagon-btn .text { position: absolute; top: 0; left: 0; width: 100px; height: 40px; line-height: 40px; font-family: "Microsoft Yahei"; font-size: 14px; text-align: center; color: #34495e; transition: color .2s;}
.works-oper-aside .hexagon-btn:hover i { color: #44a0dd;}
.works-oper-aside .hexagon-btn:hover .text { color: #44a0dd;}

.comment-quick { /*position: absolute; top: 65px; left: 0;*/ z-index: 1;display: none; margin-top: 50px;
 /* opacity: 0; visibility: hidden; */
/*    -webkit-transform: scale(0,0);
       -moz-transform: scale(0,0);
        -ms-transform: scale(0,0);
         -o-transform: scale(0,0);
            transform: scale(0,0);
    -webkit-transform-origin: 80% -50px;
       -moz-transform-origin: 80% -50px;
        -ms-transform-origin: 80% -50px;
         -o-transform-origin: 80% -50px;
            transform-origin: 80% -50px;
    -webkit-transition: all .5s;
       -moz-transition: all .5s;
        -ms-transition: all .5s;
         -o-transition: all .5s;
       transition: all .5s;*/ }
/*.comment-quick.open { opacity: 1; visibility: visible; display: block;
    -webkit-transform: scale(1,1);
       -moz-transform: scale(1,1);
        -ms-transform: scale(1,1);
         -o-transform: scale(1,1);
            transform: scale(1,1);
    -webkit-transform-origin: 80% -50px;
       -moz-transform-origin: 80% -50px;
        -ms-transform-origin: 80% -50px;
         -o-transform-origin: 80% -50px;
         transform-origin: 80% -50px;}*/
         .comment-quick textarea { width: 198px; height: 80px; padding: 10px; color: #6d6d6d; font-size: 14px;}
         .comment-quick .btn { border-radius: 0; margin-top: 5px; padding: 0; width: 80px; height: 30px; line-height: 30px;}

         /*æŽ¨èå¼¹å‡ºæ¡†*/
         .modal-recommend { position: relative; width: 412px; margin: 0 auto; z-index: 101; height: 100px; padding: 15px 30px 30px; background-color: #fff; }
         .modal-recommend .icon-close { position: absolute; top: 20px; right: 20px; font-size: 18px; color: #e4e9ed; cursor: pointer; }
         .modal-recommend .popup-info h2 { margin-bottom: 10px; font-size: 24px; color: #2c3e50; text-indent: -10px; }
         .modal-recommend .btn { width: 100px; height: 40px; border-radius: 0; }
         .btn-level-1 { color: #fff; background-color: #e74c3c; }
         .btn-level-1:hover{ color: #fff; background-color: #D73C2C; }
         .btn-level-1:active{ background-color: #C72C1C; }
         .btn-level-2 { color: #fff; background-color: #f18c14; }
         .btn-level-2:hover{ color: #fff; background-color: #E17C04; }
         .btn-level-2:active{ background-color: #D16BF4; }
         .btn-level-3 { color: #fff; background-color: #f3bf21; }
         .btn-level-3:hover{ color: #fff; background-color: #E3AF11; }
         .btn-level-3:active{ background-color: #D39F01; }
         
         /*ç§ä¿¡ä¸¾æŠ¥å¼¹å‡ºæ¡†*/
         .modal-letter { position: relative; width: 640px; margin: 0 auto; z-index: 101; height: 215px; padding: 15px 30px 30px; background-color: #fff; }
         .modal-letter .icon-close { position: absolute; top: 20px; right: 20px; font-size: 18px; color: #e4e9ed; cursor: pointer; }
         .modal-letter .popup-info h2 { margin-bottom: 10px; font-size: 24px; color: #2c3e50; text-indent: -10px; }
         .modal-letter .popup-info h2 a { color: #2f99de; }
         .modal-letter .popup-info label { margin-right: 28px; font-size: 14px; color: #7f8c8d; }
         .modal-letter .popup-info label input { margin-right: 5px; }
         .modal-letter .popup-text { width: 628px; height: 93px; padding: 10px 5px; font-size: 12px; color: #bdc3c7; }
         .modal-letter .popup-text-let { height: 60px; margin-top: 10px; }
         .modal-letter .btn { width: 100px; height: 40px; border-radius: 0; }
         .modal-letter .tip { display: inline-block; margin-right: 10px; font-size: 12px; color: #bdc3c7; line-height: 40px; }
              /* ç§ä¿¡æ·»åŠ å­—æ•°é™åˆ¶æé†’ 20160302 */
              #textarea-letter + .word-warn {  position: absolute; top: auto; right: auto; bottom: -25px; left: 0; 
                font-size: 12px; color: #bdc3c7;}
              #textarea-letter + .word-warn span { color: #f39c12; font-weight: bold; }
         /*è¡¨æƒ…æ¡†*/
         .uiem-btn { z-index: 2; position: relative; width: 77px; height: 40px; font-size: 12px; color: #3499da; line-height: 40px; cursor: pointer; }
         .uiem-btn .icon-face { float: left; margin-left: 15px; line-height: 40px; margin-right: 3px; font-size: 18px; color: #3499da; }
         .uiem-box { z-index: 1; display: block; position: absolute; top: 0; left: 0; width: 344px; height: auto; background-color: #fff; border: 1px solid #e6eaee; box-shadow: 0 0 8px rgba(0,0,0,.15); }
         .uiem-nav { width: 100%; height: 35px; border-bottom: 1px solid #e6eaee; }
         .uiem-cont { margin: 12px;  padding: 1px 0 0 1px; }
         .uiem-cont li { float: left; width: 22px; height: 22px; padding: 3px; margin: -1px 0 0 -1px; border: 1px solid #ececec; cursor: pointer; }
         .uiem-cont li img { width: 22px; height: 22px; }
         .uiem-cont li:hover,
         .uiem-cont li.on { position: relative; z-index:2; list-style: none outside none; border-color: #aec9e8; background-color: #e4eef9; border-radius: 2px;}

         /*ä¿®æ”¹è¯¦æƒ…é¡µè·Ÿéšæ»šåŠ¨æ·»åŠ æ ·å¼*/
         /*å›ºå®šé¡¶éƒ¨æ ·å¼*/
         .fixed{position: fixed!important;top:0!important;}
         .fixed1{position: fixed!important;top:20px!important;}
         /*è¯¦æƒ…é¡µ*/
         .uptop{width: 220px;height: 50px;display: none;}
         .works-author-aside{position: absolute;top:0;}
         /*  æ–°è¯¦æƒ…é¡µæ ·å¼*/
         .zbd_warp{width: 220px;overflow-x: hidden;background:#fff;text-align: center;box-shadow: 0 0 3px rgba(0,0,0,.1);overflow-y: hidden; }
         .Occupying{width:220px;height:87px;display: block;}
         .zbd_warp .zbd_portrait a{display:inline-block;margin-top:30px; width:100px;height: 100px;background:#eee;border-radius: 50%;overflow: hidden; }
          .zbd_warp .zbd_portrait a img{width: 100%;height: 100%;}
         .zbd_warp .zbd_name{font-size: 16px;color: #34495e;font-weight: bold;margin-top: 5px;}
         .zbd_warp .zbd_name i{color: #e74c3c;font-size: 14px;}
         /*.zbd_warp .zbd_name a{margin-left:14px; }*/
         .zbd_warp .zbd_name a:hover{color: #34495e; }
         .zbd_warp .zbd_introduce {font-size: 13px;color:#b4bbc0;width: 180px;/*height: 20px;*/overflow-y: hidden; overflow-x: hidden;  padding: 0 20px 0 20px;  text-overflow: ellipsis;white-space: nowrap;}
         .zbd_warp .zbd_introduce a:hover{color:#b4bbc0;}
         .zbd_warp .zbd_medal{margin-top: 7px;}
         .zbd_warp .zbd_medal img{width: 27px;height: 27px;}
         .zbd_warp .zbd_foot{position: absolute;bottom: 0;left:0;}
         .zbd_warp .zbd_foot a{display:block;width:49.7%;height:55px;border: 1px solid #eff3f5;border-left:none;border-bottom:none; background-color: #f8f8f8; text-align: center;}
         .zbd_warp .zbd_foot .zbd_right{border-right: none;}
         .zbd_warp .zbd_foot a b{margin-top: -2px; overflow: hidden;  display:block;color: #34495e;font-size: 20px;font-weight: bold;width:109.5px;text-align: center;}
         .zbd_warp .zbd_foot a em{  color: #acbbc6;font-size: 12px;width: 109.5px;display:block;padding-top: 5px;text-align: center;}
         /*åŠ å…³æ³¨*/
         .zbd_focus{display:inline-block;width:38px;height: 38px; position: absolute;left: 50%;margin-left:-19px;bottom:36px;z-index: 6;text-align: center;line-height:38px; }
         .z_green:before{color: #1abc9c!important;}/*å…³æ³¨*/
         .z_red:before{color: #e74c3c!important;}/*å–æ¶ˆå…³æ³¨*/
         .z_orange:before{color:#e67e22!important;}/*äº’ç›¸å…³æ³¨*/
         .z_blue:before{color: #3498db !important;}/*åŠ å…³æ³¨*/
         .zbd_focus .iconfont{display: block;height: 42px;width: 42px;line-height: 42px;}
         .zbd_focus .iconfont:before { content: "\e647"; font-size:42px; line-height: 42px; color: #3498db; }
         
         .zbd_focus .icon-add-bold,.zbd_focus .icon-ok-sign,.zbd_focus .icon-relating-bold,.zbd_focus .icon-close-bold{color:#fff;font-size: 15px;position: relative;bottom: 52px;z-index: 10;}
         /*ç‚¹èµžè¯„è®º*/
         .zbd_comments{width: 220px;height: 50px;margin-top: 10px;background-color: #fff;box-shadow: 0 0 3px rgba(0,0,0,.1); }
         .zbd_comments a{display:block;width:49.7%;background-color: #fff; text-align: center;color: #acbbc6;font-size: 12px;border-bottom: 1px solid #fff}
/*         .zbd_comments .zbd_two:hover{color:#34495e;}*/
         .zbd_comments a em{color:#34495e;}
         .zbd_comments .zbd{color:#34495e; }
         .zbd_comments .zbd em{font-weight:bold;}
         .zbd_comments a em{margin-top: -2px; overflow: hidden;font-size: 16px;height: 20px;  width:99%;display: block;}
         .zbd_comments a b{width: 109.5px;display: block;padding-top: 5px}
         .zbd_comments .zbd_one{height: 49px; border-right:1px solid #eff3f5;position: relative;z-index: 6;}
         .zbd_comments .zbd_one i{display:inline-block;*display:inline;*zoom:1;}
         .zbd_txt::-webkit-input-placeholder {font-size: 14px;}
         .zbd_txt::-moz-input-placeholder {font-size: 14px;}
         /* .zbd_comments .zbd_one:before {content: "";position: absolute;left: -12px;top: 15px;border: solid transparent;border-right-color: #fff;border-width: 10px 12px 10px 0px;z-index: 5;}*/
         /*å°ä¸‰è§’*/
         .arrow-shadow{position: absolute;top:15px;left: -5px;z-index:3;background-color:#fff;width: 20px;height: 20px;box-shadow: 0 0 3px rgba(0,0,0,.1);
          transform:rotate(45deg);
          -ms-transform:rotate(45deg);   /* IE 9 */
          -moz-transform:rotate(45deg);  /* Firefox */
          -webkit-transform:rotate(45deg); /* Safari å’Œ Chrome */
          -o-transform:rotate(45deg);}

         .zbd_write{height: 150px;width: 220px;background-color: #fff;display:none;box-shadow: 0 3px 3px rgba(0,0,0,.1);}
         .zbd_write .zbd_txt{width: 200px;height: 90px;border: none;padding: 10px;}
         .zbd_write .zbd_txt:focus{box-shadow: none;}
         .zbd_write .zbd_btn{position: absolute;bottom: 0;left:0; width: 220px;height: 40px;text-align: center;color: #fff;background-color: #3498db;font-size: 14px;}
         /*è¯„è®ºæœ€åº•éƒ¨*/
         .zbd_item{margin-bottom: 30px;}
  .zbd_center{}
  .zbd_center .rele .img{width: 220px;height: 165px;overflow: hidden;}
  .zbd_center .rele .img>a{display:block;position: relative;width: 220px;height: 165px;}
  .zbd_center .rele .img>a img{width: 100%;height: 100%;}
  .zbd_center .rele .img>a .h-aside-show{text-align:center;display: table;width:186px;height: 100%;padding: 0 17px;}
  .zbd_center .rele .img>a .h-aside-show p{ display: table-cell;vertical-align: middle; width: 186px;height: 84px; text-align: center;color: #fff;font-size: 18px;overflow: hidden;}
  .zbd_center .rele .img>a:hover .h-aside-show { opacity: 1; visibility: visible; }
    /* æ–‡ç« åˆ—è¡¨*/
  .zbd_center .article{}
  .zbd_center .article h3{margin-top: 15px;}
  .zbd_center .article h3 em{cursor: pointer;color: #3498db;font-size: 12px;}
  .zbd_center .article h3 em i{font-size: 14px;color: #3498db;padding-right: 5px;height: 26px;line-height: 26px;}
  
  .zbd_center .article .cont{box-shadow: 0 0 3px rgba(0,0,0,.1);}
  .zbd_center .article .cont .top{width: 205px; background: #fff;border-bottom: 1px solid #eff3f5;padding: 10px 0 10px 15px;}
  .zbd_center .article .cont .top .img{margin-top: 4px; width:70px;height: 52px;overflow: hidden;margin-right:10px;}
  .zbd_center .article .cont .top .img img{width:100%;height:100%;}
  .zbd_center .article .cont .top .tit .h1{font-size: 12px;color: #2c3e50;width: 110px;height:32px;overflow: hidden;line-height: 1.5; padding-bottom: 7px; }
  .zbd_center .article .cont .top .tit .time{ color: #2c3e50;opacity: 0.5;font-size: 12px;}
  
  .zbd_center .article .cont .down{background: #f8f8f8;padding:10px 10px 3px 15px;}
  .zbd_center .article .cont .down>ul>li{padding-bottom: 10px;}
  .zbd_center .article .cont .down>ul>li>i{color:#2c3e50;font-size: 12px;}
  .zbd_center .article .cont .down>ul>li>a{color:#2c3e50;font-size: 12px;margin-left: 5px;width: 175px;}
  .zbd_center .article .cont .down>ul>li:hover>i{color:#3498db;} 
  .zbd_center .article .cont .down>ul>li:hover>a{color:#3498db;text-decoration:underline;} 
.hmember {
  margin-left: -20px; margin-top: 20px;
}
.hmember li {
  float: left; width: 580px; margin-left: 20px;
}
.hmember .cover {
  display: block;
  width: 280px; height: 210px;
}
.hmember .info {
  width: 270px; height: 183px; padding: 27px 30px 0 0;
  background-color: #fff; 
}
.hmember .info .ribbon {
  position: absolute; right: 5px; top: -5px;
  background: url("../img/ribbon_blue.svg") no-repeat center center;
  background-size: 55px; width: 35px; height: 55px;
}
.hmember .author {
  width: 240px; padding-left: 30px;
}
.hmember .avatar {
  display: block; width: 100px; height: 100px; margin-right: 20px;
}
.hmember .intro {
  display: table;
}
.hmember .intro > div {
  display: table-cell; vertical-align: middle; height: 100px;
}
.hmember .intro .name {
  font-size: 16px; color: #34495e; line-height: 24px; width: 120px;
}
.hmember .intro .txt {
  font-size: 14px; color: #b4bbc0; line-height: 22px; width: 120px;
}
.hmember .intro .medal {
  width: 120px;
}
.hmember .num {
  width: 300px; background-color: #f8f8f8; margin-top: 27px; height: 55px;
  border-top: 1px solid #eff3f5;
} 
.hmember .num .item {
  float: left;
  width: 99px; border-left: 1px solid #eff3f5; text-align: center;
}  
.hmember .num .item span {
  display: block; padding-top: 5px;
  font-size: 12px; color: #acbbc6; line-height: 18px;
}
.hmember .num .item strong {
  display: block; padding-bottom: 3px;
  font-size: 20px; color: #34495e; line-height: 30px; font-weight: bold;
}
.cert{color: #e74c3c;font-size: 12px;}
.cert1{color: #e74c3c;font-size: 14px;}
.cert1{color: #e74c3c;font-size: 16px;}
.mar2{margin-left: 2px;}
.certg{color:#b8c4ce!important;}
.rote180{
  transform:rotate(180deg);
  -ms-transform:rotate(180deg); /* Internet Explorer */
  -moz-transform:rotate(180deg); /* Firefox */
  -webkit-transform:rotate(180deg); /* Safari å’Œ Chrome */
  -o-transform:rotate(180deg); /* Opera */
  display: inline-block;
}

 .modal-pay { position: relative; width: 425px; margin: 0 auto; z-index: 101;  padding: 40px 60px; background-color: #fff; }
 .modal-pay .icon-close { position: absolute; top: 15px; right: 15px; font-size: 28px; color: #e4e9ed; cursor: pointer; }
 .modal-pay p:nth-of-type(1){font-size: 20px;margin-left: 2px;color: #000000;font-weight: bold;}
 .modal-pay p:nth-of-type(2){font-size: 16px;margin-left: 2px;color: #95a5a6;}
 .modal-pay p:nth-of-type(3){font-size: 14px;margin-left: 2px;color: #95a5a6;text-align: center;}
 .modal-pay .mtm{padding: 26px 0 22px 0;}
 
 
 /*ä½œå“å±•ç¤º*/
.post-works { margin-left: -20px; }
.post-works li { width: 280px; margin-left: 20px; }
.post-works .cover a { display: block; width: 280px; height: 210px; overflow: hidden; }

/*å…±ç”¨æ ·å¼*/
.post li { position: relative; float: left; margin-bottom: 15px; }
/*æ»‘è¿‡é˜´å½±*/
.post .shade { opacity: 0; filter:alpha(opacity=0); position: absolute; z-index: 1; top: -16px; right: -14px; bottom: 0; left: -14px; background-color: #fff; box-shadow: 0 0 12px rgba(0, 0, 0, 0.1); }
.post .shade:after { content:""; position: absolute; top: -1px; right: -1px; bottom: -1px; left: -1px; border: 1px solid rgba(0, 0, 0, 0.05); }
/*ä½œå“å°é¢*/
.post .cover { position: relative; z-index: 2; }
.post li .cover img {
-webkit-transform: scale(1);
-moz-transform: scale(1);
-ms-transform: scale(1);
transform: scale(1);
-webkit-transition: -webkit-transform 0.2s;
-moz-transition: -moz-transform 0.2s;
-ms-transition: -moz-transform 0.2s
transition: transform 0.2s;
}
.post li:hover .cover img { 
-webkit-transform: scale(1.05);
-moz-transform: scale(1.05);
-ms-transform: scale(1.05);
transform: scale(1.05);}
/*ä½œå“ä¿¡æ¯*/
.post .info { position: relative; z-index: 2; padding: 5px 0 20px 0; height: 75px; overflow: hidden; }
/*ä½œå“æ ‡é¢˜*/
.post .info .title { width: 100%; font-weight: bold; color: #34495e; }
	/*ä¸‹è½½*/
.post .info .title.download { max-width: 217px; }
.post .info .title.download + .i-rar { position: absolute;text-align: center;border-radius: 20px; right: 6px; top: 7px; height: 20px;line-height: 20px;width: 50px; /*padding: 0 2px;*/ font-size: 12px; color: #fff;  background-color: #9aabb8; }
.post .info .title.download + .i-rar:after,
/*.post .info .title.download + .i-rar:before { content:""; width: 0; height: 0; position: absolute; border-style: solid; }
.post .info .title.download + .i-rar:before { top: 0; left: -6px; border-color: transparent #7f8c8d transparent transparent; border-width: 9px 6px 9px 0; }
.post .info .title.download + .i-rar:after { top: 0; right: -6px; border-color: transparent transparent transparent #7f8c8d; border-width: 9px 0 9px 6px; }*/
	/*åˆ†ç±»*/
.post .info .classify { float: left; height: 20px; margin-right: 10px; padding: 0 5px; font-size: 12px; color: #9aabb8; line-height: 19px; text-align: center; background-color: #dfe5e9; border-radius: 3px; }
/*æŸ¥çœ‹ã€è¯„è®ºã€ç‚¹èµžæ•°é‡*/
.post .info .msg { height: 21px; overflow: hidden; }
.post .info .msg span { margin-right: 10px; display: inline-block;}
.post .info .msg span i { font-size: 18px; color: #9aabb8; margin-right: 5px; display: inline-block; line-height: 21px; vertical-align: middle; }
.post .info .msg span em { font-size: 14px; color: #9aabb8; display: inline-block; line-height: 21px; vertical-align: middle; }
.post .info .msg .slogan { height: 21px; line-height: 21px; font-size: 12px; }
/*ç”¨æˆ·ä¿¡æ¯*/
.post .info .user { margin-top: 7px; }
.post .info .user.on a { color: #3498db; }
.post .info .user a { display: block; height: 20px; line-height: 20px;}
.post .info .user a img { float: left; width: 20px; height: 20px; border-radius: 50%; }
.post .info .user a .name { float: left; margin-left: 10px; font-size: 12px;display: inline-block;display: flex;align-items: center;}
.post .info .user a .name em{float: left;margin-right: 3px;}
.post .info .user a .name i{margin-right: 3px;}
.post .info .user a .name img{width: 14px;height: 14px;margin-top: -2px;float: none;border-radius: 0;}
/*åº•çº¿*/
.post .line { width: 100%; height: 1px; background: #e2e8eb; position: absolute; bottom: 0; }

		/* 内容区域  end */
	</style>
	<body style="background:#EFF3F5;">
		<!-- 顶部导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/header.jsp"%>
		<!-- 顶部导航  end -->
		
		<!-- 左侧导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/left.jsp"%>
		<!-- 左侧导航  end -->
		
		<!-- 内容区域  start -->
		<div id="mainWrap">
			<div class="bannerWrap"></div>
		
			<div class="wpn" id="project">
		        <!--  -->
		        <div class="cl pos">
		            <ul class="h-screen">
		                <li class="on"><a href="javascript:;" title="首页推荐">首页推荐</a></li>
		                <li><a href="/?t=share#project" title="佳作分享">佳作分享</a></li>                                   
		                <li><a href="/?t=new#project" title="最新作品">最新作品</a></li>                                       
		                <li><a href="/?t=follow#project" title="我的关注">我的关注</a></li>            
		            </ul>
		            <!--  -->
		            <ul class="h-soup cl">
						<li>                            
							<i class="iconfont icon-star1" title="更新"></i>
		                    <a class="txt" href="/system.html" target="_blank"> 更新：导航栏更新~一起来发现！ </a>
		                </li>
		                <li class="open">
		                     <i class="iconfont icon-heart-round" title="鸡汤"></i>
		                     <a class="txt" href="/soup.html" target="_blank"> 鸡汤：今早本来要发鸡汤的，被AR红包淹没了~ </a>
		                </li>                            
		                <li>
							<i class="iconfont icon-warn" title="公告"></i>
		                    <a class="txt" href="/site.html" target="_blank"> 公告：关于作品／文章推荐，UI中国特此声明 </a>
		                </li>                
		            </ul>
		        </div>
		        <!--  -->
		        <!--  -->
		        <ul class="post post-works mtw cl">
		            <li>
		                <!--  -->
		                <div class="shade" style="opacity: 0;"></div>
		                <!--  -->
		                <div class="cover pos">
		                    <a href="javascript:void(0)" target="_blank" title="业务与用户路径如何运用到产品优化">
		                        <img width="280" height="210" src="${basePath}/resources/imgs/index/1044522.jpg" data-original="${basePath}/resources/imgs/index/1044522.jpg" class="imgloadinglater" alt="业务与用户路径如何运用到产品优化" rel="nofollow" style="display: inline;">
		                    </a>
		                </div>
		                <div class="info">
		                    <h4 class="title ellipsis download"> 业务与用户路径如何运用到产品优化</h4>
		                    <div class="msg mtn cl">
		                        <span class="classify">原创</span>
		                        <span><i class="iconfont icon-iconeye" title="浏览数"></i><em>1404</em></span>
		                        <span><i class="iconfont icon-comment" title="评论数"></i><em>6</em></span>
		                        <span><i class="iconfont icon-leaf" title="点赞数"></i><em>36</em></span>
		                    </div>
		                    <p class="user cl">
		                        <a href="javascript:void(0)" target="_blank"><img src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" title="星夜Design"> 
			                        <strong class="name">
			                            <em>星夜Design</em> 
			                        	<i class="cert icon-certified2" title="UI中国认证设计师"></i>                                                                       
			                        </strong>
		                        </a>
		                    </p>
		                </div>
		                <!--  分隔线  -->
		                <div class="line"></div>
		            </li>
		            <li>
		                <!--  -->
		                <div class="shade" style="opacity: 0;"></div>
		                <!--  -->
		                <div class="cover pos">
		                    <a href="javascript:void(0)" target="_blank" title="Point_Vision原创教程Principle简单动效">
		                        <img width="280" height="210" src="${basePath}/resources/imgs/index/1045420.jpg" data-original="${basePath}/resources/imgs/index/1045420.jpg" class="imgloadinglater" alt="Point_Vision原创教程Principle简单动效" rel="nofollow" style="display: inline;">
		                    </a>
		                </div>
		                <div class="info">
		                    <h4 class="title ellipsis download">Point_Vision原创教程Principle简单动效</h4>
		                    <div class="msg mtn cl">
		                        <span class="classify">原创</span>
		                        <span><i class="iconfont icon-iconeye" title="浏览数"></i><em>2361</em></span>
		                        <span><i class="iconfont icon-comment" title="评论数"></i><em>6</em></span>
		                        <span><i class="iconfont icon-leaf" title="点赞数"></i><em>97</em></span>
		                    </div>
		                    <p class="user cl">
		                        <a href="javascript:void(0)" target="_blank">
			                        <img src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" title="Point_Vision"> 
			                        <strong class="name"><em>Point_Vision</em></strong>
		                        </a>
		                    </p>
		                </div>
		                <!--  分隔线  -->
		                <div class="line"></div>
		            </li>
		            <li>
		                <!--  -->
		                <div class="shade" style="opacity: 0;"></div>
		                <!--  -->
		                <div class="cover pos">
		                    <a href="javascript:void(0)" target="_blank" title="Origami教程10-列表视差动画+TAB动画">
		                        <img width="280" height="210" src="${basePath}/resources/imgs/index/1046463.png" data-original="${basePath}/resources/imgs/index/1046463.png" class="imgloadinglater" alt="Origami教程10-列表视差动画+TAB动画" rel="nofollow" style="display: inline;">
		                    </a>
		                </div>
		                <div class="info">
			                <div class="msg mtn cl">
				                 <h4 class="title ellipsis download">Origami教程10-列表视差动画+TAB动画</h4>
			                     <span class="classify">原创</span>
			                     <span><i class="iconfont icon-iconeye" title="浏览数"></i><em>2604</em></span>
			                     <span><i class="iconfont icon-comment" title="评论数"></i><em>4</em></span>
			                     <span><i class="iconfont icon-leaf" title="点赞数"></i><em>28</em></span>
			                 </div>
			                 <p class="user cl">
			                     <a href="javascript:void(0)" target="_blank"><img src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" title="HeNgrY"> <strong class="name">
			                         <em>HeNgrY</em> 
			                     <i class="cert icon-certified2" title="UI中国认证设计师"></i>                                                                        </strong></a>
			                 </p>
		                </div>
		                <!--  分隔线  -->
		                <div class="line"></div>
		            </li>
		            <li>
		                <!--  -->
		                <div class="shade" style="opacity: 0;"></div>
		                <!--  -->
		                <div class="cover pos">
		                    <a href="javascript:void(0)" target="_blank" title="深度揭秘上百种H5动效（不看可能会后悔篇）">
		                        <img width="280" height="210" src="${basePath}/resources/imgs/index/1048507.png" data-original="${basePath}/resources/imgs/index/1048507.png" class="imgloadinglater" alt="深度揭秘上百种H5动效（不看可能会后悔篇）" rel="nofollow" style="display: inline;">
		                    </a>
		                </div>
		                <div class="info">
		                    <h4 class="title ellipsis download">深度揭秘上百种H5动效（不看可能会后悔篇） </h4>
		                    <div class="msg mtn cl">
		                        <span class="classify">原创</span>
		                        <span><i class="iconfont icon-iconeye" title="浏览数"></i><em>4834</em></span>
		                        <span><i class="iconfont icon-comment" title="评论数"></i><em>10</em></span>
		                        <span><i class="iconfont icon-leaf" title="点赞数"></i><em>103</em></span>
		                    </div>
		                    <p class="user cl">
		                        <a href="javascript:void(0)" target="_blank">
		                        	<img src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" title="尼姑拉丝赵四"> 
		                        	<strong class="name"><em>尼姑拉丝赵四</em></strong>
		                        </a>
		                    </p>
		                </div>
		                <!--  分隔线  -->
		                <div class="line"></div>
		            </li>
		            <li>
		                <!--  -->
		                <div class="shade" style="opacity: 0;"></div>
		                <!--  -->
		                <div class="cover pos">
		                    <a href="javascript:void(0)" target="_blank" title="球球世界">
		                        <img width="280" height="210" src="${basePath}/resources/imgs/index/1048934.gif" data-original="${basePath}/resources/imgs/index/1048934.gif" class="imgloadinglater" alt="球球世界" rel="nofollow" style="display: inline;">
		                    </a>
		                </div>
		                <div class="info">
		                    <h4 class="title ellipsis download">球球世界</h4>
		                    <div class="msg mtn cl">
		                        <span class="classify">原创</span>
		                        <span><i class="iconfont icon-iconeye" title="浏览数"></i><em>1690</em></span>
		                        <span><i class="iconfont icon-comment" title="评论数"></i><em>10</em></span>
		                        <span><i class="iconfont icon-leaf" title="点赞数"></i><em>79</em></span>
		                    </div>
		                    <p class="user cl">
		                        <a href="javascript:void(0)" target="_blank">
		                        <img src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" title="大裤衩"> 
		                        <strong class="name"><em>大裤衩</em></strong>
		                        </a>
		                    </p>
		                </div>
		                <!--  分隔线  -->
		                <div class="line"></div>
		            </li>
		            <li>
		                <!--  -->
		                <div class="shade" style="opacity: 0;"></div>
		                <!--  -->
		                <div class="cover pos">
		                    <a href="javascript:void(0)" target="_blank" title="《石头记》像素风格百度手机输入法皮肤设计">
		                        <img width="280" height="210" src="${basePath}/resources/imgs/index/1055025.gif" data-original="${basePath}/resources/imgs/index/1055025.gif" class="imgloadinglater" alt="《石头记》像素风格百度手机输入法皮肤设计" rel="nofollow" style="display: inline;">
		                    </a>
		                </div>
		                <div class="info">
		                    <h4 class="title ellipsis download">《石头记》像素风格百度手机输入法皮肤设计</h4>
		                    <div class="msg mtn cl">
		                        <span class="classify">原创</span>
		                        <span><i class="iconfont icon-iconeye" title="浏览数"></i><em>1765</em></span>
		                        <span><i class="iconfont icon-comment" title="评论数"></i><em>17</em></span>
		                        <span><i class="iconfont icon-leaf" title="点赞数"></i><em>100</em></span>
		                    </div>
		                    <p class="user cl">
		                        <a href="javascript:void(0)" target="_blank">
		                        	<img src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" title="吉茄木木"> 
		                        	<strong class="name"><em>吉茄木木</em></strong>
		                        </a>
		                    </p>
		                </div>
		                <!--  分隔线  -->
		                <div class="line"></div>
		            </li>
		            <li>
		                <!--  -->
		                <div class="shade"></div>
		                <!--  -->
		                <div class="cover pos">
		                    <a href="javascript:void(0)" target="_blank" title="百度输入法大赛——Suitcase of bourne">
		                        <img width="280" height="210" src="${basePath}/resources/imgs/index/1056081.jpg" data-original="${basePath}/resources/imgs/index/1056081.jpg" class="imgloadinglater" alt="百度输入法大赛——Suitcase of bourne" rel="nofollow" style="display: inline;">
		                    </a>
		                </div>
		                <div class="info">
		                    <h4 class="title ellipsis download">百度输入法大赛——Suitcase of bourne</h4>
		                    <div class="msg mtn cl">
		                        <span class="classify">原创</span>
		                        <span><i class="iconfont icon-iconeye" title="浏览数"></i><em>2785</em></span>
		                        <span><i class="iconfont icon-comment" title="评论数"></i><em>107</em></span>
		                        <span><i class="iconfont icon-leaf" title="点赞数"></i><em>193</em></span>
		                    </div>
		                    <p class="user cl">
		                        <a href="javascript:void(0)" target="_blank">
		                        	<img src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" title="大表狗"> 
		                        	<strong class="name"><em>大表狗</em></strong>
		                        </a>
		                    </p>
		                </div>
		                <!--  分隔线  -->
		                <div class="line"></div>
		            </li>
		            <li>
		                <!--  -->
		                <div class="shade" style="opacity: 0;"></div>
		                <!--  -->
		                <div class="cover pos">
		                    <a href="javascript:void(0)" target="_blank" title="【旺达与巨像】SHADOW OF THE COLOSSUS">
		                        <img width="280" height="210" src="${basePath}/resources/imgs/index/1059537.png" data-original="${basePath}/resources/imgs/index/1059537.png" class="imgloadinglater" alt="【旺达与巨像】SHADOW OF THE COLOSSUS" rel="nofollow" style="display: inline;">
		                    </a>
		                </div>
		                <div class="info">
		                    <h4 class="title ellipsis download">【旺达与巨像】SHADOW OF THE COLOSSUS</h4>
		                    <div class="msg mtn cl">
		                        <span class="classify">原创</span>
		                        <span><i class="iconfont icon-iconeye" title="浏览数"></i><em>2196</em></span>
		                        <span><i class="iconfont icon-comment" title="评论数"></i><em>29</em></span>
		                        <span><i class="iconfont icon-leaf" title="点赞数"></i><em>142</em></span>
		                    </div>
		                    <p class="user cl">
		                        <a href="javascript:void(0)" target="_blank">
		                        	<img src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" title="x行骗艺术家"> 
		                        	<strong class="name"><em>x行骗艺术家</em></strong>
		                        </a>
		                    </p>
		                </div>
		                <!--  分隔线  -->
		                <div class="line"></div>
		            </li>
		                       
		         </ul>
		         <div class="h_page mtn mbw">
		                <ul class="cl">
		                	<li><a class="on" href="?p=1#project">1</a></li>
		                	<li><a href="javascript:;">2</a></li>
		                	<li><a href="?p=3#project">3</a></li>
		                	<li><a href="/list.html?r=main&amp;p=2" target="_blank">...</a></li>
		                </ul>            
		         </div>
		         <!--  -->
		     </div>
		
			<div class="bg-white" id="article">
			    <div class="wpn cl">
			        <div class="w820 z">
			            <h1 class="h-tit mtv h-article-btn pos">
			                <a class="on" href="javascript:;" title="文章">推荐文章</a>
			                <a href="/?art=article#article" title="最新文章">最新文章</a>            
			            </h1>
			
			            <div class="h-article-box">
			                <ul class="h-article-list">
			                    <li class="cl">
		                            <a href="javascript:void(0)" title="2017年，UI设计风格预测。" target="_blank">
		                                <div class="shade"></div>
		                                <div class="showd">
		                                    <span class="cover">
		                                        <img width="160" height="120" src="${basePath}/resources/imgs/index/1046463.png" alt="2017年，UI设计风格预测。" rel="nofollow">
		                                    </span>
		                                    <div class="h-article-info">
		                                        <h1 class="cl">
		                                            <span class="tag bg-blue" target="_blank" href="/exp.html?scatid=15">经验观点</span>
		                                            <span class="ellipsis" href="javascript:void(0)" title="2017年，UI设计风格预测。" target="_blank">2017年，UI设计风格预测。</span>
		                                        </h1>
		                                        <p>这不仅仅是一篇经验，而是前辈用日积月累得工作心得，用笔记用脑想，最重要得是要走心。还有我是占位符不是简介。</p>
		                                        <div class="mtm cl">
		                                            <span class="avatar z" href="javascript:void(0)" title="苏大牙" target="_blank">
		                                                <img width="20" height="20" src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" alt="苏大牙" rel="nofollow">
		                                                <strong class="name">苏大牙                                                    
		                                                	<i class="icon-certified2" title="UI中国认证设计师"></i>                                                                                                    
		                                                </strong>
		                                            </span>
		                                            <div class="msg z cl">
		                                                <span><i class="iconfont icon-iconeye"></i><em>14016</em></span>
		                                                <span><i class="iconfont icon-comment"></i><em>30</em></span>
		                                                <span><i class="iconfont icon-leaf"></i><em>456</em></span>
		                                            </div>
		                                        </div>
		                                        <div class="data"><i class="iconfont icon-time"></i>3-2 16:32</div>
		                                    </div>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="cl">
		                            <a href="javascript:void(0)" title="C4D置换星球教程" target="_blank">
		                                <div class="shade"></div>
		                                <div class="showd">
		                                    <span class="cover">
		                                        <img width="160" height="120" src="${basePath}/resources/imgs/index/1046463.png" alt="C4D置换星球教程" rel="nofollow">
		                                    </span>
		                                    <div class="h-article-info">
		                                        <h1 class="cl">
		                                            <span class="tag bg-blue" target="_blank" href="/exp.html?scatid=11">设计教程</span>
		                                            <span class="ellipsis" href="javascript:void(0)" title="C4D置换星球教程" target="_blank">C4D置换星球教程</span>
		                                        </h1>
		                                        <p>附件下载在最下面，高清观看移步b站 &nbsp;&nbsp;</p>
		                                        <div class="mtm cl">
		                                            <span class="avatar z" href="javascript:void(0)" title="FinalRound" target="_blank">
		                                                <img width="20" height="20" src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" alt="FinalRound" rel="nofollow">
		                                                <strong class="name">FinalRound</strong>
		                                            </span>
		                                            <div class="msg z cl">
		                                                <span><i class="iconfont icon-iconeye"></i><em>4506</em></span>
		                                                <span><i class="iconfont icon-comment"></i><em>13</em></span>
		                                                <span><i class="iconfont icon-leaf"></i><em>109</em></span>
		                                            </div>
		                                        </div>
		                                        <div class="data"><i class="iconfont icon-time"></i>3-2 09:52</div>
		                                    </div>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="cl">
		                            <a href="javascript:void(0)" title="UI配色整理" target="_blank">
		                                <div class="shade"></div>
		                                <div class="showd">
		                                    <span class="cover">
		                                        <img width="160" height="120" src="${basePath}/resources/imgs/index/1046463.png" alt="UI配色整理" rel="nofollow">
		                                    </span>
		                                    <div class="h-article-info">
		                                        <h1 class="cl">
		                                            <span class="tag bg-blue" target="_blank" href="/exp.html?scatid=15">经验观点</span>
		                                            <span class="ellipsis" href="javascript:void(0)" title="UI配色整理" target="_blank">UI配色整理</span>
		                                        </h1>
		                                        <p>这不仅仅是一篇经验，而是前辈用日积月累得工作心得，用笔记用脑想，最重要得是要走心。还有我是占位符不是简介。</p>
		                                        <div class="mtm cl">
		                                            <span class="avatar z" href="javascript:void(0)" title="鱼子有梦" target="_blank">
		                                                <img width="20" height="20" src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" alt="鱼子有梦" rel="nofollow">
		                                                <strong class="name">鱼子有梦                                                   
		                                                	<i class="icon-certified2" title="UI中国认证设计师"></i>                                                                                                    
		                                                </strong>
		                                            </span>
		                                            <div class="msg z cl">
		                                                <span><i class="iconfont icon-iconeye"></i><em>16862</em></span>
		                                                <span><i class="iconfont icon-comment"></i><em>72</em></span>
		                                                <span><i class="iconfont icon-leaf"></i><em>697</em></span>
		                                            </div>
		                                        </div>
		                                        <div class="data"><i class="iconfont icon-time"></i>3-1 13:42</div>
		                                    </div>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="cl">
		                            <a href="javascript:void(0)" title="切磋第15期——鸡" target="_blank">
		                                <div class="shade"></div>
		                                <div class="showd">
		                                    <span class="cover">
		                                        <img width="160" height="120" src="${basePath}/resources/imgs/index/1046463.png" alt="切磋第15期——鸡" rel="nofollow">
		                                    </span>
		                                    <div class="h-article-info">
		                                        <h1 class="cl">
		                                            <span class="tag bg-blue" target="_blank" href="/exp.html?scatid=15">经验观点</span>
		                                            <span class="ellipsis" href="javascript:void(0)" title="切磋第15期——鸡" target="_blank">切磋第15期——鸡</span>
		                                        </h1>
		                                        <p>这不仅仅是一篇经验，而是前辈用日积月累得工作心得，用笔记用脑想，最重要得是要走心。还有我是占位符不是简介。</p>
		                                        <div class="mtm cl">
		                                            <span class="avatar z" href="javascript:void(0)" title="MDDDesign" target="_blank">
		                                                <img width="20" height="20" src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" alt="MDDDesign" rel="nofollow">
		                                                <strong class="name">MDDDesign</strong>
		                                            </span>
		                                            <div class="msg z cl">
		                                                <span><i class="iconfont icon-iconeye"></i><em>7952</em></span>
		                                                <span><i class="iconfont icon-comment"></i><em>77</em></span>
		                                                <span><i class="iconfont icon-leaf"></i><em>170</em></span>
		                                            </div>
		                                        </div>
		                                        <div class="data"><i class="iconfont icon-time"></i>2-26 19:21</div>
		                                    </div>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="cl">
		                            <a href="javascript:void(0)" title="Stack自动布局:Sketch中的Flexbox" target="_blank">
		                                <div class="shade"></div>
		                                <div class="showd">
		                                    <span class="cover">
		                                        <img width="160" height="120" src="${basePath}/resources/imgs/index/1046463.png" alt="Stack自动布局:Sketch中的Flexbox" rel="nofollow">
		                                    </span>
		                                    <div class="h-article-info">
		                                        <h1 class="cl">
		                                            <span class="tag bg-blue" target="_blank" href="/exp.html?scatid=27">规范资料</span>
		                                            <span class="ellipsis" href="javascript:void(0)" title="Stack自动布局:Sketch中的Flexbox" target="_blank">Stack自动布局:Sketch中的Flexbox</span>
		                                        </h1>
		                                        <p>难得介绍一次设计工具，本文主角是一款Sketch插件。它不只是提升工作效率那么简单，而是能改变设计界面布局时的思维方式。如果你熟悉Flexbox，上手非常容易。</p>
		                                        <div class="mtm cl">
		                                            <span class="avatar z" href="javascript:void(0)" title="可乐橙" target="_blank">
		                                                <img width="20" height="20" src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" alt="可乐橙" rel="nofollow">
		                                                <strong class="name">可乐橙<i class="icon-certified2" title="UI中国认证设计师"></i></strong>
		                                            </span>
		                                            <div class="msg z cl">
		                                                <span><i class="iconfont icon-iconeye"></i><em>6374</em></span>
		                                                <span><i class="iconfont icon-comment"></i><em>16</em></span>
		                                                <span><i class="iconfont icon-leaf"></i><em>75</em></span>
		                                            </div>
		                                        </div>
		                                        <div class="data"><i class="iconfont icon-time"></i>2-26 01:07</div>
		                                    </div>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="cl">
		                            <a href="javascript:void(0)" title="浅析动效在UI设计中的作用" target="_blank">
		                                <div class="shade"></div>
		                                <div class="showd">
		                                    <span class="cover">
		                                        <img width="160" height="120" src="${basePath}/resources/imgs/index/1046463.png" alt="浅析动效在UI设计中的作用" rel="nofollow">
		                                    </span>
		                                    <div class="h-article-info">
		                                        <h1 class="cl">
		                                            <span class="tag bg-blue" target="_blank" href="/exp.html?scatid=15">经验观点</span>
		                                            <span class="ellipsis" href="javascript:void(0)" title="浅析动效在UI设计中的作用" target="_blank">浅析动效在UI设计中的作用</span>
		                                        </h1>
		                                        <p>这不仅仅是一篇经验，而是前辈用日积月累得工作心得，用笔记用脑想，最重要得是要走心。还有我是占位符不是简介。</p>
		                                        <div class="mtm cl">
		                                            <span class="avatar z" href="javascript:void(0)" title="吃吃吃" target="_blank">
		                                                <img width="20" height="20" src="${basePath}/resources/imgs/index/auther.png?imageMogr2/auto-orient/crop/!300x300a0a0/thumbnail/60x60" alt="吃吃吃" rel="nofollow">
		                                                <strong class="name">吃吃吃 </strong>
		                                            </span>
		                                            <div class="msg z cl">
		                                                <span><i class="iconfont icon-iconeye"></i><em>2839</em></span>
		                                                <span><i class="iconfont icon-comment"></i><em>4</em></span>
		                                                <span><i class="iconfont icon-leaf"></i><em>74</em></span>
		                                            </div>
		                                        </div>
		                                        <div class="data"><i class="iconfont icon-time"></i>2-24 17:04</div>
		                                    </div>
		                                </div>
		                            </a>
		                        </li>                
		                    </ul>
			                <div class="h_page mtw mbw">
			                    <ul class="cl">
			                    	<li><a class="on" href="javascript:;">1</a></li>
			                    	<li><a href="?page=2#article">2</a></li>
			                    	<li><a href="?page=3#article">3</a></li>
			                    	<li><a href="/exp.html?tag=1&amp;p=3" target="_blank">...</a></li>
			                    </ul>                
			               </div>
			            </div>
			
			        </div>
			        <div class="w280 y mtv">
			            <h1 class="h-tit-aside">点击排行</h1>
			            <ul class="h-aside-list">
			                <li class="pos">
		                        <a href="http://zhaopin.ui.cn/prev/pid/349.html" target="_blank">
		                            <img class="cover" width="280" height="125" src="http://img.ui.cn/data/booth/201609/1473307771_779.jpeg" alt="" rel="nofollow">
		                            <div class="h-aside-show">
		                                <p class="item ellipsis">[上海市] 高级UI设计师 [18k-30k]</p>
		                                <p class="item ellipsis">[上海市] 设计助理（实习） [3k-5k]</p>                            
		                            </div>
		                        </a>
		                    </li>
		                    <li class="pos">
		                        <a href="http://zhaopin.ui.cn/prev/pid/322.html" target="_blank">
		                            <img class="cover" width="280" height="125" src="http://img.ui.cn/data/booth/201609/1474862195_107.jpeg" alt="" rel="nofollow">
		                            <div class="h-aside-show">
		                                <p class="item ellipsis">[上海市] 视觉设计师 [10k-25k]</p>
		                                <p class="item ellipsis">[上海市] 高级交互设计师 [15k-25k]</p>                            
		                            </div>
		                        </a>
		                    </li>
		                    <li class="pos">
		                        <a href="http://zhaopin.ui.cn/prev/pid/481.html" target="_blank">
		                            <img class="cover" width="280" height="125" src="http://img.ui.cn/data/booth/201612/1482144673_737.jpeg" alt="" rel="nofollow">
		                            <div class="h-aside-show">
		                                <p class="item ellipsis">[西安] 交互设计师 [5k-15k]</p>
		                                <p class="item ellipsis">[西安] 视觉设计师 [5k-15k]</p>
		                                <p class="item ellipsis">[西安] 设计实习生 [3k-5k]</p>                            
		                            </div>
		                        </a>
		                    </li>            
			            </ul>
			            <a class="more" href="javascript:void(0)" title="招聘" target="_blank">更多</a>
			
			            <h1 class="h-tit-aside mtw">热门标签</h1>
			            <ul class="h-aside-list">
			                <li class="pos">
		                        <a href="http://peixun.ui.cn/detail/363.html" target="_blank">
		                            <img class="cover" width="280" height="125" src="http://img.ui.cn/data/booth/201702/1487744828_327.jpeg" alt="" rel="nofollow">
		                        </a>
		                    </li>
		                    <li class="pos">
		                        <a href="http://peixun.ui.cn/detail/364.html" target="_blank">
		                            <img class="cover" width="280" height="125" src="http://img.ui.cn/data/booth/201609/1473390683_245.jpeg" alt="" rel="nofollow">
		                        </a>
		                    </li>
		                    <li class="pos">
		                        <a href="http://peixun.ui.cn/detail/390.html" target="_blank">
		                            <img class="cover" width="280" height="125" src="http://img.ui.cn/data/booth/201702/1487908457_191.jpeg" alt="" rel="nofollow">
		                        </a>
		                    </li>            
			            </ul>
			            <a class="more" href="javascript:void(0)" title="培训" target="_blank">更多</a>
			        </div>
			    </div>
		    </div>
		
		</div>
		<!-- 内容区域  end -->
		
		<!-- 底部导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/footer.jsp"%>
		<!-- 底部导航  end -->
		<script type="text/javascript"> 
			
		</script>
	</body>
</html>
