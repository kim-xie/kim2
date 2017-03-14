<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
	/* left nav  start*/
	.left-nav,.tool-nav{position:fixed;top:0;left:-240px;width:240px;height:100%;padding-top:60px;z-index:3;background:#1F1F1F;}
	.nav_title{color:rgb(255,255,255);margin-bottom:20px;padding:0 30px;}
	.parents{width:100%;height:100%;}
	.parents .p_title{border-bottom:1px solid #333;height:28px;line-height:28px;padding:5px 30px;}
	.parents .p_title:hover a{color:rgb(255,255,255);}
	.parents .p_title:hover i{color:rgb(255,255,255);}
	.parents .p_title i{margin-right:5px;}
	.parents .p_title a,i{color:rgb(182,179,173);font-size:18px;}
	.parents .p_title .children{width:100%;}
	.parents .p_title .children .c_title{line-height:32px;border-bottom:1px solid #333;background:#2b2d2e;font-size:14px;padding:0 20px;display:none;}
	.parents .p_title .children .c_title:hover a{color:#2DD888;}
	.parents .tool_title{border-bottom:1px solid #333;height:28px;line-height:28px;padding:5px 30px;font-size:18px;}
	.parents .tool_title a{color:rgb(182,179,173);font-size:16px;}
	.parents .tool_title:hover a{color:#2DD888;}
	
	.overlay{position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,0.4);z-index:100;display:none;}
	
	.button{width:18px;height:18px;padding:16px;border-radius:50%;cursor:pointer;position:fixed;left:10px;z-index:100;-webkit-transform:translateX(0);-ms-transform:translateX(0);transform:translateX(0);-webkit-transition:-webkit-transform .5s;transition:transform .5s;}
	.push_button{top:66px;background-color:#2e2e2e;}
	.tool_button{top:126px;background-color:#2DD888;}
	.project_button{top:186px;background-color:#2DD888;width:18px;height:18px;padding:16px;border-radius:50%;cursor:pointer;position:fixed;left:10px;z-index:100;-webkit-transform:translateX(0);-ms-transform:translateX(0);transform:translateX(0);-webkit-transition:-webkit-transform .5s;transition:transform .5s;}
	.tool_button .icon-icontool{font-size:26px;color:#fff;line-height:21px;margin-left:-4px;}
	.project_button .icon-project{font-size:26px;color:#fff;line-height:17px;margin-left:-4px;}
	.project_button.on{-webkit-transform:translateX(240px);-ms-transform:translateX(240px);transform:translateX(240px);}
	.push_button li{width:100%;height:2px;background:#FFF;margin:0 auto;border-radius:2px;}
	.push_button .navi-one{margin-top:6px;-webkit-transform:translate(0,-200%);-ms-transform:translate(0,-200%);transform:translate(0,-200%);-webkit-transition:-webkit-transform .3s .3s;transition:transform .3s .3s;}
	.push_button .navi-two{transition:opacity .2s .3s,width .2s .3s;-webkit-transition:opacity .2s .3s,width .2s .3s;-moz-transition:opacity .2s .3s,width .2s .3s;-ms-transition:opacity .2s .3s,width .2s .3s;}
	.push_button .navi-three{transition:transform .3s .3s;-webkit-transition:-webkit-transform .3s .3s;-ms-transition:transform .3s .3s;-moz-transition:transform .3s .3s;transform:translate(0,200%);-moz-transform:translate(0,200%);-webkit-transform:translate(0,200%);-ms-transform:translate(0,200%);}
	.button.active{-webkit-transform:translateX(240px);-ms-transform:translateX(240px);transform:translateX(240px);} 
	.navi-one.active{transform:translateY(2px) rotate(45deg);-moz-transform:translateY(2px) rotate(45deg);-webkit-transform:translateY(2px) rotate(45deg);-ms-transform:translateY(2px) rotate(45deg);}
	.navi-two.active{width:0;opacity:0;}
	.navi-three.active{transform:translateY(-2px) rotate(-45deg);-moz-transform:translateY(-2px) rotate(-45deg);-webkit-transform:translateY(-2px) rotate(-45deg);-ms-transform:translateY(-2px) rotate(-45deg);}
	/* left nav end */
</style>

<body>
	<!-- left-nav start -->
	<div class="left-nav">
		<h2 class="nav_title">学习路线</h2>
		<ul class="parents">
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">HTML</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);" target="_blank">网页</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">布局</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">表单</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">列表</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">框架</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">标签总结</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">html5</a></li>
				</ul>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">CSS</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);" target="_blank">样式总结</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">css3</a></li>
				</ul>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">JavaScript</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);" target="_blank">js简介</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">字符串</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">操作符</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">数组</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">数据类型</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">面向对象</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">函数</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">动画</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">bom</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">dom</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">ajax</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">正则表达式</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">设计模式</a></li>
				</ul>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">Jquery</a>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i>
				<a href="javascript:void(0);">Boostrap</a>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">Angular</a>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">Node</a>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">JAVASE</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);" target="_blank">简介</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">操作符</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">数据类型</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">面向对象</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">集合</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">异常处理</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">IO文件流</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">网络编程</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">多线程</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">反射</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">泛型</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">设计模式</a></li>
				</ul>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">DBAS</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);" target="_blank">Mysql</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">Oracle</a></li>
				</ul>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i>
				<a href="javascript:void(0);">JAVAWEB</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);" target="_blank">Servlet</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">Jsp</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">Jstl</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">自定义标签</a></li>
				</ul>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">JAVAEE</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);" target="_blank">SpringMvc</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">Structs2</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">Spring</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">Mybatis</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">Hibernate</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">WebService</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">自定义框架</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">Maven</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">SVN</a></li>
					<li class="c_title"><a href="javascript:void(0);" target="_blank">GIT</a></li>
				</ul>
			</li>
		</ul>
	</div>

	<div class="tool-nav">
		<h2 class="nav_title">工具箱</h2>
		<ul class="parents">
			<li class="tool_title">
				<a href="${basePath}/resources/html/tools/cssFormat.html" target="_blank">css格式化工具</a>
			</li>
			<li class="tool_title">
				<a href="${basePath}/resources/html/tools/htmlFormat.html" target="_blank">html格式化工具</a>
			</li>
			<li class="tool_title">
				<a href="${basePath}/resources/html/tools/yhFormat.html" target="_blank">单双引号转换工具</a>
			</li>
		</ul>
	</div>

	<!-- button start -->
	<ul class="push_button button">
		<li class="navi-one"></li>
		<li class="navi-two"></li>
		<li class="navi-three"></li>
	</ul>

	<div class="tool_button button">
		<a class="tool-btn" href="javascript:void(0);"> 
			<i class="iconfont icon-icontool"></i> 
			<span class="tool-btn-num"></span>
		</a>
	</div>

	<div class="project_button">
		<a class="project-btn" href="${basePath}/resources/html/projects/index.html" target="_blank">
			<i class="iconfont icon-project"></i>
			<span class="project-btn-num"></span>
		</a>
	</div>
	<!-- button end -->

	<!-- overlay -->
	<div class="overlay"></div>

	<!-- left-nav end -->

	<script>
		var leftNav = 0;
		var toolNav = 0;
		$(".button").on("click", function() {
			$(this).toggleClass("active");
			$(".project_button").toggleClass("on");
			$(this).siblings().toggleClass("active");
			$(this).css("z-index", 101);
			$(this).siblings().css("z-index", 100);
			$(".left-nav").css("z-index", 101);
			$(".tool-nav").css("z-index", 101);
			$(".overlay").toggle();
			var bodyLeft = parseInt($("body").css("margin-left"));
			if (bodyLeft == 0) {
				$("body").animate({"margin-left" : "240px"}, 300);
			} else {
				$("body").animate({"margin-left" : 0}, 300);
			}
			if ($(this).attr("class")[1] == "u") {
				
				$(this).children().toggleClass("active");
				leftNav = parseInt($(".left-nav").css("left"));
				if (leftNav == 0) {
					$(".left-nav").animate({"left" : "-240px"}, 300);
				} else {
					$(".left-nav").animate({"left" : 0}, 300);
				}
			} else if ($(this).attr("class")[1] == "o") {
				toolNav = parseInt($(".tool-nav").css("left"));
				if (toolNav == 0) {
					$(".tool-nav").animate({"left" : "-240px"}, 300);
				} else {
					$(".tool-nav").animate({"left" : 0}, 300);
				}
			}
		});
		$(".overlay").click(function() {
			if (leftNav != 0) {
				$(".push_button").trigger("click");
			} else if (toolNav != 0) {
				$(".tool_button").trigger("click");
			} 
		});
		/* 左边导航列表 */
		$(".p_title").click(function() {
			$(this).find("i").toggleClass("icon-jian icon-add");
			$(this).siblings().slideToggle();
			$(this).find(".c_title").slideToggle();
			$(this).siblings().find(".c_title").slideUp().end().find("i").removeClass("icon-jian").addClass("icon-add");
		});
		/* 触发事件 */
		$(".c_title").click(function() {
			$(".overlay").trigger("click");
		});
		/* 触发事件 */
		$(".tool_title").click(function() {
			$(".overlay").trigger("click");
		});
	</script>
</body>