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
		#mainWrap{width:100%;height:100%;}
		.wpn{width:1180px;margin:0 auto;}
		.mtw{margin-top:20px !important;}
		.mtn{margin-top:5px !important;}
		.z{float:left !important;}
		.y{float:right !important;}
		.cl:before,.cl:after{content:" ";display:table}
		.cl:after{clear:both}
		.cl{*zoom:1}
		.show{display:block !important;}
		.hide{display:none !important;}
		.pos{position:relative;}
		.block{display:block;margin-left:auto;margin-right:auto;}
		.inblock{display:inline-block;}
		a{color:#2c3e50;}
		a:hover{color:#2980b9;}
		.bg-blue{background-color:#3498db!important;}
		.bg-purple{background-color:#9b59b6!important;}
		.bg-red{background-color:#e74c3c!important;}
		.main{float:left;width:940px;}
		.aside{float:right;width:220px;}
		.msg span{margin-right:10px;}
		.msg span i{font-size:18px;color:#9aabb8;margin-right:5px;}
		.msg span em{font-size:14px;color:#9aabb8;}
		.w280{width:280px;}
		.w820{width:820px;}
		.mbw{margin-bottom:20px !important;}
		
		/* 文章列表导航 start */
		.h-screen{float:left;margin-top:15px;}
		.h-screen li{position:relative;float:left;}
		.h-screen li a{display:block;height:40px;margin-right:25px;padding:0 20px;font-size:14px;color:#7c7c7c;line-height:40px;text-align:center;}
		.h-screen li a:hover{color:#3498db;}
		.h-screen li a .num{position:relative;display:inline-block;height:18px;line-height:18px;margin-left:10px;padding:0 3px;background-color:#3498db;font-size:12px;color:#fff;}
		.h-screen li a .num:after,.h-screen li a .num:before{content:"";width:0;height:0;position:absolute;border-style:solid;border-color:;}
		.h-screen li a .num:before{top:0;left:-6px;border-color:transparent #3498db transparent transparent;border-width:9px 6px 9px 0;}
		.h-screen li a .num:after{top:0;right:-6px;border-color:transparent transparent transparent #3498db;border-width:9px 0 9px 6px;}
		.h-screen li.on a{border:1px solid #3498db;border-radius:20px;font-weight:bold;color:#3498db;}
		.h-screen li.on a:hover{border-color:#3498db;}
		.h-screen li.on a .num{display:none;}
		.h-soup{position:relative;float:right;width:auto;height:40px;margin-top:15px;padding:0 10px 0 10px;background-color:#fff7e7;border-radius:20px;box-shadow:1px 1px 2px rgba(0,0,0,.2);}
		#feedroll{padding:5px 60px 5px 90px;height:30px;overflow:hidden;position:relative;}
		.vertical_area{-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;-o-user-select:none;user-select:none;position:relative;}
		.vertical_area i{color:#666;}
		.vertical_area i{display:block;text-align:center;cursor:pointer;position:absolute;}
		label{display:inline-block;max-width:100%;margin-bottom:5px;font-weight:bold;}
		#feedroll label{margin:0;top:0;left:0;padding-left:25px;width:80px;height:40px;line-height:40px;font-weight:normal;position:absolute;}
		#feedroll label i{top:0px;left:0;font-size:18px;color:#ccc;background:transparent;position:absolute;}
		#feedroll label span{padding-right:20px;}
		#feedroll #feed-box{height:30px;line-height:30px;}
		.horizonroll_area .horizonroll_box .horizonroll_plate,.vertical_area .verticalroll_box .verticalroll_plate{margin:0;overflow:hidden;position:relative;}
		#feedroll #feed-box #feed-plate li{max-width:1020px;height:30px;line-height:30px;overflow:hidden;}
		#feedroll #feed-box #feed-plate li em{color:#666;}
		#feedroll #feed-box #feed-plate li em,#feedroll #feed-box #feed-plate li span.feetime{float:left;}
		#feedroll #feed-box #feed-plate li span.feetime{color:#bbb;margin-right:10px;}
		#feedroll .verticalroll_btl{left:inherit;right:30px;top:14px;}
		#feedroll .verticalroll_btr{right:0px;top:11px;}
		#feedroll .verticalroll_btl,#feedroll .verticalroll_btr{width:31px;height:26px;font-size:29px;vertical-align:center;z-index:0;position:absolute;}
		#feedroll .verticalroll_btl:hover,#feedroll .verticalroll_btr:hover{color:#3498db!important;}
		#feedroll #feed-box #feed-plate li a{color:#3498db!important;}
		/* 文章列表导航 end */
		
		/* 文章列表 start */
		.post-works{margin-left:-20px;}
		.post-works li{width:280px;margin-left:20px;}
		.post-works .cover a{display:block;width:280px;height:210px;overflow:hidden;}
		.post li{position:relative;float:left;margin-bottom:15px;}
		.post li .cover img{-webkit-transform:scale(1);-moz-transform:scale(1);-ms-transform:scale(1);transform:scale(1);-webkit-transition:-webkit-transform 0.2s;-moz-transition:-moz-transform 0.2s;-ms-transition:-moz-transform 0.2stransition:transform 0.2s;}
		.post li:hover .cover img{-webkit-transform:scale(1.05);-moz-transform:scale(1.05);-ms-transform:scale(1.05);transform:scale(1.05);}
		.post li:hover .shade{opacity:1;filter:alpha(opacity=1);transition:all .2s;}
		.post .shade{opacity:0;filter:alpha(opacity=0);position:absolute;z-index:1;top:-16px;right:-14px;bottom:0;left:-14px;background-color:#fff;box-shadow:0 0 12px rgba(0,0,0,0.1);transition:all .2s;}
		.post .shade:after{content:"";position:absolute;top:-1px;right:-1px;bottom:-1px;left:-1px;border:1px solid rgba(0,0,0,0.05);}
		.post .cover{position:relative;z-index:2;}
		.post .info{position:relative;z-index:2;padding:5px 0 20px 0;height:75px;overflow:hidden;}
		.post .info .title{width:100%;font-weight:bold;color:#34495e;}
		.post .info .title.download{max-width:217px;}
		.post .info .title.download + .i-rar:after,.post .info .classify{float:left;height:20px;margin-right:10px;padding:0 5px;font-size:12px;color:#9aabb8;line-height:19px;text-align:center;background-color:#dfe5e9;border-radius:3px;}
		.post .info .msg{height:21px;overflow:hidden;}
		.post .info .msg span{margin-right:10px;display:inline-block;}
		.post .info .msg span i{color:#9aabb8;margin-right:5px;display:inline-block;vertical-align:middle;}
		.post .info .msg span em{font-size:14px;color:#9aabb8;display:inline-block;line-height:21px;vertical-align:middle;}
		.post .info .msg .slogan{height:21px;line-height:21px;font-size:12px;}
		.post .info .user{margin-top:7px;}
		.post .info .user.on a{color:#3498db;}
		.post .info .user a{display:block;height:20px;line-height:20px;}
		.post .info .user a img{float:left;width:20px;height:20px;border-radius:50%;}
		.post .info .user a .name{float:left;margin-left:10px;font-size:12px;display:inline-block;display:flex;align-items:center;}
		.post .info .user a .name em{float:left;margin-right:3px;}
		.post .info .user a .name i{margin-right:3px;}
		.post .info .user a .name img{width:14px;height:14px;margin-top:-2px;float:none;border-radius:0;}
		.post .line{width:100%;height:1px;background:#e2e8eb;position:absolute;bottom:0;}
		/* 文章列表 end */
		
		/*  */
		.h-tit{height:42px;line-height:42px;padding-bottom:5px;}
		.h-tit a{float:left;height:40px;margin-right:25px;padding:0 20px;font-size:14px;color:#7c7c7c;line-height:40px;text-align:center;transition:all 0s;}
		.h-tit a:hover{color:#3498db;}
		.h-tit a.on{border:1px solid #3498db;border-radius:20px;font-weight:bold;color:#3498db;}
		
		.h-article-list{width:100%;}
		.h-article-list li{padding:20px 0;border-bottom:1px solid #e0e7eb;position:relative;}
		.h-article-list li:hover h1 a{color:#2980b9}
		.h-article-list li:hover{border-bottom:1px solid #fff;}
		.h-article-list li.oe{border-bottom:1px solid #fff;}
		.h-article-list li:hover .shade{opacity:1;transition:all .2s;}
		.h-article-list li .shade{opacity:0;filter:alpha(opacity=0);position:absolute;z-index:1;top:0px;right:-25px;bottom:0;left:-23px;background-color:#fff;box-shadow:0 0 12px rgba(0,0,0,0.1);transition:all .2s;}
		.h-article-list li .shade:after{content:"";position:absolute;top:-1px;right:-1px;bottom:-1px;left:-1px;border:3px solid #3498db;}
		.h-article-list li .showd{position:relative;z-index:2;}
		.h-article-list li .showd .cover{float:left;display:block;width:160px;height:120px;}
		.h-article-list li .cover img{-webkit-transform:scale(1);-moz-transform:scale(1);-ms-transform:scale(1);transform:scale(1);-webkit-transition:-webkit-transform 0.2s;-moz-transition:-moz-transform 0.2s;-ms-transition:-moz-transform 0.2stransition:transform 0.2s;}
		.h-article-list li:hover .cover img{-webkit-transform:scale(1.05);-moz-transform:scale(1.05);-ms-transform:scale(1.05);transform:scale(1.05);}
		.h-article-info{position:relative;float:left;width:640px;margin-left:20px;}
		.h-article-info h1{margin:2px 0;}
		.h-article-info h1 span{float:left;display:block;max-width:450px;font-size:18px;font-weight:bold;}
		.h-article-info .tag{float:left;height:25px;margin:1px 5px 1px 0;padding:0 10px;font-size:12px;color:#fff;border-radius:2px;line-height:25px;}
		.h-article-info p{max-height:44px;overflow:hidden;margin-top:5px;color:#7f8c8d;}
		.h-article-info .avatar img{width:20px;height:20px;}
		.h-article-info .avatar .name{padding:0 15px;vertical-align:middle;font-size:12px;color:#394a58;font-weight:bold;line-height:21px;}
		.h-article-info .avatar .name img{border-radius:0;}
		.h-article-info .avatar .name:after{content:"";float:right;height:14px;margin:3px 20px 3px 0;border-right:1px solid #e0e7eb;}
		.h-article-info .data{position:absolute;top:5px;right:0;color:#bdbdbd;}
		.h-article-info .data i{margin-right:10px;color:#bdbdbd;font-size:14px;}
		.h-article-info .icon-certified2{font-size:12px;color:#e74c3c;vertical-align:middle;line-height:21px;}
		.h-tit-aside{height:40px;margin-bottom:17px;font-size:14px;color:#7c7c7c;line-height:40px;}
		.h-aside-list{box-shadow:0 1px 4px rgba(0,0,0,.5);}
		.h-aside-list li > a{display:block;width:280px;height:125px;}
		.h-aside-list .cover{width:280px;height:125px;}
		.h-aside-list + .more{display:block;margin:0 auto;width:43px;height:36px;background:url("${basePath}/resources/imgs/bg/arrow3.png") no-repeat center top;font-size:12px;color:#7f8c8d;text-align:center;line-height:28px;}
		.h-aside-show{opacity:0;visibility:hidden;padding:18px 50px 18px 25px;position:absolute;top:0;right:0;bottom:0;left:0;background-color:rgba(0,0,0,.6);transition:all .3s;}
		.h-aside-show .item{position:absolute;font-size:14px;color:#fff;}
		.h-aside-show .item:nth-child(1){bottom:18px;}
		.h-aside-show .item:nth-child(2){bottom:40px;}
		.h-aside-show .item:nth-child(3){bottom:62px;}
		.h-aside-show .item:nth-child(4){bottom:84px;}
		.h-aside-show .tip{position:absolute;right:20px;bottom:14px;font-size:12px;color:rgba(255,255,255,.5);text-align:center;}
		.h-aside-show .tip .num{display:block;width:34px;height:38px;font-size:44px;line-height:38px;text-align:left;font-style:italic;font-weight:bold;}
		.h-aside-show .tip .txt{font-size:22px;font-weight:bold;}
		.h-aside-list li > a:hover .h-aside-show{opacity:1;visibility:visible;}
		
		/* 热门标签 start */
		#tagbox{position:relative;margin:0 0px 20px 0px;width:280px;height:250px;box-shadow: 0 1px 4px rgba(0,0,0,.5);}
		#tagbox a{position:absolute;padding:5px 6px;font-family:Microsoft YaHei;color:#fff;TOP:0px;font-weight:bold;text-decoration:none;left:0px}
		#tagbox a:hover{border:#eee 1px solid;background:#000;}
		#tagbox .blue{color:blue}
		#tagbox .red{color:red}
		#tagbox .yellow{color:yellow}
		/* 热门标签 end */
		
		/* 分页  start */
		.h_page{display:table;margin:0 auto;width:auto;height:40px;}
		.h_page ul li{float:left;}
		.h_page ul li a{display:block;width:40px;height:40px;margin:0 10px;border:1px solid #bdc3c7;border-radius:50%;font-size:20px;color:#bdc3c7;text-align:center;line-height:38px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
		.h_page ul li a:hover,.h_page ul li a:hover{color:#2d3e4f;border-color:#2d3e4f;font-weight:bold;}
		.h_page ul li:last-child a{line-height:25px;}
		/* 分页  end */
		
		/* 内容区域  end */
	</style>
	<body style="background:#EFF3F5;">
	
		<input type="hidden" class="nav_model" value="首页">
		
		<!-- 顶部导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/header.jsp"%>
		<!-- 顶部导航  end -->
		
		<!-- 左侧导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/left.jsp"%>
		<!-- 左侧导航  end -->
		
		<!-- 内容区域  start -->
		<div id="mainWrap">
		
			<!-- banner start -->
			<div id="bannerWrap" style="width:1180px;height:350px;margin:0 auto;margin-top:80px;"></div>
			<!-- banner end -->
			
			<div class="wpn" id="project">
		        <!-- 文章列表导航start -->
		        <div class="cl pos">
		            <ul class="h-screen">
		                <li class="on"><a href="javascript:;" title="首页推荐">首页推荐</a></li>
		                <li><a href="javascript:;" title="佳作分享">佳作分享</a></li>                                   
		                <li><a href="javascript:;" title="最新作品">最新作品</a></li>                                       
		                <li><a href="javascript:;" title="我的关注">我的关注</a></li>            
		            </ul>
		            <ul class="h-soup cl">
		            	<div id="feedroll" class="vertical_area"> 
		            		<label><i class="iconfont icon-bullhorn"></i><span>前端动态：</span></label> 
		            		<div id="feed-box" class="verticalroll_box" style="display: block;"> 
		            			<ul id="feed-plate" class="verticalroll_plate" style="margin-top: -30px;">
		            				<li>
			            				<em>
			            					<a href="javascript:;" target="_blank" >哈哈哈哈</a> 拜读了
			            					<a href="javascript:;" target="_blank" >老姚</a> 的笔记 《
			            					<a href="javascript:;" class="link_blue" target="_blank">世界上最伟大的真理1</a>》
		            					</em>
		            					<span class="feetime">
		            						<span class="cm_datetime" >3&nbsp;分钟前</span>
	            						</span>
	            					</li>
		            				<li>
		            					<em>
				            				<a href="javascript:;" target="_blank">jinming1937</a> 访问了 
				            				<a href="javascript:;" target="_blank">大大大大糖糖</a> 的小屋。
				            			</em>
				            			<span class="feetime">
				            				<span class="cm_datetime">9&nbsp;分钟前</span>
			            				</span>
			            			</li>
			            			<li>
			            				<em>
			            					<a href="javascript:;" target="_blank" >741778231</a> 拜读了
			            					<a href="javascript:;" target="_blank" >老姚</a> 的笔记 《
			            					<a href="javascript:;" class="link_blue" target="_blank">世界上最伟大的真理</a>》
		            					</em>
		            					<span class="feetime">
		            						<span class="cm_datetime" >3&nbsp;分钟前</span>
	            						</span>
	            					</li>
	            					<li>
		            					<em>
				            				<a href="javascript:;" target="_blank">kimi</a> 访问了 
				            				<a href="javascript:;" target="_blank">大大糖糖</a> 的小屋。
				            			</em>
				            			<span class="feetime">
				            				<span class="cm_datetime">9&nbsp;分钟前</span>
			            				</span>
			            			</li>
			            			<li>
			            				<em>
			            					<a href="javascript:;" target="_blank" >哈哈哈哈</a> 拜读了
			            					<a href="javascript:;" target="_blank" >老姚</a> 的笔记 《
			            					<a href="javascript:;" class="link_blue" target="_blank">世界上最伟大的真理1</a>》
		            					</em>
		            					<span class="feetime">
		            						<span class="cm_datetime" >3&nbsp;分钟前</span>
	            						</span>
	            					</li>
	            					<li>
		            					<em>
				            				<a href="javascript:;" target="_blank">jinming1937</a> 访问了 
				            				<a href="javascript:;" target="_blank">大大大大糖糖</a> 的小屋。
				            			</em>
				            			<span class="feetime">
				            				<span class="cm_datetime">9&nbsp;分钟前</span>
			            				</span>
			            			</li>
	            				</ul> 
	            			</div> 
	            			<i class="verticalroll_btl iconfont icon-angleupcircle" onclick="goUp()"></i> 
	            			<i class="verticalroll_btr iconfont icon-angledowncircle" onclick="goDown()"></i> 
	            		</div>
		            </ul>
		        </div>
		        <!-- 文章列表导航end -->
		        
		        <!-- 文章列表start -->
		        <ul id="articleWrap" class="post post-works mtw cl"></ul>
		        <!-- 文章列表end -->
		        
		        <!-- 文章列表分页start -->
		        <div class="h_page mtn mbw">
	                <ul class="cl">
	                	<li><a class="on" href="javascript:;">1</a></li>
	                	<li><a href="javascript:;">2</a></li>
	                	<li><a href="javascript:;">3</a></li>
	                	<li><a href="javascript:;" target="_blank">...</a></li>
	                </ul>            
		        </div>
		        <!-- 文章列表分页end -->
		     </div>
		
			<div class="bg-white" id="article">
			    <div class="wpn cl">
			    	<!-- 左侧部分 start -->
			        <div class="w820 z">
			            <h1 class="h-tit mtv h-article-btn pos">
			                <a class="on" href="javascript:;" title="推荐文章">推荐文章</a>
			                <a href="javascript:;" title="最新文章">最新文章</a>            
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
		                                            <span class="tag bg-blue" target="_blank" href="javascript:;">经验观点</span>
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
		                                                <span><i class="iconfont icon-Love"></i><em>456</em></span>
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
		                                            <span class="tag bg-blue" target="_blank" href="javascript:;">设计教程</span>
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
		                                                <span><i class="iconfont icon-Love"></i><em>109</em></span>
		                                            </div>
		                                        </div>
		                                        <div class="data"><i class="iconfont icon-time"></i>3-2 09:52</div>
		                                    </div>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="cl">
		                            <a href="javascript:void(0)" title="2017年，UI设计风格预测。" target="_blank">
		                                <div class="shade"></div>
		                                <div class="showd">
		                                    <span class="cover">
		                                        <img width="160" height="120" src="${basePath}/resources/imgs/index/1046463.png" alt="2017年，UI设计风格预测。" rel="nofollow">
		                                    </span>
		                                    <div class="h-article-info">
		                                        <h1 class="cl">
		                                            <span class="tag bg-blue" target="_blank" href="javascript:;">经验观点</span>
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
		                                                <span><i class="iconfont icon-Love"></i><em>456</em></span>
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
		                                            <span class="tag bg-blue" target="_blank" href="javascript:;">设计教程</span>
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
		                                                <span><i class="iconfont icon-Love"></i><em>109</em></span>
		                                            </div>
		                                        </div>
		                                        <div class="data"><i class="iconfont icon-time"></i>3-2 09:52</div>
		                                    </div>
		                                </div>
		                            </a>
		                        </li>
		                    </ul>
		                    
			                <div class="h_page mtw mbw">
			                    <ul class="cl">
			                    	<li><a class="on" href="javascript:;">1</a></li>
			                    	<li><a href="javascript:;">2</a></li>
			                    	<li><a href="javascript:;">3</a></li>
			                    	<li><a href="javascript:;" target="_blank">...</a></li>
			                    </ul>                
			               </div>
			               
			            </div>
			        </div>
			        <!-- 左侧部分 end -->
			        
			        <!-- 右侧部分 start -->
			        <div class="w280 y mtv">
			            <h1 class="h-tit-aside">点击排行</h1>
			            <ul class="h-aside-list">
			                <li class="pos">
		                        <a href="javascript:;" target="_blank">
		                            <img class="cover" width="280" height="125" src="" alt="" rel="nofollow">
		                            <div class="h-aside-show">
		                                <p class="item ellipsis">[上海市] 高级UI设计师 [18k-30k]</p>
		                                <p class="item ellipsis">[上海市] 设计助理（实习） [3k-5k]</p>                            
		                            </div>
		                        </a>
		                    </li>
		                    <li class="pos">
		                        <a href="javascript:;" target="_blank">
		                            <img class="cover" width="280" height="125" src="" alt="" rel="nofollow">
		                            <div class="h-aside-show">
		                                <p class="item ellipsis">[上海市] 视觉设计师 [10k-25k]</p>
		                                <p class="item ellipsis">[上海市] 高级交互设计师 [15k-25k]</p>                            
		                            </div>
		                        </a>
		                    </li>
		                    <li class="pos">
		                        <a href="javascript:;" target="_blank">
		                            <img class="cover" width="280" height="125" src="" alt="" rel="nofollow">
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
			            <div id="tagbox">
							<a href="javascript:;">HTML/CSS</a> 
							<a class="red" href="javascript:;">javaScript</a> 
							<a href="javascript:;">Node.js</a> 
							<a href="javascript:;">手机移动</a> 
							<a class="blue" href="javascript:;">java</a> 
							<a href="javascript:;">Mysql</a> 
							<a class="red" href="javascript:;">Oracle</a> 
							<a class="yellow" href="javascript:;">mongodb</a> 
							<a href="javascript:;">react.js</a> 
							<a class="red" href="javascript:;">angular.js</a> 
							<a href="javascript:;">vue.js</a> 
							<a class="blue" href="javascript:;">性能优化</a> 
							<a class="blue" href="javascript:;">前端安全</a>
							<a class="red" href="javascript:;">类库框架</a> 
							<a class="yellow" href="javascript:;">面试经验</a>
							<a class="yellow" href="javascript:;">浏览器</a> 
						</div>
			        </div>
			        <!-- 右侧部分 end -->
			    </div>
		    </div>
		
		</div>
		<!-- 内容区域  end -->
		
		<!-- 底部导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/footer.jsp"%>
		<!-- 底部导航  end -->
		<script type="text/javascript" src="${basePath}/resources/kimUtils/banner/banner.js"></script>
		<script type="text/javascript" src="${basePath}/resources/js/script.js"></script>
		<script type="text/javascript"> 
		
			$(function(){
				loadArticles();
			});
			
			
			//加载文章列表
			function loadArticles(){
				var param = {pageNo:'0',pageSize:'8'};
				$.ajax({
					type: "post",
					url: basePath+"/article/template",
					data: param,
					success:function(data){
						var $data = $(data);
						$("#articleWrap").html($data);
					}
				});
			}
		
			//初始化banner
			$("#bannerWrap").kimBanner({
				imgSrc: ["${basePath}/resources/imgs/banner/ui1.png","${basePath}/resources/imgs/banner/ui2.png","${basePath}/resources/imgs/banner/ui3.jpeg","${basePath}/resources/imgs/banner/ui4.jpeg","${basePath}/resources/imgs/banner/ui5.png"],
				imgUrl: ["javascript:viod(0);","javascript:viod(0);","javascript:viod(0);","javascript:viod(0);","javascript:viod(0);"],
				imgTitle: ["第一张图","第二张图","第三张图","第四张图","第五张图"]
			});
			
			
			//前端动态
			var feedUl = $("#feedroll #feed-plate");
			var feedLi = $("#feedroll #feed-plate li");
			var tabLen = feedLi.length-2;
			var index = 0 , nowTime = 0 ,timer = null;
			
			function goUp(){
				if(new Date()- nowTime > 600){
					nowTime = new Date();
					index--;
					feedUl.stop(true,true).animate({
						"margin-top":-(index+1)*30},500,function(){
								if(index < 0){
									feedUl.css("margin-top",-tabLen*30);
									index = tabLen-1;
								}
					});
				}
			}
			
			function goDown(){
				if(new Date()- nowTime > 600){
					nowTime = new Date();
					autoPlay();
				}
			}
			
			function autoPlay(){
				index++;
				feedUl.stop(true,true).animate({
					"margin-top":-(index+1)*30},500,function(){
							if(index == tabLen){
								feedUl.css("margin-top",-30+"px");
								index = 0;
							}
				});
			}
			//启动定时器
			timer = setInterval(autoPlay,3000);
			//鼠标进入清除定时
			$("#feedroll").mouseover(function(){
				clearInterval(timer);
			});
			//鼠标移出继续定时
			$("#feedroll").mouseout(function(){
				clearInterval(timer);
				timer = setInterval(autoPlay,3000);
			});
			
			
		</script>
	</body>
</html>
