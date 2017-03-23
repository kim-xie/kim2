<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>登录页面</title>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<%@include file="/WEB-INF/pages/common/common.jsp"%>
	<link rel="stylesheet" type="text/css" href="${basePath}/resources/login/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${basePath}/resources/login/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="${basePath}/resources/login/css/component.css" />

<style>
	/* 提示栏 start */
	#tip{display:none;width:100%;height:60px;vertical-align:middle;position:absolute;left:0;top:0;background-color:#3499DA;line-height:60px;text-align:center;}
	#tip .tip_conts{height:100%;margin:0 auto;}
	#tip .tip_conts i{font-size:26px;}
	#tip .tip_conts .tip_txt{font-size:18px;color:#fff;margin-left:6px;display:inline-block;}
	/* 提示栏 end */
	
	/* 登录栏 start */
	#loginBox{padding:10px 20px;position:absolute;top:25%;left:50%;margin-left:-150px;background:rgba(32, 33, 32, 0.4);text-align:center;border-radius:20px;}
	#logo{margin-bottom:20px;}
	/* loginForm start */
	#form{width:300px;margin:0 auto;}
	#form p{margin-bottom:30px;width:100%;position:relative;height:35px;line-height:35px;}
	#form p.mb10{margin-bottom:10px;}
	#form p.mb0{margin-bottom:0px;}
	#form p input{width:100%;height:100%;background:rgba(108, 131, 134, 0.59);border:none;outline:none;text-indent:2.5em;font-size:16px;font-weight:600;border-radius:5px;}
	#form p #login{text-align:center;text-indent:0em;height:40px;cursor:pointer;background-color:#3499DA;color:#fff;transition: all 1s;border-radius:5px;}
	#form p #login:hover{background-color:#688ac2;transition: color 1s;}
	#form p .left{position:absolute;left:5px;font-size:30px;color:rgba(152, 151, 151, 0.59);vertical-align:middle;}
	#form p #vfy{width:50%;float:left;}
	#form p span a{cursor:pointer;color:#fefefe;font-size:16px;font-weight:600;text-decoration:none;}
	#form p span:hover a{color:#3499DA;}
	#form p .regist{float:left;}
	#form p .pwd{float:right;}
	/* loginForm end */
	.icon{position:absolute;right:6px;top:2px;color:rgba(152, 151, 151, 0.59);font-size:20px;cursor:pointer;}
	.icon-iconsuccess{color:#0FFD0F;}
	.icon-iconerror{color:red;}
	/* 登录栏 end */
</style>

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
								<input type="text" placeholder="请输入用户名" class="input" maxlength="30" id="user" autofocus="autofocus">
								<i class="iconfont icon"></i>
							</p>
							
							<p class="animated bounceInRight">
								<i class="iconfont icon-icon16 left" id="icon_pwd"></i>
								<input type="password" placeholder="请输入密码" class="input" maxlength="20" id="pwd">
								<i class="iconfont icon"></i>
							</p>
							
							<!--<p class="animated bounceInLeft">
								<i class="iconfont icon-verify left" id="icon_vfy"></i>
								<input type="text" placeholder="请输入验证码" class="input" maxlength="5" id="vfy">
								<i class="iconfont icon"></i>
							</p>-->
							
							<p class="animated bounceIn mb10">
								<input id="login" type="button" value="登&nbsp;&nbsp;录" onclick="user.getLogin();">
							</p>
							
							<p class="animated rotateInUpRight mb0">
								<span class="regist">
									<a href="${basePath}/regist">立即注册</a>
								</span>
								<span class="pwd">
									<a href="#" target="_blank">忘记密码?</a>
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
			$(".input").each(function(i){
				//获取焦点事件
				$(this).focus(function(){
					$this = $(this);
					$(this).siblings().blur();
					$(this).css("borderBottom","4px solid #3499DA");
					$(this).prev().css("color","#3499DA");
					if($(this).val()){
						$(this).keydown(function(){
							$this.next().fadeOut(500);
						});
					}else{
						$(this).next().fadeOut(500);
					}
				});
				//失去焦点事件
				$(this).blur(function(){
					if(!$(this).val()){
						$(this).css("borderBottom","");
						$(this).prev().css("color","");
					}
					if($(this).has("#user") && $(this).val()){
						var name = $("#user").val();
						var params = {name:name};
						$.ajax({
							type:"post",
							url:basePath+"/user/checkName",
							data:params,
							success:function(data){
								if(data == "nameCorrect"){
									$("#user").next().fadeIn(500).removeClass("icon-iconerror").addClass("icon-iconsuccess");
								}else if(data == "nameError"){
									showTip("bounceInDown","icon-iconerror","red","您输入的用户名有误！",3000);
									$("#user").focus().next().fadeIn(500).removeClass("icon-iconsuccess").addClass("icon-iconerror");
								}
							}
						});
					}
				});
				//去提示
				$(this).keydown(function(){
					$("#tip").fadeOut(500);
				});
			});
			
			//清空按钮
			$(".icon").click(function(){
				if($(this).attr("class").indexOf("icon-iconerror")!=-1){
					$(this).prev().val("").focus();
					$(this).fadeOut("slow");
				}
			});
			
			
			//登录
			var user = {
					getLogin: function(){
						var name = $("#user").val();
						var password = $("#pwd").val();
						var verifyCode = $("#vfy").val();
						if(!password && !name){
							showTip("bounceInDown","icon-warn","yellow","请输入登录信息！",3000);
							$("#user").focus();
						}
						if(password && !name){
							showTip("bounceInDown","icon-warn","yellow","请输入用户名！",3000);
							$("#user").focus();
						}
						if(!password && name){
							showTip("bounceInDown","icon-warn","yellow","请输入密码！",3000);
							$("#pwd").focus();
						}
						if(!verifyCode && password && name){
							var params = {name:name,password:password};
							user.login(params);
						}
						if(verifyCode && password && name){
							var params = {name:name,password:password,verifyCode:verifyCode};
							user.login(params);
						}
					},
					login: function(params){
						$("#login").val("登录中...");
						$("#login").removeAttr("onclick");
						$.ajax({
							type:"post",
							url:basePath+"/user/login",
							data:params,
							success:function(data){
								if(data == "success"){
									showTip("bounceInDown","icon-iconsuccess","#0FFD0F","登录成功请稍等！",3000);
									$("#pwd").next().fadeIn(500).removeClass("icon-iconerror").addClass("icon-iconsuccess");
									setTimeout(function(){
										window.location.href = basePath+"/index";
									},3000);
									
								}else if(data == "pswError"){
									showTip("bounceInDown","icon-iconerror","red","您输入的密码有误！",3000);
									$("#pwd").focus().next().fadeIn(500).removeClass("icon-iconsuccess").addClass("icon-iconerror");
									setTimeout(function(){
										$("#login").val("登   录");
										$("#login").attr("onclick","user.getLogin()");
									},3000);
								}
							}
						});
					}
			};
			
			
			//展示提示框信息		
			function showTip(animate,icon,color,message,time){
				$("#tip").css("display","block");
				$("#tip").removeClass().addClass("animated "+ animate);
				$("#tip").empty();
				$("#tip").append(  "<div class='tip_conts'>"+
								   "	<i class='iconfont "+icon+"' style='color:"+color+"'></i>"+
								   "	<span class='tip_txt'>"+message+"</span>"+
								   "</div>");
				setTimeout(function(){ $("#tip").fadeOut(); },time);
			};
			
			//keydown事件
			$("html").keydown(function(event){
				var e = event || window.event;
				if(e.keyCode == 13){
					user.getLogin();
				}else if(e.keyCode == 40){
					$("#user").blur();
					$("#pwd").focus();
				}else if(e.keyCode == 38){
					$("#user").focus();
					$("#pwd").blur();
				}
			});
		</script>
	</body>
</html>
