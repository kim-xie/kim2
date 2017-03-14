<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@include file="/WEB-INF/pages/common/common.jsp" %>
 </head>
 <style>
	@charset "utf-8";.mod_list_menu{font-size: 0; height: 36px}
	.main, .section_inner{max-width: 1200px; min-width: 1200px; margin: 0 auto; position: relative;}
	.icon_txt{font: 0/0 a;}
	.list_menu__item{display: inline-block; margin-right: 10px; vertical-align: top}
	.list_menu__icon_add,.list_menu__icon_down,.list_menu__icon_pause,.list_menu__icon_play,.list_menu__icon_share{display: block; width: 36px; height: 36px; background-image: url(img/icon_list_menu.png?max_age=2592000&v=873fb6560497db4abbe63767018022eb); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/icon_list_menu.png?max_age=2592000&v=873fb6560497db4abbe63767018022eb) 1x,url(${basePath}/resources/imgs/music/icon_list_menu@2x.png?max_age=2592000&v=873fb6560497db4abbe63767018022eb&v=5b2eee44c015947ffe8d44c5b69fd078) 2x); background-repeat: no-repeat}
	.list_menu__icon_play{background-position: 0 0}
	.list_menu__icon_pause{background-position: 0 -200px}
	.list_menu__icon_share{background-position: 0 -40px}
	.list_menu__icon_add{background-position: 0 -80px}
	.list_menu__icon_down{background-position: 0 -120px}
	.list_menu__item:hover .list_menu__icon_play{background-position: -40px 0}
	.list_menu__item:hover .list_menu__icon_pause{background-position: -40px -200px}
	.list_menu__item:hover .list_menu__icon_share{background-position: -40px -40px}
	.list_menu__item:hover .list_menu__icon_add{background-position: -40px -80px}
	.list_menu__item:hover .list_menu__icon_down{background-position: -40px -120px}
	.songlist__item--disable .list_menu__item{cursor: default}
	.songlist__item--disable .list_menu__icon_play,.songlist__item--disable .list_menu__item:hover .list_menu__icon_play{background-position: -160px 0}
	.songlist__item--disable .list_menu__icon_pause,.songlist__item--disable .list_menu__item:hover .list_menu__icon_pause{background-position: -160px -200px}
	.songlist__item--disable .list_menu__icon_share,.songlist__item--disable .list_menu__item:hover .list_menu__icon_share{background-position: -160px -40px}
	.songlist__item--disable .list_menu__icon_add,.songlist__item--disable .list_menu__item:hover .list_menu__icon_add{background-position: -160px -80px}
	.songlist__item--disable .list_menu__icon_down,.songlist__item--disable .list_menu__item:hover .list_menu__icon_down{background-position: -160px -120px}
	.btn_operate_menu{position: absolute; bottom: auto; right: -99px; width: 20px; height: 20px; background-image: url(${basePath}/resources/imgs/music/icon_sprite.png?max_age=2592000&v=cfc9e963685e5ce3f9fcef4a4449cddb); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/icon_sprite.png?max_age=2592000&v=cfc9e963685e5ce3f9fcef4a4449cddb) 1x,url(${basePath}/resources/imgs/music/icon_sprite@2x.png?max_age=2592000&v=cfc9e963685e5ce3f9fcef4a4449cddb&v=18e4c7db7f50abb38446f0daed234778) 2x); background-position: -80px -40px}
	.btn_operate_menu:hover{background-position: -80px -60px}
	.mod_operate_menu{position: absolute; top: auto; left: auto; z-index: 100; color: #4F4F4F; font-size: 14px}
	.operate_menu__cont,.operate_menu__sub{width: 168px; padding: 5px 0; background-color: #fff; box-shadow: 0 0 10px 0 rgba(183,183,183,.65); border: 1px solid #bfbfbf}
	.operate_menu__link{display: block; height: 36px; line-height: 36px; padding-left: 40px; padding-right: 15px; margin-bottom: 1px; position: relative; overflow: hidden; white-space: nowrap; text-overflow: ellipsis}
	.operate_menu__list{max-height: 250px; overflow-y: auto}
	.operate_menu__list--no_icon .operate_menu__link{padding-left: 15px}
	.operate_menu__link--hover,.operate_menu__link:hover{background-color: #31c27c; color: #fff}
	.operate_menu__link--disabled{opacity: .5; filter: alpha(opacity=50); cursor: default; pointer-events: none}
	.operate_menu__top_line{padding-top: 5px; border-top: 1px solid #f0f0f0; margin-top: 5px}
	.operate_menu__bottom_line{padding-bottom: 5px; border-bottom: 1px solid #f0f0f0; margin-bottom: 5px}
	.operate_menu__sub{position: absolute; top: initial; left: 169px; width: 180px; overflow: hidden; color: #4F4F4F; display: none; z-index: -1}
	.operate_menu__sub.top{top: -3px}
	.operate_menu__sub.bottom{bottom: -3px}
	.operate_menu__sub ul{max-height: 250px; overflow-x: hidden; overflow-y: auto}
	.operate_menu__sub .mod_operate_menu__link{padding-left: 15px}
	.operate_menu__item--hover .operate_menu__sub,.operate_menu__item:focus .operate_menu__sub{display: block; max-height: 285px}
	.operate_menu__icon_add,.operate_menu__icon_arrow,.operate_menu__icon_batch,.operate_menu__icon_delete,.operate_menu__icon_down,.operate_menu__icon_edit,.operate_menu__icon_like,.operate_menu__icon_prev_arrow,.operate_menu__icon_radio,.operate_menu__icon_share{position: absolute; width: 16px; height: 16px; left: 15px; top: 10px; background-image: url(${basePath}/resources/imgs/music/icon_sprite.png?max_age=2592000&v=cfc9e963685e5ce3f9fcef4a4449cddb); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/icon_sprite.png?max_age=2592000&v=cfc9e963685e5ce3f9fcef4a4449cddb) 1x,url(${basePath}/resources/imgs/music/icon_sprite@2x.png?max_age=2592000&v=cfc9e963685e5ce3f9fcef4a4449cddb&v=18e4c7db7f50abb38446f0daed234778) 2x); background-repeat: no-repeat}
	.operate_menu__icon_like{background-position: -60px 0}
	.operate_menu__icon_add{background-position: -20px 0}
	.operate_menu__icon_radio{background-position: -80px 0}
	.operate_menu__icon_delete{background-position: -100px 0}
	.operate_menu__icon_down{background-position: -40px -220px}
	.operate_menu__icon_share{background-position: -100px -180px}
	.operate_menu__icon_batch{background-position: -120px 0}
	.operate_menu__icon_edit{background-position: -140px 0}
	.operate_menu__icon_arrow{width: 6px; height: 11px; left: auto; right: 15px; top: 12px; background-position: 0 0}
	.operate_menu__icon_prev_arrow{width: 6px; height: 11px; left: 20px; top: 12px; background-position: -10px 0}
	.operate_menu__link:hover .operate_menu__icon_add{background-position: -20px -20px}
	.operate_menu__link:hover .operate_menu__icon_like{background-position: -60px -20px}
	.operate_menu__link:hover .operate_menu__icon_radio{background-position: -80px -20px}
	.operate_menu__link:hover .operate_menu__icon_delete{background-position: -100px -20px}
	.operate_menu__link:hover .operate_menu__icon_down{background-position: -40px -240px}
	.operate_menu__link:hover .operate_menu__icon_share{background-position: -100px -200px}
	.operate_menu__link:hover .operate_menu__icon_batch{background-position: -120px -20px}
	.operate_menu__link:hover .operate_menu__icon_arrow{background-position: 0 -20px}
	.operate_menu__link:hover .operate_menu__icon_prev_arrow{background-position: -10px -20px}
	.operate_menu__link:hover .operate_menu__icon_edit{background-position: -140px -20px}
	.mod_page_nav{clear: both; text-align: center; margin-bottom: 60px; font-size: 0}
	.mod_page_nav a{color: #a2a2a2}
	.mod_page_nav a,.mod_page_nav strong{font-size: 16px; font-weight: 400; display: inline-block; line-height: 50px; margin: 0 5px; padding: 0 21px; box-sizing: border-box; min-width: 24px}
	.mod_page_nav .current,.mod_page_nav a:hover{color: #fff; background-color: #31c27c}
	.mod_page_nav__next,.mod_page_nav__prev{font-size: 0}
	.mod_page_nav__next_icon,.mod_page_nav__prev_icon{display: inline-block; width: 6px; height: 11px; background-image: url(${basePath}/resources/imgs/music/icon_sprite.png?max_age=2592000&v=cfc9e963685e5ce3f9fcef4a4449cddb); background-repeat: no-repeat}
	.mod_page_nav__prev_icon{background-position: -10px 0}
	.mod_page_nav__next_icon{background-position: 0 0}
	.mod_page_nav a:hover .mod_page_nav__prev_icon{background-position: -10px -20px}
	.mod_page_nav a:hover .mod_page_nav__next_icon{background-position: 0 -20px}
	.mod_singer_list{overflow: hidden; text-align: center}
	.singer_list__list{margin-right: -20px; overflow: hidden; zoom:1;margin-bottom: -24px}
	.singer_list__item{float: left; width: 20%; margin-bottom: 20px; overflow: hidden}
	.singer_list__item_box{position: relative; margin-right: 20px; background-color: #fbfbfd; min-height: 195px; padding: 25px 0; overflow: hidden}
	.singer_list__cover,.singer_list__pic{display: block; width: 140px; height: 140px; border-radius: 126px}
	.singer_list__cover{margin-left: auto; margin-right: auto}
	.singer_list__title{font-size: 16px; font-weight: 400; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; zoom:1;*width: 100%; margin: 20px 30px 4px}
	.singer_list__info{overflow: hidden; text-overflow: ellipsis; white-space: nowrap; line-height: 22px; height: 22px}
	.singer_list__info,.singer_list__info a{color: #999}
	.singer_list__info a:hover{color: #31c27c}
	.singer_list__focus{display: none}
	.singer_list__item .btn_operate_menu{bottom: 20px}
	.singer_list__item--current .btn_operate_menu,.singer_list__item--hover .btn_operate_menu{right: 20px}
	.singer_list__item--current .singer_list__item_box--disable .btn_operate_menu,.singer_list__item--hover .singer_list__item_box--disable .btn_operate_menu{display: none}
	.singer_list__item--current .singer_list__item_box--disable .singer_list__focus,.singer_list__item--hover .singer_list__item_box--disable .singer_list__focus{display: block; position: absolute; top: 0; bottom: 0; width: 100%; filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#19000000', endColorstr='#19000000'); background: rgba(0,0,0,.1)}
	.singer_list__item--current .singer_list__item_box--disable .singer_list__btn_focus,.singer_list__item--hover .singer_list__item_box--disable .singer_list__btn_focus{position: absolute; top: 50%; left: 50%; margin: -20px -60px}
	.singer_list__item_box--disable .singer_list__cover,.singer_list__item_box--disable .singer_list__info,.singer_list__item_box--disable .singer_list__title{opacity: .4; filter: alpha(opacity=40)}
	.mod_singer_list--fans .btn_operate_menu{display: none}
	.mod_singer_list--fans .singer_list__focus{display: block}
	.mod_singer_list--fans .singer_list__btn_focus{display: block; margin: 9px auto 0}
	.singer_list__btn_focus{width: 120px; padding: 0; margin-right: 0}
	.btn_focus__cont{cursor: pointer}
	.mod_slide{overflow: hidden; margin-bottom: 25px}
	.mod_slide:after{content: ""; display: block; clear: both}
	.slide__list{position: relative; font-size: 0; width: 500%}
	.slide__item{display: inline-block; width: 4%}
	.mod_slide_action{position: absolute; top: 0; left: 0; width: 100%; height: 100%; overflow: hidden}
	.slide_action{position: absolute; top: 0; width: 50%; height: 100%}
	.slide_action__btn{position: absolute; top: 50%; margin-top: -54px; width: 72px; height: 108px; filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#66999999', endColorstr='#66999999'); background: url(#); background: rgba(153,153,153,.4); opacity: 0; visibility: none; transition-property: opacity,transform; transition-duration: .5s; z-index: 2}
	.slide_action__btn--left{transform: translateX(-100%)}
	.slide_action__btn--right{transform: translateX(100%)}
	.mod_slide_box:hover .slide_action__btn{opacity: 1; visibility: none; transform: translateX(0); transition-property: opacity,transform,background,width; transition-duration: .5s}
	.slide_action:hover .slide_action__btn{width: 80px; filter: none; background: #31c27c; transition-property: background,width; transition-duration: .5s}
	.slide_action--left,.slide_action__btn--left{left: 0}
	.slide_action--right,.slide_action__btn--right{right: 0}
	.slide_action__arrow{position: absolute; top: 50%; margin-top: -9px; background-image: url(${basePath}/resources/imgs/music/icon_sprite.png?max_age=2592000&v=cfc9e963685e5ce3f9fcef4a4449cddb); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/icon_sprite.png?max_age=2592000&v=cfc9e963685e5ce3f9fcef4a4449cddb) 1x,url(${basePath}/resources/imgs/music/icon_sprite@2x.png?max_age=2592000&v=cfc9e963685e5ce3f9fcef4a4449cddb&v=18e4c7db7f50abb38446f0daed234778) 2x); width: 11px; height: 18px}
	.slide_action__arrow--left{left: 28px; background-position: -180px 0}
	.slide_action__arrow--right{right: 28px; background-position: -160px 0}
	.mod_slide_switch{width: 100%; text-align: center; font-size: 0}
	.slide_switch__item{display: inline-block; width: 30px; height: 1px; padding: 10px 0; margin: 0 5px}
	.slide_switch__bg{display: block; width: 100%; height: 1px; filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#4CFFFFFF', endColorstr='#4CFFFFFF'); background-color: rgba(255,255,255,.3)}
	.slide_switch__item--current .slide_switch__bg{filter: none; background-color: #fff}
	.mod_singer_push{position: relative; width: 100%; height: 376px; background: url(${basePath}/resources/imgs/music/bg_singer.jpg) 50% 0 repeat-x; overflow: hidden}
	.singer_push__desc,.singer_push__tit{margin-left: auto; margin-right: auto; background-image: url(${basePath}/resources/imgs/music/singer_tit.png?max_age=2592000&v=ae08170ee14d442df63a4172e84b8d88); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/singer_tit.png?max_age=2592000&v=ae08170ee14d442df63a4172e84b8d88) 1x,url(${basePath}/resources/imgs/music/singer_tit@2x.png?max_age=2592000&v=ae08170ee14d442df63a4172e84b8d88&v=69aba30e081e0eee4e824a46f3b81071) 2x)}
	.singer_push__tit{width: 494px; height: 60px; margin-top: 103px; background-position: 0 0}
	.singer_push__desc{width: 260px; height: 26px; margin-top: 20px; background-position: 0 -70px}
	.singer_push__btn{position: relative; display: block; margin: 20px auto 0; font-size: 18px; text-align: center; color: #fff; line-height: 48px; width: 174px; background-color: transparent; border: 0 none}
	.singer_push__btn:hover{color: #fff}
	.singer_push__btn_border{position: absolute; top: 0; left: 0; right: 0; bottom: 0; border-radius: 2px; border: 1px solid #fff; opacity: .2; filter: alpha(opacity=20); transition-property: opacity; transition-duration: .3s}
	.singer_push__btn:hover .singer_push__btn_border{opacity: 1; filter: alpha(opacity=100); transition-duration: .3s}
	.mod_singer_push--nofocus .singer_push__tit{width: 720px; height: 57px; margin-top: 146px; background-position: 0 -116px}
	.mod_singer_push--nofocus .singer_push__desc{width: 226px; height: 28px; margin-top: 30px; background-position: 0 -180px}
	.mod_singer_push--nofocus .singer_push__btn{display: none}
	.singer_push_tab{text-align: center; padding: 60px 0 44px; line-height: 22px}
	.singer_push_tab__item{color: #898989; margin: 0 32px; font-size: 18px}
	.singer_push_tab__item--on{color: #fff}
	.singer_push_slide{width: 750px; margin-left: auto; margin-right: auto}
	.singer_push_list__item{height: 150px}
	.singer_push_list__link{display: block; position: relative; background-color: #000}
	.singer_push_list__pic{width: 100%; height: 150px; -webkit-filter: grayscale(1); opacity: .8; filter: alpha(opacity=70)}
	.singer_push_list__link:hover .singer_push_list__cover{position: absolute; top: 0; left: 0; width: 140px; height: 140px; border: 5px solid #31c27c; z-index: 2}
	.singer_push_list__link:hover .singer_push_list__pic{opacity: 1; filter: none; -webkit-filter: grayscale(0); transition-property: opacity,-webkit-filter; transition-duration: .3s}
	.singer_push_list__more{position: absolute; top: 0; left: 0; width: 100%; height: 100%; border: 0 none; filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#7F000000', endColorstr='#7F000000'); background: rgba(0,0,0,.5); line-height: 150px; color: #fff; font-size: 18px; text-align: center}
	.slider__next,.slider__prev{position: absolute; top: 176px; width: 26px; height: 52px; background-image: url(${basePath}/resources/imgs/music/slider_arrow.png?max_age=2592000&v=f63a909749ce0e37e690f856c11fb122)}
	.slider__prev{left: 50%; margin-left: -462px; background-position: 0 0}
	.slider__next{right: 50%; margin-right: -462px; background-position: -26px 0}
	.slider__prev:hover{background-position: 0 -54px}
	.slider__next:hover{background-position: -26px -54px}
	.mod_singer_tag{background-color: #fbfbfd; padding: 34px 0 17px 40px; margin: 30px 0 20px}
	.singer_tag__list{padding-bottom: 3px; height: auto; zoom:1;clear: both; overflow: hidden}
	.singer_tag__item{float: left; line-height: 26px; padding: 0 8px; margin: 0 12px 14px 0}
	@supports (-webkit-appearance:none){.singer_tag__item{height: 26px; line-height: 27px; overflow: hidden}}
	.singer_tag__item--all{margin-right: 28px}
	.singer_tag__item--select,.singer_tag__item--select:hover{background-color: #31c27c; color: #fff}
	.singer_list__list{margin-bottom: 4px}
	.singer_list_txt{margin-right: -20px; overflow: hidden; margin-bottom: 60px}
	.singer_list_txt__item{float: left; width: 20%}
	.singer_list_txt__link{float: left; max-width: 90%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-size: 14px; line-height: 36px}
	/*  |xGv00|9ecaf4a97d81676f9a62d81396f88f78 */
	
 </style>
 <body>
 	<!-- 顶部导航  start -->
	<%@include file="/WEB-INF/pages/fronts/common/header.jsp"%>
	<!-- 顶部导航  end -->
	
	<!-- top banner -->
	<div class="mod_singer_push js_my_singers_nologin">
        <div class="section_inner">
            <h2 class="singer_push__tit"><i class="icon_txt">万千歌手，尽在眼前</i></h2>
            <div class="singer_push__desc"><i class="icon_txt">登录查看你关注的歌手</i></div>
            <a class="singer_push__btn js_login" href="javascript:;" data-stat="y_new.singerlist.header.login">立即登录<span class="singer_push__btn_border"></span></a>
        </div>
    </div>
    
    
    <div class="mod_singer_push mod_slide_box js_my_singers" style="display:none;">
        <div class="section_inner">
            <div class="singer_push_tab">
                <span href="javascript:;" class="singer_push_tab__item singer_push_tab__item--on">我关注的歌手</span>
                <!--a href="javascript:;" class="singer_push_tab__item">我常听的歌手</a-->
            </div>
            <div class="mod_slide singer_push_slide">
				<a href="javascript:;" class="slider__prev js_jump" data-stat="y_new.singerlist.header.pager" data-p="prev"><i class="icon_txt">上一页</i></a>
                <a href="javascript:;" class="slider__next js_jump" data-stat="y_new.singerlist.header.pager" data-p="next"><i class="icon_txt">下一页</i></a>
                <ul class="singer_push_list slide__list"></ul>
            </div>
	    	<div class="mod_slide_switch js_switch" data-stat="y_new.singerlist.header.pager">
            </div>
        </div>
    </div>
    
    <!-- main start -->
    <div class="main">
        <div class="mod_singer_tag">
            <div class="singer_tag__list js_area">
                <a href="javascript:;" class="singer_tag__item singer_tag__item--all singer_tag__item--select" data-key="all_all" hidefocus="">全部</a>
                <a href="javascript:;" class="singer_tag__item" data-key="cn_man" hidefocus="">华语男</a>
                <a href="javascript:;" class="singer_tag__item" data-key="cn_woman" hidefocus="">华语女</a>
                <a href="javascript:;" class="singer_tag__item" data-key="cn_team" hidefocus="">华语组合</a>
                <a href="javascript:;" class="singer_tag__item" data-key="k_man" hidefocus="">韩国男</a>
                <a href="javascript:;" class="singer_tag__item" data-key="k_woman" hidefocus="">韩国女</a>
                <a href="javascript:;" class="singer_tag__item" data-key="k_team" hidefocus="">韩国组合</a>
                <a href="javascript:;" class="singer_tag__item" data-key="j_man" hidefocus="">日本男</a>
                <a href="javascript:;" class="singer_tag__item" data-key="j_woman" hidefocus="">日本女</a>
                <a href="javascript:;" class="singer_tag__item" data-key="j_team" hidefocus="">日本组合</a>
                <a href="javascript:;" class="singer_tag__item" data-key="eu_man" hidefocus="">欧美男</a>
                <a href="javascript:;" class="singer_tag__item" data-key="eu_woman" hidefocus="">欧美女</a>
                <a href="javascript:;" class="singer_tag__item" data-key="eu_team" hidefocus="">欧美组合</a>
				<a href="javascript:;" class="singer_tag__item" data-key="c_orchestra" hidefocus="">乐团</a>
				<a href="javascript:;" class="singer_tag__item" data-key="c_performer" hidefocus="">演奏家</a>
				<a href="javascript:;" class="singer_tag__item" data-key="c_composer" hidefocus="">作曲家</a>
				<a href="javascript:;" class="singer_tag__item" data-key="c_cantor" hidefocus="">指挥家</a>
                <a href="javascript:;" class="singer_tag__item" data-key="other_other" hidefocus="">其他</a>
            </div>
            <div class="singer_tag__list js_letter">
                <a href="javascript:;" class="singer_tag__item singer_tag__item--all singer_tag__item--select" data-key="all" hidefocus="">热门</a>
                <a href="javascript:;" class="singer_tag__item" data-key="A" hidefocus="">A</a>
                <a href="javascript:;" class="singer_tag__item" data-key="B" hidefocus="">B</a>
                <a href="javascript:;" class="singer_tag__item" data-key="C" hidefocus="">C</a>
                <a href="javascript:;" class="singer_tag__item" data-key="D" hidefocus="">D</a>
                <a href="javascript:;" class="singer_tag__item" data-key="E" hidefocus="">E</a>
                <a href="javascript:;" class="singer_tag__item" data-key="F" hidefocus="">F</a>
                <a href="javascript:;" class="singer_tag__item" data-key="G" hidefocus="">G</a>
                <a href="javascript:;" class="singer_tag__item" data-key="H" hidefocus="">H</a>
                <a href="javascript:;" class="singer_tag__item" data-key="I" hidefocus="">I</a>
                <a href="javascript:;" class="singer_tag__item" data-key="J" hidefocus="">J</a>
                <a href="javascript:;" class="singer_tag__item" data-key="K" hidefocus="">K</a>
                <a href="javascript:;" class="singer_tag__item" data-key="L" hidefocus="">L</a>
                <a href="javascript:;" class="singer_tag__item" data-key="M" hidefocus="">M</a>
                <a href="javascript:;" class="singer_tag__item" data-key="N" hidefocus="">N</a>
                <a href="javascript:;" class="singer_tag__item" data-key="O" hidefocus="">O</a>
                <a href="javascript:;" class="singer_tag__item" data-key="P" hidefocus="">P</a>
                <a href="javascript:;" class="singer_tag__item" data-key="Q" hidefocus="">Q</a>
                <a href="javascript:;" class="singer_tag__item" data-key="R" hidefocus="">R</a>
                <a href="javascript:;" class="singer_tag__item" data-key="S" hidefocus="">S</a>
                <a href="javascript:;" class="singer_tag__item" data-key="T" hidefocus="">T</a>
                <a href="javascript:;" class="singer_tag__item" data-key="U" hidefocus="">U</a>
                <a href="javascript:;" class="singer_tag__item" data-key="V" hidefocus="">V</a>
                <a href="javascript:;" class="singer_tag__item" data-key="W" hidefocus="">W</a>
                <a href="javascript:;" class="singer_tag__item" data-key="X" hidefocus="">X</a>
                <a href="javascript:;" class="singer_tag__item" data-key="Y" hidefocus="">Y</a>
                <a href="javascript:;" class="singer_tag__item" data-key="Z" hidefocus="">Z</a>
                <a href="javascript:;" class="singer_tag__item" data-key="9" hidefocus="">#</a>
            </div>
        </div>
		<div id="mod-singerlist">
	        <div class="mod_singer_list js_avtar_list">
	            <ul class="singer_list__list">
	                        
	                <li class="singer_list__item">
	                    <div class="singer_list__item_box">
	                        <a href="//y.qq.com/portal/singer/002J4UUk29y8BY.html#stat=y_new.singerlist.singerpic" class="singer_list__cover js_singer" hidefocus="true" data-singermid="002J4UUk29y8BY" data-singerid="5062" title="薛之谦">
	                            <img class="singer_list__pic" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/singer_300.png?max_age=31536000'" src="//y.gtimg.cn/music/photo_new/T001R300x300M000002J4UUk29y8BY.jpg?max_age=2592000" alt="薛之谦">
	                        </a>
	                        <h3 class="singer_list__title"><a href="//y.qq.com/portal/singer/002J4UUk29y8BY.html#stat=y_new.singerlist.singername" data-singermid="002J4UUk29y8BY" data-id="5062" class="js_singer" title="薛之谦">薛之谦</a></h3>
	                    </div>
	                </li>
			  
	                <li class="singer_list__item">
	                    <div class="singer_list__item_box">
	                        <a href="//y.qq.com/portal/singer/0025NhlN2yWrP4.html#stat=y_new.singerlist.singerpic" class="singer_list__cover js_singer" hidefocus="true" data-singermid="0025NhlN2yWrP4" data-singerid="4558" title="周杰伦">
	                            <img class="singer_list__pic" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/singer_300.png?max_age=31536000'" src="//y.gtimg.cn/music/photo_new/T001R300x300M0000025NhlN2yWrP4.jpg?max_age=2592000" alt="周杰伦">
	                        </a>
	                        <h3 class="singer_list__title"><a href="//y.qq.com/portal/singer/0025NhlN2yWrP4.html#stat=y_new.singerlist.singername" data-singermid="0025NhlN2yWrP4" data-id="4558" class="js_singer" title="周杰伦">周杰伦</a></h3>
	                    </div>
	                </li>
			  
	                <li class="singer_list__item">
	                    <div class="singer_list__item_box">
	                        <a href="//y.qq.com/portal/singer/004AlfUb0cVkN1.html#stat=y_new.singerlist.singerpic" class="singer_list__cover js_singer" hidefocus="true" data-singermid="004AlfUb0cVkN1" data-singerid="11733" title="BIGBANG (빅뱅)">
	                            <img class="singer_list__pic" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/singer_300.png?max_age=31536000'" src="//y.gtimg.cn/music/photo_new/T001R300x300M000004AlfUb0cVkN1.jpg?max_age=2592000" alt="BIGBANG (빅뱅)">
	                        </a>
	                        <h3 class="singer_list__title"><a href="//y.qq.com/portal/singer/004AlfUb0cVkN1.html#stat=y_new.singerlist.singername" data-singermid="004AlfUb0cVkN1" data-id="11733" class="js_singer" title="BIGBANG (빅뱅)">BIGBANG (빅뱅)</a></h3>
	                    </div>
	                </li>
			  
	                <li class="singer_list__item">
	                    <div class="singer_list__item_box">
	                        <a href="//y.qq.com/portal/singer/003Nz2So3XXYek.html#stat=y_new.singerlist.singerpic" class="singer_list__cover js_singer" hidefocus="true" data-singermid="003Nz2So3XXYek" data-singerid="143" title="陈奕迅">
	                            <img class="singer_list__pic" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/singer_300.png?max_age=31536000'" src="//y.gtimg.cn/music/photo_new/T001R300x300M000003Nz2So3XXYek.jpg?max_age=2592000" alt="陈奕迅">
	                        </a>
	                        <h3 class="singer_list__title"><a href="//y.qq.com/portal/singer/003Nz2So3XXYek.html#stat=y_new.singerlist.singername" data-singermid="003Nz2So3XXYek" data-id="143" class="js_singer" title="陈奕迅">陈奕迅</a></h3>
	                    </div>
	                </li>
			  
	                <li class="singer_list__item">
	                    <div class="singer_list__item_box">
	                        <a href="//y.qq.com/portal/singer/001BLpXF2DyJe2.html#stat=y_new.singerlist.singerpic" class="singer_list__cover js_singer" hidefocus="true" data-singermid="001BLpXF2DyJe2" data-singerid="4286" title="林俊杰">
	                            <img class="singer_list__pic" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/singer_300.png?max_age=31536000'" src="//y.gtimg.cn/music/photo_new/T001R300x300M000001BLpXF2DyJe2.jpg?max_age=2592000" alt="林俊杰">
	                        </a>
	                        <h3 class="singer_list__title"><a href="//y.qq.com/portal/singer/001BLpXF2DyJe2.html#stat=y_new.singerlist.singername" data-singermid="001BLpXF2DyJe2" data-id="4286" class="js_singer" title="林俊杰">林俊杰</a></h3>
	                    </div>
	                </li>
			  
	                <li class="singer_list__item">
	                    <div class="singer_list__item_box">
	                        <a href="//y.qq.com/portal/singer/0020PeOh4ZaCw1.html#stat=y_new.singerlist.singerpic" class="singer_list__cover js_singer" hidefocus="true" data-singermid="0020PeOh4ZaCw1" data-singerid="944940" title="Alan Walker (艾伦·沃克)">
	                            <img class="singer_list__pic" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/singer_300.png?max_age=31536000'" src="//y.gtimg.cn/music/photo_new/T001R300x300M0000020PeOh4ZaCw1.jpg?max_age=2592000" alt="Alan Walker (艾伦·沃克)">
	                        </a>
	                        <h3 class="singer_list__title"><a href="//y.qq.com/portal/singer/0020PeOh4ZaCw1.html#stat=y_new.singerlist.singername" data-singermid="0020PeOh4ZaCw1" data-id="944940" class="js_singer" title="Alan Walker (艾伦·沃克)">Alan Walker (艾伦·沃克)</a></h3>
	                    </div>
	                </li>
			  
	                <li class="singer_list__item">
	                    <div class="singer_list__item_box">
	                        <a href="//y.qq.com/portal/singer/000aHmbL2aPXWH.html#stat=y_new.singerlist.singerpic" class="singer_list__cover js_singer" hidefocus="true" data-singermid="000aHmbL2aPXWH" data-singerid="60505" title="李荣浩">
	                            <img class="singer_list__pic" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/singer_300.png?max_age=31536000'" src="//y.gtimg.cn/music/photo_new/T001R300x300M000000aHmbL2aPXWH.jpg?max_age=2592000" alt="李荣浩">
	                        </a>
	                        <h3 class="singer_list__title"><a href="//y.qq.com/portal/singer/000aHmbL2aPXWH.html#stat=y_new.singerlist.singername" data-singermid="000aHmbL2aPXWH" data-id="60505" class="js_singer" title="李荣浩">李荣浩</a></h3>
	                    </div>
	                </li>
			  
	                <li class="singer_list__item">
	                    <div class="singer_list__item_box">
	                        <a href="//y.qq.com/portal/singer/001fNHEf1SFEFN.html#stat=y_new.singerlist.singerpic" class="singer_list__cover js_singer" hidefocus="true" data-singermid="001fNHEf1SFEFN" data-singerid="13948" title="G.E.M. 邓紫棋">
	                            <img class="singer_list__pic" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/singer_300.png?max_age=31536000'" src="//y.gtimg.cn/music/photo_new/T001R300x300M000001fNHEf1SFEFN.jpg?max_age=2592000" alt="G.E.M. 邓紫棋">
	                        </a>
	                        <h3 class="singer_list__title"><a href="//y.qq.com/portal/singer/001fNHEf1SFEFN.html#stat=y_new.singerlist.singername" data-singermid="001fNHEf1SFEFN" data-id="13948" class="js_singer" title="G.E.M. 邓紫棋">G.E.M. 邓紫棋</a></h3>
	                    </div>
	                </li>
			  
	                <li class="singer_list__item">
	                    <div class="singer_list__item_box">
	                        <a href="//y.qq.com/portal/singer/001JuGrt372YIQ.html#stat=y_new.singerlist.singerpic" class="singer_list__cover js_singer" hidefocus="true" data-singermid="001JuGrt372YIQ" data-singerid="4983" title="Maroon 5 (魔力红乐团)">
	                            <img class="singer_list__pic" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/singer_300.png?max_age=31536000'" src="//y.gtimg.cn/music/photo_new/T001R300x300M000001JuGrt372YIQ.jpg?max_age=2592000" alt="Maroon 5 (魔力红乐团)">
	                        </a>
	                        <h3 class="singer_list__title"><a href="//y.qq.com/portal/singer/001JuGrt372YIQ.html#stat=y_new.singerlist.singername" data-singermid="001JuGrt372YIQ" data-id="4983" class="js_singer" title="Maroon 5 (魔力红乐团)">Maroon 5 (魔力红乐团)</a></h3>
	                    </div>
	                </li>
			  
	                <li class="singer_list__item">
	                    <div class="singer_list__item_box">
	                        <a href="//y.qq.com/portal/singer/003Cn3Yh16q1MO.html#stat=y_new.singerlist.singerpic" class="singer_list__cover js_singer" hidefocus="true" data-singermid="003Cn3Yh16q1MO" data-singerid="89698" title="庄心妍">
	                            <img class="singer_list__pic" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/singer_300.png?max_age=31536000'" src="//y.gtimg.cn/music/photo_new/T001R300x300M000003Cn3Yh16q1MO.jpg?max_age=2592000" alt="庄心妍">
	                        </a>
	                        <h3 class="singer_list__title"><a href="//y.qq.com/portal/singer/003Cn3Yh16q1MO.html#stat=y_new.singerlist.singername" data-singermid="003Cn3Yh16q1MO" data-id="89698" class="js_singer" title="庄心妍">庄心妍</a></h3>
	                    </div>
	                </li>
			  
	            </ul>
	        </div>
	
	        <ul class="singer_list_txt">
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000CK5xN3yZDJt.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000CK5xN3yZDJt" data-singerid="7221" title="许嵩">许嵩</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000zmpju02bEBm.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000zmpju02bEBm" data-singerid="34412" title="TFBOYS">TFBOYS</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/002azErJ0UcDN6.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="002azErJ0UcDN6" data-singerid="6499" title="张杰">张杰</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003tMm0y0TuewY.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003tMm0y0TuewY" data-singerid="11608" title="杨宗纬">杨宗纬</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000Q4W691sMvLG.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000Q4W691sMvLG" data-singerid="5924" title="苏打绿">苏打绿</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001SqkF53OEhdO.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001SqkF53OEhdO" data-singerid="204664" title="鹿晗">鹿晗</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004Be55m1SJaLk.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004Be55m1SJaLk" data-singerid="174" title="张学友">张学友</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003LCFXH0eodXv.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003LCFXH0eodXv" data-singerid="137" title="那英">那英</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/0003ZpE43ypssl.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="0003ZpE43ypssl" data-singerid="199515" title="张碧晨">张碧晨</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004bsIDK0awMOv.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004bsIDK0awMOv" data-singerid="13203" title="萧敬腾">萧敬腾</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/002DYpxl3hW3EP.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="002DYpxl3hW3EP" data-singerid="16257" title="Justin Bieber (贾斯汀·比伯)">Justin Bieber (贾斯汀·比伯)</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000aw4WC2EQYTv.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000aw4WC2EQYTv" data-singerid="4607" title="张靓颖">张靓颖</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/002pUZT93gF4Cu.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="002pUZT93gF4Cu" data-singerid="2" title="BEYOND">BEYOND</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000TCjfG183Hp9.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000TCjfG183Hp9" data-singerid="366026" title="王圆坤">王圆坤</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001f0VyZ1hmWZ1.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001f0VyZ1hmWZ1" data-singerid="11606" title="林宥嘉">林宥嘉</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001JDzPT3JdvqK.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001JDzPT3JdvqK" data-singerid="265" title="王力宏">王力宏</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/002Vcz8F2hpBQj.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="002Vcz8F2hpBQj" data-singerid="163550" title="华晨宇">华晨宇</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000f1b6W1wzyRN.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000f1b6W1wzyRN" data-singerid="9962" title="RADWIMPS (ラッドウィンプス)">RADWIMPS (ラッドウィンプス)</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000GDDuQ3sGQiT.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000GDDuQ3sGQiT" data-singerid="264" title="王菲">王菲</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/002yeznU3VAVEV.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="002yeznU3VAVEV" data-singerid="180646" title="吴亦凡">吴亦凡</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004YXxql1sSr2o.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004YXxql1sSr2o" data-singerid="12111" title="金志文">金志文</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000mLAT42CFWNa.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000mLAT42CFWNa" data-singerid="4442" title="朴树">朴树</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/002Sm9iK4RIsCr.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="002Sm9iK4RIsCr" data-singerid="11761" title="筷子兄弟">筷子兄弟</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003ZQQb64D5317.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003ZQQb64D5317" data-singerid="69205" title="南征北战">南征北战</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004WgCsE3KBddt.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004WgCsE3KBddt" data-singerid="940748" title="陈粒">陈粒</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003ArN8Z0WpjTz.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003ArN8Z0WpjTz" data-singerid="6028" title="A-Lin">A-Lin</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/00235pCx2tYjlq.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="00235pCx2tYjlq" data-singerid="3376" title="许巍">许巍</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000t2qd13dLpae.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000t2qd13dLpae" data-singerid="19851" title="G-DRAGON (权志龙)">G-DRAGON (权志龙)</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001z2JmX09LLgL.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001z2JmX09LLgL" data-singerid="3954" title="汪苏泷">汪苏泷</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004NMZuf2BLjg8.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004NMZuf2BLjg8" data-singerid="4365" title="周传雄">周传雄</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001oXbjs29oPul.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001oXbjs29oPul" data-singerid="22874" title="孙子涵">孙子涵</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/0035kILA0ydw3j.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="0035kILA0ydw3j" data-singerid="160022" title="MC天佑">MC天佑</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/0000mFvh1jtLcz.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="0000mFvh1jtLcz" data-singerid="167" title="张信哲">张信哲</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000WbpKa3WokLD.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000WbpKa3WokLD" data-singerid="1045852" title="MC魏小然">MC魏小然</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003JGrNQ3RjelA.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003JGrNQ3RjelA" data-singerid="141" title="张惠妹">张惠妹</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004KKLWZ4320g1.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004KKLWZ4320g1" data-singerid="61620" title="宋冬野">宋冬野</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004DFS271osAwp.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004DFS271osAwp" data-singerid="4284" title="陈小春">陈小春</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000cISVf2QqLc6.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000cISVf2QqLc6" data-singerid="54" title="莫文蔚">莫文蔚</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001pWERg3vFgg8.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001pWERg3vFgg8" data-singerid="109" title="孙燕姿">孙燕姿</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/0044wQXL0ElWF1.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="0044wQXL0ElWF1" data-singerid="168" title="张宇">张宇</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/0030RkE50nmpWC.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="0030RkE50nmpWC" data-singerid="34703" title="曲婉婷">曲婉婷</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000CQ06r24Naco.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000CQ06r24Naco" data-singerid="12978" title="Wiz Khalifa (维兹·卡利法)">Wiz Khalifa (维兹·卡利法)</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004eaDNU1nfRO0.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004eaDNU1nfRO0" data-singerid="1012038" title="张磊">张磊</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001adLDR1SS40P.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001adLDR1SS40P" data-singerid="4604" title="汪峰">汪峰</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001ByAsv3XCdgm.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001ByAsv3XCdgm" data-singerid="4701" title="田馥甄">田馥甄</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/0043Zxw10txf5O.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="0043Zxw10txf5O" data-singerid="11626" title="郭静">郭静</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004coWV04C5FCV.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004coWV04C5FCV" data-singerid="944274" title="杨洋">杨洋</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/002OfR3n1vx75j.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="002OfR3n1vx75j" data-singerid="61959" title="葛林">葛林</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004aRKga0CXIPm.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004aRKga0CXIPm" data-singerid="22704" title="徐良">徐良</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/0012bj8d36Xkw1.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="0012bj8d36Xkw1" data-singerid="4422" title="牛奶咖啡">牛奶咖啡</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003vSrlp0ujV6o.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003vSrlp0ujV6o" data-singerid="1102711" title="鹏泊">鹏泊</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/002seUhN1Akj7J.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="002seUhN1Akj7J" data-singerid="38" title="李圣杰">李圣杰</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004FtTNW2b0tJi.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004FtTNW2b0tJi" data-singerid="7485" title="雨宗林">雨宗林</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/002mze3U0NYXOM.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="002mze3U0NYXOM" data-singerid="24833" title="胡夏">胡夏</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000jnR7q3pCzYG.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000jnR7q3pCzYG" data-singerid="39000" title="Charlie Puth (查理·普斯)">Charlie Puth (查理·普斯)</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/002MiBdR19HQWx.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="002MiBdR19HQWx" data-singerid="6966" title="Rihanna (蕾哈娜)">Rihanna (蕾哈娜)</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/0023ni2j3F9CpN.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="0023ni2j3F9CpN" data-singerid="1041231" title="Jam">Jam</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000TWxig04fpou.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000TWxig04fpou" data-singerid="156330" title="石杨">石杨</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003rJfMG3PPqWd.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003rJfMG3PPqWd" data-singerid="943468" title="萌萌哒天团">萌萌哒天团</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003LaMHm42u7qS.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003LaMHm42u7qS" data-singerid="4545" title="本兮">本兮</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003CoxJh1zFPpx.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003CoxJh1zFPpx" data-singerid="12578" title="Adele (阿黛尔)">Adele (阿黛尔)</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003AfDK34H82GU.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003AfDK34H82GU" data-singerid="219" title="张敬轩">张敬轩</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003wWQBU0fHBcj.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003wWQBU0fHBcj" data-singerid="28227" title="马旭东">马旭东</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000yDAjj2TE9j8.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000yDAjj2TE9j8" data-singerid="4880" title="Eminem (艾米纳姆)">Eminem (艾米纳姆)</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/002ZOuVm3Qn20Y.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="002ZOuVm3Qn20Y" data-singerid="4615" title="李宇春">李宇春</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000SJp6n49rDgl.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000SJp6n49rDgl" data-singerid="63938" title="张赫宣">张赫宣</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001WcO2V0TLCv3.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001WcO2V0TLCv3" data-singerid="38625" title="威仔">威仔</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/0042kZuh1dgLre.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="0042kZuh1dgLre" data-singerid="968571" title="周二珂">周二珂</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/002xpOdd4Dh6pu.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="002xpOdd4Dh6pu" data-singerid="11707" title="李易峰">李易峰</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/0020IaUo4Vgsjk.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="0020IaUo4Vgsjk" data-singerid="1042260" title="齐一">齐一</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/002raUWw3PXdkT.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="002raUWw3PXdkT" data-singerid="224" title="张韶涵">张韶涵</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003bQEFA3KrvLI.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003bQEFA3KrvLI" data-singerid="161444" title="刘瑞琦">刘瑞琦</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000hNnWC3kko2c.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000hNnWC3kko2c" data-singerid="112" title="蔡健雅">蔡健雅</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001oNMzI3WznzG.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001oNMzI3WznzG" data-singerid="23800" title="夏婉安">夏婉安</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000ndQx82fsq8Z.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000ndQx82fsq8Z" data-singerid="947788" title="Tez Cadey">Tez Cadey</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003CKb192ggBqi.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003CKb192ggBqi" data-singerid="4868" title="Fall Out Boy (打倒男孩)">Fall Out Boy (打倒男孩)</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000H4xDG3heHtr.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000H4xDG3heHtr" data-singerid="40798" title="齐晨">齐晨</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003aQYLo2x8izP.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003aQYLo2x8izP" data-singerid="163" title="刘德华">刘德华</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001m7JoC1IVL44.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001m7JoC1IVL44" data-singerid="44018" title="金南玲">金南玲</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003nS2v740Lxcw.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003nS2v740Lxcw" data-singerid="235" title="李克勤">李克勤</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004dXznj3zlHKW.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004dXznj3zlHKW" data-singerid="14411" title="孙露">孙露</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001FXn5P0kkWfV.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001FXn5P0kkWfV" data-singerid="24561" title="One Direction (单向组合)">One Direction (单向组合)</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/0040D7gK4aI54k.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="0040D7gK4aI54k" data-singerid="149" title="谭咏麟">谭咏麟</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/000QG95i2rHlOf.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="000QG95i2rHlOf" data-singerid="6370" title="谭晶">谭晶</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004QoDUs3jfOC6.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004QoDUs3jfOC6" data-singerid="1043567" title="韩安旭">韩安旭</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001Yxpxc0OaUUX.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001Yxpxc0OaUUX" data-singerid="15514" title="逃跑计划">逃跑计划</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/004dr7ZS36C2B1.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="004dr7ZS36C2B1" data-singerid="43665" title="梦然">梦然</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003DBAjk2MMfhR.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003DBAjk2MMfhR" data-singerid="1190986" title="BLACKPINK">BLACKPINK</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/003vyG9q2klWs4.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="003vyG9q2klWs4" data-singerid="4351" title="范玮琪">范玮琪</a></li>
	                        
	            <li class="singer_list_txt__item"><a href="//y.qq.com/portal/singer/001TpDgn4SxyJn.html#stat=y_new.singerlist.singername" class="singer_list_txt__link js_singer" data-singermid="001TpDgn4SxyJn" data-singerid="162691" title="방탄소년단 (防弹少年团)">방탄소년단 (防弹少年团)</a></li>
	                        
	        </ul>
			<div class="mod_page_nav js_pager">
				<strong class="current">1</strong>
				<a href="javascript:;" class="js_pageindex" data-index="2" hidefocus="">2</a>
				<a href="javascript:;" class="js_pageindex" data-index="3" hidefocus="">3</a>
				<a href="javascript:;" class="js_pageindex" data-index="4" hidefocus="">4</a>
				<strong class="more">...</strong>
				<a href="javascript:;" class="js_pageindex" data-index="5517" hidefocus="">5517</a>
				<a href="javascript:;" class="next js_pageindex" data-index="2" title="下一页" hidefocus=""><span>&gt;</span></a>
			</div>
		</div>
	</div>
    
	
	<!-- 底部导航  start -->
	<%@include file="/WEB-INF/pages/fronts/common/footer.jsp"%>
	<!-- 底部导航  end -->	
	
	<script type="text/javascript">
		
	</script>
 </body>
</html>
