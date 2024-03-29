<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>音乐播放列表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<meta name="Author" content="kim">
		<meta name="Keywords" content="">
		<meta name="Description" content="">
		<%@include file="/WEB-INF/pages/common/common.jsp"%>
	</head>
	<style>
		html,body,div,span,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,abbr,address,cite,code,del,dfn,em,img,ins,kbd,q,samp,small,strong,sub,sup,var,b,i,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,figcaption,figure,footer,header,hgroup,menu,nav,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;outline:0;font-size:100%;background:transparent}
		body{line-height:1}
		article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section{display:block}
		nav ul{list-style:none}
		blockquote,q{quotes:none}
		blockquote:before,blockquote:after,q:before,q:after{content:'';content:none}
		a{margin:0;padding:0;font-size:100%;vertical-align:baseline;background:transparent}
		ins{background-color:#ff9;color:#000;text-decoration:none}
		mark{background-color:#ff9;color:#000;font-style:italic;font-weight:700}
		del{text-decoration:line-through}
		abbr[title],dfn[title]{border-bottom:1px dotted;cursor:help}
		table{border-collapse:collapse;border-spacing:0}
		hr{display:block;height:1px;border:0;border-top:1px solid #ccc;margin:1em 0;padding:0}
		input,select{vertical-align:middle}
		li{list-style:none}
		html{height:100%;width:100%}
		body{height:100%;width:100%;font-family:"Helvetica Neue","Hiragino Sans GB","Microsoft Yahei",Helvetica,Arial,sans-serif;font-size:12px;line-height:1.2;background-color:#363636;font-smoothing:antialiased;-webkit-font-smoothing:antialiased;-moz-font-smoothing:antialiased;-ms-font-smoothing:antialiased;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;text-size-adjust:none;-webkit-backface-visibility:hidden}
		.ks-ie7 body{overflow:hidden}
		.ks-ie6 body{background-color:#FFF}
		#musicWrap{height:100%;width:100%;min-width:930px;min-height:500px;position:relative;-webkit-transition-property:all;-moz-transition-property:all;-o-transition-property:all;-ms-transition-property:all;transition-property:all;-webkit-transition-duration:.2s;-moz-transition-duration:.2s;-o-transition-duration:.2s;-ms-transition-duration:.2s;transition-duration:.2s}
		/* #top{height:50px;width:100%;position:absolute;top:0;background:url(http://gtms01.alicdn.com/tps/i1/T10MNqFzVXXXcu5FDa-20-20.png) repeat 0 0} */
		#middle{width:100%;position:absolute;top:50px;bottom:80px;background-color:#FFF}
		#bottom{height:80px;width:100%;position:absolute;bottom:0;background:url(http://gtms01.alicdn.com/tps/i1/T10MNqFzVXXXcu5FDa-20-20.png) repeat 0 0}
		#J_blurBackground{width:100%;height:100%;position:fixed;overflow:hidden;top:0;bottom:0;left:0;right:0;z-index:0}
		#J_blurBackground .ui-canvas{position:absolute;z-index:0}
		#J_blurBackground .ui-canvas img{display:block;position:absolute;margin-top:-120px;margin-left:-120px;filter:progid:DXImageTransform.Microsoft.Blur(PixelRadius=70,MakeShadow=false)}
		#J_blurBackground .ui-canvas-current{z-index:1;opacity:0;-webkit-animation:fadeIn 1s .2s ease both;-moz-animation:fadeIn 1s .2s ease both;-ms-animation:fadeIn 1s .2s ease both;-o-animation:fadeIn 1s .2s ease both;animation:fadeIn 1s .2s ease both}
		#J_blurBackground .ui-blurdiv-current{z-index:1;opacity:1}
		@-webkit-keyframes fadeIn{0%{opacity:0}
		100%{opacity:1}
		}
		@-moz-keyframes fadeIn{0%{opacity:0}
		100%{opacity:1}
		}
		.playing .menu-outer ul li .icon-play{background:url(http://gtms01.alicdn.com/tps/i1/T1oHFEFwGeXXXYdLba-18-18.gif) no-repeat 0 0!important}
		#J_loading{position:fixed;z-index:9999;top:56px;left:0;bottom:80px;right:0;background:url(http://gtms02.alicdn.com/tps/i2/T1pOySFxxcXXbHygfc-30-30.gif) no-repeat 50% 50%}
		.drag-mouse-icon{background:url(http://gtms02.alicdn.com/tps/i2/T1ZCoCFqRXXXboEBbb-25-23.png) no-repeat 0 0}
		.drag-mouse-add{background:url(http://gtms01.alicdn.com/tps/i1/T1OyAnFyJfXXboEBbb-25-23.png) no-repeat 0 0}
		.seiya-drag-line{height:1px;overflow:hidden;background-color:#f60;margin-bottom:-1px;position:relative;z-index:1}
		.ks-dd-dragging{background-color:#f5f5f5!important}
		.ks-scroll-view{overflow:hidden;position:relative;cursor:default;outline:0;-webkit-tap-highlight-color:transparent;-webkit-user-drag:none;-ms-touch-action:none;-ms-user-select:none}
		.ks-ie7 .ks-scroll-view{position:static;overflow:normal;overflow-x:hidden;overflow-y:auto}
		.ks-scroll-view-hidden{display:none}
		.ks-scroll-view-content{position:absolute;left:0;top:0;min-height:100%;min-width:100%;width:100%;-webkit-user-drag:none}
		.ks-ie7 .ks-scroll-view-content{width:0;height:auto}
		.ks-ie6 .ks-scroll-view-content{height:expression(Math.max(this.parentNode.clientHeight,this.scrollHeight));width:expression(Math.max(this.parentNode.clientWidth,this.scrollWidth))}
		.ks-scrollbar{z-index:9;position:absolute}
		.ks-scrollbar-hidden{visibility:hidden}
		.ks-scrollbar-y{right:0;height:100%}
		.ks-scrollbar-y-track,.ks-scrollbar-y-drag,.ks-scrollbar-y{width:8px}
		.ks-scrollbar-y-arrow-up,.ks-scrollbar-y-arrow-down{display:none}
		.ks-scrollbar-y-track{position:absolute;right:0;top:0;bottom:0}
		.ks-ie6 .ks-scrollbar-y-track{height:expression(this.parentNode.clientHeight)}
		.ks-scrollbar-y-drag{position:absolute;background:#ccc;border-radius:4px;opacity:.5}
		.ks-scrollbar-x{bottom:0;width:100%}
		.ks-scrollbar-x-track,.ks-scrollbar-x-drag,.ks-scrollbar-x{height:8px}
		.ks-scrollbar-x-arrow-up,.ks-scrollbar-x-arrow-down{display:none}
		.ks-scrollbar-x-track{position:absolute;left:0;right:0}
		.ks-ie6 .ks-scrollbar-x-track{width:expression(this.parentNode.clientWidth)}
		.ks-scrollbar-x-drag{position:absolute;background:#ccc;border-radius:4px}
		.ks-scroll-view-pull-to-refresh{position:absolute;width:100%;top:-51px}
		.ks-scroll-view-pull-to-refresh-content{background:#fff;height:40px;line-height:40px;padding:5px 10px;border-bottom:1px solid #ccc;font-weight:700;font-size:14px;color:#888}
		.ks-scroll-view-pull-icon{display:block;float:left;width:40px;height:40px;background:url(http://img01.taobaocdn.com/tps/i1/T1u0mQXDtaXXXjasMR-80-160.png) 0 0 no-repeat;-webkit-background-size:40px 80px;background-size:40px 80px;-webkit-transition-property:-webkit-transform;-webkit-transition-duration:250ms}
		.ks-scroll-view-pulling .ks-scroll-view-pull-icon{-webkit-transform:rotate(0deg) translateZ(0)}
		.ks-scroll-view-releasing .ks-scroll-view-pull-icon{-webkit-transform:rotate(-180deg) translateZ(0)}
		.ks-scroll-view-loading .ks-scroll-view-pull-icon{background-position:0 100%;-webkit-transform:rotate(0deg) translateZ(0);-webkit-transition-duration:0ms;-webkit-animation-name:loading;-webkit-animation-duration:2s;-webkit-animation-iteration-count:infinite;-webkit-animation-timing-function:linear}
		@-webkit-keyframes loading{from{-webkit-transform:rotate(0deg) translateZ(0)} to{-webkit-transform:rotate(360deg) translateZ(0)}}
		#J_header{height:100%;width:100%;position:relative}
		#J_header .logo{float:left;height:100%;width:184px;padding-left:16px}
		#J_header .logo h1{width:162px;height:100%;background:url(http://gtms01.alicdn.com/tps/i1/T15QU5FXXmXXcUet2f-162-34.png) no-repeat 0 50%;font-size:0;line-height:0;overflow:hidden}
		#J_header .logo h1 a{display:block;width:100%;height:100%;text-indent:-999px}
		#J_header .userinfo{position:absolute;height:56px;width:273px;right:0;top:0}
		#J_header .user{float:right;width:34px;height:56px;padding-right:20px;padding-left:20px;border-left:1px solid rgba(255,255,255,.1);background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAXSURBVChTY/j37x8vMXhUIV5MbYX/eAEJmS7MUrjxygAAAABJRU5ErkJggg==") repeat 0 0}
		.ks-ie7 #J_header .user{background:url(http://gtms01.alicdn.com/tps/i1/T1pf9xFEJbXXc9v57_-10-10.png) repeat 0 0}
		#J_header .user .avatar{margin-top:11px;height:30px;width:30px;border:2px solid #fff;box-shadow:1px 1px 1px rgba(0,0,0,.5) inset;border-radius:999px}
		#J_header .user .avatar img{width:30px;height:30px;border-radius:999px}
		#J_header .user em{background-color:#f60;border-radius:999px;position:absolute;padding:2px;top:5px;right:15px;color:#fff;font-style:normal}
		#J_header .unlogin{border-left:0;background:none!important}
		#J_header .user .arrow {margin-top: 11px;height: 30px;line-height: 30px;width: 30px;border: 2px solid rgba(255,255, 255, 0);text-align: center;}
		#J_header .friend{color:#fff;float:right;width:198px;height:100%;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAXSURBVChTY/j37x8vMXhUIV5MbYX/eAEJmS7MUrjxygAAAABJRU5ErkJggg==") repeat 0 0}
		.ks-ie7 #J_header .friend{background:url(http://gtms01.alicdn.com/tps/i1/T1pf9xFEJbXXc9v57_-10-10.png) repeat 0 0}
		#J_header .friend .friend-count{line-height:56px;padding-left:30px;padding-left:24px}
		#J_header .friend .friend-count i{margin-top:16px;vertical-align:top}
		#J_header .friend .friend-count em{font-style:normal;color:#f60;padding-left:10px}
		#J_header .mod-login{line-height:56px;font-size:14px;text-align:right;color:#fff}
		#J_header .mod-login a{color:#f60;text-decoration:none}
		.ml{margin-left:10px}
		.icon.mv{display:inline-block;width:18px;height:12px;padding:0 2px;border-radius:3px;text-indent:-9999px;font:9px/12px Verdana;color:#FFF;vertical-align:middle;background-repeat:no-repeat;background-position:center center;background-image:url(//gtms03.alicdn.com/tps/i3/TB1sQZJJpXXXXcyXFXXt5uDFpXX-18-12.png)}
		.icon.mv.mv-big{width:28px;height:17px;background-image:url(http://gtms02.alicdn.com/tps/i2/TB1nUrZIVXXXXXIXXXX3yZgFVXX-28-17.png)}
		.identities{font-size:14px;display:inline-block;font:9px/1.5 Verdana;color:#FFF;vertical-align:middle;text-align:center;text-indent:-9999px;background-repeat:no-repeat}
		.ident{margin-left:5px;font-size:14px;display:inline-block;background-color:#F60;font:9px/1.5 Verdana;color:#FFF;vertical-align:middle;text-align:center}
		.ident-small{font-size:8px;cursor:pointer;width:24px;height:12px;background-image:url(//gtms01.alicdn.com/tps/i1/TB14ucJJpXXXXb6XFXXKMKLFFXX-24-12.png)}
		.ident-default{height:17px;border-radius:2px;padding:0 4px}
		.ident-big{width:32px;height:17px;margin-left:5px;background-image:url(//gtms04.alicdn.com/tps/i4/TB1Qgc5JpXXXXXQXXXXMOlEGXXX-32-17.png)}
		.ident-big-sp{position:absolute;top:12px;left:120px;border-radius:4px;padding:2px 14px;cursor:pointer}
		a.ident-big-sp:hover{background-color:#E65C00;color:#fff;text-decoration:none}
		#dialog_clt .dialog-buy-music{background-color:#fff;text-align:center;font-size:14px!important;color:#797C80;padding:20px}
		#dialog_clt .dialog-buy-music p{font-size:14px!important;margin:0!important}
		#dialog_clt .dialog-buy-music .qrcode{width:200px;height:200px;margin:0 auto}
		.cklist{margin:0 20px 20px}
		.cklist .item{height:47px;line-height:47px;border-bottom:#e8e8e8 1px solid;font-size:14px}
		.cklist .item>.identities{float:right;margin-top:18px}
		@media only screen and (-Webkit-min-device-pixel-ratio:1.5),only screen and (-moz-min-device-pixel-ratio:1.5),only screen and (-o-min-device-pixel-ratio:3 / 2),only screen and (min-device-pixel-ratio:1.5){.icon.mv{background-size:18px 12px;background-image:url(//gtms02.alicdn.com/tps/i2/TB1T5vIIVXXXXaOaXXXoMvXGpXX-36-24.png)}
		.icon.mv.mv-big{background-size:28px 17px;background-image:url(//gtms02.alicdn.com/tps/i2/TB1alA3JpXXXXa6XXXXwA9qHFXX-56-34.png)}
		.ident-small{background-size:24px 12px;background-image:url(//gtms03.alicdn.com/tps/i3/TB16bRyJXXXXXanXFXXaYjxHXXX-48-24.png)}
		.ident-big{background-size:32px 17px;background-image:url(//gtms04.alicdn.com/tps/i4/TB1Bt7VJpXXXXbGXpXXhOdiIXXX-64-34.png)}
		}
		#J_xiamiPlayerWrap{position:absolute;top:-100px;left:-100px}
		#J_playerWrap{height:100%;position:relative;padding-left:278px;padding-right:330px}
		.player-controls{width:278px;height:100%;position:absolute;top:0;left:0}
		.player-controls .prev-btn,.player-controls .play-btn,.player-controls .pause-btn,.player-controls .next-btn{display:block;width:30px;height:30px;position:absolute;cursor:pointer}
		.player-controls .prev-btn{top:25px;left:38px}
		.player-controls .pause-btn,.player-controls .play-btn{top:25px;left:91px}
		.player-controls .next-btn{top:25px;left:144px}
		.player-controls .player-mode{position:absolute;top:31px;left:202px;width:20px;text-align:right}
		.player-controls .player-mode a{display:block;width:20px;height:18px;cursor:pointer}
		.player-room .player-controls .player-mode a{cursor:not-allowed;filter:alpha(opacity=30);opacity:.3}
		.player-roam .player-controls .prev-btn{background-position:-30px -90px;cursor:not-allowed;filter:alpha(opacity=30);opacity:.3}
		.player-room .player-controls .prev-btn{background-position:-30px -90px;cursor:not-allowed;filter:alpha(opacity=30);opacity:.3}
		.player-room .player-controls .next-btn{background-position:-30px -60px;cursor:not-allowed;filter:alpha(opacity=30);opacity:.3}
		.player-room .player-controls .pause-btn{background-position:-30px -30px;cursor:not-allowed;filter:alpha(opacity=30);opacity:.3}
		.player-volume{width:270px;height:100%;position:absolute;right:0;top:0}
		.player-volume #J_playerHQ{width:80px;height:32px;display:block;position:absolute;top:28px;right:176px;cursor:pointer;background-image:url(http://gtms01.alicdn.com/tps/i1/T1ldFHFpxtXXaLghZR-80-832.png);background-repeat:no-repeat}
		.player-volume #volume{position:absolute;top:31px;right:40px;width:110px;height:18px}
		.player-volume #J_volumeSpeaker{position:absolute;cursor:pointer;left:0}
		.player-volume .volume-wrap{position:absolute;left:24px;width:80px;height:18px}
		.player-volume .volume-wrap .volume-panel{width:100%;position:absolute;left:0;top:0;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAYAAABytg0kAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAASSURBVBhXY/j//78xCEMZ/40Bd5oMwTgDaikAAAAASUVORK5CYII=") repeat-x 0 50%;height:100%}
		.ks-ie7 .player-volume .volume-wrap .volume-panel{background:url(http://gtms02.alicdn.com/tps/i2/T1rgeAFt0XXXbIPdPr-2-2.png) repeat-x 0 50%}
		.player-volume .volume-wrap .volume-cur{-webkit-transition-property:width;-moz-transition-property:width;-o-transition-property:width;-ms-transition-property:width;transition-property:width;-webkit-transition-duration:.3s;-moz-transition-duration:.3s;-o-transition-duration:.3s;-ms-transition-duration:.3s;transition-duration:.3s;position:absolute;left:0;top:px;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAYAAABytg0kAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAPSURBVBhXY/gPBVDG//8Aj4IP8dFqTzkAAAAASUVORK5CYII=") repeat-x 0 50%;height:100%}
		.ks-ie7 .player-volume .volume-wrap .volume-cur{background:url(http://gtms01.alicdn.com/tps/i1/T1Dr5zFxtaXXbIPdPr-2-2.png) repeat-x 0 50%}
		.player-volume .volume-wrap .volume-dot{-webkit-transition-property:left;-moz-transition-property:left;-o-transition-property:left;-ms-transition-property:left;transition-property:left;-webkit-transition-duration:.3s;-moz-transition-duration:.3s;-o-transition-duration:.3s;-ms-transition-duration:.3s;transition-duration:.3s;position:absolute;top:0}
		.player-volume .volume-wrap .volume-control{width:100%;height:100%;position:absolute;left:0;top:0;cursor:pointer}
		.player-info{height:100%;position:relative;user-select:text;-moz-user-select:text;-webkit-user-select:text;-ms-user-select:text}
		.player-info .track-info{position:absolute;top:20px;height:18px;line-height:18px;width:100%;color:#fff}
		.player-info .track-info .player-track-info{text-overflow:ellipsis;white-space:nowrap;overflow:hidden;padding-right:100px;font-size:14px}
		.player-info .track-info .player-track-info a:link,.player-info .track-info .player-track-info a:visited{color:#fff;text-decoration:none}
		.player-info .track-info .player-track-info a:hover,.player-info .track-info .player-track-info a:active{text-decoration:underline}
		.player-info .track-info .track-controls{position:absolute;top:0;right:0;width:100px;height:18px}
		.player-info .track-info .track-controls #J_trackMore{position:absolute;right:0;top:0;cursor:pointer}
		.player-info .track-info .track-controls #J_trackShare{position:absolute;right:33px;top:0;cursor:pointer}
		.player-info .track-info .track-controls #J_trackFav{position:absolute;right:66px;top:0;cursor:pointer}
		.player-info .player-length{position:absolute;top:43px;font-size:10px;width:100%;height:20px}
		.player-info .player-length .player-position{position:absolute;line-height:18px;left:0;color:#fff;width:40px;filter:alpha(opacity=30);opacity:.3}
		.player-info .player-length .player-duration{position:absolute;line-height:18px;right:0;color:#fff;width:40px;text-align:right;filter:alpha(opacity=30);opacity:.3}
		.player-info .player-progress{position:absolute;height:18px;left:40px;right:40px}
		.player-info .player-progress .progress{position:absolute;top:0;width:100%;height:100%;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAYAAABytg0kAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAASSURBVBhXY/j//78xCEMZ/40Bd5oMwTgDaikAAAAASUVORK5CYII=") repeat-x 0 50%}
		.ks-ie7 .player-info .player-progress .progress{background:url(http://gtms02.alicdn.com/tps/i2/T1rgeAFt0XXXbIPdPr-2-2.png) repeat-x 0 50%}
		.player-info .player-progress .loading{position:absolute;top:0;left:0;height:100%;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAYAAABytg0kAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAASSURBVBhXY/j3758vCEMZ/3wBejQNHTLQK0UAAAAASUVORK5CYII=") repeat-x 0 50%}
		.ks-ie7 .player-info .player-progress .loading{background:url(http://gtms04.alicdn.com/tps/i4/T16.uxFrFbXXbIPdPr-2-2.png) repeat-x 0 50%}
		.player-info .player-progress .playing{position:absolute;top:0;left:0;height:100%;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAYAAABytg0kAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAPSURBVBhXY/gPBVDG//8Aj4IP8dFqTzkAAAAASUVORK5CYII=") repeat-x 0 50%}
		.ks-ie7 .player-info .player-progress .playing{background:url(http://gtms01.alicdn.com/tps/i1/T1Dr5zFxtaXXbIPdPr-2-2.png) repeat-x 0 50%}
		.player-info .player-progress .panel{position:absolute;top:0;left:0;width:100%;height:100%;cursor:pointer}
		.player-room .player-info .player-progress .panel{cursor:not-allowed}
		.player-info .player-progress .player-dot{position:absolute;top:0;cursor:pointer;margin-left:-4px}
		.player-room .player-info .player-progress .player-dot{display:none}
		.prev-btn,.play-btn,.next-btn,.pause-btn,.icon-fav,.icon-faved,.icon-share,.icon-more,.volume-on,.volume-off,.volume-dot,.player-dot,.mode-order,.mode-only,.mode-random,.icon-download,.icon-tshare,.icon-bobo,.icon-thenplay,.icon-playnow,.icon-collect,.icon-mobile,.icon-play,.icon-history,.icon-myfav,.icon-addCollect,.icon-editCollect,.icon-deleteCollect,.icon-track-fav,.icon-track-faved,.icon-track-more,.icon-track-delete,.icon-roam-fav,.icon-roam-faved,.icon-roam-more,.icon-roam-delete{background-image:url(http://gtms03.alicdn.com/tps/i3/T1bMh.FxNXXXb_r3IF-72-730.png);background-repeat:no-repeat}
		.prev-btn{background-position:0 -90px}
		.prev-btn:hover{background-position:-30px -90px}
		.play-btn{background-position:0 0}
		.play-btn:hover{background-position:-30px 0}
		.pause-btn{background-position:0 -30px}
		.pause-btn:hover{background-position:-30px -30px}
		.next-btn{background-position:0 -60px}
		.next-btn:hover{background-position:-30px -60px}
		.icon-fav{background-position:0 -241px;width:18px;height:18px}
		.icon-fav:hover{background-position:-28px -241px}
		.icon-faved{background-position:0 -130px;width:18px;height:18px}
		.icon-share{background-position:0 -259px;width:18px;height:18px}
		.icon-share:hover{background-position:-28px -259px}
		.icon-more{background-position:0 -277px;width:18px;height:18px}
		.icon-more:hover{background-position:-28px -277px}
		.volume-on{background-position:0 -295px;width:18px;height:18px}
		.volume-on:hover{background-position:-28px -295px}
		.volume-off{background-position:0 -313px;width:18px;height:18px}
		.volume-off:hover{background-position:-28px -313px}
		.volume-dot{background-position:-32px -338px;width:18px;height:18px}
		.player-dot{background-position:-32px -338px;width:18px;height:18px}
		.mode-order{background-position:0 -181px}
		.mode-order:hover{background-position:-30px -181px}
		.mode-only{background-position:0 -201px}
		.mode-only:hover{background-position:-30px -201px}
		.mode-random{background-position:0 -221px}
		.mode-random:hover{background-position:-30px -221px}
		.icon-download{background-position:0 -527px}
		.icon-collect{background-position:0 -545px}
		.icon-mobile{background-position:0 -581px}
		.icon-tshare{background-position:0 -563px}
		.icon-bobo{background-position:0 -599px}
		.icon-thenplay{background-position:0 -689px}
		.icon-playnow{background-position:0 -509px}
		.icon-play{background-position:0 -358px}
		.icon-history{background-position:0 -376px}
		.icon-myfav{background-position:0 -394px}
		.icon-addCollect{background-position:0 -412px}
		.icon-addCollect:hover{background-position:-28px -412px}
		.icon-editCollect{background-position:0 -430px}
		.icon-editCollect:hover{background-position:-28px -430px}
		.icon-deleteCollect{background-position:0 -448px}
		.icon-deleteCollect:hover{background-position:-28px -448px}
		.icon-track-fav,.icon-roam-fav{background-position:-28px -130px;width:18px;height:18px}
		.icon-track-faved,.icon-roam-faved{background-position:0 -130px;width:18px;height:18px}
		.icon-track-fav:hover,.icon-roam-fav:hover{background-position:-28px -155px}
		.icon-track-more,.icon-roam-more{background-position:0 -473px;width:18px;height:18px}
		.icon-track-more:hover,.icon-roam-more:hover{background-position:-28px -473px}
		.icon-track-delete,.icon-roam-delete{background-position:0 -491px;width:18px;height:18px}
		.icon-track-delete:hover,.icon-roam-delete:hover{background-position:-28px -491px}
		.icon-tracks-delete,.icon-tracks-play,.icon-tracks-fav,.icon-tracks-more,.icon-playAllBtn{background-image:url(http://gtms01.alicdn.com/tps/i1/T1Z8x_FEBXXXcvwvwe-420-106.png);background-repeat:no-repeat;width:73px;height:30px}
		.icon-tracks-add{background-image:url(http://gtms01.alicdn.com/tps/i1/T1Z8x_FEBXXXcvwvwe-420-106.png);background-repeat:no-repeat;width:120px;height:30px}
		.icon-tracks-delete{background-position:0 0}
		.icon-tracks-delete:hover{background-position:0 -30px}
		.icon-tracks-play{background-position:-75px 0}
		.icon-tracks-play:hover{background-position:-75px -30px}
		.icon-tracks-fav{background-position:-150px 0}
		.icon-tracks-fav:hover{background-position:-150px -30px}
		.icon-tracks-add{background-position:-225px 0}
		.icon-tracks-add:hover{background-position:-225px -30px}
		.icon-tracks-more{background-position:-348px 0}
		.icon-tracks-more:hover{background-position:-348px -30px}
		.icon-playAllBtn{background-position:0 -63px}
		.icon-playAllBtn:hover{background-position:-42px -63px}
		.icon-listener{width:24px;height:24px;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHMSURBVEhLrZPBSgJRFIYjFbNeIOgZgpa2cCVlpa2Ceogot7ULoocqa+eqXFkE1apFgkRLsSLHvnP9HTTvWDP0wc+d85//nkE9zvgIgiCLjtETekePVvf7/YwiyWFIimE1zgnwzzlSiiaDIVUNe0ElHuc5N1FLflXRZDCgqUElWQ7qivnQkJUMBn1o0Nj3jZ8zk7MrKxluNKj8fzQ/8gW0MuiIT/Jgnwa5DUNZRaZDcPgVpWWF4NmG2SZNgH/B8fuGERz+yOuyQvD21WuhMlpAG1bL/33DCB0qbGta5DHNuWY9nhvqVVxYUNs6m9+U5YdAHp2inl0YRf2uyjl3QVCnzaT/KWscGgV0Y6EoLKdH7wKoNdlj8A76QkYNHaBVsoto1jIjp8Oef6KW9wXP1uDckhUJmfhfEWbbmiqnQiz+j4zZsabKqZCNv6aYdWt6OFHEQc427AwF6o+B3VM/rysD6K1g3g9iIeFwekXk/nwxaHCnoBHRENpDww27RFVkK72EcsrkVJtv/St7A6fd23WDoiDwqnBZ1p8gv617LVl+CLxZUGUs9IK2Sj8E3N6rjIVe0FHph8C1BZPC/bpG+SFjG3Y3iMeDe7dBECx/A73ysGgMXCa4AAAAAElFTkSuQmCC") no-repeat 0 0;display:inline-block}
		.ks-ie7 .icon-listener{background:url(http://gtms03.alicdn.com/tps/i3/T1PQGAFpNXXXa1YfHb-24-24.png) repeat 0 0}
		.mode-hq-on1{background-position:0 0}
		.mode-hq-on2{background-position:0 -32px}
		.mode-hq-on3{background-position:0 -64px}
		.mode-hq-on4{background-position:0 -96px}
		.mode-hq-on5{background-position:0 -128px}
		.mode-hq-on6{background-position:0 -160px}
		.mode-hq-on7{background-position:0 -192px}
		.mode-hq-on8{background-position:0 -224px}
		.mode-hq-on9{background-position:0 -256px}
		.mode-hq-on10{background-position:0 -288px}
		.mode-hq-on11{background-position:0 -320px}
		.mode-hq-on12{background-position:0 -352px}
		.mode-hq-on13{background-position:0 -384px}
		.mode-hq-on14{background-position:0 -416px}
		.mode-hq-on15{background-position:0 -448px}
		.mode-hq-on16{background-position:0 -480px}
		.mode-hq-on17{background-position:0 -512px}
		.mode-hq-on18{background-position:0 -544px}
		.mode-hq-on19{background-position:0 -576px}
		.mode-hq-on20{background-position:0 -608px}
		.mode-hq-on21{background-position:0 -640px}
		.mode-hq-on22{background-position:0 -672px}
		.mode-hq-on23{background-position:0 -704px}
		.mode-hq-on24{background-position:0 -736px}
		.mode-hq-on25{background-position:0 -768px}
		.mode-hq-on26{background-position:0 -800px}
		.mode-hq-off1{background-position:0 -800px}
		.mode-hq-off2{background-position:0 -768px}
		.mode-hq-off3{background-position:0 -736px}
		.mode-hq-off4{background-position:0 -704px}
		.mode-hq-off5{background-position:0 -672px}
		.mode-hq-off6{background-position:0 -640px}
		.mode-hq-off7{background-position:0 -608px}
		.mode-hq-off8{background-position:0 -576px}
		.mode-hq-off9{background-position:0 -544px}
		.mode-hq-off10{background-position:0 -512px}
		.mode-hq-off11{background-position:0 -480px}
		.mode-hq-off12{background-position:0 -448px}
		.mode-hq-off13{background-position:0 -416px}
		.mode-hq-off14{background-position:0 -384px}
		.mode-hq-off15{background-position:0 -352px}
		.mode-hq-off16{background-position:0 -320px}
		.mode-hq-off17{background-position:0 -288px}
		.mode-hq-off18{background-position:0 -256px}
		.mode-hq-off19{background-position:0 -224px}
		.mode-hq-off20{background-position:0 -192px}
		.mode-hq-off21{background-position:0 -160px}
		.mode-hq-off22{background-position:0 -128px}
		.mode-hq-off23{background-position:0 -96px}
		.mode-hq-off24{background-position:0 -64px}
		.mode-hq-off25{background-position:0 -32px}
		.mode-hq-off26{background-position:0 0}
		.track-more-menu{background-color:#333;border-radius:4px;position:fixed;width:140px;height:90px;padding:10px;bottom:26px;left:300px;z-index:1999}
		.track-more-menu ul li{height:30px;line-height:30px}
		.track-more-menu ul li a{display:block;padding-left:38px;line-height:30px;border-radius:4px;text-decoration:none;color:#aaa;position:relative}
		.track-more-menu ul li a:hover{background-color:#444}
		.track-more-menu ul li i{width:18px;height:18px;position:absolute;top:6px;left:8px}
		.track-more-menu .arrow{background-image:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAASCAYAAACJgPRIAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACLSURBVChThc4BDoIwDAVQONK6HUhRuQ4xRrksqP+PDsjWwU+arO3L0uYkrfd+0LeZVkSeQD/ti6yghgheCVioADnike8csHQff/hYgJXAaC1TNWeARdTj8c0X+4oHAT7QVGFEDOAdAxMqWYLBDVVAXW8JIXRYzIeIyaGOyzjnrrhzOkRMgtrWIyKXPykjhfjqVAPDAAAAAElFTkSuQmCC");position:absolute;bottom:16px;left:-9px;width:9px;height:18px}
		.ks-ie7 .track-more-menu .arrow{background-image:url(http://gtms03.alicdn.com/tps/i3/T1ZNuzFrtaXXbeUgbb-9-18.png)}
		.page-more-menu{background-color:#333;border-radius:4px;position:fixed;width:140px;height:auto;padding:10px;bottom:85px;left:300px;z-index:1999}
		.page-more-menu ul li{height:30px;line-height:30px}
		.page-more-menu ul li a{display:block;padding-left:38px;line-height:30px;border-radius:4px;text-decoration:none;color:#aaa;position:relative}
		.page-more-menu ul li a:hover{background-color:#444}
		.page-more-menu ul li i{width:18px;height:18px;position:absolute;top:6px;left:8px}
		.page-more-menu .arrow{background-image:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAASCAYAAACJgPRIAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACLSURBVChThc4BDoIwDAVQONK6HUhRuQ4xRrksqP+PDsjWwU+arO3L0uYkrfd+0LeZVkSeQD/ti6yghgheCVioADnike8csHQff/hYgJXAaC1TNWeARdTj8c0X+4oHAT7QVGFEDOAdAxMqWYLBDVVAXW8JIXRYzIeIyaGOyzjnrrhzOkRMgtrWIyKXPykjhfjqVAPDAAAAAElFTkSuQmCC");position:absolute;bottom:16px;left:-9px;width:9px;height:18px}
		.ks-ie7 .page-more-menu .arrow{background-image:url(http://gtms03.alicdn.com/tps/i3/T1ZNuzFrtaXXbeUgbb-9-18.png)}
		.item-more-menu{background-color:#333;border-radius:4px;position:fixed;width:140px;height:auto;padding:10px;bottom:auto;left:300px;z-index:1999}
		.item-more-menu ul li{height:30px;line-height:30px}
		.item-more-menu ul li a{display:block;padding-left:38px;height:30px;line-height:30px;border-radius:4px;text-decoration:none;color:#aaa;position:relative}
		.item-more-menu ul li a:hover{background-color:#444}
		.item-more-menu ul li i{width:18px;height:18px;position:absolute;top:6px;left:8px}
		.item-more-menu .arrow{background-image:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAASCAYAAACJgPRIAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACLSURBVChThc4BDoIwDAVQONK6HUhRuQ4xRrksqP+PDsjWwU+arO3L0uYkrfd+0LeZVkSeQD/ti6yghgheCVioADnike8csHQff/hYgJXAaC1TNWeARdTj8c0X+4oHAT7QVGFEDOAdAxMqWYLBDVVAXW8JIXRYzIeIyaGOyzjnrrhzOkRMgtrWIyKXPykjhfjqVAPDAAAAAElFTkSuQmCC");position:absolute;left:-9px;width:9px;height:18px}
		.ks-ie7 .item-more-menu .arrow{background-image:url(http://gtms03.alicdn.com/tps/i3/T1ZNuzFrtaXXbeUgbb-9-18.png)}
		.item-more-menu-up{bottom:auto}
		.item-more-menu-up .arrow{top:16px;bottom:auto}
		.item-more-menu-down{top:auto}
		.item-more-menu-down .arrow{bottom:16px;top:auto}
		.player-add-tip{position:absolute;width:20px;height:20px;background:url(http://gtms04.alicdn.com/tps/i4/T1oJ1AFxdaXXcu5FDa-20-20.png) no-repeat 0 0;left:100px;top:76px}
		.ui-album-cover{height:185px;width:250px;padding-top:20px}
		.ui-album-img{width:250px;height:185px;display:table-cell;vertical-align:middle;text-align:center}
		.ui-album-img img{max-height:100%;max-width:100%}
		.ks-ie .ui-album-img{display:block;font-size:162px}
		.ui-album-sale{height:42px;padding:5px 0}
		.ui-album-sale a.taobao{display:block;width:170px;height:40px;border-radius:4px;background:#ff7b00 url(http://gtms04.alicdn.com/tps/i4/TB1m4bJFVXXXXXsXFXXnuQ0GpXX-158-28.png) no-repeat 50% 50%;border:1px solid #e0e0e0;text-decoration:none;margin:0 auto;position:relative}
		.ui-album-sale a.taobao:hover{background-color:#ea5f03}
		.ui-album-sale a.taobao s{display:block;width:60px;height:18px;color:#FFD9AF;text-align:center;line-height:18px;position:absolute;right:3px;top:22px}
		.ui-album-sale a.taobao i{display:block;width:60px;height:18px;color:#FFF;font-style:normal;text-align:center;line-height:18px;position:absolute;right:3px;top:5px}
		.ui-album-sale a.taobao span{display:block;width:65px;height:40px;line-height:40px;position:absolute;left:40px;top:0;color:#FFF;font-size:20px;text-align:center}
		.ui-album-sale a.taobao em{font-style:normal;font-size:32px}
		.ui-album-sale .none{display:block;width:130px;height:40px;overflow:hidden;padding-left:40px;text-indent:-900px;border-radius:4px;border:1px solid #e0e0e0;text-decoration:none;margin:0 auto;background:#ff7b00 url(http://gtms04.alicdn.com/tps/i4/TB1kzPbFVXXXXaDaXXXXtoJFVXX-152-27.gif) no-repeat 50% 50%;font-size:0;color:#fff;text-align:center}
		.ui-album-sale .none:hover{background-color:#f27300}
		#J_lyricScrollView{height:100%}
		.ui-player-lrc{position:absolute;top:215px;bottom:0;width:250px}
		.ks-ie7 .ui-player-lrc{overflow-y:auto;overflow-x:hidden}
		.ui-player-lrc .no-lrc{cursor:pointer;width:180px;height:72px;position:absolute;top:50%;left:50%;margin-top:-36px;margin-left:-90px;background:url(http://gtms01.alicdn.com/tps/i1/T10mh6FyluXXcWtwnj-180-72.png) no-repeat 0 0}
		.ui-player-lrc .pure-music{position:absolute;top:50%;left:50%;margin-top:-7px;margin-left:-60px}
		.ui-player-lrc ul{padding:0 10px}
		.ui-player-lrc ul li{color:#333;line-height:22px;text-align:center;padding:3px 10px}
		.ui-player-lrc ul .ui-lrc-current{color:#f60;-webkit-transition-property:color;-moz-transition-property:color;-o-transition-property:color;-ms-transition-property:color;transition-property:color;-webkit-transition-duration:.1s;-moz-transition-duration:.1s;-o-transition-duration:.1s;-ms-transition-duration:.1s;transition-duration:.1s;-webkit-transition-timing-function:ease-in;-moz-transition-timing-function:ease-in;-o-transition-timing-function:ease-in;-ms-transition-timing-function:ease-in;transition-timing-function:ease-in}
		.search-wrap{position:absolute;left:240px;width:230px;height:30px;top:13px;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOYAAAAeCAYAAAA4q2LPAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGpSURBVHhe7d3NTsJAFEDhkcRnIIEHcKM7drrWhfH9n4MA3eI9dTRQJ0BROrM4N/lWLXV1Upn+kC6Z/X4/22w28/DYdd3Ldrt9De+73e5DUhmN0ArN0A4N0VLO6vqJg9yv1+uHOPhb6Q9LGoeWaIq2cmbjJg6ypPbhgSX9XW5rmXM7P1HyXZxyn4YHkvT/aI3mcn7lYYfYeTX8sKSbWp2Mky+ohQ9JujHOnDnD44mNi+HOkia1yDl+DStELvRIddEgLeYsU2L5trSjpGnRYh9lFDrj2kppJ0nTokWaZMFnXtpBUh006Uqs1BiaTF3XPZc2SqqDJpPfL6W20CRh+pSI1BCaNEypMd9h+q+s1BCadPFHaky/+OPlEqkt/eUSLmaWNkqqgya9JU9qCC32t+Qx3sQuteHnJnaGR02iVB/7kirKZ8vjl3TFBh+Uluoqv5wrvnT6Ei6pAtrLGf6eOI36Mi5peqdfxsWwg2dOaRq0djbKw4kP+cJn6UZyW5e/8PlwWCFi+ZbVouGBJY1HSzRFWzmz6ycO4o8KSSPRCK3QDO3QEC3lrE5MSp/SzqyX2PtjLwAAAABJRU5ErkJggg==") no-repeat 0 0}
		.ks-ie7 .search-wrap{background:url(http://gtms03.alicdn.com/tps/i3/T14kyzFDBXXXcSgITo-230-30.png) no-repeat 0 0}
		.search-wrap .search-content{padding-left:30px;position:relative}
		.search-wrap .search-content #J_searchStatus{border:0 none;cursor:pointer;background-color:red;width:30px;height:30px;display:block;overflow:hidden;position:absolute;font-size:0;left:0;top:0;text-indent:150%;outline:0;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAEcSURBVDhPpZNNTgJREIQncanulCvINTgD7jyKOySchABbhnsYxIsAsgBCZvhqKHgQ3tMMfkmFprq6Mz9vsnPKsnwqiqKHZmhtTVFHPcd+h3Cb8BxFob9QxvE4CqDCAzlqUT5IqtHEPRFfRuMZLRx8t32Fes7oyhq2A5i6fwUmtpKQyZ3t2QpgTt1s2UqijLMzWwHMtZuPtpIo4+zGVqDOImJ6Acr+2Apg3nJrX7YCmMeHndtKooyz0YfdQP9//YLG+YEcIx3Ce0t1dSWCeuixOARe0dL5K9RDI9dd9EJ55/FLaBw/2m+0RSv0iT7UU4a662UbNEgu+wsGmyyojoy4eZmGGB5WWwz/+27Xg9nTMn536M2t+nhZ/7Aky/Y0HADxN+jy+QAAAABJRU5ErkJggg==") no-repeat 10px 50%}
		.ks-ie7 .search-wrap .search-content #J_searchStatus{background:url(http://gtms02.alicdn.com/tps/i2/T1u55zFpXaXXX9g2ba-18-18.png) no-repeat 10px 50%}
		.search-wrap .search-content #J_searchStatus.loading{background:url(http://gtms01.alicdn.com/tps/i1/T1OT08Fv8aXXXYdLba-18-18.gif) no-repeat 10px 50%}
		.search-wrap .search-input{width:200px}
		.search-wrap .search-input input{border:0 none;background-color:transparent;height:24px;width:180px;padding:3px;outline:0;color:#fff;font-family:"Hiragino Sans GB","Microsoft Yahei",SimHei,SimSun}
		.search-result{position:fixed;z-index:99;width:280px;top:46px;left:240px;border-radius:4px;border:1px solid #ccc;background-color:#FFF;box-shadow:2px 2px 2px rgba(0,0,0,.1);overflow:hidden}
		.search-result b{font-weight:400;color:red}
		.search-result .play-btn{cursor:pointer;display:block;width:18px;height:18px;position:absolute;right:10px;top:6px;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAkCAYAAACE7WrnAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALUSURBVEhLrVTNThphFKVJqwut3fcBGpoUjU9gYk19kvYdMBK2/IaQsBmWQwLyo2HFFl3xCJoID4AuJMRocDM95+PMlOnMwCTtTU6+ufece7+/+W4izNrt9jFgAffAQuC31e12v0sWbb1eLwnxsNPpOOtADbVK8xvII2Au8SOQhp8aDAbbxMXFxQH8jDgWmzNH6UtjdZAzCoAe8ElUwBqNxp401M68lTmO8w6BkYgefUOsMeW4xUYmB0s+YQDLfOBs0hpD7LLZbH6W6zNqwU+ZyxoJfNRVKCONZ4o/AT/DVgo+TQ1r0BnT4WGK90wiF9etVuuLKGOYICVuTGdBhzcj3jOJPED7ApwNh8P34rcUX7CQufI4hYBXFrIs64P4XcbdQnd0Ymzt5u+t4S/fJ4caExay5UQeNsZf6w6bNXj9p3KmIdd/Fef6sbIf/++HpK0+EczS7ff7Hw0RYuRWisxwbl9FLQ0FAo8W2/7GG7JtewfLP0TsXBwnDD5a17Qyd5vrMIpsI65xvzw8iOuYcYLxDXjG9y1j5OKco7FisXgMWMB9qVRaEPxmDN+bOyRESWAIOBtATfjWyuXyEcg5hZj5EUgjlqpWq9sEvg/AZchRQy1zlL40BLmSGQUQ9nK5XGSHRNE9alSMOX86JIiRWyTOQSrHFGOuySkUCicKPHA2aY0hfpnP50OfCLXgp8xlDYrrdIDAo2UcEzxBGNohwaWVW6d4TIeHKd4ziQyQdI3R10Z4GeLHFPM/cXgz4j2TaLXYC8azbDZrOiTGLXELis2VxykEvAJeh6zVaruKm0J3dDZtDbgBfFvD2e2Tw0onFNsSRh42xtAOuXLYNsWncqYh138V8/qXHRKV//2HpCHgPRGgi1VEdkhybhHmVCoVf4fkAwThe7SA6ZAYdxA/xHhOTkWCj9Y1kEkIzTbXQZrNHZKHB2EdCRPgDd/PGG8ZIxc8x0TiN8TI5Mlo5KNJAAAAAElFTkSuQmCC") no-repeat 0 0}
		.ks-ie7 .search-result .play-btn{background:url(http://gtms04.alicdn.com/tps/i4/T1xLexFDdbXXXql2na-18-36.png) no-repeat 0 0}
		.search-result .play-btn:hover{background-position:0 bottom}
		.search-result dt{height:30px;line-height:30px;padding-left:20px;color:#aaa;background-color:#F0F0F0}
		.search-result dd{padding:10px}
		.search-result ul li{position:relative;height:30px;border-radius:4px;padding-left:10px;padding-right:40px}
		.search-result ul li a{color:#333;text-decoration:none}
		.search-result ul li:hover{background-color:#F5F5F5}
		.search-result .song-list li{line-height:30px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden}
		.search-result .album-list li{padding-top:5px;padding-bottom:5px}
		.search-result .album-list .play-btn{top:11px}
		.search-result .album{overflow:hidden}
		.search-result .album .img{float:left}
		.search-result .album .img img{display:block}
		.search-result .album .name{float:left;width:170px;padding-left:8px;line-height:15px}
		.search-result .album .name p{text-overflow:ellipsis;white-space:nowrap;overflow:hidden}
		.search-result .artist-list li{padding-top:5px;padding-right:0;padding-bottom:5px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden}
		.search-result .artist-list .play-btn{top:11px}
		.search-result .artist{overflow:hidden}
		.search-result .artist .img{float:left}
		.search-result .artist .img img{display:block}
		.search-result .artist .name{float:left;width:202px;padding-left:8px;line-height:30px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden}
		.search-result .result-more{border-top:1px solid #ccc;line-height:30px;padding-left:20px}
		.search-result .result-more a{color:#333;text-decoration:none}
		.search-result .search-none{padding-left:10px}
		.search-result .search-none a{text-decoration:none;color:#333}
		.tip-twitter{opacity:.85;z-index:1000;text-align:left;border-radius:4px;-moz-border-radius:4px;-webkit-border-radius:4px;padding:15px;max-width:200px;color:#fff;background-color:#000}
		.tip-twitter a{color:#f60;text-decoration:none}
		.tip-twitter .tip-inner{font:700 12px/14px 'Lucida Grande',sans-serif}
		.tip-twitter .tip-arrow-top{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;margin-top:-5px;margin-left:-5px;top:0;left:50%;width:9px;height:5px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAJCAYAAABaMo5wAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABlSURBVDhPtY6BCgAhDEL3/z990dGFeW4FWw8kcCqZ4BkvojymZ3ZilLfglZWnwD6L8fwJljmsPA/Mep3o9oIBVkd5EVEWb+r+C5xqh8rwhsocUTIyKNlKDxDpvcrPfKQ/dAPaNWte0mOdiGqHOwAAAABJRU5ErkJggg==) no-repeat}
		.tip-twitter .tip-arrow-right{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;margin-top:-4px;margin-left:0;top:50%;left:100%;width:5px;height:9px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAJCAYAAABaMo5wAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABlSURBVDhPtY6BCgAhDEL3/z990dGFeW4FWw8kcCqZ4BkvojymZ3ZilLfglZWnwD6L8fwJljmsPA/Mep3o9oIBVkd5EVEWb+r+C5xqh8rwhsocUTIyKNlKDxDpvcrPfKQ/dAPaNWte0mOdiGqHOwAAAABJRU5ErkJggg==) no-repeat -9px 0}
		.tip-twitter .tip-arrow-bottom{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;margin-top:0;margin-left:-5px;top:100%;left:50%;width:9px;height:5px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAJCAYAAABaMo5wAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABlSURBVDhPtY6BCgAhDEL3/z990dGFeW4FWw8kcCqZ4BkvojymZ3ZilLfglZWnwD6L8fwJljmsPA/Mep3o9oIBVkd5EVEWb+r+C5xqh8rwhsocUTIyKNlKDxDpvcrPfKQ/dAPaNWte0mOdiGqHOwAAAABJRU5ErkJggg==) no-repeat -18px 0}
		.tip-twitter .tip-arrow-left{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;margin-top:-4px;margin-left:-5px;top:50%;left:0;width:5px;height:9px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAJCAYAAABaMo5wAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABlSURBVDhPtY6BCgAhDEL3/z990dGFeW4FWw8kcCqZ4BkvojymZ3ZilLfglZWnwD6L8fwJljmsPA/Mep3o9oIBVkd5EVEWb+r+C5xqh8rwhsocUTIyKNlKDxDpvcrPfKQ/dAPaNWte0mOdiGqHOwAAAABJRU5ErkJggg==) no-repeat -27px 0}
		.tip_60d{margin:0 15px;text-align:center}
		.tip_60d a{font-weight:400;color:#858585}
		.tip_60d strong{display:block;font-size:18px;line-height:1.5;color:#F60}
		.tip_60d em{display:block;margin-bottom:10px;border-bottom:1px solid #5C5C5C;font-style:normal;line-height:2;color:#FFF}
		.main-wrap{height:100%;padding-left:240px;padding-right:310px;position:relative}
		.ks-ie7 .main-wrap{position:absolute;left:0;right:0;bottom:0;top:0}
		.main-sidebar{width:190px;padding:0 10px;height:100%;position:absolute;top:0;left:0}
		.main-outher{width:250px;padding-right:20px;height:100%;position:absolute;right:0;top:0;user-select:text;-moz-user-select:text;-webkit-user-select:text;-ms-user-select:text}
		.main-body{height:100%}
		.main-page{height:100%;position:relative}
		.menu-outer{padding-top:10px;padding-bottom:10px;border-bottom:1px solid #ccc}
		.menu-outer ul li{-moz-user-select:none;-webkit-user-select:none;-ms-user-select:none;user-select:none;height:36px}
		.menu-outer ul li a{display:block;height:36px;line-height:36px;padding-left:36px;cursor:pointer;border-radius:4px;position:relative;color:#333;text-decoration:none;-webkit-transition:.3s ease;-moz-transition:.3s ease;-webkit-transition-property:background-color;-moz-transition-property:background-color}
		.menu-outer ul li a:hover{background-color:#F5F5F5;text-decoration:none}
		.menu-outer ul li i{position:absolute;top:9px;left:9px;width:18px;height:18px}
		.menu-outer ul .current a,.menu-outer ul .current a:hover{background-color:#F0F0F0}
		.collect-outer{padding-top:10px}
		.collect-outer .collect-title{height:30px;line-height:30px;position:relative}
		.collect-outer .collect-title h3{color:#aaa}
		.collect-outer .collect-title span{position:absolute;right:0;top:6px}
		.collect-outer .collect-title a{display:block;width:18px;height:18px;cursor:pointer}
		.collect-list{position:absolute;bottom:120px;top:169px;width:190px;overflow:hidden}
		.ks-ie7 .collect-list{overflow-y:auto;overflow-x:hidden}
		#J_collectScrollView{height:100%}
		#J_collectList{user-select:none;-moz-user-select:none;-webkit-user-select:none;-ms-user-select:none}
		.collect-item{height:36px;padding:5px 0}
		.collect-item .collect-item-con{padding-left:36px;border-radius:4px;height:36px;line-height:36px;cursor:pointer;position:relative;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;-webkit-transition:.3s ease;-moz-transition:.3s ease;-webkit-transition-property:background-color;-moz-transition-property:background-color}
		.collect-item .collect-item-con img{position:absolute;left:5px;top:5px}
		.collect-item .collect-item-con .edit{width:18px;height:18px;display:none;position:absolute;top:9px;right:28px}
		.collect-item .collect-item-con .delete{width:18px;height:18px;display:none;position:absolute;top:9px;right:10px}
		.collect-item .collect-item-con input{display:none}
		.collect-item:hover .collect-item-con,.collect-item-hover .collect-item-con{padding-right:40px;background-color:#F5F5F5}
		.collect-item:hover .collect-item-con .edit,.collect-item-hover .collect-item-con .edit{display:block}
		.collect-item:hover .collect-item-con .delete,.collect-item-hover .collect-item-con .delete{display:block}
		.collect-item-current .collect-item-con{background-color:#F0F0F0}
		.collect-item-edit .collect-item-con span{display:none}
		.collect-item-edit .collect-item-con input{display:block;border:2px solid #dbdbdb;height:23px;line-height:23px;margin:5px 0 0;padding:0 3px;float:left;width:134px;border-radius:4px;font-family:"Hiragino Sans GB","Microsoft Yahei",SimHei,SimSun}
		.promotion-block{position:absolute;bottom:10px}
		/*! music-player - v0.9.24 build by Kissy-cake * @Author:baoma <nongyoubao@alibaba-inc.com> * Copyright (c) XIAMI */
		input[type=checkbox]{cursor:pointer;width:16px;height:16px;margin:0}
		.ks-webkit #player-main input[type=checkbox]{appearance:none;-moz-appearance:none;-webkit-appearance:none;background:url(http://gtms03.alicdn.com/tps/i3/T1bMh.FxNXXXb_r3IF-72-730.png) no-repeat 0 0;background-position:-1px -710px}
		.ks-webkit #player-main input[type=checkbox]:hover{background-position:-19px -710px}
		.ks-webkit #player-main input[type=checkbox]:checked{background-position:-37px -710px}
		.ks-webkit #player-main input[type=checkbox]:disabled{background-position:-55px -710px}
		.ui-row-item{width:100%;position:relative}
		.ui-row-item-body{padding-left:72px;padding-right:110px;overflow:hidden;-moz-user-select:none;-webkit-user-select:none;-ms-user-select:none;user-select:none}
		.ui-row-item .c1,.ui-row-item .c2,.ui-row-item .c3{float:left;width:33%;padding-right:.2%;text-overflow:ellipsis;white-space:nowrap;overflow:hidden}
		.ui-row-item .c1 img,.ui-row-item .c2 img,.ui-row-item .c3 img{vertical-align:middle}
		.ui-row-item .time{color:#aaa}
		.ui-track-item{background-color:#FFF;user-select:none;-moz-user-select:none;-webkit-user-select:none;-ms-user-select:none;-webkit-transition:.3s ease;-moz-transition:.3s ease;-webkit-transition-property:background-color;-moz-transition-property:background-color}
		.ui-track-main{border-bottom:1px solid #EBEBEB;height:40px;line-height:41px;color:#333}
		.ui-track-main a:link,.ui-track-main a:visited{text-decoration:none;color:#333}
		.ui-track-main a:hover{text-decoration:underline}
		.ui-track-disabled{color:#aaa}
		.ui-track-disabled .c1,.ui-track-disabled .c2,.ui-track-disabled .c3{color:#aaa!important}
		.ui-track-disabled .c1 a,.ui-track-disabled .c2 a,.ui-track-disabled .c3 a{color:#aaa!important}
		.ui-track-checkbox{position:absolute;left:0;height:16px;padding:12px 0;padding-left:10px;padding-right:5px;line-height:0}
		.ui-track-sort{position:absolute;width:36px;height:41px;left:31px;top:0;text-align:center}
		.ui-track-sort em,.ui-track-sort i{font-style:normal;font-family:Arial;color:#aaa}
		.ui-track-control{position:absolute;top:0;right:0;width:110px;height:40px}
		.ui-track-control a{display:block;position:absolute;top:11px;cursor:pointer}
		.ui-track-control .icon-track-fav,.ui-track-control .icon-track-faved{right:86px}
		.ui-track-control .icon-track-more{right:53px;display:none}
		.ui-track-control .icon-track-delete{right:20px;display:none}
		.ui-track-item:hover,.ui-track-hover{background-color:#F5F5F5}
		.ui-track-item:hover .ui-track-sort,.ui-track-hover .ui-track-sort{left:31px}
		.ui-track-item:hover .ui-track-sort em,.ui-track-hover .ui-track-sort em{cursor:pointer;display:block;width:18px;height:18px;margin:11px 9px;overflow:hidden;font-size:0;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAkCAYAAACE7WrnAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALUSURBVEhLrVTNThphFKVJqwut3fcBGpoUjU9gYk19kvYdMBK2/IaQsBmWQwLyo2HFFl3xCJoID4AuJMRocDM95+PMlOnMwCTtTU6+ufece7+/+W4izNrt9jFgAffAQuC31e12v0sWbb1eLwnxsNPpOOtADbVK8xvII2Au8SOQhp8aDAbbxMXFxQH8jDgWmzNH6UtjdZAzCoAe8ElUwBqNxp401M68lTmO8w6BkYgefUOsMeW4xUYmB0s+YQDLfOBs0hpD7LLZbH6W6zNqwU+ZyxoJfNRVKCONZ4o/AT/DVgo+TQ1r0BnT4WGK90wiF9etVuuLKGOYICVuTGdBhzcj3jOJPED7ApwNh8P34rcUX7CQufI4hYBXFrIs64P4XcbdQnd0Ymzt5u+t4S/fJ4caExay5UQeNsZf6w6bNXj9p3KmIdd/Fef6sbIf/++HpK0+EczS7ff7Hw0RYuRWisxwbl9FLQ0FAo8W2/7GG7JtewfLP0TsXBwnDD5a17Qyd5vrMIpsI65xvzw8iOuYcYLxDXjG9y1j5OKco7FisXgMWMB9qVRaEPxmDN+bOyRESWAIOBtATfjWyuXyEcg5hZj5EUgjlqpWq9sEvg/AZchRQy1zlL40BLmSGQUQ9nK5XGSHRNE9alSMOX86JIiRWyTOQSrHFGOuySkUCicKPHA2aY0hfpnP50OfCLXgp8xlDYrrdIDAo2UcEzxBGNohwaWVW6d4TIeHKd4ziQyQdI3R10Z4GeLHFPM/cXgz4j2TaLXYC8azbDZrOiTGLXELis2VxykEvAJeh6zVaruKm0J3dDZtDbgBfFvD2e2Tw0onFNsSRh42xtAOuXLYNsWncqYh138V8/qXHRKV//2HpCHgPRGgi1VEdkhybhHmVCoVf4fkAwThe7SA6ZAYdxA/xHhOTkWCj9Y1kEkIzTbXQZrNHZKHB2EdCRPgDd/PGG8ZIxc8x0TiN8TI5Mlo5KNJAAAAAElFTkSuQmCC") no-repeat 0 0}
		.ks-ie7 .ui-track-item:hover .ui-track-sort em,.ks-ie7 .ui-track-hover .ui-track-sort em{background:url(http://gtms04.alicdn.com/tps/i4/T19feyFsNbXXXql2na-18-36.png) no-repeat 0 0}
		.ui-track-item:hover .ui-track-sort em:hover,.ui-track-hover .ui-track-sort em:hover{background-position:0 -18px}
		.ui-track-item:hover .icon-track-fav,.ui-track-hover .icon-track-fav{background-position:0 -155px}
		.ui-track-item:hover .icon-track-fav:hover,.ui-track-hover .icon-track-fav:hover{background-position:-28px -155px}
		.ui-track-item:hover .icon-track-more,.ui-track-hover .icon-track-more{display:block}
		.ui-track-item:hover .icon-track-delete,.ui-track-hover .icon-track-delete{display:block}
		.ui-track-disabled .ui-track-sort{left:31px!important}
		.ui-track-select .icon-track-fav{background-position:0 -155px}
		.ui-track-select .icon-track-fav:hover{background-position:-28px -155px}
		.ui-track-select .icon-track-more{display:block}
		.ui-track-select .icon-track-delete{display:block}
		.ui-track-current{background-color:#F0F0F0}
		.ui-track-current .icon-track-fav{background-position:0 -155px}
		.ui-track-current .icon-track-fav:hover{background-position:-28px -155px}
		.ui-track-current .icon-track-more{display:block}
		.ui-track-current .icon-track-delete{display:block}
		.ui-track-current .ui-track-sort{left:31px!important}
		.ui-track-current .ui-track-sort em{cursor:default!important;display:block;width:12px;height:12px;margin:14px 0 14px 10px;overflow:hidden;font-size:0;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAsAAAAMCAYAAAC0qUeeAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAA6SURBVChTY0AH/1IZDv9PY/gPoqFCuAFIIQxDhXADihTjdRa6YnQ+CkCXROGjW4Miic5H4Qw7xQz/AR6CwDExYgN8AAAAAElFTkSuQmCC") no-repeat 50% 50%}
		.ks-ie7 .ui-track-current .ui-track-sort em{background:url(http://gtms02.alicdn.com/tps/i2/T1t4KyFpXbXXXl1UA_-11-12.png) no-repeat 0 0}
		.playing .ui-track-current .ui-track-sort em{background:url(http://gtms01.alicdn.com/tps/i1/T1X4JEFq8qXXXaYEA_-11-12.gif) no-repeat 0 0;cursor:default!important}
		.ui-track-current .ui-track-sort em:hover{cursor:default!important}
		.ui-track-current .ui-track-sort-roam{width:40px}
		.ui-track-current .ui-track-sort-roam em{width:18px!important;height:18px!important;margin:11px!important;background:url(http://gtms04.alicdn.com/tps/i4/T1Ep5PFwhaXXXYdLba-18-18.gif) no-repeat 0 0!important}
		.ui-track-current .ui-track-main{border-bottom:0;height:41px;overflow:hidden}
		.ui-track-current:hover{background-color:#F0F0F0!important}
		.ui-track-current:hover .ui-track-sort{left:31px!important}
		.ui-track-current:hover .ui-track-sort em{display:block;width:12px;height:12px;margin:14px 0 14px 10px;overflow:hidden;font-size:0;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAsAAAAMCAYAAAC0qUeeAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAA6SURBVChTY0AH/1IZDv9PY/gPoqFCuAFIIQxDhXADihTjdRa6YnQ+CkCXROGjW4Miic5H4Qw7xQz/AR6CwDExYgN8AAAAAElFTkSuQmCC") no-repeat 50% 50%}
		.ks-ie7 .ui-track-current:hover .ui-track-sort em{background:url(http://gtms02.alicdn.com/tps/i2/T1t4KyFpXbXXXl1UA_-11-12.png) no-repeat 0 0}
		.playing .ui-track-current:hover .ui-track-sort em{background:url(http://gtms01.alicdn.com/tps/i1/T1X4JEFq8qXXXaYEA_-11-12.gif) no-repeat 0 0}
		.ui-track-current .ui-roam-wrap{display:block}
		.ui-track-roaming{background-color:#F0F0F0}
		.ui-track-roaming:hover{background-color:#F0F0F0}
		.ui-track-roaming .ui-track-sort{width:40px;left:31px!important}
		.ui-track-roaming .ui-track-sort em{background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAQCAYAAAAbBi9cAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGBSURBVDhPpVO7SkNREBwRFUG/wE4bxUL/QBTRRkt/QHNvMCE+agutbbRO6SckH2FpRAsL8wGKlYKY5hxnNnsuEXKDkIElO7szm/O6GETMsRwyXDsthTTSOv0LNjcYHyFH3UuloK7KeJPHS33YSnK8xwzbzqesMQSpFyrYMk9aWQQmWLjn9JoJqlggf4gVrJtgAKqpJ40487q8mgGtguQ5HmCSMW3CDBfmHAL1GJ3QwIw85tVOmDQZZybK0WC0zUHQ0IrHWHRaQHVpLaeX0VTxNe2TBW1xU7nAeiT/Zv0ynGPWy/JsSqtcXs2QuactmYB5OMS8ckGDUkjMA95TXRryH9P0j6Mn8+c/B3XZ37d6DXPkX0VugzK8UDhyazzMq7KtcZWr5F2Z7xj9w85wwmgpF1hvky85LSCNtJ6faoYm7pI82VXySpl3GKOvP8djcf30MnZKHyR/18w5AHuQ+qP0IOmR1x6kCcb4RMIRVqyRwOnjf7QJvrJbp6XggBtpnRLAL64HHXs+KcBcAAAAAElFTkSuQmCC") no-repeat 0 0!important;cursor:default!important;display:block;overflow:hidden;width:18px;height:18px;margin:11px!important;font-size:0;line-height:200px}
		.ui-track-roaming .icon-track-fav{background-position:0 -155px}
		.ui-track-roaming .icon-track-fav:hover{background-position:-28px -155px}
		.ui-track-roaming .icon-track-more{display:block}
		.ui-track-roaming .icon-track-delete{display:block}
		.ui-track-roaming .ui-roam-wrap{display:block}
		.ui-track-roaming .ui-track-main{border-bottom:0;height:41px;overflow:hidden}
		.ui-track-roaming .ui-track-main:hover .ui-track-sort-roam em{background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAkCAYAAACE7WrnAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALUSURBVEhLrVTNThphFKVJqwut3fcBGpoUjU9gYk19kvYdMBK2/IaQsBmWQwLyo2HFFl3xCJoID4AuJMRocDM95+PMlOnMwCTtTU6+ufece7+/+W4izNrt9jFgAffAQuC31e12v0sWbb1eLwnxsNPpOOtADbVK8xvII2Au8SOQhp8aDAbbxMXFxQH8jDgWmzNH6UtjdZAzCoAe8ElUwBqNxp401M68lTmO8w6BkYgefUOsMeW4xUYmB0s+YQDLfOBs0hpD7LLZbH6W6zNqwU+ZyxoJfNRVKCONZ4o/AT/DVgo+TQ1r0BnT4WGK90wiF9etVuuLKGOYICVuTGdBhzcj3jOJPED7ApwNh8P34rcUX7CQufI4hYBXFrIs64P4XcbdQnd0Ymzt5u+t4S/fJ4caExay5UQeNsZf6w6bNXj9p3KmIdd/Fef6sbIf/++HpK0+EczS7ff7Hw0RYuRWisxwbl9FLQ0FAo8W2/7GG7JtewfLP0TsXBwnDD5a17Qyd5vrMIpsI65xvzw8iOuYcYLxDXjG9y1j5OKco7FisXgMWMB9qVRaEPxmDN+bOyRESWAIOBtATfjWyuXyEcg5hZj5EUgjlqpWq9sEvg/AZchRQy1zlL40BLmSGQUQ9nK5XGSHRNE9alSMOX86JIiRWyTOQSrHFGOuySkUCicKPHA2aY0hfpnP50OfCLXgp8xlDYrrdIDAo2UcEzxBGNohwaWVW6d4TIeHKd4ziQyQdI3R10Z4GeLHFPM/cXgz4j2TaLXYC8azbDZrOiTGLXELis2VxykEvAJeh6zVaruKm0J3dDZtDbgBfFvD2e2Tw0onFNsSRh42xtAOuXLYNsWncqYh138V8/qXHRKV//2HpCHgPRGgi1VEdkhybhHmVCoVf4fkAwThe7SA6ZAYdxA/xHhOTkWCj9Y1kEkIzTbXQZrNHZKHB2EdCRPgDd/PGG8ZIxc8x0TiN8TI5Mlo5KNJAAAAAElFTkSuQmCC") no-repeat 0 0!important;cursor:pointer!important}
		.ks-ie7 .ui-track-roaming .ui-track-main:hover .ui-track-sort-roam em{background:url(http://gtms04.alicdn.com/tps/i4/T19feyFsNbXXXql2na-18-36.png) no-repeat 0 0!important}
		.ui-track-roaming .ui-track-main:hover .ui-track-sort-roam em:hover{background-position:0 -18px!important}
		.ui-playlist-footer{border-top:1px solid #ccc;height:45px;width:100%;position:absolute;bottom:0;padding-top:14px;user-select:none;-moz-user-select:none;-webkit-user-select:none;-ms-user-select:none}
		.ui-track-all{height:30px;width:100%;line-height:30px;position:relative;padding-left:38px}
		.ui-track-all .ui-all-checkbox{position:absolute;left:0;height:16px;padding-top:7px;padding-bottom:7px;padding-left:10px;padding-right:10px;line-height:0}
		.ui-track-all .ui-all-item{float:left;height:30px;padding-right:10px;user-select:none;-moz-user-select:none;-webkit-user-select:none;-ms-user-select:none}
		.ui-track-all .ui-all-item a{display:block;text-indent:38px;cursor:pointer;color:#333;text-decoration:none}
		.ui-playlist-header{height:36px;line-height:36px;padding-top:9px;border-bottom:1px solid #ccc;color:#aaa;position:absolute;top:0}
		.ui-playlist-body{width:100%;position:absolute;top:46px;bottom:60px}
		#J_tracksScrollView{height:100%}
		.ui-playlist-body,.ui-history-body,.ui-myfav-body,.ui-collect-body{background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAApCAYAAAA1bQl+AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAiSURBVEhL7cMxDQAACAMw/FudiGGCg6NNOgAAAN8k6d10AejGSwFOVOZoAAAAAElFTkSuQmCC") repeat 0 0}
		.ks-ie7 .ui-playlist-body,.ks-ie7 .ui-history-body,.ks-ie7 .ui-myfav-body,.ks-ie7 .ui-collect-body{overflow-y:auto;overflow-x:hidden}
		.loading .ui-playlist-body,.loading .ui-history-body,.loading .ui-myfav-body,.loading .ui-collect-body{background:none!important}
		#J_myfavScrollView{height:100%}
		.ui-myfav-title{padding-top:20px}
		.ui-myfav-title-con{position:relative;padding-left:82px;padding-right:40px;padding-top:11px;height:75px;background-color:#F0F0F0;border-radius:4px}
		.ui-myfav-title-con h2{font-size:18px;color:#333;line-height:38px;height:38px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:400}
		.ui-myfav-title-con h2 a{color:#333;text-decoration:none}
		.ui-myfav-title-con p{height:18px;line-height:18px;color:#aaa}
		.ui-myfav-title-con p span{padding-right:18px}
		.ui-myfav-title-con p a{color:#f60;text-decoration:none}
		.ui-myfav-title-con .icon-playAllBtn{position:absolute;top:22px;left:20px;width:42px;height:42px;cursor:pointer}
		.ui-myfav-header{height:36px;line-height:36px;padding-top:9px;border-bottom:1px solid #ccc;color:#aaa;position:absolute;top:106px}
		.ui-myfav-header .ui-row-item-body{padding-right:112px}
		.ui-myfav-body{width:100%;position:absolute;top:152px;bottom:60px}
		.ui-myfav-empty{background:none!important}
		.ui-myfav-footer{border-top:1px solid #ccc;height:45px;width:100%;position:absolute;bottom:0;padding-top:14px}
		.fav-detail-none{height:200px;background:url(http://gtms01.alicdn.com/tps/i1/T1KQ4cFCJiXXcR9GLk-179-18.gif) no-repeat 50% 50%}
		#J_pageCollectScrollView{height:100%}
		.ui-collect-title{padding-top:20px}
		.ui-collect-title-con{position:relative;padding-left:82px;padding-right:40px;padding-top:11px;height:75px;background-color:#F0F0F0;border-radius:4px}
		.ui-collect-title-con h2{font-size:18px;color:#333;line-height:38px;height:38px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:400}
		.ui-collect-title-con h2 a{color:#333;text-decoration:none}
		.ui-collect-title-con p{height:18px;line-height:18px;color:#aaa}
		.ui-collect-title-con p span{padding-right:18px}
		.ui-collect-title-con p a{color:#f60;text-decoration:none}
		.ui-collect-title-con .icon-playAllBtn{position:absolute;top:22px;left:20px;width:42px;height:42px;cursor:pointer}
		.ui-collect-header{height:36px;line-height:36px;padding-top:9px;border-bottom:1px solid #ccc;color:#aaa;position:absolute;top:106px}
		.ui-collect-header .ui-row-item-body{padding-right:112px}
		.ui-collect-body{width:100%;position:absolute;top:152px;bottom:60px}
		.ui-collect-footer{border-top:1px solid #ccc;height:45px;width:100%;position:absolute;bottom:0;padding-top:14px}
		.collect-none{width:185px;height:89px;margin:0 auto;background:url(http://gtms04.alicdn.com/tps/i4/T11aF_Fx4aXXcxTH6l-185-89.png) no-repeat 0 0}
		.collect-detail-none{height:200px;background:url(http://gtms01.alicdn.com/tps/i1/T14gtaFphjXXa.956M-361-18.gif) no-repeat 50% 50%}
		#J_historyScrollView{height:100%}
		.history-detail-none{height:200px;background:url(http://gtms01.alicdn.com/tps/i1/T1xlkHFX0iXXbWYmfl-217-18.gif) no-repeat 50% 50%}
		.ui-history-title{padding-top:20px}
		.ui-history-title-con{position:relative;padding-left:82px;padding-right:40px;padding-top:11px;height:75px;background-color:#F0F0F0;border-radius:4px}
		.ui-history-title-con h2{font-size:18px;color:#333;line-height:38px;height:38px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:400}
		.ui-history-title-con h2 a{color:#333;text-decoration:none}
		.ui-history-title-con p{height:18px;line-height:18px;color:#aaa}
		.ui-history-title-con p span{padding-right:18px}
		.ui-history-title-con p a{color:#f60;text-decoration:none}
		.ui-history-title-con .icon-playAllBtn{position:absolute;top:22px;left:20px;width:42px;height:42px;cursor:pointer}
		.ui-history-header{height:36px;line-height:36px;padding-top:9px;border-bottom:1px solid #ccc;color:#aaa;position:absolute;top:106px}
		.ui-history-header .ui-row-item-body{padding-right:112px}
		.ui-history-body{width:100%;position:absolute;top:152px;bottom:60px}
		.ui-history-footer{border-top:1px solid #ccc;height:45px;width:100%;position:absolute;bottom:0;padding-top:14px}
		.ui-history-empty{background:none!important}
		.ui-roam-open{background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHYAAAA8CAYAAACzZE4bAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAASaSURBVHhe7ZvNS1RRGIdvxChB/gXtalO0sP9AkshNLVtlH0RlKZoIGSSkVBRFpkGrFhEWfRBFaFBBtIjAnR/kIijBykZHx8jR/Jqct/M7x/vBzBHPqGfwXt6BB8497++9m4dzvPd6r4MfnXZimdPO+cwpZ1iMiQkfcAeHYhxTUg85RWJiKDvIhBPpUjh1lixrQ0w4gVOHt9/oIcSO4u+rtsiEGxYbUVhsRFmd2Es7id7d1NeCIIOsrsZYJX+xt8qIppNEj2v09SCPqohSCdWjqzPWyE8sVl9qjKhtnzo+G8vNuLi12+Wqh1duQTEXW7WJaLBbrNRqddy4jehHL9GVPblZzKGGDI6xutGLc2RnGSuYi8Uq/TVAdGYzUXWREveqSZ8FqP3sE9li1YNed6Uz1jEX+/Ee0bN6NX5SS9Tf5df6O4kubvePg/PIYoxenCM7w1jBXOzYN//vJLbV1r1+Db+FGaLOZqKaLf48MshijF6cw60xVjEXm55XW7A7rivxa8Ef5N09oOaRSc+pMXrR5/YwVjEXO5syEzs+KMQeVPO1W4nmpvwxiy0Y5mJHv6y8FXe1LL8Vt+xW0t0aYxVzsd0d/sXT0zp1YeTWcCHVtMM/9uZFBlmMn51T58jOMFYwF3unQtyyfF663RG3MLiVWfF2pz9wuyN62/frs8y6Yy52uQcUl0tzs3hAAfHeAwrRg15+QFEwzMWCtTxSbN6Vm2GskZ9YwP8ECAX5iwVYue/b9bUg79v8K2mmoKxOLLPhYbERhcVGFH79NILI10/5hfHoIV8Y5088ooV0iU88At/v4KOsuC7MbHzgTu6+rlT8RCE2ctg5Hz/sDMcrHWJCiHAHh3AppQ4Iw78qnSFtmAkdcAmnjlypmgATXuDU4e03eohVO+roCkz4YbERhcVGlFWJHWvcSdOvb2prQZBBVldj7JK32OTVMlqcStKfBzXaepA/96tocTIhe3R1xh55icXqW0yN0cT1fWruWCwn47FUS14rlz28cguLudgjm2jha7dYqdXyOFG7jRaGemm8aU9OFnOoIYNjrG704hzZWcYOxmKxStPDAxQ/uplGjhdJcannTdosQG3he5/IFsse9HornbGOsdi/H+7R5KN6OZ7sqKW5ni6vNtvTSYmG7d5xcB5ZjNGLc2RnGDsYi/2X+Ob9ncS2mry216vhl5mfodSLZho5scWbR0ZuwWKMXpzDrTF2MRabSc/LLdgbnyzxasEf5E20HpDzyGTSc2osetHn9jB2MRc7mzIUO0i/Ww/K+ZGTW0XflD9msQXDWGw6/mXFrXjqZcvyW/GF3VK6W2PsYix25lNH4OKpTl4YuTVcSCUadnjHLuriqU6OJx+ek+fIzjB2MBY7caOC0j8/L93uFMtbmRVvd370+7c7onfixn5tlll/jMUu+4DiYmlOVj6gEOL9BxTVakvmBxQFw1ysYG2PFHflZhhr5CUW8D8BwkHeYgFW7vTbdm0tyPSbNu9KmiksqxLLbHxYbERhsRGFXz+NIPL1U35hPHrIF8b5E49o4X3i4X6/A8tiMq4LMxsfuINDJdVx/gPKVgPsEdJ87QAAAABJRU5ErkJggg==") no-repeat 0 0;display:block;width:88px;height:30px;line-height:30px;padding-left:30px;color:#fff;text-align:center;cursor:pointer}
		.ks-ie7 .ui-roam-open{background:url(http://gtms01.alicdn.com/tps/i1/T1RxuzFrxaXXXOEKQ8-118-60.png) no-repeat 0 0}
		.ks-ie7 .ui-roam-sort em{background:url(http://gtms04.alicdn.com/tps/i4/T1xLexFDdbXXXql2na-18-36.png) no-repeat 0 0}
		.ks-ie7 .ui-roam-main{position:relative}
		.ks-ie7 .ui-roam-current .ui-roam-sort em{background:url(http://gtms02.alicdn.com/tps/i2/T1t4KyFpXbXXXl1UA_-11-12.png) no-repeat 50% 50%}
		.ui-roam-open:hover{background-position:0 -30px}
		.ui-roam-close{color:#333;text-decoration:none;position:absolute;width:74px;right:0;top:0}
		.ui-roam-close a{cursor:pointer}
		.ui-roam-control{position:absolute;top:0;right:0;width:74px;height:40px}
		.ui-roam-control a{display:block;position:absolute;top:11px;cursor:pointer}
		.ui-roam-control .icon-roam-fav,.ui-roam-control .icon-roam-faved{right:50px}
		.ui-roam-control .icon-roam-more{right:17px;display:none}
		.ui-roam-control .icon-roam-delete{right:20px;display:none}
		.ui-roam-sort{position:absolute;top:0;left:0;width:36px;height:41px;display:none}
		.ui-roam-sort em{cursor:pointer;display:block;width:18px;height:18px;margin:11px 9px;overflow:visible;font-size:0;background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAkCAYAAACE7WrnAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALUSURBVEhLrVTNThphFKVJqwut3fcBGpoUjU9gYk19kvYdMBK2/IaQsBmWQwLyo2HFFl3xCJoID4AuJMRocDM95+PMlOnMwCTtTU6+ufece7+/+W4izNrt9jFgAffAQuC31e12v0sWbb1eLwnxsNPpOOtADbVK8xvII2Au8SOQhp8aDAbbxMXFxQH8jDgWmzNH6UtjdZAzCoAe8ElUwBqNxp401M68lTmO8w6BkYgefUOsMeW4xUYmB0s+YQDLfOBs0hpD7LLZbH6W6zNqwU+ZyxoJfNRVKCONZ4o/AT/DVgo+TQ1r0BnT4WGK90wiF9etVuuLKGOYICVuTGdBhzcj3jOJPED7ApwNh8P34rcUX7CQufI4hYBXFrIs64P4XcbdQnd0Ymzt5u+t4S/fJ4caExay5UQeNsZf6w6bNXj9p3KmIdd/Fef6sbIf/++HpK0+EczS7ff7Hw0RYuRWisxwbl9FLQ0FAo8W2/7GG7JtewfLP0TsXBwnDD5a17Qyd5vrMIpsI65xvzw8iOuYcYLxDXjG9y1j5OKco7FisXgMWMB9qVRaEPxmDN+bOyRESWAIOBtATfjWyuXyEcg5hZj5EUgjlqpWq9sEvg/AZchRQy1zlL40BLmSGQUQ9nK5XGSHRNE9alSMOX86JIiRWyTOQSrHFGOuySkUCicKPHA2aY0hfpnP50OfCLXgp8xlDYrrdIDAo2UcEzxBGNohwaWVW6d4TIeHKd4ziQyQdI3R10Z4GeLHFPM/cXgz4j2TaLXYC8azbDZrOiTGLXELis2VxykEvAJeh6zVaruKm0J3dDZtDbgBfFvD2e2Tw0onFNsSRh42xtAOuXLYNsWncqYh138V8/qXHRKV//2HpCHgPRGgi1VEdkhybhHmVCoVf4fkAwThe7SA6ZAYdxA/xHhOTkWCj9Y1kEkIzTbXQZrNHZKHB2EdCRPgDd/PGG8ZIxc8x0TiN8TI5Mlo5KNJAAAAAElFTkSuQmCC") no-repeat 0 0}
		
		.ui-roam-sort em:hover{background-position:0 bottom}
		.ui-roam-wrap{display:none;padding-left:31px;padding-right:36px}
		.ui-roam-wrap .ui-roam-head{padding-left:41px;height:41px}
		.ui-roam-wrap .ui-roam-head p{line-height:30px;color:#f60}
		.ui-roam-body{border-top:1px solid #ccc;overflow:hidden;height:245px}
		.ui-roam-body .ui-roam-title{padding-left:41px;height:41px;line-height:41px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;position:relative;padding-right:74px}
		.ui-roam-body .ui-roam-title span{color:#f60}
		.ui-roam-main{overflow:hidden;height:204px}
		.ui-roam-item{padding-left:41px;padding-right:74px;height:40px;line-height:40px;border-bottom:1px solid #F0F0F0;position:relative;overflow:hidden;-webkit-transition-property:color;-moz-transition-property:color;-o-transition-property:color;-ms-transition-property:color;transition-property:color;-webkit-transition-duration:.5s;-moz-transition-duration:.5s;-o-transition-duration:.5s;-ms-transition-duration:.5s;transition-duration:.5s}
		.ui-roam-item a:link,.ui-roam-item a:visited{-webkit-transition-property:color;-moz-transition-property:color;-o-transition-property:color;-ms-transition-property:color;transition-property:color;-webkit-transition-duration:.5s;-moz-transition-duration:.5s;-o-transition-duration:.5s;-ms-transition-duration:.5s;transition-duration:.5s;color:#333;text-decoration:none}
		.ui-roam-item a:hover{color:#333;text-decoration:underline}
		.ui-roam-item:hover{border-bottom:1px solid #dbdbdb}
		.ui-roam-item:hover .ui-roam-sort{display:block}
		.ui-roam-item:hover .more-btn{display:block}
		.ui-roam-current{}
		.ui-roam-current .ui-roam-sort{display:block}
		.ui-roam-current .ui-roam-sort em{background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAsAAAAMCAYAAAC0qUeeAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAA6SURBVChTY0AH/1IZDv9PY/gPoqFCuAFIIQxDhXADihTjdRa6YnQ+CkCXROGjW4Miic5H4Qw7xQz/AR6CwDExYgN8AAAAAElFTkSuQmCC") no-repeat 50% 50%}
		.ui-roam-current .more-btn{display:block}
		.playing .ui-roam-current .ui-roam-sort em{background:url(http://gtms01.alicdn.com/tps/i1/T1X4JEFq8qXXXaYEA_-11-12.gif) no-repeat 50% 50%}
		
		.ui-roam-item:nth-child(3){color:#999}
		.ui-roam-item:nth-child(3) .ui-roam-control{opacity:.6}
		.ui-roam-item:nth-child(3) a:link,.ui-roam-item:nth-child(3) a:visited{color:#999;text-decoration:none}
		.ui-roam-item:nth-child(3) a:hover{color:#999;text-decoration:underline}
		.ui-roam-item:nth-child(4){color:#b3b3b3}
		.ui-roam-item:nth-child(4) .ui-roam-control{opacity:.5}
		.ui-roam-item:nth-child(4) a:link,.ui-roam-item:nth-child(4) a:visited{color:#b3b3b3;text-decoration:none}
		.ui-roam-item:nth-child(4) a:hover{color:#b3b3b3;text-decoration:underline}
		.ui-roam-item:nth-child(5){color:#ccc}
		.ui-roam-item:nth-child(5) .ui-roam-control{opacity:.4}
		.ui-roam-item:nth-child(5) a:link,.ui-roam-item:nth-child(5) a:visited{color:#ccc;text-decoration:none}
		.ui-roam-item:nth-child(5) a:hover{color:#ccc;text-decoration:underline}
		.ui-roam-item:nth-child(6){color:#ccc}
		.ui-roam-item:nth-child(6) .ui-roam-control{opacity:.4}
		.ui-roam-item:nth-child(6) a:link,.ui-roam-item:nth-child(6) a:visited{color:#ccc;text-decoration:none}
		.ui-roam-item:nth-child(6) a:hover{color:#ccc;text-decoration:underline}
		#J_playerLrc{width:100%;height:340px;overflow:hidden;}
				
	</style>
	<body>
		<div id="J_loading"></div>
		
		<div id="J_blurBackground">
			<canvas class="ui-canvas ui-canvas-current" id="J_Player_Canvas_Even" style="/* width: 100%; */ /* height: 100%; */" width="1284" height="927"></canvas>
			<canvas class="ui-canvas" id="J_Player_Canvas_Odd" style="/* width: 100%; */ /* height: 100%; */"></canvas>
		</div>
		<div id="musicWrap">
		
			<!-- 顶部导航  start -->
			<%@include file="/WEB-INF/pages/fronts/common/header.jsp"%>
			<!-- 顶部导航  end -->
			
		    <!-- 中间歌词部分 -->
			<div id="middle" class="">
				<div id="J_mainWrap" class="main-wrap">
					<!-- 侧边栏  begin -->
					<div class="main-sidebar">
						<div class="menu-outer">
							<ul id="J_sidebarMenu">
								<li class="current" id="J_menuPlaying" data-page="J_pagePlayList">
									<a data-spm-anchor-id="a1z1s.7154410.0.0"><i class="icon-play"></i>正在播放</a>
								</li>
								<li id="J_menuHistory" data-page="J_pageHistory">
									<a data-spm-anchor-id="a1z1s.7154410.0.0"><i class="icon-history"></i>播放历史</a>
								</li>
								<li id="J_menuMyfav" data-page="J_pageMyfav">
									<a><i class="icon-myfav"></i>我收藏的单曲</a>
								</li>
							</ul>
						</div>
						<div class="collect-outer">
							<div class="collect-title">
								<h3>我创建的歌单</h3>
								<span><a class="icon-addCollect" id="J_createCollect" title="新建歌单" data-spm-anchor-id="a1z1s.7154410.0.0"></a></span>
							</div>
						</div>
						<div class="collect-list">
							<div id="J_collectScrollView" class="ks-scroll-view">
								<!-- 滚动内容 -->
								<div class="ks-scroll-view-content" id="J_collectList"><div class="collect-none"></div></div>
								<!-- 滚动内容 end -->
							</div>
						</div>
					</div>
					<!-- 侧边栏 end -->

					<div id="J_tab" class="main-body">
						<!-- 正在播放 begin -->
						<div id="J_pagePlayList" class="main-page" data-spm="1996860241" style="display:block">
							<div class="ui-playlist-header ui-row-item">
								<div class="ui-row-item-body">
									<div class="ui-row-item-column c1">
										歌曲<span id="J_trackCount">(1)</span>
									</div>
									<div class="ui-row-item-column c2">
										演唱者
									</div>
									<div class="ui-row-item-column c3">
										专辑
									</div>
								</div>
							</div>

							<div class="ui-playlist-body">
								<div id="J_tracksScrollView" class="ks-scroll-view">
									<!-- 歌曲列表 -->
									<div class="ks-scroll-view-content">
										<!-- 列表 begin -->
										<div class="ui-tracks-wrap" id="J_playTracksList">

										</div>
										<!-- 列表 end -->
										
									</div>
									<!-- 歌曲列表 end -->
								</div>
							</div>

							<div class="ui-playlist-footer">
								<div class="ui-track-all">
									<div class="ui-all-checkbox">
										<input id="J_checkAll_track" type="checkbox" onclick="SEIYA.syncCheck(this,'track')">
									</div>
									<div class="ui-all-item">
										<a class="icon-tracks-delete" id="J_trackListDelete">删除</a>
									</div>
									<div class="ui-all-item">
										<a class="icon-tracks-fav" id="J_trackListFav">收藏</a>
									</div>
									<div class="ui-all-item">
										<a class="icon-tracks-add" id="J_trackListAdd" onclick="SEIYA.collects('track')">添加到歌单</a>
									</div>
									<div class="ui-all-item">
										<a class="icon-tracks-more" data-type="track" data-event="more" id="J_trackListMore">更多</a>
									</div>
								</div>
							</div>
						</div>
						<!-- 正在播放 end -->

						<!-- 播放历史 begin -->
						<div id="J_pageHistory" class="main-page" data-spm="1996860237" style="display: none">
							<div class="ui-history-title">
								<div class="ui-history-title-con">
									<a class="icon-playAllBtn" title="播放全部" id="J_playAllMyfav" onclick="SEIYA.addPlaySongs('history')"></a>
									<h2>播放历史</h2>
									<p id="J_historyCount">
										<span>loading</span>
									</p>
								</div>
							</div>
							<div class="ui-history-header ui-row-item">
								<div class="ui-row-item-body">
									<div class="ui-row-item-column c1">歌曲</div>
									<div class="ui-row-item-column c2">演唱者</div>
									<div class="ui-row-item-column c3">试听时间</div>
								</div>
							</div>
							<div class="ui-history-body">
								<div id="J_historyScrollView" class="ks-scroll-view">
									<!-- 歌曲列表 -->
									<div class="ks-scroll-view-content">
										<!-- 列表 begin -->
										<div class="ui-tracks-wrap" id="J_historyTracksList"></div>
										<!-- 列表 end -->
									</div>
									<!-- 歌曲列表 end -->
								</div>
							</div>
							<div class="ui-history-footer">
								<div class="ui-track-all">
									<div class="ui-all-checkbox">
										<input id="J_checkAll_history" type="checkbox" onclick="SEIYA.syncCheck(this,'history')">
									</div>
									<div class="ui-all-item">
										<a class="icon-tracks-play" onclick="SEIYA.playAllSongs('history')">播放</a>
									</div>
									<div class="ui-all-item">
										<a class="icon-tracks-add" onclick="SEIYA.collects('history')">添加到歌单</a>
									</div>
									<div class="ui-all-item">
										<a class="icon-tracks-more" data-type="history" data-event="more">更多</a>
									</div>
								</div>
							</div>
						</div>
						<!-- 播放历史 end -->

						<!-- 我收藏的单曲 begin -->
						<div id="J_pageMyfav" class="main-page" data-spm="1996860218" style="display:none">
							<div class="ui-myfav-title">
								<div class="ui-myfav-title-con">
									<a class="icon-playAllBtn" title="播放全部" id="J_playAllMyfav" onclick="SEIYA.addPlaySongs('fav')"></a>
									<h2>我收藏的单曲</h2>
									<p id="J_favCount">
										<span>loading </span>
									</p>
								</div>
							</div>

							<div class="ui-myfav-header ui-row-item">
								<div class="ui-row-item-body">
									<div class="ui-row-item-column c1">歌曲</div>
									<div class="ui-row-item-column c2">演唱者</div>
									<div class="ui-row-item-column c3">专辑</div>
								</div>
							</div>

							<div class="ui-myfav-body">
								<div id="J_myfavScrollView" class="ks-scroll-view">
									<div class="ks-scroll-view-content">
										<!-- 收藏单曲 begin -->
										<div class="ui-tracks-wrap" id="J_myFavTracksList"></div>
										<!-- 收藏单曲 begin -->
									</div>
								</div>
							</div>

							<div class="ui-myfav-footer">
								<div class="ui-track-all">
									<div class="ui-all-checkbox">
										<input id="J_checkAll_fav" type="checkbox" onclick="SEIYA.syncCheck(this,'fav')">
									</div>
									<div class="ui-all-item">
										<a class="icon-tracks-play" onclick="SEIYA.playAllSongs('fav')">播放</a>
									</div>
									<div class="ui-all-item">
										<a class="icon-tracks-add" onclick="SEIYA.collects('fav')">添加到歌单</a>
									</div>
									<div class="ui-all-item">
										<a class="icon-tracks-more" data-type="fav" data-event="more">更多</a>
									</div>
								</div>
							</div>
						</div>
						<!-- 我收藏的单曲 end -->

						<!-- 精选集 detail -->
						<div id="J_pageCollect" class="main-page" data-spm="1996860182" style="display:none"></div>
						<!-- 精选集 detail end -->
					</div>

					<div id="J_lrcWrap" class="main-outher" data-spm="1996860293">
						<div class="ui-album-cover" id="J_albumCover">
							<div id="J_playerCover" class="ui-album-img">
								<a href="/album/2100377381" target="_blank" title="">
									<img id="J_playerCoverImg" src="" alt="">
								</a>
							</div>
						</div>
						
						<div class="ui-player-lrc" id="J_lyricScrollWrap" style="top: 265px;">
							<div id="J_lyricScrollView" class="ks-scroll-view">
								
								<div class="ks-scroll-view-content">
									<div class="ui-player-lrc-wrap" id="J_playerLrc">
										<ul id="playerLrcBox"></ul>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 底部播放器 -->
			<div id="bottom">
				<div id="J_playerWrap">
					<div class="player-info" data-spm="1996860142">

						<div class="track-info">
							<div id="J_trackInfo" class="player-track-info">
								<a href="#nohash">暂无歌曲</a>
							</div>
							<div class="track-controls">
								<a id="J_trackFav" class="icon-fav" data-sid="0" title="收藏"></a>
								<a id="J_trackShare" class="icon-share" data-sid="0" title="分享"></a>
								<a id="J_trackMore" class="icon-more" data-sid="0" title="更多"></a>
							</div>
						</div>

						<div class="player-length">
							<div class="player-position" id="J_positionTime">00:00</div>
							<div class="player-progress">
								<div class="progress" id="J_playerProgress">
									<div class="loading" style="width:0%;"></div>
									<div class="playing" style="width:0%;"></div>
								</div>
								<div class="panel" id="J_playerPanel">
									<a class="player-dot" id="J_playerDot" style="left:0px;"></a>
								</div>
							</div>
							<div class="player-duration" id="J_durationTime">00:00</div>
						</div>

					</div>

					<div class="player-controls">
						<a id="J_prevBtn" class="prev-btn"></a>
						<a id="J_playBtn" class="play-btn"></a>
						<a id="J_nextBtn" class="next-btn"></a>
						<div class="player-mode">
							<a id="J_playerMode" class="mode-order" title="顺序播放"></a>
						</div>
					</div>

					<div class="player-volume">
						<a id="J_playerHQ" class="mode-hq-on1" data-hq="off"></a>
						<div id="volume">
							<div id="J_volumeSpeaker" class="volume-on"></div>
							<div class="volume-wrap" id="J_volumeRange">
								<div class="volume-panel">
									<div class="volume-cur" style="width:50%"></div>
								</div>
								<div class="volume-control">
									<a class="volume-dot" style="left:40px"></a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$(function(){
				$.ajax({
					type:"post",
					url: basePath + "/music/template",
					success:function(data){
						$("#J_playTracksList").append(data);
						$("#J_playTracksList").children().first().addClass("ui-track-current");
						var title = $("#J_playTracksList").children().first().find(".ui-row-item-body .c1").text();
						var singer = $("#J_playTracksList").children().first().find(".ui-row-item-body .c2").text();
						$("#J_trackInfo").find("a").text(title +" - "+ singer);
						var lrc = $("#J_playTracksList").children().first().find("#lrcont").data("lrc");
						var img = $("#J_playTracksList").children().first().find("#lrcont").data("img");
						var song = $("#J_playTracksList").children().first().find("#lrcont").data("src");
						
						$("#J_playerCoverImg").attr("src",img);
						kimMusic.init();
						kimMusic.src(song);
						kimMusic.lrc(lrc);
						kimMusic.event(function(mark){
							if(mark == "time"){
								$("#J_durationTime").html(this.ftime);
							}else if(mark == "play"){
								kimMusic.jump(parseInt(this.playtime));
								$("#J_positionTime").html(this.fptime);
								$("#J_playerProgress .playing").css("width",this.percent+"%");
								$("#J_playerPanel #J_playerDot").css("left",this.percent+"%");
							}			
						});
					}
				});
			});
			
			//播放--暂停
			$("#J_playBtn").click(function(){
				$(this).toggleClass("pause-btn play-btn");
				if($(this).hasClass("pause-btn")){
					kimMusic.play();
					$(".ui-tracks-wrap").addClass("playing");
					$("#middle").addClass("playing");
				}else{
					kimMusic.pause();
					$(".ui-tracks-wrap").removeClass("playing");
					$("#middle").removeClass("playing");
				}
			});
			
			//静音
			$("#J_volumeSpeaker").click(function(){
				$(this).toggleClass("volume-off volume-on");
				kimMusic.mute();
			});
			
			//播放效果
			$("#J_playerMode").click(function(){
				if($(this).hasClass("mode-order")){
					$(this).removeClass("mode-order").addClass("mode-random");
					$(this).attr("title","随机播放");
				}else if($(this).hasClass("mode-random")){
					$(this).removeClass("mode-random").addClass("mode-only");
					$(this).attr("title","单曲循环");
				}else if($(this).hasClass("mode-only")){
					$(this).removeClass("mode-only").addClass("mode-order");
					$(this).attr("title","顺序播放");
				}
			});

			//点击播放列表事件
			function selectPlay(obj){
				$(obj).addClass("ui-track-current").siblings().removeClass("ui-track-current");
				var lrc = $(obj).find("#lrcont").data("lrc");
				var img = $(obj).find("#lrcont").data("img");
				var song = $(obj).find("#lrcont").data("src");
				
				$("#J_playerCoverImg").attr("src",img);
				kimMusic.src(song);
				kimMusic.lrc(lrc);
				kimMusic.event(function(mark){
					if(mark == "time"){
						$("#J_durationTime").html(this.ftime);
					}else if(mark == "play"){
						kimMusic.jump(parseInt(this.playtime));
						$("#J_positionTime").html(this.fptime);
						$("#J_playerProgress .playing").css("width",this.percent+"%");
						$("#J_playerPanel #J_playerDot").css("left",this.percent+"%");
					}
					
				});
						
				$("#J_playBtn").trigger("click");
				var singer = $(obj).find(".ui-row-item-body .c1").text();
				var song = $(obj).find(".ui-row-item-body .c2").text();
				$("#J_trackInfo").find("a").text(singer +" - "+ song);
			}
			
			//播放器
			var kimMusic = {
				audioDom: null,
				src: function(src){
					this.audioDom.src = src;
				},
				init: function(){
					this.audioDom = document.createElement("audio");
				},
				play:function(){
					this.audioDom.play();
				},
				pause:function(){
					this.audioDom.pause();
				},
				next:function(){
				
				},
				prev:function(){
				
				},
				mute:function(){
					this.audioDom.muted = !this.audioDom.muted;
				},
				volume:function(value){
					this.audioDom.volume = value;
					$(".volume-cur").css("width",value * 100 + "%");
					$(".volume-dot").css("left",value * 100 + "%");
				},
				event:function(callback){
					//总时长 oncanplaythrough
					var json = {};
					this.audioDom.oncanplaythrough = function(){
						json.totaltime = this.duration;
						json.ftime = kimMusic.format(this.duration);
						if(callback)callback.call(json,"time");
					};
					
					//播放时间 ontimeupdate
					this.audioDom.ontimeupdate = function(){
						json.playtime = this.currentTime;
						json.backtime  = this.duration - this.currentTime;
						json.fptime = kimMusic.format(json.playtime);
						json.btime =  kimMusic.format(json.backtime);
						json.percent = ((json.playtime / this.duration)*100).toFixed(0)||0;
						if(callback)callback.call(json,"play");
					};
					//播放完毕执行的事件:onended
					this.audioDom.onended = function(){
						$("#J_playBtn").trigger("click");
						this.audioDom.currentTime = 0;
					};
				},
				progress:function(){
				
				},
				
				lrc:function(lrtxts){
					//定义一个正则表达式
					var regex_tirm = /^\s+|\s+$/;
					//把换行的歌词分割成数组以分号隔开
					var txts = lrtxts.split("\n");
					//遍历每一句歌词
					var html = "";
					var len = txts.length;
					for(var i=0;i<len;i++){
						//把歌词左右空格去掉
						var item = txts[i].replace(regex_tirm,"");
						//把歌词和时间分离
						var ms = item.split("]");
						//alert(ms);
						var mt = ms[0].replace("[","").split(":");
						//获取时间把分秒转换为秒
						var m = parseInt(mt[0]*60+mt[1]*1);
						//把内容附加到lrclist中
						if(ms[1]){
							html += "<li id=t_"+m+">"+ms[1]+"</li>";
							$("#playerLrcBox").html(html);
						}
					}
				},
					
				//定义歌词调动
				jump:function(t){
					//获取当前时间对应得具体歌词
					var dom = $("#playerLrcBox").find("#t_"+t);
					//判断当前歌词不为空
					if(dom){
						//给当前歌词添加类样式
						dom.addClass("ui-lrc-current").siblings().removeClass("ui-lrc-current");
						//指定当前播放歌词的下标位置
						var index = dom.index();
						if(index != -1){
							$("#playerLrcBox").css("margin-top",((index-3) < 0 ? 0 : (index-3))*-28+"px");
						}
					}
				},
				
				repeat:function(){
				
				},
				format:function(time){
					var m = Math.floor(time / 60);
					var s = Math.floor(time % 60);
					if(m<10)m = "0"+m;
					if(s<10)s = "0"+s;
					return m +":"+s;
				}
			};
		</script>
	</body>
</html>
