<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>

<!DOCTYPE HTML>
<html>
<head>
<title>信息板</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@include file="/WEB-INF/pages/common/common.jsp"%>
<style type="text/css">
	body {
		font-size: 10pt;
		color: #404040;
		font-family: SimSun;
	}
	
	.divBody {
		margin-left: 15%;
		margin-top:100px;
	}
	
	.divTitle {
		text-align: left;
		width: 900px;
		height: 25px;
		line-height: 25px;
		background-color: #efeae5;
		border: 5px solid #efeae5;
	}
	
	.divContent {
		width: 900px;
		height: 230px;
		border: 5px solid #efeae5;
		margin-right: 20px;
		margin-bottom: 20px;
	}
	
	.spanTitle {
		margin-top: 10px;
		margin-left: 10px;
		height: 25px;
		font-weight: 900;
	}
	
	a {
		text-decoration: none;
	}
	
	a:visited {
		color: #018BD3;
	}
	
	a:hover {
		color: #FF6600;
		text-decoration: underline;
	}
	/*footer start*/
	.footer{width:100%;height:50px;padding:20px 0;}
	.footer .copyright{width:1000px;height:50px;margin:0 auto;text-align:center;line-height:50px;color:#999;font-size:16px;}
	.footer .copyright a{color:#999;font-size:16px;}
	/*footer end*/
</style>

</head>

<body>

	<div class="divBody">
		<div class="divTitle">
			<span class="spanTitle">Kim技术分享平台</span>
		</div>
		<div class="divContent">
			<div style="margin: 20px;">
				<img src="${basePath}/resources/imgs/msg/cuohao.png" width="150" style="float:left; margin-right:30px;"/> 
				<span style="font-size:30px;color:#c30;font-weight:900;">激活失败,无效的激活码！</span>
				<br/> <br/> <br/> <br/> 
				<span style="margin-left:50px;">
					<a target="_top" href="<c:url value='/login'/>">登录</a>
				</span> 
				<span style="margin-left: 50px;">
					<a target="_top" href="<c:url value='/index'/>">主页</a>
				</span>
			</div>
		</div>
	</div>
	
	<!--footer start-->
	 <div class="footer">
		 <div class="copyright">
			<span title="Copyright" style="cursor:pointer;">Copyright ©</span>&nbsp;
			<a href="javascript:void(0)">2016</a> All rights by kim | 手写的从前
			<a href="javascript:void(0)">&nbsp;|&nbsp;联系邮箱:1134771121@qq.com</a>
		</div>
	 </div>
	 <!--footer end-->

</body>
</html>
