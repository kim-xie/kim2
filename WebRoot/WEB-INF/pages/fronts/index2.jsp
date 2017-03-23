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
		body{ background-color: #eff3f5;}
		/* 内容区域  start */
		#mainWrap{width:100%;height:100%;}
		#mainWrap #wrapper{width:1180px;margin:0 auto;margin-top:70px;}
		.z {float: left !important;}
		.y {float: right !important;}
		.pos {position: relative;}
		.cl:before, .cl:after {content: " ";display: table;}
		.cl:after {clear: both;}
		h1, .h1 {font-size: 24px;}
		h3, .h3 {font-size: 16px;}
		img {border: 0;vertical-align: middle;width: inherit;height: inherit;}
		input, textarea {border: 1px solid #b8c4ce;border-radius: 2px;}
		b, strong{font-weight: normal;}
		a{color: #2c3e50;}
		.works-main {background-color: #fff;box-shadow: 0 0 3px rgba(0,0,0,.1);}
		.main {float: left;width: 940px;}
		.works-top {padding: 20px;}
		.works-top .left {float: left;width: 700px;}
		.works-top .left h1 {height: 34px;}
		.works-top .left h1 strong{display: inline-block; max-width: 640px; white-space: nowrap; overflow: hidden; font-size: 20px; color: #2c3e50; font-weight: bold; height: 30px;}
		.works-top .left .det .tag{float: left; padding: 0 5px; height: 20px; font-size: 12px; color: #9aabbf; line-height: 20px; background-color: #dfe5e9; border-radius: 2px;}
		.works-top .left .det span{float: left;}
		.works-top .left .det .txt-gray1{margin-left: 25px;}
		.works-top .left .det span{float: left;}
		.txt-gray1{color: #b8c4ce!important;}
		.txt-primary{color: #3498db;}
		.works-top .left .det .txt-gray1{margin-left: 25px;}
		.txt-gray1{color: #b8c4ce!important;}
		.copyright{float: left;}
		.copyright i{font-size: 22px; cursor: pointer;}
		.copyright .text{opacity: 0; position: absolute; top: 25px; left: -78px; width: 180px; background-color: #3498db; color: #fff; padding: 10px 0; line-height: 14px; font-size: 14px; text-align: center; border-radius: 2px; -webkit-transition: all .5s; -moz-transition: all .5s; -ms-transition: all .5s; -o-transition: all .5s; transition: all .5s;}
		.copyright .text:before{content: ""; position: absolute; top: -6px; left: 50%; margin-left: -8px; border-color: transparent transparent #3498db transparent; border-style: solid; border-width: 0 7px 8px 7px; height: 0; width: 0;}.msg span{margin-right: 10px;}.msg span i{font-size: 18px; color: #9aabb8; margin-right: 5px;}
		.msg span em{font-size: 14px; color: #9aabb8;}
		.works-top .left .det .time{margin-left: 20px;}
		.works-top .left .det span{float: left;}
		.works-top .left .det .time i{float: left; height: 21px; line-height: 21px; margin-right: 5px; color: #9aabb8;}
		.works-top .left .det .time em{float: left; height: 21px; line-height: 21px; color: #9aabb8;}
		.works-top .right{float: left; width: 200px;}
		.works-top .hot{text-align: right; margin-top: 15px; margin-right: 12px; height: 45px;}
		.works-top .hot i{font-size: 30px; color: #acbbc6; vertical-align: super;}
		.works-top .hot .num{font-size: 30px; color: #acbbc6; font-weight: bold; font-style: italic;}
		.works-top .hot .num strong{position: absolute; right: 5px; top: 25px; font-size: 22px;}
		.works-top .right h3{position: absolute; right: 20px; margin-top: 3px; width: 360px; overflow: hidden; white-space: nowrap; text-align: right;}
		.works-top .right h3 a{font-size: 14px; color: #16a085; transition: all .2s;}
		.works-top .tag-star{position: absolute; top: -6px; right: -6px;}
		.works-cont{padding: 30px 20px 30px 20px; border-top: 1px solid #eff3f5; border-bottom: 1px solid #eff3f5;}
		.simditor .simditor-body, .editor-style{font-size: 16px; font-family: "Microsoft Yahei", "Helvetica Neue", Helvetica, Arial, sans-serif; line-height: 1.6; color: #333; outline: none; word-wrap: break-word;}
		.works-top .left .det{margin-top: 5px; font-size: 14px; height: 22px; line-height: 22px;}
		.aside{float: right; width: 220px;}
		.fixed1{position: fixed!important; top: 70px!important;}
		.works-author-aside{position: absolute; top: 0;}
		.zbd_warp{width: 220px; overflow-x: hidden; background: #fff; text-align: center; box-shadow: 0 0 3px rgba(0,0,0,.1); overflow-y: hidden;}.
		zbd_warp p{margin: 0; font-size: 14px; line-height: 1.57142858; color: #34495e; word-wrap: break-word; word-break: break-word;}
		.zbd_warp .zbd_portrait a{display: inline-block; margin-top: 30px; width: 100px; height: 100px; background: #eee; border-radius: 50%; overflow:hidden;}
		.zbd_warp .zbd_portrait a img{width: 100%; height: 100%;}
		.zbd_warp .zbd_name{font-size: 16px; color: #34495e; font-weight: bold; margin-top: 5px;}a{color: #2c3e50;}
		.zbd_warp .zbd_name i{color: #e74c3c; font-size: 14px;}
		.rote180{transform: rotate(180deg); -ms-transform: rotate(180deg); -moz-transform: rotate(180deg); -webkit-transform: rotate(180deg); -o-transform: rotate(180deg); display: inline-block;}
		.certg{color: #b8c4ce!important;}
		.zbd_warp .zbd_introduce{font-size: 13px; color: #b4bbc0; width: 180px; /* height: 20px; */ overflow-y: hidden; overflow-x: hidden; padding: 0 20px 0 20px; text-overflow: ellipsis; white-space: nowrap;}
		.zbd_warp .zbd_medal{margin-top: 7px;}
		.zbd_warp .zbd_medal img{width: 27px; height: 27px;}
		.Occupying{width: 220px; height: 87px; display: block;}
		.zbd_warp .zbd_foot{position: absolute; bottom: 0; left: 0;}
		.zbd_warp .zbd_foot a{display: block; width: 49.7%; height: 55px; border: 1px solid #eff3f5; border-left: none; border-bottom: none; background-color: #f8f8f8; text-align: center;}
		.zbd_warp .zbd_foot .zbd_right{border-right: none;}
		.zbd_warp .zbd_foot a em{color: #acbbc6; font-size: 12px; width: 109.5px; display: block; padding-top: 5px; text-align: center;}
		.zbd_warp .zbd_foot a b{margin-top: 6px; overflow: hidden; display: block; color: #34495e; font-size: 20px; font-weight: bold; width: 109.5px; text-align: center;}
		.zbd_focus{display: inline-block; width: 38px; height: 38px; position: absolute; left: 50%; margin-left: -19px; bottom: 36px; z-index: 6; text-align: center; line-height: 38px;}
		.zbd_focus .iconfont{display: block; height: 42px; width: 42px; line-height: 42px;}
		.zbd_focus .iconfont:before{content: "\e647"; font-size: 42px; line-height: 42px; color: #3498db;}
		.zbd_focus .icon-add-bold, .zbd_focus .icon-ok-sign, .zbd_focus .icon-relating-bold, .zbd_focus .icon-close-bold{color: #fff; font-size: 15px; position: relative; bottom: 52px; z-index: 10;}
		.zbd_comments{width: 220px; height: 50px; margin-top: 10px; background-color: #fff; box-shadow: 0 0 3px rgba(0,0,0,.1);}
		.zbd_comments .zbd_one{height: 49px; border-right: 1px solid #eff3f5; position: relative; z-index: 6;}
		.zbd_comments a{display: block; width: 49.7%; background-color: #fff; text-align: center; color: #acbbc6; font-size: 12px; border-bottom: 1px solid #fff;}
		.zbd_comments a b{width: 109.5px; display: block; padding-top: 5px;}
		.zbd_comments a em{margin-top: 3px; overflow: hidden; font-size: 16px; height: 20px; width: 99%; display: block;}
		.zbd_comments a em{color: #34495e;}
		.arrow-shadow{position: absolute; top: 15px; left: -10px; z-index: 3; background-color: #fff; width: 20px; height: 20px; box-shadow: 0 0 3px rgba(0,0,0,.1); transform: rotate(45deg); -ms-transform: rotate(45deg); -moz-transform: rotate(45deg); -webkit-transform: rotate(45deg); -o-transform: rotate(45deg);}
		.zbd_write{height: 150px; width: 220px; background-color: #fff; display: none; box-shadow: 0 3px 3px rgba(0,0,0,.1);}
		.works-tag{padding: 0 20px;}
		.works-tag li{display: inline-block; height: 20px; margin-right: 20px; margin-top: 10px;}
		.works-tag li i{padding-right: 5px; color: #b8c4ce; font-size: 14px;}
		.works-tag li span{color: #b8c4ce;}
		.works-bottom{/* width: 900px; */ height: 140px; padding: 0 20px;}
		.works-bottom .share{position: relative; float: left; margin-top: 32px;}
		.works-bottom .share .weixin-box{display: none; position: absolute; left: 5px; top: -160px; bottom: initial; width: 270px; padding: 18px; background-color: #fff; box-shadow: 0 0 5px rgba(0,0,0,.1); border-radius: 2px;}
		.works-bottom .share .weixin-box p{display: inline-block; width: 100px; margin-left: 15px; padding-top: 22px; font-size: 14px; position: relative; z-index: 1;}
		.works-bottom .share .weixin-box .icon-close{position: absolute; right: 8px; top: 8px; color: #34495e; z-index: 1;}
		.works-bottom .share > a{float: left; margin-right: 10px;}
		.works-bottom .share > a > i{display: inline-block; width: 40px; height: 40px; font-size: 24px; color: #34495e; text-align: center; line-height: 40px; background-color: #fff; border-radius: 50%; border: 1px solid #34495e; -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;}
		.works-bottom .share > a > i.icon-huaban{font-size: 21px;}
		.works-bottom .share > a > i.icon-douban1{font-size: 19px;}
		.works-bottom .tip{font-size: 12px; color: #9dacb9; line-height: 28px;}
		.works-bottom .oper{float: right; margin-top: 32px;}
		.works-bottom .oper li{float: left; margin-left: 20px;}
		.works-bottom .oper li a{display: block; width: 120px; height: 38px; font-size: 14px; color: #2c3e50; line-height: 38px; text-align: center; border-radius: 20px; border: 1px solid #4f5f6e;}
		.works-bottom .oper li a i{margin-right: 5px; font-size: 18px; color: #2c3e50; line-height: 35px;}
		.works-bottom .tip{font-size: 12px; color: #9dacb9; line-height: 28px;}
		.txt-center{text-align: center;}
		.works-zan{display: block; width: 221px; margin: 20px auto 0;}
		.works-zan .iconfont{background: url(${basePath}/resources/imgs/contentDetail/bgz1.png) no-repeat center; background-size: 190px; width: 190px; height: 65px; display: inline-block;}
		.works-zan .cont{position: absolute; top: 0; left: 0; width: 221px;}
		.works-zan .cont i{float: left; margin-left: 32px; font-size: 30px;width:45px; color: #fff; line-height: 66px;}
		.works-zan .cont .txt{float: left; margin-left: 8px; font-family: "Microsoft Yahei"; font-size: 18px; color: #fff; line-height: 65px; -webkit-text-stroke-width: initial;}
		.works-zan .cont .num{float: right; margin-right: 65px; font-size: 12px; color: rgba(255,255,255,.5); text-align: right; line-height: 65px;}
		.works-author{/* width: 900px; */ padding: 20px 20px; background-color: #f6f9fa; border-top: 1px solid #eff3f5; border-bottom: 1px solid #eff3f5;}
		.works-author .avatar-md{margin: 10px 0;}
		.avatar-md{display: inline-block; width: 100px; height: 100px;}
		.avatar img, .avatar-xs img, .avatar-sm img, .avatar-md img, .avatar-lg img{width: 100%; height: 100%; border-radius: 50%;}
		.works-author .info{display: table; width: 245px; overflow: hidden; margin: 10px 15px;}
		.works-author .info > div{display: table-cell; vertical-align: middle; height: 100px;}
		.works-author .info h1{height: 30px; line-height: 30px;}
		.works-author .info .name{display: inline-block; width: 245px; font-size: 20px; color: #2c3e50; font-weight: bold;}
		.works-author .info .intro{width: 245px; color: #bdc3c7;}
		.works-author .info .num{width: 245px; color: #34495e;}
		.works-author .btn-group{float: left; width: 90px; padding: 40px 0;}
		.works-author .btn-group .btn-item{float: left; width: 88px; height: 28px; margin: 5px 0; border: 1px solid #bdc3c7; border-radius: 20px; font-size: 12px; color: #34495e; line-height: 28px; text-align: center;}
		.works-author .btn-group .btn-item i{margin-right: 5px; font-size: 14px; color: #34495e;}
		.works-author .more{float: right; /* width: 340px; */}
		.works-author .more .item{float: right; width: 160px; height: 120px; margin-left: 10px;}
		.comment-form{margin: 20px;}
		.comment-form textarea{width: 100%; height: 115px; padding: 18px; color: #6d6d6d; margin: 0; font-size: 14px; border: 1px solid #e4e9ed; -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;}
		.comment-warn{position: absolute; right: 15px; top: 85px; font-size: 12px; color: #bdc3c7;}
		.mtm{margin-top: 10px !important;}
		.uiem-btn{z-index: 2; position: relative; width: 77px; height: 40px; font-size: 12px; color: #3499da; line-height: 43px; cursor: pointer;}
		.uiem-btn .icon-face{float: left; margin-left: 15px; line-height: 40px; margin-right: 3px; font-size: 18px; color: #3499da;}
		.comment-warn span{color: #f39c12; font-weight: bold;}
		.comment-code{width: 148px; height: 40px; overflow: hidden;}
		.comment-code-input{width: 100px; height: 28px; margin-left: 15px; margin-right: 10px; border: 1px solid #ccc; padding: 5px 10px; font-size: 14px;}
		.btn{display: inline-block; padding: 10px 20px; height: 40px; height: 20px; line-height: 1.42857143; line-height: 20px; letter-spacing: 1px; font-size: 14px; text-align: center; white-space: nowrap; vertical-align: middle; cursor: pointer; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; background-image: none; border: none; border-radius: 2px;}
		.btn-primary{color: #fff; background-color: #3498db;}
		.comment-form .btn{padding: 0; border-radius: 0; width: 100px; height: 40px; line-height: 40px;}
		.comment-tip{margin-right: 15px; font-size: 14px; color: #bdc3c7; line-height: 40px;}
		.comment-main > li{position: relative; min-height: 90px; padding: 20px; transition: all .2s;}
		.comment-num{position: relative; float: left; width: 43px; height: 73px; margin: 0 20px 0 42px; /* overflow: hidden; */}
		.avatar-sm{display: inline-block; width: 60px; height: 60px;}
		.comment-cont{float: left; /* width: 670px; */ margin-left: 20px;}
		.comment-cont .user{margin-bottom: 2px;}
		.comment-cont .user a{font-size: 14px; color: #95a5a6; font-weight: bold;}
		.comment-cont .user time{margin-left: 15px; font-size: 12px; color: #bdbdbd;}
		.comment-cont .text{font-size: 16px; color: #34495e; line-height: 26px; overflow: hidden;}
		.comment-cont .oper{margin-top: 15px; height: 30px; line-height: 30px;}
		.comment-cont .oper a{float: left; padding: 0 22px; font-size: 12px; color: #34495e;}
		.comment-cont .oper a.p-replay{padding-left: 0;}
		.comment-cont .oper a.comment-toggle{line-height: 28px;}
		.comment-cont .oper-hide{display: none;}
		.comment-cont .oper a.comment-toggle i{display: inline-block; margin-right: 5px; color: #34495e; line-height: 30px; float: left;}	
		/* 内容区域  end */
	</style>
	<body>
		<!-- 顶部导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/header.jsp"%>
		<!-- 顶部导航  end -->
		
		<!-- 左侧导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/left.jsp"%>
		<!-- 左侧导航  end -->
		
		<!-- 内容区域  start -->
		<div id="mainWrap">
			<div id="wrapper" class="wpn mtv mbv cl">
				<div class="main works-main">
					<div class="works-top cl pos">
						<div class="left">
							<h1 id="p-title">
								<strong>遇见·曾经的你-GSMIKE</strong>
							</h1>
							<div class="det cl">
								<span class="tag">原创作品</span>
								<span class="txt-gray1">分类：</span>
								<a class="txt-primary z" href="/list.html?subcatid=4" title="" target="_blank">移动应用界面/主题</a>
								<span class="txt-gray1">版权：</span>
								<div class="copyright pos">
									<i class="iconfont icon-copyright2"></i>
									<span class="text">保留作者信息</span>
								</div>
								<div class="copyright pos">
									<i class="iconfont icon-copyright3"></i>
									<span class="text">禁止商业使用</span>
								</div>
								<div class="copyright pos">
									<i class="iconfont icon-copyright5"></i>
									<span class="text">修改作品禁止更改版权信息</span>
								</div>
							</div>
							<div class="det cl">
								<div class="msg z cl">
									<span><i class="iconfont icon-iconeye" title="浏览数"></i><em class="ll_number">579</em></span>
									<span><i class="iconfont icon-iconstar" title="收藏数"></i><em class="sc_number">4</em></span>
									<span><i class="iconfont icon-leaf" title="点赞数"></i><em class="dz_number">34</em></span>
									<span><i class="iconfont icon-comment" title="评论数"></i><em id="ping-num" class="pl_number">4</em></span>
								</div>
								<span class="time"><i class="iconfont icon-icontime"></i><em>2016-12-17</em></span>
							</div>
						</div>
						<div class="right">
							<div class="hot">
								<i class="iconfont icon-iconhot"></i>
								<span class="num">34.2<strong>。</strong></span>
							</div>
							<h3><a href="http://activity.ui.cn/baidu2016.html" target="_blank">《百度输入法第二届特技皮肤大赛》-参赛作品</a></h3>
						</div>
						<div class="tag-star tag-star1" title="首页推荐"><img src="${basePath}/resources/imgs/contentDetail/tag-star1.png" alt="首页推荐"></div>
					</div>
					<!-- .works-top -->
			
					<div class="works-cont editor-style ui-theme" id="p-content">
					<p style="width: 600px; margin: 0px auto;"></p>
					<p style="width: 600px; margin: 0px auto;">“小五语音情书”这个H5是这样创作出来的</p>
					<p style="width: 600px; margin: 0px auto;"></p>							
					<p style="text-align: center; margin: 40px auto;">
						<img alt="Image title" class="fr-fil fr-dib" src="${basePath}/resources/imgs/index/1059537.png" width="900" style="display: inline-block;">
					</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;">嗨，大家好，我是“H5案例分享”公众号的<span style="color: #E74C3C;">小五</span>，上面这个H5案例叫“<span style="color: #E74C3C;">小五语音情书</span>”，这次就分享这支H5的<span style="color: #E74C3C;">生产过程</span>。</p><p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;">这支H5在（春节、情人节）时上线，效果很不错，这次我来个<span style="color: #E74C3C;">创作全解析</span>：从创意、策划，到设计、开发，再到上线、传播，最后的数据及效果，给大家分享一个关于“爱情”的故事。</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;">如果还没有体验过“小五情书”的读者，可以点击微信公众号“H5案例分享”底部第一个菜单“小五情书”，根据反馈的文字回复“<span style="color: rgb(231, 76, 60); font-size: 20px;">520</span>”，即可以体验。</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;">不啰嗦，开始啦：</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: rgb(231, 76, 60); font-size: 20px;">00 背景</span></p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;">“H5案例分享” 微信公众号从2015年7月开创，坚持每天分享至少1个创意H5案例，到2016年底，已经累积了近<span style="color: #E74C3C;">100000</span>粉丝。</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="text-align: center; margin: 40px auto;">
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;">&nbsp;为让用户能持续的通过这个号，方便获取“高质创意H5案例”和H5相关干货，小五做了一些工作：</p>
					<p style="width: 600px; margin: 0px auto;">①&nbsp;&nbsp;&nbsp;成立了<span style="color: #E74C3C;">8个微信群</span>（案例分享、公开课）；</p>
					<p style="width: 600px; margin: 0px auto;">②&nbsp;&nbsp;&nbsp;上线了<span style="color: #E74C3C;"><a href="http://h5-share.com" rel="nofollow" target="_blank">h5-share.com</a>网站</span>：可以搜“创意H5”；</p>
					<p style="width: 600px; margin: 0px auto;">③&nbsp;&nbsp;&nbsp;上线了<span style="color: #E74C3C;">语音搜</span>：跟公众号语音说一个关键词，返回“创意H5”；</p>
					<p style="width: 600px; margin: 0px auto;">④&nbsp;&nbsp;&nbsp;开通了<span style="color: #E74C3C;">投稿</span>：不管是个人，还是公司，只要H5优质，小五就会接收。可以将H5链接发到<span style="color: #E74C3C;">邮箱：tougao@h5-share.com</span>，也可以从我们的网站/公众号入口提交。</p>
					<p style="width: 600px; margin: 0px auto;">&nbsp;</p><p style="width: 600px; margin: 0px auto;"><span style="color: #E74C3C;">问题来了</span></p>
					<p style="width: 600px; margin: 0px auto;">如何在过节（春节、情人节）的时候，跟粉丝互动一下，让关注很久的老粉活动一下筋骨？</p>
					<p style="width: 600px; margin: 0px auto;">&nbsp;</p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: rgb(231, 76, 60); font-size: 20px;">01 目标</span></p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: #E74C3C;">只促活，不拉新。</span></p>
					<p style="width: 600px; margin: 0px auto;">目标用户：</p><p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;">&nbsp;活跃已关注“H5案例分享”（微信公众号：h5-share）的粉丝用户；</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;">“H5案例分享”微信群里的用户；</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;">“H5案例分享”网站（http://www.h5-share.com）的用户。</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;">&nbsp;</p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: rgb(231, 76, 60); font-size: 20px;">02 创意及策划</span></p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;">简单解释一下“创意”和“策划”：</p>
					<p style="width: 600px; margin: 0px auto;">创意：一个idea，这个idea的目的和大体思路；</p>
					<p style="width: 600px; margin: 0px auto;">策划：将“创意”分解到每一屏，每一个元素和逻辑。</p>
					<p style="width: 600px; margin: 0px auto;"><br></p><p style="width: 600px; margin: 0px auto;">以“小五语音情书”H5为例：</p>
					<p style="width: 600px; margin: 0px auto;">创意：以“语音情书”的形式展现，让用户看情书、听声音，感受陪伴和爱；</p>
					<p style="width: 600px; margin: 0px auto;">策划：</p>
					<p style="width: 600px; margin: 0px auto;">p0-Loading加载；</p>
					<p style="width: 600px; margin: 0px auto;">p1-情书信封；</p>
					<p style="width: 600px; margin: 0px auto;">p2-语音情书；</p>
					<p style="width: 600px; margin: 0px auto;">p3-未关注用户看到格式</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;">小五选的策划工具是：<span style="color: #E74C3C;">Axure RP Pro7.0</span></p>
					<p style="width: 600px; margin: 0px auto;">策划稿大致长这个样子：</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: #E74C3C;">策划思路：</span></p>
					<p style="width: 600px; margin: 0px auto;">以“小五语音情书”为主题，用&nbsp;“小五”“语音”“情书”三个点来引起大家兴趣，大家在体验“情书”的过程中，再生成“荣誉证书”，不期分享，只要用户认真读完，就能产生两点效果：</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: #E74C3C;">大家用行动证明了“陪伴”；</span></p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: #E74C3C;">真爱小五（爱，就深爱，不爱，才离开）；</span></p>
					<p style="width: 600px; margin: 0px auto;"><br></p><p style="width: 600px; margin: 0px auto;">&nbsp;</p>
					<p style="width: 600px; margin: 0px auto;">如果有未关注公众号的用户通过分享链接进入这支H5，因为<span style="color: #E74C3C;">微信静默授权调不起来</span>，所以无法正常展现（细节会在后面的“开发”部分说明），就给一个关注公众号的引导页面。</p>
					<p style="width: 600px; margin: 0px auto;">&nbsp;</p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: #E74C3C;">关于小五</span></p>
					<p style="width: 600px; margin: 0px auto;">“H5案例分享”微信号的客服人员，不管是公众号粉友，还是微信群里的群友，还是网站上的网友，一直以来，都在猜测Ta是男生还是女生，我们团队一直没有正面回答过这个问题，所以，大量粉丝一直存疑，“好奇心”驱使，会使用户/粉丝去看下“熟悉又陌生”的小五在搞什么鬼。</p>
					<p style="width: 600px; margin: 0px auto;">&nbsp;</p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: #E74C3C;">关于语音</span></p>
					<p style="width: 600px; margin: 0px auto;">排除上面好奇心的因素，主要考虑比文字、图片更形象的交互方式，一是语音，一是视频，后者被小五直接拒绝，所以，用小五好听的声音，也是不错的一种选择。</p>
					<p style="width: 600px; margin: 0px auto;">&nbsp;</p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: #E74C3C;">关于情书</span></p>
					<p style="width: 600px; margin: 0px auto;">诉情点有4个：</p><p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: #E74C3C;">陪伴</span>，通过微信静默授权，获取用户昵称、头像、关注时间，参与感和时间，让用户</p>
					<p style="width: 600px; margin: 0px auto;">感觉到温度，“关注天数”会让用户惊叹时间的无声无息，转眼已关注400多天；</p>
					<p style="width: 600px; margin: 0px auto;"><br></p><p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: #E74C3C;">信+声音</span>，静静的文字流淌在信纸上，小五一直觉得很亲切，像情人在安静的倾诉，而你一直在静听；打破安静，来段语音，好像更活泼和生动，使看信的人心情更近一步；</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: #E74C3C;">荣誉证书</span>，根据关注天数，生成带用户昵称的荣誉证书，荣誉感和仪式感满满。证书直接采用lol英雄联盟的等级+延展；</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;"><span style="color: #E74C3C;">互动，</span>调研用户想与小五做哪些事情（找H5，做H5，学H5，推H5），用户点选后，进入落款；</p>
					<p style="width: 600px; margin: 0px auto;"><br></p>
					<p style="width: 600px; margin: 0px auto;">&nbsp;</p>
					</div>
			        <!-- .works-cont -->
			
					<ul class="works-tag">
						<li>
							<a href="http://s.ui.cn?keywords=移动应用界面" target="_blank">
								<i class="iconfont icon-tag"></i>
								<span>移动应用界面</span>
							</a>
						</li>
						<li>
							<a href="http://s.ui.cn?keywords=app" target="_blank">
								<i class="iconfont icon-tag"></i>
								<span>app</span>
							</a>
						</li>
						<li>
							<a href="http://s.ui.cn?keywords=ui" target="_blank">
								<i class="iconfont icon-tag"></i>
								<span>ui</span>
							</a>
						</li>
						<li>
							<a href="http://s.ui.cn?keywords=输入法" target="_blank">
								<i class="iconfont icon-tag"></i>
								<span>输入法</span>
							</a>
						</li>
						<li>
							<a href="http://s.ui.cn?keywords=你的名字" target="_blank">
								<i class="iconfont icon-tag"></i>
								<span>你的名字</span>
							</a>
						</li>
					</ul>
					<!-- works-tag -->
					
					<div class="works-bottom cl">
						<div class="share cl">
							<div class="weixin-box">
								<div id="qrcodeCanvas" style="display:inline-block"><canvas width="100" height="100"></canvas></div>
								<p style="top:-20px">打开微信“扫一扫”，将本文章分享到朋友圈</p>
								<a href="javascript:;"><i class="icon-close"></i></a>
							</div>
							<a href="javascript:;" id="share-sina"><i class="iconfont icon-weibo"></i></a>
							<a href="javascript:;"><i class="iconfont icon-weixin"></i></a>
							<a href="javascript:;" id="share-douban"><i class="iconfont icon-iconqq"></i></a>
							<p class="tip">快给朋友分享吧！</p>
						</div>
						<ul class="oper">
							<li>
								<a href="javascript:;" id="p-collect" data="add"><i class="iconfont icon-star-solid"></i><strong>收藏</strong></a>
								<p class="tip txt-center"><em id="favnum">4</em>人已收藏</p>
							</li>			
						</ul>
						<div class="works-zan pos cl">
							<a class="iconfont p-like z" href="javascript:;" data="like">
								<div class="cont">
									<i class="iconfont icon-zan flower"></i>
									<span class="txt">赞</span>
									<em class="num like-num">34</em>
								</div>
							</a>
							<!-- <a class="award y" href="javascript:;" data-target="#modal-pay" >
								<div class="cont2">
									<i class="icon-renminbi"></i>
									<span class="txt">打赏一下</span>
									<em class="num like-num"></em>
								</div>
							</a> -->
						</div>
					</div>
					<!-- works-bottom -->
			
					<div class="works-author cl">
						<a href="http://i.ui.cn/ucenter/85963.html" target="_blank" class="avatar-md z">
							<img src="${basePath}/resources/imgs/contentDetail/85963.gif" alt="">
						</a>
						<div class="info z">
							<div>
			                    <h1></h1>
								<h1><a href="http://i.ui.cn/ucenter/85963.html" target="_blank" class="name ellipsis" id="p-author">gsmike</a></h1>
								<p class="intro ellipsis">dribbble.com/gsmike</p>
								<p class="num"><em id="fan_num">4149</em>粉丝/<em>1</em>关注</p>
								<div class="medal ellipsis">
									<!-- <img src="http://img.ui.cn/data/upload/201404/1397973361_587.png" title="原创小生" alt="原创小生">	 -->					
								</div>				
							</div>
						</div>
						<div class="btn-group cl">
							<a class="btn-item letter_num" href="javascript:;" data-target="#modal-letter"><i class="iconfont icon-envelope"></i><span>私信</span></a>
						</div>
						<div class="more">
							<!-- 该作者更多作品 -->
							<a class="item" href="/detail/186732.html" target="_blank">
								<img src="http://img.ui.cn/data/file/6/9/8/882896.jpg" alt="致真我-奥迪A7创意海报设计">
							</a>
						</div>
					</div>
					<!-- works-author -->
					
					<!-- 评论 -->
					<form id="comment" class="comment-form pos" method="POST" onsubmit="return false">
						<textarea id="textarea" class="comment-area" name=""></textarea>
						<p class="comment-warn">还可以输入<span id="com-num">500</span>个字</p>
						<div class="mtm cl pos">
							<div id="btn" class="uiem-btn z"><i class="iconfont icon-face"></i>表情</div>
							<input style="display:none;" id="rcode" class="comment-code-input z" name="code" type="text">
							<span class="comment-code z" id="vcode" style="display:none;">
								<img src="/code" onclick="this.src='/code?'+Math.random()" alt="验证码" title="点击刷新">
							</span>
							<input name="iscode" type="hidden" id="iscode" value="0">						
							<button class="btn btn-primary y" id="p-comment">评论</button>
							<span class="comment-tip f12 y">Ctrl+Enter</span>
						</div>
					</form>
					<!-- comment-form -->		
					<!-- 精彩评论 -->
					
					<!-- 全部评论 -->
					<ul class="comment-main cl zbd_item" id="com-list">		
						<li class="item cl" id="com-244046">
							<!-- <div class="comment-num">
								<i class="icon-hexagon-up up com-like" id="244046" rel="277081" data="add">						
									<a class="num" href="javascript:;">0</a>
								</i>
								<i class="icon-hexagon-down down com-report on" id="244046" rel="277081" data="del"></i>						
								<span class="comment-num-down on">1</span> 
							</div>-->
							<a class="avatar-sm z" title="Honling" href="http://i.ui.cn/ucenter/277081.html">
								<img src="${basePath}/resources/imgs/user/small.png" alt="Honling">
							</a>
							
							<div class="comment-cont comment-data">
								<h5 class="user"><a href="http://i.ui.cn/ucenter/277081.html">Honling</a>
		                        	<time>12-17 18:12</time>
		                        </h5>
								<p class="text">撒花撒花</p>
								<div class="oper cl">
									<a class="comment-toggle p-replay" href="javascript:;" id="244046" _rel="277081">
										<i class="iconfont icon-comment"></i>回复
									</a>
									<a href="javascript:;" rel="Honling" class="com-sina">分享</a>
									<span class="oper-hide">
										<a href="javascript:;" id="c-244046" rel="244046" data-target="#modal-inform">举报（<em>0</em>）</a>														
									</span>
								</div>
								<form id="comment_inner" class="comment-form comment-form-inner pos" action="" style="display: none;">
									<textarea id="textarea_inner" class="comment-area" name=""></textarea>
									<p class="comment-warn">还可以输入<span id="rep-num">500</span>个字</p>
									<div class="mtm cl">
										<div class="uiem-btn z btn_inner"><i class="icon-face"></i>表情</div>
										<button class="btn btn-primary btn-fixed-100 y" id="rep-comment">回复</button>
										<a class="comment-tip y del-comment" href="javascript:;">取消</a>
									</div>
								</form>
							</div>
							<!-- comment-cont -->
						</li>
					</ul>
					<!-- comment-main -->
				</div>
				<!-- main works-main -->
			
				<div class="aside pos">
					<div class="works-author-aside cl fixed1" style="position: static;"><!-- 上半部分-->
						<div class="zbd_warp pos cl">
							<p class="zbd_portrait">
								<a href="http://i.ui.cn/ucenter/85963.html" title="gsmike" target="_blank">
									<img src="${basePath}/resources/imgs/contentDetail/85963.gif" alt="gsmike">
								</a>
							</p>
							<p class="zbd_name">
								<a href="http://i.ui.cn/ucenter/85963.html" target="_blank">gsmike</a>
								<a class="fuceng" href="http://cert.ui.cn?from=nb" title="UI中国待认证NB设计师"><i class="icon-certified2 certg rote180"></i></a>                                        				
							</p>
							<p class="zbd_introduce">dribbble.com/gsmike</p>
							<div class="zbd_medal">
								<img src="http://img.ui.cn/data/upload/201404/1397973018_537.png" title="分享帝" alt="分享帝">
								<img src="http://img.ui.cn/data/upload/201506/1433393373_708.png" title="“劳模勋章”之蒲公英勋章" alt="“劳模勋章”之蒲公英勋章">
								<img src="http://img.ui.cn/data/upload/201404/1397973361_587.png" title="原创小生" alt="原创小生">					
							</div>				
							<div class="Occupying"></div>
							<div class="zbd_foot">
								<a class="zbd_left z" href="http://i.ui.cn/fans.html?id=85963&amp;act=fans" title="粉丝">
									<em>粉丝</em><b id="fan-num">4149</b>
								</a>
								<a class="zbd_right z" href="http://i.ui.cn/fans.html?id=85963&amp;act=follow" title="关注">
									<em>关注</em><b>1</b>
								</a>
							</div>
							<!-- /*加关注*/ -->
							<div class="zbd_focus pos">
								<a href="javascript:;" class="z_follow" rel="myfollow" data="follow">
									<i class="iconfont icon-add"></i>
								</a>									
							</div>
						</div>
						<!-- 	点赞评论 -->
						<div class="zbd_comments cl pos">
							<a class="zbd_one z arrow-left p-like zan-num" href="javascript:;" data="like">
								<b>赞</b><em class="l-num">34</em>				
							</a>
							<a class="zbd_two z ping-num" href="javascript:;" title="">
								<b>评论</b><em id="pinglun_num">4</em>
							</a>
							<!-- 小三角 -->
							<div class="arrow-shadow"></div>
						</div>
						<div class="zbd_write pos">
							<form action="" onsubmit="return false">
								<textarea class="zbd_txt" id="textcomment" placeholder="大神，帮我看看我的作品？"></textarea>
								<button class="zbd_btn btn" id="fast-com">发布评论</button>
							</form>
						</div>
					</div>
					<!-- 上半部分结束 -->
					
					<div class="uptop" style="position: absolute; top: 6297.56px; display: none;">
						<!-- 中部推荐 -->
						<div class="zbd_center works-look-aside">
							<!-- 相关推荐 -->
							<div class="rele">
								<h3>相关推荐</h3>
								<div class="img">
									<a href="/detail/193543.html" title="AR虚拟健身教练概念设计 | 附AE源文件" target="_blank" class="xg_num">
										<img src="http://img.ui.cn/data/file/9/4/5/915549.gif" alt="AR虚拟健身教练概念设计 | 附AE源文件">
										<div class="h-aside-show">
											<p>AR虚拟健身教练概念设计 | 附AE源文件</p>
				                        </div>
									</a>
								</div>
							</div>								
							<!-- 文章推荐 -->
							<div class="article">
								<h3 class="cl">小U妹文章推荐 
									<em class="y">
										<div class="cl" id="change">
											<i class="icon-refresh z"></i>
											<span class="z">换一换</span>
										</div>
									</em>
								</h3>					
								<div class="cont">
									<div class="top cl" id="hot">
										<div class="img z">
											<a href="/detail/195430.html" class="hot_num" title="近期动态产品包装合集 | 附过程分享" target="__blank">
												<img src="http://img.ui.cn/data/file/0/5/8/924850.gif" alt="近期动态产品包装合集 | 附过程分享">
											</a>
										</div>
										<div class="tit z">
											<div class="h1">
											<a href="/detail/195430.html" class="hot_num" title="近期动态产品包装合集 | 附过程分享" target="__blank">
												近期动态产品包装合集 | 附过程分享									
											</a>
											</div>
											<em class="time">2016-12-09</em>
										</div>
									</div>											
								</div>
							</div>
						</div>
					</div>
					<!-- 下半部分点赞评论结束 -->
				</div>
				<!-- aside works-aside -->
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
