<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
	/* 返回顶部  start */
	#goTop{position:fixed;bottom:80px;right:20px;z-index:1993;width:38px;}
	#goTop .goTop a{display:block;width:100%;text-align:center;height:38px;line-height:38px;margin:5px 0;background:#ccc;border-radius:5px;}
	#goTop .goTop a i{color:#fff;}
	#goTop .goTop a.arrows{display:none;}
	#goTop .goTop a:hover i{color:#3498db;}
	#goTop .goTop a:hover em{color:#3498db;}
	#goTop .goTop a.feedback{color:#fff;}
	.fz32{font-size:32px;}
	/* 返回顶部  end */
	
	/* 底部导航  start */
	#footer{width:100%;height:50px;}
	#footer .footerWrap{width:60%;height:100%;margin:0 auto;line-height:50px;text-align:center;color:#999;}
	/* 底部导航  end */
</style>
	
	<!-- 返回顶部  start -->
	<div id="goTop">
		<div class="goTop">
			<a class="arrows" title="返回顶部" href="javascript:;"><i class="iconfont icon-gotop fz32"></i></a>
			<a class="service" title="QQ" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1134771121&amp;site=qq&amp;menu=yes"><i class="iconfont icon-icon-qq fz28"></i></a>
			<a class="feedback" title="反馈" target="_blank" href="${basePath}/feedback"><i class="iconfont icon-love fz24"></i></a><!-- <em>反馈</em>  -->
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
			$(document.body).stop(true,true).animate({"scrollTop":0},1000,function(){$("#goTop .goTop a.arrows").stop(true,true).fadeOut(1000);});
		});
		$(window).scroll(function(){
			var scrollTop = $(this).scrollTop();
			if(scrollTop >= 100){
				$("#goTop .goTop a.arrows").stop(true,true).fadeIn(1000).css("display","block");
			}else{
				$("#goTop .goTop a.arrows").stop(true,true).fadeOut(1000);
			}
		});
		/*gotop end*/
	</script>