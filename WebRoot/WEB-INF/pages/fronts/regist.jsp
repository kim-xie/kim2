<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>kim--注册</title>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<%@include file="/WEB-INF/pages/common/common.jsp"%>
	<link rel="stylesheet" type="text/css" href="${basePath}/resources/login/css/login.css" />

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
							<h1 style="color:#fff;font-size:40px;font-weight:600;">regist</h1>
						</div>
						<!--logo end-->
							
						<!--loginForm start-->
						<div id="form">
							<p class="animated bounceInLeft">
								<i class="iconfont icon-account left" id="icon_user"></i>
								<input type="text" placeholder="请输入用户名" class="input" maxlength="20" id="user" onblur="checkUser(this)" autofocus="autofocus">
								<i class="iconfont icon"></i>
							</p>
							
							<p class="animated bounceInRight">
								<i class="iconfont icon-icon16 left" id="icon_pwd"></i>
								<input type="password" placeholder="请输入密码" class="input" maxlength="16" id="pwd">
								<i class="iconfont icon"></i>
							</p>
							
							<!-- <p class="animated bounceInRight">
								<i class="iconfont icon-icon16 left" id="icon_confpwd"></i>
								<input type="password" placeholder="请输入确认密码" class="input" maxlength="16" id="confpwd">
								<i class="iconfont icon"></i>
							</p> -->
							
							<p class="animated bounceInLeft">
								<i class="iconfont icon-youxiang1 left" id="icon_email"></i>
								<input type="email" placeholder="请输入邮箱" class="input" maxlength="20" id="email" onblur="checkEmail(this)">
								<i class="iconfont icon"></i>
							</p>
							
							<!-- <p class="animated bounceInRight">
								<i class="iconfont icon-verify left" id="icon_vfy"></i>
								<input type="text" placeholder="请输入验证码" class="input" maxlength="5" id="vfy">
								<i class="iconfont icon"></i>
							</p> -->
							
							<p class="animated bounceIn mb10">
								<input id="login" type="button" value="注&nbsp;&nbsp;册" onclick="user.getRegist();">
							</p>
							
							<p class="animated rotateInUpRight mb0">
								<span class="login">
									<a href="${basePath}/login">已有账号?立即登录</a>
								</span>
							</p>
							
						</div>
						<!--loginForm end-->
						
					</div>
					<!--登录栏 end-->
				</div>
				
			</div>
		</div>
		<script src="${basePath}/resources/login/js/TweenLite.min.js"></script>
		<script src="${basePath}/resources/login/js/EasePack.min.js"></script>
		<script src="${basePath}/resources/login/js/demo-1.js"></script>
		<script src="${basePath}/resources/login/js/login.js"></script>
	</body>
</html>
