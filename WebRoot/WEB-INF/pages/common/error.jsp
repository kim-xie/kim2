<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<title>哎呀！页面不在了</title>
	<meta name="Keywords" content="关键词,关键词">
	<meta name="description" content="">
	<!--css,js-->
	<%@include file="/WEB-INF/pages/common/common.jsp"%>
	<style type="text/css">
		*{margin:0;padding:0;font-size:12px;font-family:"微软雅黑";}
		ul{list-style:none;}
		a{text-decoration:none;}
		img{border:0;}
		.bg{position:fixed;z-index:-999;top:0;left:0;width:100%;height:100%;}
		section{}
		.pic{width:374px;height:111px;margin:80px auto 50px;background:url("${basePath}/resources/imgs/error/404.png") no-repeat ;}
		.tip h2{position:relative;width:374px;height:32px;line-height:30px;margin:20px auto;text-align:center;font-size:20px;font-weight:normal;color:#fff;}
		h4{font-weight:normal;color:#fff;text-align:center;}
		.tip h2 i{position:absolute;top:0;left:25px;display:block;width:32px;height:32px;background:url("${basePath}/resources/imgs/error/ico.png") no-repeat ;}
		.sreach{position:relative;width:535px;height:212px;background:url("${basePath}/resources/imgs/error/search.png") no-repeat;margin:70px auto;}
		.sreach h3{padding-top:110px;text-align:center;font-size:16px;color:#fff;font-weight:normal;}
		.sreach h3 span, a{font-size:18px;color:#fff;}
		.sreach h3 a:hover{text-decoration:underline;}
		.sreach input{width:357px;height:35px;padding:0 60px 0 10px;margin-left:60px;margin-top:15px;font-size:14px;border-radius:5px;border:1px solid rgba(255,255,255,.15);box-shadow:0 0px 0px 1px rgba(0,0,0,.1) inset;text-shadow:0 1px 2px rgba(0,0,0,.1);}
		.sreach i{position:absolute;right:58px;bottom:36px;display:block;width:25px;height:25px;background:url("${basePath}/resources/imgs/error/ico.png") no-repeat 0 -43px}
	</style>
</head>
<body>
	<div class="bg">
		<img src="${basePath}/resources/imgs/error/bg.jpg" width="100%" height="100%" alt="bg">
	</div>
	<section>
		<div class="pic"></div>
		<div class="tip">
			<h2><i></i>哎呀…您访问的页面不存在</h2>
		</div>
		<div class="sreach">
			<h3>还有&nbsp;&nbsp;<span id="time">6</span>&nbsp;&nbsp;秒<a href="${basePath}/index">&nbsp;返回首页</a>，或者搜索网站相关信息</h3>
			<input type="text" placeholder="Search" autofocus="autofocus" maxlength="55">
			<a href="${basePath}/index"><i></i></a>
		</div>
	</section>
	<h4>kim提醒您 - 您可能输入了错误的网址，或者该网页已删除或移动</h4>
	<script type="text/javascript">
		var count = 50;
		window.onload = function(){
			setInterval(function(){
				count--;
				document.getElementById("time").innerHTML = count;
				if(count <= 1){
					window.location.href = basePath+"/index";
				}
			},1200);
		};
	</script>
</body>
</html>
