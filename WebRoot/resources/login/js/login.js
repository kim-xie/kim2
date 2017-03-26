//(function(){
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
			if(!$(this).val().trim()){
				$(this).css("borderBottom","");
				$(this).prev().css("color","");
			}
			if($(this).val().trim()){}
			
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
	
	$("#user").blur(function(){
		var name = $(this).val().trim();
		if(!name)return;
		var params = {name:name};
		$.ajax({
			type:"post",
			url:basePath+"/user/checkName",
			data:params,
			success:function(data){
				if(data == "nameCorrect"){
					if(($(this).parents("#loginBox").find("h1").text()=="login" || $(this).parents("#loginBox").find("h1").text()=="findPassword")){
						$("#user").next().fadeIn(500).removeClass("icon-iconerror").addClass("icon-iconsuccess");
					}else{
						showTip("bounceInDown","icon-iconerror","red","该用户已经被注册,请换个用户名吧^_^！",3000);
						$("#user").focus().next().fadeIn(500).removeClass("icon-iconsuccess").addClass("icon-iconerror");
					}
					
				}else if(data == "nameError"){
					if(($(this).parents("#loginBox").find("h1").text()=="login" || $(this).parents("#loginBox").find("h1").text()=="findPassword")){
						showTip("bounceInDown","icon-iconerror","red","您输入的用户名有误！",3000);
						$("#user").focus().next().fadeIn(500).removeClass("icon-iconsuccess").addClass("icon-iconerror");
					}else{
						$("#user").next().fadeIn(500).removeClass("icon-iconerror").addClass("icon-iconsuccess");
					}
				}
			}
		});
	});
	
	$("#email").blur(function(){
		var email = $(this).val().trim();
		if(!email)return;
		$.ajax({
			type: "post",
			url: basePath+"/user/checkEmail",
			data: "userEmail="+email,
			success:function(data){
				//找到邮箱
				if(data == "EmailIsAlive"){
					if($("#email").parents("#loginBox").find("h1").text()=="regist"){
						showTip("bounceInDown","icon-iconerror","red","该邮箱已经被注册,请换个邮箱吧^_^！",3000);
						$("#email").focus().next().fadeIn(500).removeClass("icon-iconsuccess").addClass("icon-iconerror");
					}else{
						$("#email").next().fadeIn(500).removeClass("icon-iconerror").addClass("icon-iconsuccess");
					}
				//找不到邮箱	
				}else if(data == "EmailIsCorrect"){
					$("#email").next().fadeIn(500).removeClass("icon-iconerror").addClass("icon-iconsuccess");
				//邮箱格式有误
				}else if(data == "emailError"){
					showTip("bounceInDown","icon-iconerror","red","您输入的邮箱格式有误,请重新输入吧^_^！",3000);
					$("#email").focus().next().fadeIn(500).removeClass("icon-iconsuccess").addClass("icon-iconerror");
				}
			}
		});
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
		},
		getRegist: function(){
			var name = $("#user").val();
			var password = $("#pwd").val();
			var email = $("#email").val();
			var verifyCode = $("#vfy").val();
			
			if(!password && !name && !email){
				showTip("bounceInDown","icon-warn","yellow","请输入注册信息！",3000);
				$("#user").focus();
			}
			if(password && !name ){
				showTip("bounceInDown","icon-warn","yellow","请输入用户名！",3000);
				$("#user").focus();
			}
			if(!password && name){
				showTip("bounceInDown","icon-warn","yellow","请输入密码！",3000);
				$("#pwd").focus();
			}
			if(password && name && !email){
				showTip("bounceInDown","icon-warn","yellow","请输入邮箱！",3000);
				$("#email").focus();
			}
			if(!verifyCode && password && name && email){
				alert(1)
				var params = {name:name,password:password,email:email};
				user.regist(params);
			}
			if(verifyCode && password && name && email){
				var params = {name:name,password:password,email:email,verifyCode:verifyCode};
				user.regist(params);
			}
		},
		regist: function(params){
			$("#login").val("注册中...");
			$("#login").removeAttr("onclick");
			$.ajax({
				type: "post",
				url: basePath+"/user/regist",
				data: params,
				success:function(data){
					if(data == "success"){
						showTip("bounceInDown","icon-iconsuccess","#0FFD0F","注册成功请前往邮箱进行激活！",3000);
						setTimeout(function(){
							window.location.href = basePath+"/login";
						},3000);
					}else if(data == "fail"){
						showTip("bounceInDown","icon-iconerror","red","注册失败,请重新进行注册！",3000);
						setTimeout(function(){
							$("#login").val("注   册");
							$("#login").attr("onclick","user.getRegist()");
						},3000);
					}
				}
			});
		},
		getFindPwd: function(){
			var name = $("#user").val();
			var email = $("#email").val();
			var verifyCode = $("#vfy").val();
			
			if(!name && !email){
				showTip("bounceInDown","icon-warn","yellow","请输入注册信息！",3000);
				$("#user").focus();
			}
			if(name && !email){
				showTip("bounceInDown","icon-warn","yellow","请输入邮箱！",3000);
				$("#email").focus();
			}
			if(!verifyCode && name && email){
				var params = {name:name,email:email};
				user.findPwd(params);
			}
			if(verifyCode && name && email){
				var params = {name:name,email:email,verifyCode:verifyCode};
				user.findPwd(params);
			}
		},
		findPwd: function(params){
			$("#login").val("找回密码中...");
			$("#login").removeAttr("onclick");
			$.ajax({
				type:"post",
				url:basePath+"/user/findPwd",
				data:params,
				success:function(data){
					if(data == "success"){
						
					}else if(data == "pswError"){
						
					}
				}
			});
		}
	};
	
	//展示提示框信息		
	function showTip(animate,icon,color,message,time){
		$("#tip").css("display","block");
		$("#tip").removeClass().addClass("animated "+ animate);
		$("#tip").empty().append(  "<div class='tip_conts'>"+
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
//})();
			