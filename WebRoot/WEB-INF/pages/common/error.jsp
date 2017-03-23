<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>找不到页面</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="Author" content="kim">
		<meta name="Keywords" content="">
		<meta name="Description" content="">
		<%@include file="/WEB-INF/pages/common/common.jsp"%>
	</head>
    <style>
    	*{padding:0;margin:0;}
    	body{background:#007BC1;}
    	.wrap{width:100%;height:100%;overflow:hidden;margin:0 auto;}
    	.wrap .main{margin:12% auto;}
    	.wrap .main img{display:block;margin:0 auto;}
    	.wrap .main .button{width:184px;height:30px;line-height:30px;border:3px solid #fff;cursor:pointer;margin:20px auto;text-align:center;}
   		.wrap .main .button:hover{border-color:#1AD243;color:#1AD243;}
   		.wrap .main .button a{text-decoration:none;color:#fff;}
   
    </style>
	<body>
		<div class="wrap">
			<div class="main">
				<img alt="error" src="${basePath}/resources/imgs/error/404.png">
				<div class="button"><a href="${basePath}/admin/index">返回首页</a></div>
			</div>
			
		</div>
	</body>
</html>
