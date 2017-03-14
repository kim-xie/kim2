;(function(){
	$(function(){
		windowResize();
	});
	
	$(window).resize(function(){
		windowResize();
	});
	
	function windowResize(){
		var windowHeight = document.documentElement.clientHeight  || document.body.clientHeight ;
		var windowWidth = document.documentElement.clientWidth  || document.body.clientWidth ;
		//alert("窗体的高度："+windowHeight+"窗体的宽度："+windowWidth);
		//$("#mainWrap").height(windowHeight-100);
	}
})();