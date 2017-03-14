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
<style>
	body{background:#000;margin:0;padding:0;}
	canvas{cursor:crosshair;display:block;}
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
	.icon-success{color:green;}
	.icon-error{color:red;}
	/* 登录栏 end */
</style>
<!--[if IE]><script src="js/html5.js"></script><![endif]-->
</head>
<body>
	<canvas id="canvas">Canvas is not supported in your browser.</canvas>
	<div id="wrap">
	
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
					<input type="text" placeholder="请输入用户名" class="input" maxlength="20" id="user" autofocus="autofocus">
					<i class="iconfont icon"></i>
				</p>
				
				<p class="animated bounceInRight">
					<i class="iconfont icon-password left" id="icon_pwd"></i>
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
						<a href="#">立即注册</a>
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
	<script>
		window.requestAnimFrame=(function(){return window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||function(callback){window.setTimeout(callback,1000/60)}})();var canvas=document.getElementById("canvas"),ctx=canvas.getContext("2d"),cw=window.innerWidth,ch=window.innerHeight,fireworks=[],particles=[],hue=120,limiterTotal=5,limiterTick=0,timerTotal=80,timerTick=0,mousedown=false,mx,my;canvas.width=cw;canvas.height=ch;function random(min,max){return Math.random()*(max-min)+min}function calculateDistance(p1x,p1y,p2x,p2y){var xDistance=p1x-p2x,yDistance=p1y-p2y;return Math.sqrt(Math.pow(xDistance,2)+Math.pow(yDistance,2))}function Firework(sx,sy,tx,ty){this.x=sx;this.y=sy;this.sx=sx;this.sy=sy;this.tx=tx;this.ty=ty;this.distanceToTarget=calculateDistance(sx,sy,tx,ty);this.distanceTraveled=0;this.coordinates=[];this.coordinateCount=3;while(this.coordinateCount--){this.coordinates.push([this.x,this.y])}this.angle=Math.atan2(ty-sy,tx-sx);this.speed=2;this.acceleration=1.05;this.brightness=random(50,70);this.targetRadius=1}Firework.prototype.update=function(index){this.coordinates.pop();this.coordinates.unshift([this.x,this.y]);if(this.targetRadius<8){this.targetRadius+=0.3}else{this.targetRadius=1}this.speed*=this.acceleration;var vx=Math.cos(this.angle)*this.speed,vy=Math.sin(this.angle)*this.speed;this.distanceTraveled=calculateDistance(this.sx,this.sy,this.x+vx,this.y+vy);if(this.distanceTraveled>=this.distanceToTarget){createParticles(this.tx,this.ty);fireworks.splice(index,1)}else{this.x+=vx;this.y+=vy}};Firework.prototype.draw=function(){ctx.beginPath();ctx.moveTo(this.coordinates[this.coordinates.length-1][0],this.coordinates[this.coordinates.length-1][1]);ctx.lineTo(this.x,this.y);ctx.strokeStyle="hsl("+hue+", 100%, "+this.brightness+"%)";ctx.stroke();ctx.beginPath();ctx.arc(this.tx,this.ty,this.targetRadius,0,Math.PI*2);ctx.stroke()};function Particle(x,y){this.x=x;this.y=y;this.coordinates=[];this.coordinateCount=5;while(this.coordinateCount--){this.coordinates.push([this.x,this.y])}this.angle=random(0,Math.PI*2);this.speed=random(1,10);this.friction=0.95;this.gravity=1;this.hue=random(hue-20,hue+20);this.brightness=random(50,80);this.alpha=1;this.decay=random(0.015,0.03)}Particle.prototype.update=function(index){this.coordinates.pop();this.coordinates.unshift([this.x,this.y]);this.speed*=this.friction;this.x+=Math.cos(this.angle)*this.speed;this.y+=Math.sin(this.angle)*this.speed+this.gravity;this.alpha-=this.decay;if(this.alpha<=this.decay){particles.splice(index,1)}};Particle.prototype.draw=function(){ctx.beginPath();ctx.moveTo(this.coordinates[this.coordinates.length-1][0],this.coordinates[this.coordinates.length-1][1]);ctx.lineTo(this.x,this.y);ctx.strokeStyle="hsla("+this.hue+", 100%, "+this.brightness+"%, "+this.alpha+")";ctx.stroke()};function createParticles(x,y){var particleCount=30;while(particleCount--){particles.push(new Particle(x,y))}}function loop(){requestAnimFrame(loop);hue+=0.5;ctx.globalCompositeOperation="destination-out";ctx.fillStyle="rgba(0, 0, 0, 0.5)";ctx.fillRect(0,0,cw,ch);ctx.globalCompositeOperation="lighter";var i=fireworks.length;while(i--){fireworks[i].draw();fireworks[i].update(i)}var i=particles.length;while(i--){particles[i].draw();particles[i].update(i)}if(timerTick>=timerTotal){if(!mousedown){fireworks.push(new Firework(cw/2,ch,random(0,cw),random(0,ch/2)));timerTick=0}}else{timerTick++}if(limiterTick>=limiterTotal){if(mousedown){fireworks.push(new Firework(cw/2,ch,mx,my));limiterTick=0}}else{limiterTick++}}canvas.addEventListener("mousemove",function(e){mx=e.pageX-canvas.offsetLeft;my=e.pageY-canvas.offsetTop});canvas.addEventListener("mousedown",function(e){e.preventDefault();mousedown=true});canvas.addEventListener("mouseup",function(e){e.preventDefault();mousedown=false});window.onload=loop;
		
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
								$("#user").next().fadeIn(500).removeClass("icon-error").addClass("icon-success");
							}else if(data == "nameError"){
								showTip("bounceInDown","icon-error","red","您输入的用户名有误！",3000);
								$("#user").focus().next().fadeIn(500).removeClass("icon-success").addClass("icon-error");
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
			if($(this).attr("class").indexOf("icon-error")!=-1){
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
								showTip("bounceInDown","icon-success","green","登录成功请稍等！",3000);
								$("#pwd").next().fadeIn(500).removeClass("icon-error").addClass("icon-success");
								setTimeout(function(){
									window.location.href = basePath+"/index";
								},3000);
								
							}else if(data == "pswError"){
								showTip("bounceInDown","icon-error","red","您输入的密码有误！",3000);
								$("#pwd").focus().next().fadeIn(500).removeClass("icon-success").addClass("icon-error");
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
