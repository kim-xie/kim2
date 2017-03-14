<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
	/* 返回顶部  start */
	#goTop{position:fixed;display:none;bottom:50px;right:20px;z-index:1993;width:50px;}
	#goTop .goTop a{display:block;width:100%;text-align:center;height:38px;line-height:38px;margin:5px 0;background:#ccc;}
	#goTop .goTop a i{color:#fff;}
	#goTop .goTop a:hover i{color:#3498db;}
	#goTop .goTop a:hover em{color:#3498db;}
	#goTop .goTop a.feedback{font-size:14px;font-weight:600;color:#fff;}
	/* 返回顶部  end */
	
	/* 底部导航  start */
	#footer{width:100%;height:50px;background:#333;}
	#footer .footerWrap{width:60%;height:100%;margin:0 auto;line-height:50px;text-align:center;color:#fff;}
	/* 底部导航  end */
</style>
	
	<!-- 返回顶部  start -->
	<div id="goTop">
		<div class="goTop">
			<a class="arrows" title="返回顶部" href="javascript:;"><i class="iconfont icon-gotop fz30"></i></a>
			<a class="service" title="QQ" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1134771121&amp;site=qq&amp;menu=yes"><i class="iconfont icon-icon-qq fz24"></i></a>
			<a class="feedback" title="反馈" target="_blank" href="javascript:;"><em>反馈</em></a>
		</div>
	</div>
	<!-- 返回顶部  end -->
	
	<!-- 底部导航  start -->
	<div id="footer">
		<div class="footerWrap"><span>Copyright&copy;2016 Powered By KIM Version 1.0.0</span></div>
	</div>
	<!-- 底部导航  end -->
	
	<script type="text/javascript"> 
		
		/*gotop start*/
		$("#goTop .arrows").bind("click",function(){
			$(document.body).stop(true,true).animate({"scrollTop":0},1000,
			function(){$("#goTop").stop(true,true).fadeOut(1000);});
		});
		$(window).scroll(function(){
			var scrollTop = $(this).scrollTop();
			if(scrollTop >= 200){
				$("#goTop").stop(true,true).fadeIn(1000);
			}else{
				$("#goTop").stop(true,true).fadeOut(1000);
			}
		});
		/*gotop end*/
	</script>