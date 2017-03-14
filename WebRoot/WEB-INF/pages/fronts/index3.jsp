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
		.user-pad {
		    height: 370px;
		    /* background: #eff2f5; */
		    min-width: 768px;
		}
		p {
		    word-wrap: break-word;
		    word-break: break-all;
		}	
		.cl {
		    zoom: 1;
		}
		.cl:after {
		    content: ".";
		    display: block;
		    height: 0;
		    clear: both;
		    visibility: hidden;
		}
		.mtm {
		    margin-top: 10px !important;
		}
		ul li, .ol li {
		    list-style: none;
		}
		.content {
		    width: 1180px;
		    margin: 0 auto;
		}
		.content {
		    margin: 0 auto;
		    max-width: 1260px;
		    width: 100%;
		}
		.content {
		    margin: 0 auto;
		    max-width: 1260px;
		    width: 100%;
		    min-width: 768px;
		}
		.user-pad ul {
		    display: block;
		    list-style: none;
		}
		.user-pad ul.user-pad-gr {
		    margin-top: 90px;
		    width: 150px;
		    float: left;
		    margin-left: 3.1746031%;
		}
		.user-pad ul.user-pad-gr li {
		    line-height: 30px;
		    color: #2c3e50;
		    font-size: 14px;
		    cursor: pointer;
		    display: flex;
		    display: -webkit-flex;
		    align-items: center;
		    -webkit-align-items: center;
		    /* text-indent: 35px; */
		}
		.user-pad ul {
		    display: block;
		    list-style: none;
		}
		.user-pad ul.user-pad-gr li {
		    line-height: 30px;
		    color: #2c3e50;
		    font-size: 14px;
		    cursor: pointer;
		    display: flex;
		    display: -webkit-flex;
		    align-items: center;
		    -webkit-align-items: center;
		    /* text-indent: 35px; */
		}
		.user-pad ul.user-pad-gr li i {
		    margin-right: 10px;
		}
		.dimgray {
		    color: #6B7B8A!important;
		}
		.fsi {
		    font-size: 20px!important;
		}	
		.user-pad ul.user-pad-avatar {
		    margin-top: 50px;
		    left: 50%;
		    margin-left: -210px;
		    position: absolute;
		    width: 420px;
		    /* overflow: hidden; */
		}
		li.us-name {
		    margin: 0;
		    padding: 0;
		}
		.user-pad ul.user-pad-avatar li.us-name {
		    width: 420px;
		    margin-top: 20px;
		    text-align: center;
		}
		.user-pad ul.user-pad-avatar li.us-quanquan {
		    margin: 0 auto;
		    width: 420px;
		    display: block;
		    margin-top: 10px;
		}
		.us-avatar {
		    display: block;
		}
		.us-avatar a {
		    display: block;
		    width: 148px;
		    height: 148px;
		    padding: 11px;
		    margin: 0 auto;
		}
		a {
		    color: #369;
		    outline: medium none;
		    text-decoration: none;
		    star: expression(this.onFocus=this.blur());
		}
		img, a img {
		    border: 0;
		}
		.user-pad ul.user-pad-avatar .us-avatar img {
		    /* margin-left: 140px; */
		    cursor: pointer;
		}		
		.user-pad ul.user-pad-avatar .us-avatar .us-avatar-img {
		    width: 148px;
		    height: 148px;
		    display: block;
		    border-radius: 148px;
		}
		.user-pad ul.user-pad-avatar li.us-name span.n1 {
		    font-size: 22px;
		    color: #2c3e50;
		    /* background: url(../img/bao.png) no-repeat right; */
		    display: inline;
		    /* margin-left: 17px; */
		    /* padding-right: 30px; */
		}
		.user-pad ul.user-pad-avatar li.us-name span.n2 {
		    font-size: 12px;
		    color: #2c3e50;
		    height: 14px;
		    line-height: 12px;
		    display: inline;
		    clear: both;
		    width: 420px;
		    text-align: center;
		    display: block;
		    overflow: hidden;
		}
		.user-pad ul.user-pad-avatar li.us-quanquan {
		    margin: 0 auto;
		    width: 420px;
		    display: block;
		    margin-top: 10px;
		}
		.user-pad ul.user-pad-avatar li.us-quanquan ul {
		    list-style: none;
		    height: 64px;
		    width: 420px;
		}
		.user-pad ul.us-focus {
		    list-style: none;
		    display: block;
		    float: right;
		    margin-top: 90px;
		    margin-right: 3.1746031%;
		}
		.user-pad ul.us-focus li {
		    display: inline-block;
		    height: 52px;
		    margin-left: 35px;
		}
		.user-pad ul.us-focus li a {
		    display: block;
		    color: #34495e;
		}
		.user-pad ul.us-focus li strong {
		    display: block;
		    font-size: 20px;
		    text-align: center;
		    color: #2c3e50;
		}
		.user-pad ul.us-focus li span {
		    display: block;
		    font-size: 14px;
		    text-align: center;
		    color: #b8c4ce;
		}
		.user-pad ul.us-focus li span {
		    display: block;
		    font-size: 14px;
		    text-align: center;
		}	
		.job-in {
		    display: block;
		    float: right;
		    width: 160px;
		    height: 30px;
		    line-height: 30px;
		    margin-top: 20px;
		    text-align: center;
		    color: #fff;
		    background-color: #3498db;
		    border-radius: 3px;
		    font-size: 14px;
		}
		.user-pad ul.us-focus .us-editinfo {
		    width: 160px;
		    height: 30px;
		    background: #b8c4ce;
		    color: #fff;
		    font-size: 14px;
		    cursor: pointer;
		    line-height: 30px;
		    border-radius: 3px;
		    float: right;
		    text-align: center;
		}
		
		
		/*  */	
		.us-nav-wp {
		    width: 100%;
		    /* background: url("../img/topnav-c.jpg") repeat-x 0 top; */
		}
		.us-nav-wp .us-nav-c {
		    max-width: 1180px;
		    margin: 0 auto;
		}
		ul.us-nav {
		    height: 60px;
		    border: #b8c4ce 1px solid;
		    border-radius: 3px;
		    background: #FFF;
		    margin: 0 auto;
		    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
		}
			
		.us-nav-wp .us-nav {
		    width: 68%;
		    margin: 0 auto;
		    display: -webkit-box;
		    display: -ms-flexbox;
		    display: -webkit-flex;
		    display: flex;
		}
		.us-nav-wp .us-nav {
		    height: 60px;
		    border: #b8c4ce 1px solid;
		    border-radius: 3px;
		    background: #FFF;
		    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
		}
		ul.us-nav li:first-child {
		    background: none;
		}
		.us-nav-wp .us-nav li {
		    display: inline-block;
		    float: left;
		    background: url("../img/topnavleft.png") no-repeat 0 0;
		    margin-left: -1px;
		    -webkit-box-flex: 1;
		    -ms-flex: 1;
		    -webkit-flex: 1;
		    flex: 1;
		}
		.us-nav-wp .us-nav li a {
		    display: block;
		    height: 57px;
		    line-height: 60px;
		}
		.us-nav-wp .us-nav li a {
		    font-size: 20px;
		    color: #369;
		    text-align: center;
		}
		ul.us-nav li a.on {
		    border-bottom: #67b2e4 3px solid;
		    color: #3499da;
		}
		.us-nav-wp .us-nav li a:hover, .us-nav-wp .us-nav li a.on {
		    border-bottom: #67b2e4 3px solid;
		    color: #3499da;
		}	
		
		/*  */	
		.Inspir-wp {
		    width: 1261px;
		    margin: 0 auto;
		}
		.copy_index_t {
		    height: 40px;
		    margin-top: 50px;
		    margin-left: 40px;
		    margin-right: 40px;
		}
		.c-l {
		    display: inline-block;
		    height: 40px;
		    text-align: center;
		    line-height: 40px;
		    padding: 0 17px;
		    font-size: 14px;
		    float: left;
		}
		.copy_index_t li:first-child {
		    padding-left: 0;
		}
		.c-l_c {
		    color: #3498db;
		}
		.c-l a {
		    float: left;
		}
		.c-l span {
		    color: #9aabb8;
		}
		.c-l ul {
		    float: left;
		    height: 40px;
		    margin-left: 17px;
		    display: none;
		}
		.c-l-i {
		    display: inline-block;
		    height: 40px;
		    text-align: center;
		    line-height: 40px;
		}
		.c-r {
		    float: right;
		    margin: 0 0 0 20px;
		}
		.user-button {
		    display: block;
		    width: 150px;
		    height: 40px;
		    background: #3498db;
		    color: #fff;
		    text-align: center;
		    color: #FFF !important;
		    font-size: 14px;
		    cursor: pointer;
		    line-height: 40px;
		    border: none;
		    border-radius: 2px;
		}
		
		.copy_index_t li:first-child {
		    padding-left: 0;
		}
		
		.Inspir-list {
		    display: block;
		    margin-left: -20px;
		}
		.Inspir-list {
		    display: block;
		    float: left;
		    margin-top: 15px;
		    width: 95.2380952%!important;
		    margin-left: 20px;
		    margin-bottom: 15px;
		}
		.Inspir-list li {
		    float: left;
		    margin-left: 20px;
		    height: 320px;
		    margin-bottom: 20px;
		    width: 280px;
		    position: relative;
		}
		.no-works {
		    background: url("${basePath}/resources/imgs/bg/no-works.jpg") center no-repeat;
		    height: 900px;
		    width: 100%;
		    display: block;
		    float: left;
		}

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
		<div id="mainWrap" style="margin-top:50px;">
			
			<div class="user-pad">
				<div class="content cl">
					<style>
						.user-pad ul.user-pad-gr li .study-num { color: #2c3e50; }
						.study_btn_user { display: block; width: 160px; height: 30px; font-size: 14px; color: #fff; line-height: 30px; text-align: center; background-color: #6b7b8a; border-radius: 5px; display: none;}
					</style>
			
					<ul class="user-pad-gr">
						<li>
							<ul>
								<!-- <li><i class="iconfont dimgray fsi">&#xe692;</i>654人气</li> -->
								<li><i class="iconfont dimgray fsi icon-point"><!-- &#xe62e; --></i>0积分</li>
								<li id="user-avatar-gr"><i class="iconfont dimgray fsi icon-card"><!-- &#xe649; --></i>个人名片</li>
							</ul>
						</li>
					</ul>
					<script type="text/javascript">
						$(document).ready(function(){
							$("#addIn").click(function(){
								var _u = parseInt($(this).attr("data-id"));
								if(_u){
									$.post("/cin",{u:_u},function(data){
										if(data.state){
											$("#addIn").text("已是学员");
											var _num = parseInt($("#stunum").text())+1;
											$("#stunum").text(_num);
											errorTip(data.msg,3);
										}else{
											errorTip(data.msg,3);
											return false;
										}
									},"json");
								}
							});
						});
					</script>
					<ul class="user-pad-avatar">
						<li>
							<p class="us-avatar cl">
								<a href="javascript:;" style="position: relative;">
									<img id="user-avatar" class="us-avatar-img" src="${basePath}/resources/imgs/user/small.png">
									<!--改版  --3.1杜文斌-->
									<!--<div class="imgup" style="position: absolute;width: 170px;height: 170px;background: red;opacity: 0.5;top: 0;left: 0;">
										<div class="imgup-nei"></div>
										<div class="imgup-wai"></div>
									</div>-->
								</a>
							</p>
						</li>
			                        
						<li class="us-name">
							<span class="n1">手写的从前								                                			                                        				</span>
							<span class="n2">这个人很懒什么都没写</span>
						</li>
						<li class="us-quanquan">
							<ul></ul>
						</li>
					</ul>
					<ul class="us-focus">
						<li><a href="/ucenter/953447.html"><strong>0</strong><span>作品</span></a></li>
						<li><a id="user-fans" href="/fans.html?id=953447&amp;act=fans"><strong>0</strong><span>粉丝</span></a></li>
						<li><a id="user-follow" href="/fans.html?id=953447&amp;act=follow"><strong>0</strong><span>关注</span></a></li>
						
						<div class="cl">
							<a class="job-in" href="http://uier.ui.cn/" target="_blank">我的简历</a>
						</div>			
						<div class="cl mtm">
							<!-- <span id="top-logout" class="us-ret">退出</span> -->
							<a href="http://account.ui.cn/basicinfo.html" class="us-editinfo" target="_blank" style="color:white;">修改资料</a>
						</div>
					</ul>
				</div>
			</div>
			
			<div class="us-nav-wp">
				<div class="us-nav-c">
			        <ul id="user_tabnav" class="us-nav">
			            <li>
							<a href="/ucenter/953447.html" class="on">作品</a>
						</li>
						<li>
							<a href="/ucenter/953447.html?act=msg">动态</a>
						</li>
						<li>
							<a href="/ucenter/953447.html?act=letter">私信</a>
						</li>
						<li>
							<a href="/ucenter/953447.html?act=fav">收藏</a>
						</li>
			        	<li>
			        		<a href="/ucenter/953447.html?act=theme">主题</a>
			        	</li>
			        </ul>
			    </div>
			</div>
			
			<div id="ajax-upload-work" class="content cl">
				<div class="Inspir-wp">
					<div class="copy_index_t" id="projecttype">
						<ul>
							<li class="c-l"><a href="javascript:;" class="c-l_c" id="all">全部<span>(1)</span></a></li>
							<li class="c-l">
								<a href="javascript:;" id="produc" rel="1">原创<span>(0)</span></a>
								<ul>
									<li class="c-l-i"><a href="javascript:;" id="yxpro" rel="2">作品<span>(0)</span></a></li>
									<li class="c-l-i"><a href="javascript:;" id="yxexp" rel="3">经验<span>(0)</span></a></li>
								</ul>
							</li>
							<li class="c-l">
								<a href="javascript:;" id="exp" rel="4">分享<span>(0)</span></a>
								<ul>
									<li class="c-l-i"><a href="javascript:;" id="fxpro" rel="5">作品<span>(0)</span></a></li>
									<li class="c-l-i"><a href="javascript:;" id="fxexp" rel="6">经验<span>(0)</span></a></li>
								</ul>
							</li>
							<li class="c-l"><a href="javascript:;" id="copy" rel="7">临摹<span>(1)</span></a></li>
							<li class="c-r"><a href="http://upload.ui.cn/work.html" target="_blank" class="user-button ">上传作品/经验</a></li>
						</ul>
					</div>
				</div>
				<div class="no-works"></div>
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
