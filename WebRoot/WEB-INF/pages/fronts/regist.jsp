<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>注册页面</title>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<%@include file="/WEB-INF/pages/common/common.jsp"%>
	<link rel="stylesheet" type="text/css" href="${basePath}/resources/login/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${basePath}/resources/login/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="${basePath}/resources/login/css/component.css" />

<style>
	/*<!--登录栏 start-->*/
	#loginBox{padding:10px 20px;position:absolute;top:25%;left:50%;margin-left:-150px;background:rgba(32, 33, 32, 0.4);text-align:center;border-radius:20px;}
	#logo{margin-bottom:20px;}
	/*<!--loginForm start-->*/
	#form{width:300px;margin:0 auto;}
	#form p{margin-bottom:30px;width:100%;position:relative;height:35px;line-height:35px;}
	#form p.mb10{margin-bottom:10px;}
	#form p.mb0{margin-bottom:0px;}
	#form p input{width:100%;height:100%;background:rgba(59, 129, 136, 0.59);border:none;outline:none;text-indent:2.5em;font-size:16px;font-weight:600;border-radius:5px;}
	#form p #login{text-align:center;text-indent:0em;height:40px;cursor:pointer;background-color:#3499DA;color:#fff;transition: all 1s;border-radius:5px;}
	#form p #login:hover{background-color:#688ac2;transition: color 1s;}
	#form p .left{position:absolute;left:5px;font-size:30px;color:rgba(152, 151, 151, 0.59);vertical-align:middle;}
	#form p #vfy{width:50%;float:left;}
	#form p span a{cursor:pointer;color:#fefefe;font-size:16px;font-weight:600;text-decoration:none;}
	#form p span:hover a{color:#3499DA;}
	#form p .regist{float:left;}
	#form p .pwd{float:right;}
	/*<!--loginForm end-->*/
	.icon{position:absolute;right:4px;top:2px;display:none;color:rgba(152, 151, 151, 0.59);font-size:20px;cursor:pointer;}
	.icon-correct{color:green;}
	.icon-error{color:red;}
	/*<!--登录栏 end-->*/
</style>

<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
</head>
<body>
		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					
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
								<input type="text" placeholder="请输入用户名" class="input" maxlength="30" id="user" autofocus="autofocus">
								<i class="iconfont icon"></i>
							</p>
							
							<p class="animated bounceInRight">
								<i class="iconfont icon-email left" id="icon_email"></i>
								<input type="email" placeholder="请输入邮箱" class="input" maxlength="20" id="email">
								<i class="iconfont icon"></i>
							</p>
							
							<p class="animated bounceInRight">
								<i class="iconfont icon-password left" id="icon_pwd"></i>
								<input type="password" placeholder="请输入密码" class="input" maxlength="20" id="pwd">
								<i class="iconfont icon"></i>
							</p>
							
							<p class="animated bounceInRight">
								<i class="iconfont icon-password left" id="icon_confpwd"></i>
								<input type="password" placeholder="请输入确认密码" class="input" maxlength="20" id="confpwd">
								<i class="iconfont icon"></i>
							</p>
							
							<!--<p class="animated bounceInLeft">
								<i class="iconfont icon-verify left" id="icon_vfy"></i>
								<input type="text" placeholder="请输入验证码" class="input" maxlength="5" id="vfy">
								<i class="iconfont icon"></i>
							</p>-->
							
							<p class="animated bounceIn mb10">
								<input id="login" type="button" value="注&nbsp;&nbsp;册" onclick="user.getLogin();">
							</p>
							
							<p class="animated rotateInUpRight mb0">
								<span class="login">
									<a href="${basePath}/login" target="_blank">已有账号?</a>
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
		<script src="${basePath}/resources/login/js/rAF.js"></script>
		<script src="${basePath}/resources/login/js/demo-1.js"></script>
		<script type="text/javascript">
			var user = {
					getLogin:function(){
						var name = $("#user").val();
						var password = $("#pwd").val();
						var verifyCode = $("#vfy").val();
						var params = {name:name,password:password,verifyCode:verifyCode};
						$.ajax({
							type:"post",
							url:basePath+"/user/login",
							data:params,
							success:function(data){
								window.location.href = basePath+"/index";
							}
						});
					}
			}
		</script>
	</body>
</html>
