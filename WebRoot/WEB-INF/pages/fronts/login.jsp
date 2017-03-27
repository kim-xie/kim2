<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>kim--登录</title>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<%@include file="/WEB-INF/pages/common/common.jsp"%>
	<link rel="stylesheet" type="text/css" href="${basePath}/build/dev/css/login.css" />
	
	<%-- <link rel="stylesheet" type="text/css" href="${basePath}/resources/login/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${basePath}/resources/login/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="${basePath}/resources/login/css/component.css" />
	<link rel="stylesheet" type="text/css" href="${basePath}/resources/login/css/login.css" /> --%>
	
	<!--[if IE]><script src="js/html5.js"></script><![endif]-->
</head>
<body>
		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					<!--提示栏 start-->
					<div id="tip"></div>
					<!--提示栏 end-->
					
					<!--登录栏 start-->
					<div id="loginBox" class="animated bounceInDown">
						<!--logo start-->
						<div id="logo">
							<h1 style="color:#fff;font-size:40px;font-weight:600;">login</h1>
						</div>
						<!--logo end-->
							
						<!--loginForm start-->
						<div id="form">
							<p class="animated bounceInLeft">
								<i class="iconfont icon-account left" id="icon_user"></i>
								<input type="text" placeholder="请输入用户名" class="input" maxlength="20" id="user" onblur="blur(this)" onfocus="focus(this)" autofocus="autofocus">
								<i class="iconfont icon"></i>
							</p>
							
							<p class="animated bounceInRight">
								<i class="iconfont icon-icon16 left" id="icon_pwd"></i>
								<input type="password" placeholder="请输入密码" class="input" maxlength="16" id="pwd" onblur="blur(this)" onfocus="focus(this)">
								<i class="iconfont icon"></i>
							</p>
							
							<p class="animated bounceInLeft">
								<i class="iconfont icon-verify left" id="icon_vfy"></i>
								<input type="text" placeholder="请输入验证码" class="input" maxlength="5" id="vfy" onblur="blur(this)" onfocus="focus(this)">
								<i class="iconfont icon"></i>
							</p>
							
							<p class="animated bounceIn mb10">
								<input id='login' type='button' value="登&nbsp;&nbsp;录" onclick="user.getLogin();">
							</p>
							
							<p class='animated rotateInUpRight mb0'>
								<span class='regist'>
									<a href='${basePath}/regist'>立即注册</a>
								</span>
								<span class='pwd'>
									<a href='${basePath}/findPwd' target='_blank'>忘记密码?</a>
								</span>
							</p>
							
						</div>
						<!--loginForm end-->
						
					</div>
					<!--登录栏 end-->
				</div>
				
			</div>
		</div>
		<script src="${basePath}/build/dev/js/login.js"></script>
		<%-- <script src="${basePath}/resources/login/js/TweenLite.min.js"></script>
		<script src="${basePath}/resources/login/js/EasePack.min.js"></script>
		<script src="${basePath}/resources/login/js/rAF.js"></script>
		<script src="${basePath}/resources/login/js/demo-1.js"></script>
		<script src="${basePath}/resources/login/js/login.js"></script> --%>
		<script type="text/javascript">
		
			
		</script>
	</body>
</html>
