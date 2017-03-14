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
	.list_menu__icon_add,.list_menu__icon_down,.list_menu__icon_pause,.list_menu__icon_play,.list_menu__icon_share{display: block; width: 36px; height: 36px; background-image: url(${basePath}/resources/imgs/music/icon_list_menu.png?max_age=2592000&v=873fb6560497db4abbe63767018022eb); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/icon_list_menu.png) 1x,url(${basePath}/resources/imgs/music/icon_list_menu@2x.png) 2x); background-repeat: no-repeat}
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
	.btn_operate_menu{position: absolute; bottom: auto; right: -99px; width: 20px; height: 20px; background-image: url(${basePath}/resources/imgs/music/icon_sprite.png?max_age=2592000&v=f059f1bb8aed4398fe054f423a3db305); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/icon_sprite.png) 1x,url(${basePath}/resources/imgs/music/icon_sprite@2x.png) 2x); background-position: -80px -40px}
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
	.operate_menu__icon_add,.operate_menu__icon_arrow,.operate_menu__icon_batch,.operate_menu__icon_delete,.operate_menu__icon_down,.operate_menu__icon_edit,.operate_menu__icon_like,.operate_menu__icon_prev_arrow,.operate_menu__icon_radio,.operate_menu__icon_share{position: absolute; width: 16px; height: 16px; left: 15px; top: 10px; background-image: url(${basePath}/resources/imgs/music/icon_sprite.png?max_age=2592000&v=f059f1bb8aed4398fe054f423a3db305); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/icon_sprite.png) 1x,url(${basePath}/resources/imgs/music/icon_sprite@2x.png) 2x); background-repeat: no-repeat}
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
	.mod_playlist{overflow: hidden}
	.mod_playlist .playlist__list{margin-right: -20px}
	.mod_playlist .playlist__header{display: none}
	.mod_playlist .playlist__item{float: left; width: 20%; padding-bottom: 44px; overflow: hidden}
	.mod_playlist .playlist__item_box{position: relative; margin-right: 20px}
	.mod_playlist .playlist__cover{position: relative; display: block; overflow: hidden; padding-top: 100%; margin-bottom: 15px}
	.mod_playlist .playlist__pic{position: absolute; top: 0; left: 0; width: 100%; -webkit-transform: scale(1) translateZ(0); -webkit-transition: -webkit-transform .75s; transform: scale(1) translateZ(0); transition: transform .75s}
	.mod_playlist .playlist__cover:hover .playlist__pic{-webkit-transform: scale(1.07) translateZ(0); -webkit-transition: -webkit-transform .75s cubic-bezier(0,1,.75,1); transform: scale(1.07) translateZ(0); transition: transform .75s cubic-bezier(0,1,.75,1)}
	.mod_playlist .mod_list_menu,.mod_playlist .playlist__delete,.mod_playlist .playlist__number{display: none}
	.mod_playlist .playlist__title{overflow: hidden}
	.mod_playlist .playlist__title_txt{float: left; max-width: 100%; font-weight: 400; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; line-height: 22px}
	.mod_playlist .playlist__author,.mod_playlist .playlist__author a,.mod_playlist .playlist__other{color: #999; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; height: 22px}
	.mod_playlist .playlist__author a:hover{color: #31c27c}
	.mod_playlist .btn_operate_menu{bottom: 23px}
	.mod_playlist--all .btn_operate_menu{bottom: 44px}
	.mod_playlist .playlist__item--current .btn_operate_menu,.mod_playlist .playlist__item:hover .btn_operate_menu{right: 0}
	@supports (-webkit-appearance:none){.btn_operate_menu{right: 0; opacity: 0; -webkit-transition-property: opacity; -webkit-transition-duration: .3s; transition-property: opacity; transition-duration: .3s} .mod_playlist .playlist__item--current .btn_operate_menu,.mod_playlist .playlist__item:hover .btn_operate_menu{opacity: 1; -webkit-transition-duration: .3s; transition-duration: .3s}}
	.mod_playlist .playlist__item--current .playlist__title_txt,.mod_playlist .playlist__item:hover .playlist__title_txt{max-width: 88%}
	.mod_mv_list{overflow: hidden}
	.mv_list__list{margin-right: -20px; zoom:1}
	.mv_list__list:after{content: ""; display: block; clear: both}
	.mv_list__item{float: left; width: 25%; padding-bottom: 44px; overflow: hidden}
	.mv_list__item_box{position: relative; margin-right: 20px}
	.mv_list__cover{position: relative; display: block; overflow: hidden; padding-top: 56.5476%; margin-bottom: 15px}
	.mv_list__cover:after{content: ""; position: absolute; bottom: 0; left: 0; right: 0; height: 60px; background: linear-gradient(to bottom,rgba(0,0,0,0) 0,rgba(0,0,0,.4) 80%,rgba(0,0,0,.7) 100%); filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#99000000', GradientType=0 )}
	.mv_list__pic{position: absolute; top: 0; left: 0; width: 100%; height: 100%; transform: scale(1); transition: transform .75s}
	.mv_list__cover:hover .mv_list__pic{transform: scale(1.07); transition: transform .75s cubic-bezier(0,1,.75,1)}
	.mv_list__lang{position: absolute; top: 0; left: 0; width: 34px; line-height: 20px; color: #fff; filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#3A000000', endColorstr='#3A000000'); background: rgba(0,0,0,.23); text-align: center; font-size: 12px}
	@supports (-webkit-appearance:none){.mv_list__lang{height: 20px; line-height: 22px}}
	.mv_list__title{font-weight: 400; zoom:1;*width: 100%}
	.mv_list__desc,.mv_list__singer,.mv_list__title{overflow: hidden; text-overflow: ellipsis; white-space: nowrap}
	.mv_list__singer{height: 24px}
	.mv_list__info{line-height: 18px; height: 20px}
	.mv_list__desc,.mv_list__info,.mv_list__singer,.mv_list__singer a{color: #999}
	.mv_list__singer a:hover{color: #31c27c}
	.mv_list__time{position: absolute; bottom: 0; left: 0; right: 0; height: 30px; text-indent: 10px; text-align: right; padding-right: 10px; z-index: 2}
	.mv_list__cover:hover .mv_list__cover,.mv_list__time{color: #fff}
	.mv_list__listen{margin-right: 10px}
	.mv_list__listen_icon{display: inline-block; width: 19px; height: 12px; background-image: url(${basePath}/resources/imgs/music/icon_sprite.png?max_age=2592000&v=f059f1bb8aed4398fe054f423a3db305); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/icon_sprite.png) 1x,url(${basePath}/resources/imgs/music/icon_sprite@2x.png) 2x); background-position: -180px -20px; margin-right: 5px; vertical-align: -1px}
	.mod_cover{zoom:1}
	.mod_cover__icon_play{position: absolute; left: 50%; top: 50%; margin: -35px; width: 70px; height: 70px; filter: alpha(opacity=0); opacity: 0; -webkit-transform: scale(.7); -webkit-transition-property: opacity,-webkit-transform; -webkit-transition-duration: .5s; transform: scale(.7); transition-property: opacity,transform; transition-duration: .5s; zoom:1}
	@supports (-webkit-appearance:none){.mod_cover.play::after{content: ""; position: absolute; top: 50%; left: 50%; margin: -50px -70px; width: 35px; height: 40px; background: url(${basePath}/resources/imgs/music/play_ani.png?max_age=2592000&v=8941832651edecbe32917f5161e33877); -webkit-animation: play .7s forwards ease-in-out; animation: play .7s forwards ease-in-out} @-webkit-keyframes play{0{opacity: 1; -webkit-transform: translateY(0)} 100%{opacity: 0; -webkit-transform: translateY(-40px)} } @keyframes play{0{opacity: 1; transform: translateY(0)} 100%{opacity: 0; transform: translateY(-20px)} }}
	.mod_cover__mask{position: absolute; left: 0; top: 0; width: 100%; height: 100%; background-color: #000; opacity: 0; filter: alpha(opacity=0); -webkit-transition: opacity .5s; transition: opacity .5s}
	.mod_cover:hover .mod_cover__icon_play{background: 0 0\9; filter: progid:dximagetransform.microsoft.alphaimageloader(src="http://imgcache.gtimg.cn/mediastyle/yqq/img/cover_play.png", sizingmethod="crop") alpha(opacity=90); opacity: .9; -webkit-transform: scale(1); -webkit-transition-property: opacity,-webkit-transform; -webkit-transition-duration: .5s; transform: scale(1); transition-property: opacity,transform; transition-duration: .5s; cursor: pointer}
	.mod_cover .mod_cover__icon_play:hover,.mod_cover__icon_play{background-image: url(${basePath}/resources/imgs/music/cover_play.png?max_age=2592000&v=fa72193fd8d5000e90837380d6be93ea); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/cover_play.png) 1x,url(${basePath}/resources/imgs/music/cover_play@2x.png) 2x)}
	.mod_cover .mod_cover__icon_play:hover{opacity: 1; filter: none}
	.mod_cover:hover .mod_cover__mask{opacity: .2; filter: alpha(opacity=20); -webkit-transition: opacity .5s; transition: opacity .5s}
	.mod_slide{overflow: hidden; margin-bottom: 25px}
	.mod_slide:after{content: ""; display: block; clear: both}
	.slide__list{position: relative; font-size: 0; width: 500%}
	.slide__item{display: inline-block; width: 4%}
	.mod_slide_action{position: absolute; top: 0; left: 0; width: 100%; height: 100%; overflow: hidden}
	.slide_action{position: absolute; top: 0; width: 50%; height: 100%}
	.slide_action__btn{position: absolute; top: 50%; margin-top: -54px; width: 72px; height: 108px; filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#66999999', endColorstr='#66999999'); background: url(#?max_age=2592000); background: rgba(153,153,153,.4); opacity: 0; visibility: none; transition-property: opacity,transform; transition-duration: .5s; z-index: 2}
	.slide_action__btn--left{transform: translateX(-100%)}
	.slide_action__btn--right{transform: translateX(100%)}
	.mod_slide_box:hover .slide_action__btn{opacity: 1; visibility: none; transform: translateX(0); transition-property: opacity,transform,background,width; transition-duration: .5s}
	.slide_action:hover .slide_action__btn{width: 80px; filter: none; background: #31c27c; transition-property: background,width; transition-duration: .5s}
	.slide_action--left,.slide_action__btn--left{left: 0}
	.slide_action--right,.slide_action__btn--right{right: 0}
	.slide_action__arrow{position: absolute; top: 50%; margin-top: -9px; background-image: url(${basePath}/resources/imgs/music/icon_sprite.png?max_age=2592000&v=f059f1bb8aed4398fe054f423a3db305); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/icon_sprite.png) 1x,url(${basePath}/resources/imgs/music/icon_sprite@2x.png) 2x); width: 11px; height: 18px}
	.slide_action__arrow--left{left: 28px; background-position: -180px 0}
	.slide_action__arrow--right{right: 28px; background-position: -160px 0}
	.mod_slide_switch{width: 100%; text-align: center; font-size: 0}
	.slide_switch__item{display: inline-block; width: 30px; height: 1px; padding: 10px 0; margin: 0 5px}
	.slide_switch__bg{display: block; width: 100%; height: 1px; filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#4CFFFFFF', endColorstr='#4CFFFFFF'); background-color: rgba(255,255,255,.3)}
	.slide_switch__item--current .slide_switch__bg{filter: none; background-color: #fff}
	.operate_menu__cont,.operate_menu__sub{box-shadow: none}
	.mod_playlist{text-align: center}
	.mod_playlist .playlist__item_box,.mod_playlist .playlist__list{margin-right: 0}
	.mod_playlist .playlist__item_box{height: auto}
	.mod_playlist .playlist__item{width: 5%; filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#CC000000', endColorstr='#CC000000'); background: rgba(0,0,0,.8); font-size: 16px; padding-bottom: 0}
	.mod_playlist .playlist__title{display: inline-block; position: relative; max-width: 75%; padding: 0 26px; height: 22px; margin-bottom: 0}
	.mod_playlist .playlist__title_txt{float: none; display: inline-block}
	.mod_playlist .playlist__title_txt,.mod_playlist .playlist__title_txt a{color: #fff}
	.mod_playlist .playlist__cover{margin-bottom: 57px}
	.mod_playlist .playlist__author,.mod_playlist .playlist__other{line-height: 18px; margin-bottom: 57px}
	.mod_playlist li.playlist__item--current,.mod_playlist li.playlist__item--hover{filter: none; background-color: #31c27c}
	.mod_playlist .playlist__item--current .playlist__title_txt,.mod_playlist .playlist__item:hover .playlist__title_txt{max-width: 100%}
	.mod_playlist .playlist__item--current .playlist__author a,.mod_playlist .playlist__item--current .playlist__other,.mod_playlist .playlist__item--hover .playlist__author a,.mod_playlist .playlist__item--hover .playlist__other{color: #c1e9d5}
	.btn_operate_menu{display: inline-block; background-position: -180px -100px}
	.mod_playlist .playlist__item--current .btn_operate_menu,.mod_playlist .playlist__item--hover .btn_operate_menu{top: 2px; background-position: -180px -100px; opacity: .7}
	.mod_playlist .btn_operate_menu:hover{opacity: 1}
	@supports (-webkit-appearance:none){.btn_operate_menu{top: 2px}}
	.mod_index{position: relative}
	.mod_index .section_inner{z-index: 2; overflow: hidden}
	.index__hd{position: relative; width: 490px; height: 48px; padding-top: 80px; margin: 0 auto 50px}
	.index__tit{font-weight: 400; text-align: center}
	.index__tit_sprite{display: block; margin: 0 auto; height: 48px; background-image: url(${basePath}/resources/imgs/music/index_tit.png?max_age=2592000&v=ea6515ebb82f7609712c02805e2abe9c); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/index_tit.png) 1x,url(${basePath}/resources/imgs/music/index_tit@2x.png) 2x)}
	.mod_index--new .index__tit_sprite{width: 193px; background-position: 0 0}
	.mod_index--hot .index__tit_sprite{width: 193px; background-position: 0 -60px}
	.mod_index--top .index__tit_sprite{width: 144px; background-position: 0 -120px}
	.mod_index--mv .index__tit_sprite{width: 171px; background-position: 0 -180px}
	.mod_index--event .index__tit_sprite{width: 193px; background-position: 0 -240px}
	.index__more{position: absolute; right: 0; top: initial}
	.index__more:hover{color: #31c27c}
	.icon_index_arrow{display: inline-block; width: 7px; height: 12px; background-image: url(${basePath}/resources/imgs/music/icon_sprite.png?max_age=2592000&v=f059f1bb8aed4398fe054f423a3db305); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/icon_sprite.png) 1x,url(${basePath}/resources/imgs/music/icon_sprite@2x.png) 2x); background-position: -120px -40px; margin-left: 6px}
	.index__more--white{font-size: 15px; color: #fff}
	.index__more--white .icon_index_arrow{background-position: -40px -260px}
	.index__more:hover .icon_index_arrow{background-position: -120px -60px}
	.index__line{position: absolute; top: 104px; width: 72px; height: 1px; opacity: .1; filter: alpha(opacity=10); background-color: #000}
	.index__line--left{left: 0}
	.index__line--right{right: 0}
	.mod_index--new .index__line,.mod_index--top .index__line{background-color: #fff}
	.mod_index_tab{height: 50px; text-align: center; font-size: 0}
	.index_tab__item{display: inline-block; font-size: 16px; margin: 0 35px; color: #fff; opacity: .5; filter: alpha(opacity=50)}
	.index_tab__item--current,.index_tab__item:hover{color: #fff; opacity: 1; filter: none}
	.mod_index--new{height: 734px; background: #000 url(${basePath}/resources/imgs/music/bg_index_new.jpg?max_age=2592000&v=e1e9b8c2303de5fcddd034ae599dcfd3) 50% 0 repeat-x}
	.mod_index--new .playlist__item--even{filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#99000000', endColorstr='#99000000'); background: rgba(0,0,0,.6)}
	.mod_index--new .index__hd{padding-top: 80px; margin-bottom: 43px}
	.mod_index--new .index__line{top: 104px}
	.mod_index--new .mod_slide_switch{bottom: 24px}
	.mod_index--new .playlist__author,.mod_index--new .playlist__other{margin-bottom: 32px}
	.mod_index--new .playlist__cover{margin-bottom: 32px}
	@media (max-width: 1240px){.mod_index--new{height:714px}}
	.mod_index--event .section_inner{height: 610px}
	.mod_index--event .slide_switch__bg{filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#4C151515', endColorstr='#4C151515'); background: rgba(21,21,21,.3)}
	.mod_index--event .slide_switch__item--current .slide_switch__bg{filter: none; background-color: #151515}
	.event_list{width: 100%; height: 325px}
	.event_list__item{position: absolute; top: 0; top: 29px\9; left: 0; width: 751px; height: 300px; width: 606px\9; height: 242px\9; opacity: 0; filter: alpha(opacity=0); z-index: 1; -webkit-transition: all 300ms ease-in-out; -ms-transition: all 300ms ease-out; transition: all 300ms ease-out}
	.event_list__item.p2,.event_list__item.p4{opacity: .8; filter: none}
	.event_list__item.p2{transform-origin: 0 50%}
	.event_list__item.p4{transform-origin: 100% 50%}
	.event_list__item.p3{top: 0\9; width: 751px\9; height: 300px\9; z-index: 3; opacity: 1; filter: none}
	.event_list__item.p1{-webkit-transform: translate3d(-224px,0,0) scale(0.81); transform: translate3d(-224px,0,0) scale(0.81);}
	.event_list__item.p2{-webkit-transform: translate3d(0px,0,0) scale(0.81); transform: translate3d(0px,0,0) scale(0.81);}
	.event_list__item.p3{-webkit-transform: translate3d(224px,0,0) scale(1); transform: translate3d(224px,0,0) scale(1);}
	.event_list__item.p4{-webkit-transform: translate3d(449px,0,0) scale(0.81); transform: translate3d(449px,0,0) scale(0.81);}
	.event_list__item.p5{-webkit-transform: translate3d(672px,0,0) scale(0.81); transform: translate3d(672px,0,0) scale(0.81);}
	.event_list__item.p6{-webkit-transform: translate3d(896px,0,0) scale(0.81); transform: translate3d(896px,0,0) scale(0.81);}
	@media screen and (min-width: 0\0){.event_list__item{top:29px; width: 606px; height: 242px} .event_list__item.p3{top: 0; width: 751px; height: 300px}}
	.event_list__pic{width: 100%}
	.mod_index--event .slide_action__btn{margin-top: -25px}
	.mod_index--top{background: #121212 url(${basePath}/resources/imgs/music/bg_index_top2.jpg?max_age=2592000&v=531e103c145f5e41727f787b628a1b3b) 50% 0 no-repeat}
	.mod_index--top .section_inner{height: 830px}
	.mod_index--top .index__more{top: 128px}
	.toplist__item{position: relative; float: left; z-index: 2; width: 25%; height: 567px; overflow: hidden}
	.toplist__item .mod_cover__icon_play{top: 184px; margin-top: 0; margin-bottom: 0}
	.toplist__line{position: absolute; left: 50%; top: 215px; margin-left: -31px; width: 62px; height: 2px; filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#4CFFFFFF', endColorstr='#4CFFFFFF'); background: rgba(255,255,255,.3)}
	.toplist__item:hover .toplist__line{display: none}
	.toplist__bg{position: absolute; top: 0; left: 0; width: 100%; height: 567px; background-image: url(${basePath}/resources/imgs/music/bg_index_top.jpg?max_age=2592000&v=2591d4829162dfda6b9112c771edda86)}
	.toplist__item--pop .toplist__bg{background-position: 0 0}
	.toplist__item--new .toplist__bg{background-position: -300px 0}
	.toplist__item--hot .toplist__bg{background-position: -600px 0}
	.toplist__item--high .toplist__bg{background-position: -900px 0}
	.toplist__item .toplist__bg{-webkit-transform: scale(1); -webkit-transition: -webkit-transform .75s; transform: scale(1); transition: transform .75s}
	.toplist__item:hover .toplist__bg{-webkit-transform: scale(1.06); -webkit-transition: -webkit-transform .75s cubic-bezier(0,1,.75,1); transform: scale(1.06); transition: transform .75s cubic-bezier(0,1,.75,1)}
	.toplist__hd{position: absolute; top: 80px; left: 50%; margin-left: -100px; width: 200px; height: 110px; text-align: center}
	.toplist__tit_top{display: block; background-image: url(${basePath}/resources/imgs/music/index_tit.png?max_age=2592000&v=ea6515ebb82f7609712c02805e2abe9c); background-image: -webkit-image-set(url(${basePath}/resources/imgs/music/index_tit.png) 1x,url(${basePath}/resources/imgs/music/index_tit@2x.png) 2x); margin-left: auto; margin-right: auto; width: 66px; height: 24px; background-position: 0 -300px; margin-bottom: 8px}
	.toplist__tit_high,.toplist__tit_hot,.toplist__tit_new,.toplist__tit_pop{height: 36px; line-height: 1; font-size: 36px; color: #fff; font-weight: 400}
	.toplist__songlist{position: absolute; top: 282px; left: 50%; margin-left: -90px; width: 180px; white-space: nowrap}
	.toplist__songlist,.toplist__songlist a{color: #fff; font-size: 16px}
	.toplist__song{position: relative; padding-left: 15px; margin-bottom: 10px}
	.toplist__number{position: absolute; top: 0; left: 0}
	.toplist__songname{overflow: hidden; text-overflow: ellipsis; margin-bottom: 2px}
	.toplist__artist{font-size: 13px; opacity: .5; filter: alpha(opacity=50); overflow: hidden; text-overflow: ellipsis}
	.toplist__artist a{font-size: 13px}
	.mod_index--hot{height: 758px}
	.mod_index--hot .slide_switch__bg{filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#4C151515', endColorstr='#4C151515'); background: rgba(21,21,21,.3)}
	.mod_index--hot .slide_switch__item--current .slide_switch__bg{filter: none; background-color: #151515}
	.mod_index--hot .playlist__item--even{background-color: #414141}
	@media (max-width: 1240px){.mod_index--hot{height:730px}}
	.mod_index--mv{background-color: #e6e6e6}
	.mod_index--mv .section_inner{height: 860px}
	.mod_index--mv .index_tab__item,.mod_index--mv .index_tab__item--current,.mod_index--mv .index_tab__item:hover{color: #353535}
	.mod_index--mv .index__more{top: 181px}
	.mv_list__item_box,.mv_list__list{margin-right: 0}
	.mv_list__item{height: 304px; padding-bottom: 0; text-align: center}
	.mv_list__cover{margin-bottom: 34px}
	.mv_list__singer,.mv_list__title{text-align: center; margin-left: 18px; margin-right: 18px}
	.mv_list__title{font-size: 16px}
	.mod_playlist li.playlist__item--current, .mod_playlist li.playlist__item--hover{filter: none; background-color: #31c27c;}

 </style>
 <body>
 	<!-- 顶部导航  start -->
	<%@include file="/WEB-INF/pages/fronts/common/header.jsp"%>
	<!-- 顶部导航  end -->
	
	<!-- 新碟首发 -->
    <div class="mod_index mod_index--new mod_slide_box" id="albumlist_box" >
        <div class="section_inner">
            <div class="index__hd">
                <h2 class="index__tit"><i class="index__tit_sprite"></i><i class="icon_txt">新碟首发</i></h2>
                <i class="index__line index__line--left"></i>
                <i class="index__line index__line--right"></i>
            </div>
	   		<a href="//y.qq.com/portal/album_lib.html#stat=y_new.index.album.more" class="index__more index__more--white js_album_more">全部<i class="icon_index_arrow"></i></a>
            <!-- 切换 -->
            <div class="mod_index_tab">
                <a href="//y.qq.com/portal/album_lib.html#stat=y_new.index.album.all" class="index_tab__item js_tab index_tab__item--current" data-type="all" data-stat="y_new.index.album.all">全部</a>
                <a href="//y.qq.com/portal/album_lib.html#stat=y_new.index.album.all&t2=0" class="index_tab__item js_tab" data-type="cn" data-stat="y_new.index.album.cn">华语</a>
                <a href="//y.qq.com/portal/album_lib.html#stat=y_new.index.album.all&t2=5" class="index_tab__item js_tab" data-type="eu" data-stat="y_new.index.album.eu">欧美</a>
                <a href="//y.qq.com/portal/album_lib.html#stat=y_new.index.album.all&t2=4" class="index_tab__item js_tab" data-type="k" data-stat="y_new.index.album.k">韩国</a>
                <a href="//y.qq.com/portal/album_lib.html#stat=y_new.index.album.all&t2=3" class="index_tab__item js_tab" data-type="j" data-stat="y_new.index.album.j">日本</a>
            </div>
            <div class="mod_playlist mod_slide">
                <!-- 偶数加 playlist__item--even -->
                <ul class="playlist__list slide__list" id="albumlist">
                    <li class="playlist__item slide__item " onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-albummid="002XubqH0VUrnn" data-albumid="1790516">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/album/002XubqH0VUrnn.html" class="js_album" data-albummid="002XubqH0VUrnn" data-albumid="1790516"><img src="//y.gtimg.cn/music/photo_new/T002R300x300M000002XubqH0VUrnn.jpg?max_age=2592000" alt="列王的纷争" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/album_300.png?max_age=31536000';this.onerror=null;" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play"></i></a></div>
                            <h4 class="playlist__title">
							    <span class="playlist__title_txt"><a href="//y.qq.com/portal/album/002XubqH0VUrnn.html" class="js_album" data-albummid="002XubqH0VUrnn" data-albumid="1790516">列王的纷争</a></span>
							    <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2" data-mid="002XubqH0VUrnn"><span class="icon_txt">更多</span></a>
						    </h4>
                            <div class="playlist__author">
                                <a href="//y.qq.com/portal/singer/001JDzPT3JdvqK.html" class="js_singer" data-singermid="265" title="王力宏">王力宏</a>
                            </div>
                        </div>
                    </li>
		    
                    <li class="playlist__item slide__item  playlist__item--even " onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-albummid="004DkC083DgIKP" data-albumid="1765248">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/album/004DkC083DgIKP.html" class="js_album" data-albummid="004DkC083DgIKP" data-albumid="1765248"><img src="//y.gtimg.cn/music/photo_new/T002R300x300M000004DkC083DgIKP.jpg?max_age=2592000" alt="不疗愈系" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/album_300.png?max_age=31536000';this.onerror=null;" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play"></i></a></div>
                            <h4 class="playlist__title">
							    <span class="playlist__title_txt"><a href="//y.qq.com/portal/album/004DkC083DgIKP.html" class="js_album" data-albummid="004DkC083DgIKP" data-albumid="1765248">不疗愈系</a></span>
							    <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2" data-mid="004DkC083DgIKP"><span class="icon_txt">更多</span></a>
						    </h4>
                            <div class="playlist__author">
                                <a href="//y.qq.com/portal/singer/002smPmo0GDy1h.html" class="js_singer" data-singermid="1016256" title="思卫">思卫</a>
                            </div>
                        </div>
                    </li>
		    
                    <li class="playlist__item slide__item " onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-albummid="003XLBHn2YvjzJ" data-albumid="1789838">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/album/003XLBHn2YvjzJ.html" class="js_album" data-albummid="003XLBHn2YvjzJ" data-albumid="1789838"><img src="//y.gtimg.cn/music/photo_new/T002R300x300M000003XLBHn2YvjzJ.jpg?max_age=2592000" alt="잠깐만요" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/album_300.png?max_age=31536000';this.onerror=null;" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play"></i></a></div>
                            <h4 class="playlist__title">
							    <span class="playlist__title_txt"><a href="//y.qq.com/portal/album/003XLBHn2YvjzJ.html" class="js_album" data-albummid="003XLBHn2YvjzJ" data-albumid="1789838">잠깐만요</a></span>
							    <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2" data-mid="003XLBHn2YvjzJ"><span class="icon_txt">更多</span></a>
						    </h4>
                            <div class="playlist__author">
                                <a href="//y.qq.com/portal/singer/000fu7bB1kwtOd.html" class="js_singer" data-singermid="171113" title="어쿠루브">어쿠루브</a>
                            </div>
                        </div>
                    </li>
		    
                    <li class="playlist__item slide__item  playlist__item--even " onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-albummid="001EVsq93OnXiY" data-albumid="1789949">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/album/001EVsq93OnXiY.html" class="js_album" data-albummid="001EVsq93OnXiY" data-albumid="1789949"><img src="//y.gtimg.cn/music/photo_new/T002R300x300M000001EVsq93OnXiY.jpg?max_age=2592000" alt="漫动作" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/album_300.png?max_age=31536000';this.onerror=null;" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play"></i></a></div>
                            <h4 class="playlist__title">
							    <span class="playlist__title_txt"><a href="//y.qq.com/portal/album/001EVsq93OnXiY.html" class="js_album" data-albummid="001EVsq93OnXiY" data-albumid="1789949">漫动作</a></span>
							    <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2" data-mid="001EVsq93OnXiY"><span class="icon_txt">更多</span></a>
						    </h4>
                            <div class="playlist__author">
                                <a href="//y.qq.com/portal/singer/000iM9BB2TXFqu.html" class="js_singer" data-singermid="4359" title="潘玮柏">潘玮柏</a>
                            </div>
                        </div>
                    </li>
		    
                    <li class="playlist__item slide__item " onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-albummid="0026qDRr2ZClks" data-albumid="1787468">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/album/0026qDRr2ZClks.html" class="js_album" data-albummid="0026qDRr2ZClks" data-albumid="1787468"><img src="//y.gtimg.cn/music/photo_new/T002R300x300M0000026qDRr2ZClks.jpg?max_age=2592000" alt="I Got You (Cheat Codes Remix)" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/album_300.png?max_age=31536000';this.onerror=null;" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play"></i></a></div>
                            <h4 class="playlist__title">
							    <span class="playlist__title_txt"><a href="//y.qq.com/portal/album/0026qDRr2ZClks.html" class="js_album" data-albummid="0026qDRr2ZClks" data-albumid="1787468">I Got You (Cheat Codes Remix)</a></span>
							    <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2" data-mid="0026qDRr2ZClks"><span class="icon_txt">更多</span></a>
						    </h4>
                            <div class="playlist__author">
                                <a href="//y.qq.com/portal/singer/0047Atwu2anPlX.html" class="js_singer" data-singermid="164350" title="Bebe Rexha">Bebe Rexha</a>
                            </div>
                        </div>
                    </li>
		    
                    <li class="playlist__item slide__item  playlist__item--even " onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-albummid="0049unbF35ZUqw" data-albumid="1790019">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/album/0049unbF35ZUqw.html" class="js_album" data-albummid="0049unbF35ZUqw" data-albumid="1790019"><img src="//y.gtimg.cn/music/photo_new/T002R300x300M0000049unbF35ZUqw.jpg?max_age=2592000" alt="싱데렐라 스페셜 헌정송 6탄" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/album_300.png?max_age=31536000';this.onerror=null;" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play"></i></a></div>
                            <h4 class="playlist__title">
							    <span class="playlist__title_txt"><a href="//y.qq.com/portal/album/0049unbF35ZUqw.html" class="js_album" data-albummid="0049unbF35ZUqw" data-albumid="1790019">싱데렐라 스페셜 헌정송 6탄</a></span>
							    <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2" data-mid="0049unbF35ZUqw"><span class="icon_txt">更多</span></a>
						    </h4>
                            <div class="playlist__author">
                                <a href="//y.qq.com/portal/singer/000fpXpT0iC5ze.html" class="js_singer" data-singermid="32247" title="변진섭">변진섭</a>
                            </div>
                        </div>
                    </li>
		    
                    <li class="playlist__item slide__item " onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-albummid="001OQeBY0DrWj0" data-albumid="1789208">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/album/001OQeBY0DrWj0.html" class="js_album" data-albummid="001OQeBY0DrWj0" data-albumid="1789208"><img src="//y.gtimg.cn/music/photo_new/T002R300x300M000001OQeBY0DrWj0.jpg?max_age=2592000" alt="Setting Fires (Remixes)" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/album_300.png?max_age=31536000';this.onerror=null;" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play"></i></a></div>
                            <h4 class="playlist__title">
							    <span class="playlist__title_txt"><a href="//y.qq.com/portal/album/001OQeBY0DrWj0.html" class="js_album" data-albummid="001OQeBY0DrWj0" data-albumid="1789208">Setting Fires (Remixes)</a></span>
							    <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2" data-mid="001OQeBY0DrWj0"><span class="icon_txt">更多</span></a>
						    </h4>
                            <div class="playlist__author">
                                <a href="//y.qq.com/portal/singer/004ABIFV1EZUAj.html" class="js_singer" data-singermid="156095" title="The Chainsmokers">The Chainsmokers</a>
                            </div>
                        </div>
                    </li>
		    
                    <li class="playlist__item slide__item  playlist__item--even " onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-albummid="002QkIRp4RMTx4" data-albumid="1790202">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/album/002QkIRp4RMTx4.html" class="js_album" data-albummid="002QkIRp4RMTx4" data-albumid="1790202"><img src="//y.gtimg.cn/music/photo_new/T002R300x300M000002QkIRp4RMTx4.jpg?max_age=2592000" alt="梦想的声音 第8期" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/album_300.png?max_age=31536000';this.onerror=null;" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play"></i></a></div>
                            <h4 class="playlist__title">
							    <span class="playlist__title_txt"><a href="//y.qq.com/portal/album/002QkIRp4RMTx4.html" class="js_album" data-albummid="002QkIRp4RMTx4" data-albumid="1790202">梦想的声音 第8期</a></span>
							    <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2" data-mid="002QkIRp4RMTx4"><span class="icon_txt">更多</span></a>
						    </h4>
                            <div class="playlist__author">
                                <a href="//y.qq.com/portal/singer/004fNRkn1IyQ6d.html" class="js_singer" data-singermid="1259721" title="梦想的声音">梦想的声音</a>
                            </div>
                        </div>
                    </li>
		    
                    <li class="playlist__item slide__item " onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-albummid="003OVpA34ZagGJ" data-albumid="1789225">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/album/003OVpA34ZagGJ.html" class="js_album" data-albummid="003OVpA34ZagGJ" data-albumid="1789225"><img src="//y.gtimg.cn/music/photo_new/T002R300x300M000003OVpA34ZagGJ.jpg?max_age=2592000" alt="The Greatest (KDA Remix)" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/album_300.png?max_age=31536000';this.onerror=null;" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play"></i></a></div>
                            <h4 class="playlist__title">
							    <span class="playlist__title_txt"><a href="//y.qq.com/portal/album/003OVpA34ZagGJ.html" class="js_album" data-albummid="003OVpA34ZagGJ" data-albumid="1789225">The Greatest (KDA Remix)</a></span>
							    <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2" data-mid="003OVpA34ZagGJ"><span class="icon_txt">更多</span></a>
						    </h4>
                            <div class="playlist__author">
                                <a href="//y.qq.com/portal/singer/004ItgA32BhfdC.html" class="js_singer" data-singermid="7015" title="Sia">Sia</a>
                            </div>
                        </div>
                    </li>
		    
                    <li class="playlist__item slide__item  playlist__item--even " onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-albummid="002tt0FC1whLIK" data-albumid="1789240">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/album/002tt0FC1whLIK.html" class="js_album" data-albummid="002tt0FC1whLIK" data-albumid="1789240"><img src="//y.gtimg.cn/music/photo_new/T002R300x300M000002tt0FC1whLIK.jpg?max_age=2592000" alt="Years & Years (Remixes)" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/album_300.png?max_age=31536000';this.onerror=null;" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play"></i></a></div>
                            <h4 class="playlist__title">
							    <span class="playlist__title_txt"><a href="//y.qq.com/portal/album/002tt0FC1whLIK.html" class="js_album" data-albummid="002tt0FC1whLIK" data-albumid="1789240">Years & Years (Remixes)</a></span>
							    <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2" data-mid="002tt0FC1whLIK"><span class="icon_txt">更多</span></a>
						    </h4>
                            <div class="playlist__author">
                                <a href="//y.qq.com/portal/singer/001RRlcX2n2NLs.html" class="js_singer" data-singermid="22785" title="Olly Murs">Olly Murs</a>
                            </div>
                        </div>
                    </li>
		    
                    <li class="playlist__item slide__item " onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-albummid="004ThVyx1jFH5e" data-albumid="1726308">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/album/004ThVyx1jFH5e.html" class="js_album" data-albummid="004ThVyx1jFH5e" data-albumid="1726308"><img src="//y.gtimg.cn/music/photo_new/T002R300x300M000004ThVyx1jFH5e.jpg?max_age=2592000" alt="My Acoustic" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/album_300.png?max_age=31536000';this.onerror=null;" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play"></i></a></div>
                            <h4 class="playlist__title">
							    <span class="playlist__title_txt"><a href="//y.qq.com/portal/album/004ThVyx1jFH5e.html" class="js_album" data-albummid="004ThVyx1jFH5e" data-albumid="1726308">My Acoustic</a></span>
							    <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2" data-mid="004ThVyx1jFH5e"><span class="icon_txt">更多</span></a>
						    </h4>
                            <div class="playlist__author">
                                <a href="//y.qq.com/portal/singer/000Hyj9P4IqYYk.html" class="js_singer" data-singermid="171188" title="MACO">MACO</a>
                            </div>
                        </div>
                    </li>
		    
                    <li class="playlist__item slide__item  playlist__item--even " onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-albummid="004ZkT7K2odtvD" data-albumid="1789836">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/album/004ZkT7K2odtvD.html" class="js_album" data-albummid="004ZkT7K2odtvD" data-albumid="1789836"><img src="//y.gtimg.cn/music/photo_new/T002R300x300M000004ZkT7K2odtvD.jpg?max_age=2592000" alt="겨울이야기 Part 2" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/album_300.png?max_age=31536000';this.onerror=null;" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play"></i></a></div>
                            <h4 class="playlist__title">
							    <span class="playlist__title_txt"><a href="//y.qq.com/portal/album/004ZkT7K2odtvD.html" class="js_album" data-albummid="004ZkT7K2odtvD" data-albumid="1789836">겨울이야기 Part 2</a></span>
							    <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2" data-mid="004ZkT7K2odtvD"><span class="icon_txt">更多</span></a>
						    </h4>
                            <div class="playlist__author">
                                <a href="//y.qq.com/portal/singer/0044oQuD4LtuAM.html" class="js_singer" data-singermid="17677" title="조관우">조관우</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="mod_slide_switch js_switch" data-stat="y_new.index.album.pager">
            	<a href="javascript:;" tabindex="-1" class="js_jump slide_switch__item slide_switch__item--current" data-stat="y_new.index.album.pager" data-p="0">
            		<i class="slide_switch__bg"></i><i class="icon_txt">1</i>
            	</a>
            	<a href="javascript:;" tabindex="-1" class="js_jump slide_switch__item" data-stat="y_new.index.album.pager" data-p="1">
            		<i class="slide_switch__bg"></i><i class="icon_txt">2</i>
            	</a>
            	<a href="javascript:;" tabindex="-1" class="js_jump slide_switch__item" data-stat="y_new.index.album.pager" data-p="2">
            		<i class="slide_switch__bg"></i><i class="icon_txt">3</i>
            	</a>
            </div>
        </div>
        <div class="mod_slide_action">
            <div class="slide_action slide_action--left">
                <a href="javascript:;" class="slide_action__btn slide_action__btn--left js_jump" data-p="prev" data-stat="y_new.index.album.pager" tabindex="-1"><i class="icon_txt">上一页</i><i class="slide_action__arrow slide_action__arrow--left"></i></a>
            </div>
            <div class="slide_action slide_action--right">
                <a href="javascript:;" class="slide_action__btn slide_action__btn--right js_jump" data-p="next" data-stat="y_new.index.album.pager" tabindex="-1"><i class="icon_txt">下一页</i><i class="slide_action__arrow slide_action__arrow--right"></i></a>
            </div>
        </div>
    </div>
    <!-- 精彩推荐 -->
    <div class="mod_index mod_index--event mod_slide_box" id="focus">	
    	<div class="section_inner">
            <div class="index__hd">
                <h2 class="index__tit">
	                <i class="index__tit_sprite"></i>
	                <i class="icon_txt">精彩推荐</i>
                </h2>
                <i class="index__line index__line--left"></i>
                <i class="index__line index__line--right"></i>
            </div>
		    <div class="mod_event mod_slide mod_focus--animate">
	                <ul class="event_list slide__list">
	                    <li class="event_list__item slide__item js_focus_pic p4" data-idx="3">
	                        <a href="javascript:;" class="event_list__link js_focus_jump" data-type="10002" data-stat="y_new.index.focus.click" data-id="0015sPBZ1FF4y9">
	                            <img src="https://y.gtimg.cn/music/common/upload/t_focus_info_iphone/61197.jpg" class="event_list__pic" alt="YQQ围炉音乐会第一期">
	                        </a>
	                    </li>
			
	                    <li class="event_list__item slide__item js_focus_pic p3" data-idx="2">
	                        <a href="javascript:;" class="event_list__link js_focus_jump" data-type="3002" data-stat="y_new.index.focus.click" data-id="http://share.y.qq.com/l?g=2804&amp;id=1727079&amp;g_f=yqqjiaodian">
	                            <img src="https://y.gtimg.cn/music/common/upload/t_focus_info_iphone/61530.jpg" class="event_list__pic" alt="YQQ-鬼神OST">
	                        </a>
	                    </li>
			
	                    <li class="event_list__item slide__item js_focus_pic p2" data-idx="1">
	                        <a href="javascript:;" class="event_list__link js_focus_jump" data-type="10002" data-stat="y_new.index.focus.click" data-id="002XubqH0VUrnn">
	                            <img src="https://y.gtimg.cn/music/common/upload/t_focus_info_iphone/61533.jpg" class="event_list__pic" alt="王力宏PC、YQQ">
	                        </a>
	                    </li>
			
	                    <li class="event_list__item slide__item js_focus_pic p1" data-idx="0">
	                        <a href="javascript:;" class="event_list__link js_focus_jump" data-type="10002" data-stat="y_new.index.focus.click" data-id="002QkIRp4RMTx4">
	                            <img src="https://y.gtimg.cn/music/common/upload/t_focus_info_iphone/61447.jpg" class="event_list__pic" alt="YQQ 梦想的声音">
	                        </a>
	                    </li>
			
	                    <li class="event_list__item slide__item js_focus_pic p6" data-idx="5">
	                        <a href="javascript:;" class="event_list__link js_focus_jump" data-type="3002" data-stat="y_new.index.focus.click" data-id="http://y.qq.com/vip/xfhh/index.html">
	                            <img src="https://y.gtimg.cn/music/common/upload/t_focus_info_iphone/55478.jpg" class="event_list__pic" alt="PC豪华续费">
	                        </a>
	                    </li>
			
	                    <li class="event_list__item slide__item js_focus_pic p5" data-idx="4">
	                        <a href="javascript:;" class="event_list__link js_focus_jump" data-type="3002" data-stat="y_new.index.focus.click" data-id="http://y.qq.com/portal/mv/c/gs0n5e0mynsmd82.html">
	                            <img src="https://y.gtimg.cn/music/common/upload/mv_t_mv_focus/61434.jpg" class="event_list__pic" alt="平安夜 打包一份甜蜜送你">
	                        </a>
	                    </li>
			
	               </ul>
	            </div>
	            <div class="mod_slide_switch js_focus_index">
			
	                    <a href="javascript:;" tabindex="-1" data-index="0" class="slide_switch__item"><i class="slide_switch__bg"></i><i class="icon_txt">1</i></a>
			
	                    <a href="javascript:;" tabindex="-1" data-index="1" class="slide_switch__item"><i class="slide_switch__bg"></i><i class="icon_txt">2</i></a>
			
	                    <a href="javascript:;" tabindex="-1" data-index="2" class="slide_switch__item slide_switch__item--current"><i class="slide_switch__bg"></i><i class="icon_txt">3</i></a>
			
	                    <a href="javascript:;" tabindex="-1" data-index="3" class="slide_switch__item"><i class="slide_switch__bg"></i><i class="icon_txt">4</i></a>
			
	                    <a href="javascript:;" tabindex="-1" data-index="4" class="slide_switch__item"><i class="slide_switch__bg"></i><i class="icon_txt">5</i></a>
			
	                    <a href="javascript:;" tabindex="-1" data-index="5" class="slide_switch__item"><i class="slide_switch__bg"></i><i class="icon_txt">6</i></a>
			
	            </div>
        </div>
        <div class="mod_slide_action">
            <div class="slide_action slide_action--left">
                <a href="javascript:;" class="slide_action__btn slide_action__btn--left" tabindex="-1"><i class="icon_txt">上一页</i><i class="slide_action__arrow slide_action__arrow--left"></i></a>
            </div>
            <div class="slide_action slide_action--right">
                <a href="javascript:;" class="slide_action__btn slide_action__btn--right" tabindex="-1"><i class="icon_txt">下一页</i><i class="slide_action__arrow slide_action__arrow--right"></i></a>
            </div>
        </div>
    </div>
    <!-- 排行榜 -->
    <div id="toplist_box">
	    <div class="mod_index mod_index--top mod_slide_box">
	        <div class="section_inner">
	            <div class="index__hd">
	                <h2 class="index__tit"><i class="index__tit_sprite"></i><i class="icon_txt">排行榜</i></h2>
	                <i class="index__line index__line--left"></i>
	                <i class="index__line index__line--right"></i>
	            </div>
		   		<a href="//y.qq.com/portal/toplist/4.html#stat=y_new.index.toplist.more" class="index__more index__more--white">全部<i class="icon_index_arrow"></i></a>
	            <div class="mod_toplist">
	                <ul class="toplist__list">
	                    <li class="toplist__item toplist__item--pop mod_cover">
	                        <div class="toplist__bg"></div>
	                        <i class="mod_cover__mask"></i>
	                        <i class="mod_cover__icon_play js_play_toplist" data-stat="y_new.index.toplist.play1" data-id="4" data-type="0" data-date="2016-12-23"></i>
	                        <i class="toplist__line"></i>
	                        <h3 class="toplist__hd"><a href="//y.qq.com/portal/toplist/4.html?stat=y_new.index.toplist.detail1" data-id="4" class="toplist__tit js_toplist" data-stat="y_new.index.toplist.detail1"><i class="toplist__tit_top"><i class="icon_txt">巅峰榜</i></i><div class="toplist__tit_pop">流行指数</div></a></h3>
	                        <ul class="toplist__songlist">
	                            <li class="toplist__song">
	                                <div class="toplist__number">1</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/110051238_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="110051238" data-stat="y_new.index.toplist.songname">乖乖</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/6370_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="6370" data-stat="y_new.index.toplist.singername">谭晶/吴亦凡</a>
	                                </div>
	                            </li>
	                            <li class="toplist__song">
	                                <div class="toplist__number">2</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/110107021_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="110107021" data-stat="y_new.index.toplist.songname">Routine</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/944940_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="944940" data-stat="y_new.index.toplist.singername">Alan Walker</a>
	                                </div>
	                            </li>
	                            <li class="toplist__song">
	                                <div class="toplist__number">3</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/110065831_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="110065831" data-stat="y_new.index.toplist.songname">今年勇</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/7221_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="7221" data-stat="y_new.index.toplist.singername">许嵩</a>
	                                </div>
	                            </li>
	                            <li class="toplist__song">
	                                <div class="toplist__number">4</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/200016286_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="200016286" data-stat="y_new.index.toplist.songname">我们曾相爱</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/11626_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="11626" data-stat="y_new.index.toplist.singername">郭静</a>
	                                </div>
	                            </li>
	                        </ul>
	                    </li>
	                    <li class="toplist__item toplist__item--new mod_cover">
	                        <div class="toplist__bg"></div>
	                        <i class="mod_cover__mask"></i>
	                        <i class="mod_cover__icon_play js_play_toplist" data-stat="y_new.index.toplist.play2" data-id="26" data-type="0" data-date="2016_51"></i>
	                        <i class="toplist__line"></i>
	                        <h3 class="toplist__hd"><a href="//y.qq.com/portal/toplist/26.html?stat=y_new.index.toplist.detail2" data-id="26" class="toplist__tit js_toplist" data-stat="y_new.index.toplist.detail2"><i class="toplist__tit_top"><i class="icon_txt">巅峰榜</i></i><div class="toplist__tit_pop">热歌</div></a></h3>
	                        <ul class="toplist__songlist">
	                            <li class="toplist__song">
	                                <div class="toplist__number">1</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/102636799_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="102636799" data-stat="y_new.index.toplist.songname">演员</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/5062_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="5062" data-stat="y_new.index.toplist.singername">薛之谦</a>
	                                </div>
	                            </li>
	                            <li class="toplist__song">
	                                <div class="toplist__number">2</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/5106429_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="5106429" data-stat="y_new.index.toplist.songname">丑八怪</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/5062_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="5062" data-stat="y_new.index.toplist.singername">薛之谦</a>
	                                </div>
	                            </li>
	                            <li class="toplist__song">
	                                <div class="toplist__number">3</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/107192078_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="107192078" data-stat="y_new.index.toplist.songname">告白气球</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/4558_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="4558" data-stat="y_new.index.toplist.singername">周杰伦</a>
	                                </div>
	                            </li>
	                            <li class="toplist__song">
	                                <div class="toplist__number">4</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/105030812_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="105030812" data-stat="y_new.index.toplist.songname">Faded</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/944940_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="944940" data-stat="y_new.index.toplist.singername">Alan Walker/Iselin Solheim</a>
	                                </div>
	                            </li>
	                        </ul>
	                    </li>
	                    <li class="toplist__item toplist__item--hot mod_cover">
	                        <div class="toplist__bg"></div>
	                        <i class="mod_cover__mask"></i>
	                        <i class="mod_cover__icon_play js_play_toplist" data-stat="y_new.index.toplist.play3" data-id="27" data-type="0" data-date="2016-12-23"></i>
	                        <i class="toplist__line"></i>
	                        <h3 class="toplist__hd"><a href="//y.qq.com/portal/toplist/27.html?stat=y_new.index.toplist.detail3" data-id="27" class="toplist__tit js_toplist" data-stat="y_new.index.toplist.detail3"><i class="toplist__tit_top"><i class="icon_txt">巅峰榜</i></i><div class="toplist__tit_pop">新歌</div></a></h3>
	                        <ul class="toplist__songlist">
	                            <li class="toplist__song">
	                                <div class="toplist__number">1</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/110051238_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="110051238" data-stat="y_new.index.toplist.songname">乖乖</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/6370_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="6370" data-stat="y_new.index.toplist.singername">谭晶/吴亦凡</a>
	                                </div>
	                            </li>
	                            <li class="toplist__song">
	                                <div class="toplist__number">2</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/110107021_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="110107021" data-stat="y_new.index.toplist.songname">Routine</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/944940_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="944940" data-stat="y_new.index.toplist.singername">Alan Walker</a>
	                                </div>
	                            </li>
	                            <li class="toplist__song">
	                                <div class="toplist__number">3</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/110065831_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="110065831" data-stat="y_new.index.toplist.songname">今年勇</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/7221_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="7221" data-stat="y_new.index.toplist.singername">许嵩</a>
	                                </div>
	                            </li>
	                            <li class="toplist__song">
	                                <div class="toplist__number">4</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/200016286_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="200016286" data-stat="y_new.index.toplist.songname">我们曾相爱</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/11626_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="11626" data-stat="y_new.index.toplist.singername">郭静</a>
	                                </div>
	                            </li>
	                        </ul>
	                    </li>
	                    <li class="toplist__item toplist__item--high mod_cover">
	                        <div class="toplist__bg"></div>
	                        <i class="mod_cover__mask"></i>
	                        <i class="mod_cover__icon_play js_play_toplist" data-stat="y_new.index.toplist.play4" data-id="3" data-type="0" data-date="2016_51"></i>
	                        <i class="toplist__line"></i>
	                        <h3 class="toplist__hd"><a href="//y.qq.com/portal/toplist/3.html?stat=y_new.index.toplist.detail4" data-id="3" class="toplist__tit js_toplist" data-stat="y_new.index.toplist.detail4"><i class="toplist__tit_top"><i class="icon_txt">巅峰榜</i></i><div class="toplist__tit_pop">欧美</div></a></h3>
	                        <ul class="toplist__songlist">
	                            <li class="toplist__song">
	                                <div class="toplist__number">1</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/109364695_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="109364695" data-stat="y_new.index.toplist.songname">Alone</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/944940_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="944940" data-stat="y_new.index.toplist.singername">Alan Walker</a>
	                                </div>
	                            </li>
	                            <li class="toplist__song">
	                                <div class="toplist__number">2</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/108836628_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="108836628" data-stat="y_new.index.toplist.songname">Don't Wanna Know</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/4983_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="4983" data-stat="y_new.index.toplist.singername">Maroon 5/Kendrick Lamar</a>
	                                </div>
	                            </li>
	                            <li class="toplist__song">
	                                <div class="toplist__number">3</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/108962283_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="108962283" data-stat="y_new.index.toplist.songname">Just Your Fool</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/612_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="612" data-stat="y_new.index.toplist.singername">The Rolling Stones</a>
	                                </div>
	                            </li>
	                            <li class="toplist__song">
	                                <div class="toplist__number">4</div>
	                                <div class="toplist__songname">
	                                    <a href="//y.qq.com/portal/song/108654017_num.html#stat=y_new.index.toplist.songname" class="js_song" data-id="108654017" data-stat="y_new.index.toplist.songname">Starboy</a>
	                                </div>
	                                <div class="toplist__artist">
	                                    <a href="https://y.qq.com/portal/singer/32617_num.html#stat=y_new.index.toplist.singername" class="js_singer" data-singerid="32617" data-stat="y_new.index.toplist.singername">The Weeknd/Daft Punk</a>
	                                </div>
	                            </li>
	                        </ul>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </div>
    </div>
    <!-- 热门歌单 -->
    <div id="taogelist_box"> 
	    <div class="mod_index mod_index--hot mod_slide_box">
	        <div class="section_inner">
	            <div class="index__hd">
	                <h2 class="index__tit"><i class="index__tit_sprite"></i><i class="icon_txt">热门歌单</i></h2>
	                <i class="index__line index__line--left"></i>
	                <i class="index__line index__line--right"></i>
	            </div>
	            <div class="mod_playlist mod_slide">
	                <!-- 偶数加 playlist__item--even -->
	                <ul class="playlist__list slide__list" style="left: -1200px;">
	                    <li class="playlist__item  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="2644797087">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/2644797087.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="2644797087"><img src="https://p.qpic.cn/music_cover/5jvDX14RLylr9k5PnsA7jrfGHWSBTddPA99Oj4EaGkB50F7hdIuMTA/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="冷风中听这些歌，更温暖" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/2644797087.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="2644797087" title="冷风中听这些歌，更温暖">冷风中听这些歌，更温暖</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="2644797087"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：55.2万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  playlist__item--even  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="2941912820">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/2941912820.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="2941912820"><img src="https://p.qpic.cn/music_cover/FWF8KktkH7zLJFSic06n0YVcHTtZwasVrUfBfmicrkY8H2Ak9BPUtCkw/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="梦想的声音｜田馥甄挑战薛之谦金曲 " class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/2941912820.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="2941912820" title="梦想的声音｜田馥甄挑战薛之谦金曲 ">梦想的声音｜田馥甄挑战薛之谦金曲 </a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="2941912820"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：43.6万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="2040335284">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/2040335284.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="2040335284"><img src="https://p.qpic.cn/music_cover/ib3heA30VqtYFGKvbe832SHsBq9Uq6azaxb8fh1bLwyPad8Un7z0tIQ/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="圣诞老人来发糖果了" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/2040335284.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="2040335284" title="圣诞老人来发糖果了">圣诞老人来发糖果了</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="2040335284"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                               	 播放量：18.9万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  playlist__item--even  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="1742343136">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/1742343136.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="1742343136"><img src="https://p.qpic.cn/music_cover/TPTQPoBDp8OplC2TkaewjzD2iaxd5uulThWtNpExibWHyPkmLYoqQmNQ/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="欧美丨震撼内心的迷幻电音" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/1742343136.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="1742343136" title="欧美丨震撼内心的迷幻电音">欧美丨震撼内心的迷幻电音</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="1742343136"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                               	 播放量：31.9万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="2040460321">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/2040460321.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="2040460321"><img src="https://p.qpic.cn/music_cover/tHzMbKzYyUqgJIqHZCoy9eQSqDQM9iasknh9x2KwqPh8jhXxh5AhCrQ/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="看似好唱实则难度极高的KTV大魔王歌曲" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/2040460321.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="2040460321" title="看似好唱实则难度极高的KTV大魔王歌曲">看似好唱实则难度极高的KTV大魔王歌曲</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="2040460321"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：106.1万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  playlist__item--even  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="1140499444">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/1140499444.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="1140499444"><img src="https://p.qpic.cn/music_cover/ibKU7nvtiaIKKV07hcbURdFBGFaI2OeU9MJUx32mT4wcEBRx9HoHLHaA/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="2016滚石评选最佳50专辑，Beyoncé位居首位" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/1140499444.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="1140499444" title="2016滚石评选最佳50专辑，Beyoncé位居首位">2016滚石评选最佳50专辑，Beyoncé位居首位</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="1140499444"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：54.3万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="1445269203">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/1445269203.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="1445269203"><img src="https://p.qpic.cn/music_cover/RNSWCLv1Lkhicst0TibgNyogKCGiaIEiaGMzAocHFnJeNc2FMjs0PCyjXQ/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="韩语｜悲情男声，触目伤怀" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/1445269203.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="1445269203" title="韩语｜悲情男声，触目伤怀">韩语｜悲情男声，触目伤怀</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="1445269203"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：43.9万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  playlist__item--even  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="3543646615">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/3543646615.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="3543646615"><img src="https://p.qpic.cn/music_cover/Cz8Z9ECDQia3gE2YticLiaJ21RS57nYmvtwU3riadRNA8YgfC5WmibM3epQ/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="休闲时光 ：让我们周末一起看下雪" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/3543646615.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="3543646615" title="休闲时光 ：让我们周末一起看下雪">休闲时光 ：让我们周末一起看下雪</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="3543646615"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：12.1万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="1723063372">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/1723063372.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="1723063372"><img src="https://p.qpic.cn/music_cover/XMPAjfs5uwGZdWII3osvAvCRyNWx8Pqy5Yice41OCZlBhLtk0p0icNvg/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="浮光掠影：ACG纯音乐赏析合辑" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/1723063372.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="1723063372" title="浮光掠影：ACG纯音乐赏析合辑">浮光掠影：ACG纯音乐赏析合辑</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="1723063372"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：71.9万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  playlist__item--even  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="3482605622">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/3482605622.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="3482605622"><img src="https://y.gtimg.cn/music/photo_new/T005R600x600M000002CJKAY1LKpcz.jpg?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="trip-hop单曲大推荐" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/3482605622.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="3482605622" title="trip-hop单曲大推荐">trip-hop单曲大推荐</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="3482605622"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：32.2万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="2941956992">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/2941956992.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="2941956992"><img src="https://p.qpic.cn/music_cover/CUDibmpGhmsnIXEaL7YDnhfetKbCg1licsZ01dD2Gcb847tXibcScyKzA/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="〔晚安〕那些年电影里的钢琴曲" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/2941956992.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="2941956992" title="〔晚安〕那些年电影里的钢琴曲">〔晚安〕那些年电影里的钢琴曲</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="2941956992"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：27.7万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  playlist__item--even  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="2643718569">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/2643718569.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="2643718569"><img src="https://p.qpic.cn/music_cover/xf3GNcjpdDrRDj16e7fZicicDvQiczrF3mLrq6AynJ018PsqbqJ9phDuw/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="二货必备！妈妈，我的手机铃声有毒！！！" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/2643718569.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="2643718569" title="二货必备！妈妈，我的手机铃声有毒！！！">二货必备！妈妈，我的手机铃声有毒！！！</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="2643718569"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：41.1万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="2644797087">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/2644797087.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="2644797087"><img src="https://p.qpic.cn/music_cover/5jvDX14RLylr9k5PnsA7jrfGHWSBTddPA99Oj4EaGkB50F7hdIuMTA/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="冷风中听这些歌，更温暖" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/2644797087.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="2644797087" title="冷风中听这些歌，更温暖">冷风中听这些歌，更温暖</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="2644797087"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：55.2万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  playlist__item--even  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="2941912820">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/2941912820.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="2941912820"><img src="https://p.qpic.cn/music_cover/FWF8KktkH7zLJFSic06n0YVcHTtZwasVrUfBfmicrkY8H2Ak9BPUtCkw/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="梦想的声音｜田馥甄挑战薛之谦金曲 " class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/2941912820.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="2941912820" title="梦想的声音｜田馥甄挑战薛之谦金曲 ">梦想的声音｜田馥甄挑战薛之谦金曲 </a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="2941912820"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：43.6万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="2040335284">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/2040335284.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="2040335284"><img src="https://p.qpic.cn/music_cover/ib3heA30VqtYFGKvbe832SHsBq9Uq6azaxb8fh1bLwyPad8Un7z0tIQ/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="圣诞老人来发糖果了" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/2040335284.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="2040335284" title="圣诞老人来发糖果了">圣诞老人来发糖果了</a></span>
	                           		<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="2040335284"><span class="icon_txt">更多</span></a>
				   	 			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：18.9万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  playlist__item--even  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="1742343136">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/1742343136.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="1742343136"><img src="https://p.qpic.cn/music_cover/TPTQPoBDp8OplC2TkaewjzD2iaxd5uulThWtNpExibWHyPkmLYoqQmNQ/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="欧美丨震撼内心的迷幻电音" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/1742343136.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="1742343136" title="欧美丨震撼内心的迷幻电音">欧美丨震撼内心的迷幻电音</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="1742343136"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                               	 播放量：31.9万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="2040460321">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/2040460321.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="2040460321"><img src="https://p.qpic.cn/music_cover/tHzMbKzYyUqgJIqHZCoy9eQSqDQM9iasknh9x2KwqPh8jhXxh5AhCrQ/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="看似好唱实则难度极高的KTV大魔王歌曲" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/2040460321.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="2040460321" title="看似好唱实则难度极高的KTV大魔王歌曲">看似好唱实则难度极高的KTV大魔王歌曲</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="2040460321"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                                	播放量：106.1万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  playlist__item--even  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="1140499444">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/1140499444.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="1140499444"><img src="https://p.qpic.cn/music_cover/ibKU7nvtiaIKKV07hcbURdFBGFaI2OeU9MJUx32mT4wcEBRx9HoHLHaA/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="2016滚石评选最佳50专辑，Beyoncé位居首位" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/1140499444.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="1140499444" title="2016滚石评选最佳50专辑，Beyoncé位居首位">2016滚石评选最佳50专辑，Beyoncé位居首位</a></span>
	                            	<a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="1140499444"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                               	 播放量：54.3万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="1445269203">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/1445269203.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="1445269203"><img src="https://p.qpic.cn/music_cover/RNSWCLv1Lkhicst0TibgNyogKCGiaIEiaGMzAocHFnJeNc2FMjs0PCyjXQ/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="韩语｜悲情男声，触目伤怀" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/1445269203.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="1445269203" title="韩语｜悲情男声，触目伤怀">韩语｜悲情男声，触目伤怀</a></span>
	                           	 <a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="1445269203"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
	                               	 播放量：43.9万
	                            </div>
	                        </div>
	                    </li>
				   
	                    <li class="playlist__item  playlist__item--even  slide__item" onmouseover="this.className=(this.className+' playlist__item--hover')" onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')" data-disstid="3543646615">
	                        <div class="playlist__item_box">
	                            <div class="playlist__cover mod_cover"><a href="//y.qq.com/portal/playlist/3543646615.html#stat=y_new.index.playlist.pic" class="js_playlist" data-stat="y_new.index.playlist.pic" data-disstid="3543646615"><img src="https://p.qpic.cn/music_cover/Cz8Z9ECDQia3gE2YticLiaJ21RS57nYmvtwU3riadRNA8YgfC5WmibM3epQ/300?n=1" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/playlist_300.png?max_age=31536000';this.onerror=null;" alt="休闲时光 ：让我们周末一起看下雪" class="playlist__pic"><i class="mod_cover__mask"></i><i class="mod_cover__icon_play js_play" data-stat="y_new.index.playlist.play_btn"></i></a></div>
	                            <h4 class="playlist__title"><span class="playlist__title_txt"><a href="//y.qq.com/portal/playlist/3543646615.html#stat=y_new.index.playlist.name" class="js_playlist" data-stat="y_new.index.playlist.name" data-disstid="3543646615" title="休闲时光 ：让我们周末一起看下雪">休闲时光 ：让我们周末一起看下雪</a></span>
	                           	 <a href="javascript:;" class="btn_operate_menu js_playlist_more" data-stat="y_new.index.playlist.more" data-type="3" data-mid="3543646615"><span class="icon_txt">更多</span></a>
				    			</h4>
	                            
	                            <div class="playlist__other">
                               		 播放量：12.1万
	                            </div>
	                        </div>
	                    </li>
				
	                </ul>
	            </div>
	            <div class="mod_slide_switch js_switch" data-stat="y_new.index.playlist.pager"><a href="javascript:;" tabindex="-1" class="js_jump slide_switch__item slide_switch__item--current" data-stat="y_new.index.playlist.pager" data-p="0"><i class="slide_switch__bg"></i><i class="icon_txt">1</i></a><a href="javascript:;" tabindex="-1" class="js_jump slide_switch__item" data-stat="y_new.index.playlist.pager" data-p="1"><i class="slide_switch__bg"></i><i class="icon_txt">2</i></a><a href="javascript:;" tabindex="-1" class="js_jump slide_switch__item" data-stat="y_new.index.playlist.pager" data-p="2"><i class="slide_switch__bg"></i><i class="icon_txt">3</i></a></div>
	        </div>
	        <div class="mod_slide_action">
	            <div class="slide_action slide_action--left">
	                <a href="javascript:;" class="slide_action__btn slide_action__btn--left js_jump" data-p="prev" tabindex="-1" data-stat="y_new.index.playlist.pager"><i class="icon_txt">上一页</i><i class="slide_action__arrow slide_action__arrow--left"></i></a>
	            </div>
	            <div class="slide_action slide_action--right">
	                <a href="javascript:;" class="slide_action__btn slide_action__btn--right js_jump" data-p="next" tabindex="-1" data-stat="y_new.index.playlist.pager"><i class="icon_txt">下一页</i><i class="slide_action__arrow slide_action__arrow--right"></i></a>
	            </div>
	        </div>
	    </div>
    </div>
    <!-- 新碟首发 -->
    <div class="mod_index mod_index--mv mod_slide_box" id="mvlist">
        <div class="section_inner">
            <div class="index__hd">
                <h2 class="index__tit"><i class="index__tit_sprite"></i><i class="icon_txt">MV首播</i></h2>
                <i class="index__line index__line--left"></i>
                <i class="index__line index__line--right"></i>
            </div>
	    	<a href="//y.qq.com/portal/mv_lib.html#stat=y_new.index.mv.more" class="index__more js_mvlist_more">全部<i class="icon_index_arrow"></i></a>
            <!-- 切换 -->
            <div class="mod_index_tab">
	    
                <a href="//y.qq.com/portal/mv_lib.html" data-type="0" data-box="mv" class="js_tab index_tab__item index_tab__item--current" data-stat="y_new.index.mv.0">全部</a>
	    
                <a href="//y.qq.com/portal/mv_lib.html#t2=1" data-type="1" data-box="mv" class="js_tab index_tab__item" data-stat="y_new.index.mv.1">内地</a>
	    
                <a href="//y.qq.com/portal/mv_lib.html#t2=2" data-type="2" data-box="mv" class="js_tab index_tab__item" data-stat="y_new.index.mv.2">港台</a>
	    
                <a href="//y.qq.com/portal/mv_lib.html#t2=3" data-type="3" data-box="mv" class="js_tab index_tab__item" data-stat="y_new.index.mv.3">欧美</a>
	    
                <a href="//y.qq.com/portal/mv_lib.html#t2=4" data-type="4" data-box="mv" class="js_tab index_tab__item" data-stat="y_new.index.mv.4">韩国</a>
	    
                <a href="//y.qq.com/portal/mv_lib.html#t2=5" data-type="5" data-box="mv" class="js_tab index_tab__item" data-stat="y_new.index.mv.5">日本</a>
	    
            </div>
            <div class="mod_mv">
                <ul class="mv_list__list">
                     <li class="mv_list__item" data-vid="e0022yrd8t1" data-id="1066700">
                         <div class="mv_list__item_box" style="visibility: visible;">
                             <a href="//y.qq.com/portal/mv/v/e0022yrd8t1.html#stat=y_new.index.mv.play_btn" class="mv_list__cover mod_cover js_mv" data-stat="y_new.index.mv.play_btn" data-vid="e0022yrd8t1" data-id="1066700" hidefocus="true">
                                 <img class="mv_list__pic" src="//shp.qpic.cn/qqvideo_ori/0/e0022yrd8t1_360_204/0" data-original="//shp.qpic.cn/qqvideo_ori/0/e0022yrd8t1_360_204/0" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/mv_300.png?max_age=31536000';this.onerror=null;" alt="呐呐呐" style="display: block; visibility: visible;">
                                 <i class="mod_cover__mask"></i><i class="mod_cover__icon_play"></i>
                             </a>
                             <h3 class="mv_list__title"><a href="//y.qq.com/portal/mv/v/e0022yrd8t1.html#stat=y_new.index.mv.mvname" class="js_mv" data-stat="y_new.index.mv.mvname" data-vid="e0022yrd8t1" data-id="1066700" title="呐呐呐">呐呐呐</a></h3>
                             <p class="mv_list__singer">
 								<a href="https://y.qq.com/portal/singer/001P6FhW0CDEDW.html#stat=y_new.index.mv.singername" class="js_singer" data-singermid="001P6FhW0CDEDW" data-stat="y_new.index.mv.singername" data-singerid="11712" title="乔任梁">乔任梁</a>
							 	<!--div class="mv_list__info">2016-12-23</div-->
							 </p>
							 <div class="mv_list__info"><span class="mv_list__listen"><i class="mv_list__listen_icon sprite"></i>7.7万</span></div>
 							 <p></p>
                         </div>
                     </li>
                     <li class="mv_list__item" data-vid="e00227jdasp" data-id="1066608">
                         <div class="mv_list__item_box" style="visibility: visible;">
                             <a href="//y.qq.com/portal/mv/v/e00227jdasp.html#stat=y_new.index.mv.play_btn" class="mv_list__cover mod_cover js_mv" data-stat="y_new.index.mv.play_btn" data-vid="e00227jdasp" data-id="1066608" hidefocus="true">
                                 <img class="mv_list__pic" src="//shp.qpic.cn/qqvideo_ori/0/e00227jdasp_360_204/0" data-original="//shp.qpic.cn/qqvideo_ori/0/e00227jdasp_360_204/0" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/mv_300.png?max_age=31536000';this.onerror=null;" alt="我的猫" style="display: block; visibility: visible;">
                                 <i class="mod_cover__mask"></i><i class="mod_cover__icon_play"></i>
                             </a>
                             <h3 class="mv_list__title"><a href="//y.qq.com/portal/mv/v/e00227jdasp.html#stat=y_new.index.mv.mvname" class="js_mv" data-stat="y_new.index.mv.mvname" data-vid="e00227jdasp" data-id="1066608" title="我的猫">我的猫</a></h3>
                             <p class="mv_list__singer">
							 	<a href="https://y.qq.com/portal/singer/001bv9fL3w7HQj.html#stat=y_new.index.mv.singername" class="js_singer" data-singermid="001bv9fL3w7HQj" data-stat="y_new.index.mv.singername" data-singerid="65313" title="吉克隽逸">吉克隽逸</a>
							 	<!--div class="mv_list__info">2016-12-23</div-->
							 </p>
							 <div class="mv_list__info"><span class="mv_list__listen"><i class="mv_list__listen_icon sprite"></i>2.4万</span></div>
							 <p></p>
                         </div>
                     </li>
                     <li class="mv_list__item" data-vid="u00225z2kcu" data-id="1066482">
                          <div class="mv_list__item_box" style="visibility: visible;">
                              <a href="//y.qq.com/portal/mv/v/u00225z2kcu.html#stat=y_new.index.mv.play_btn" class="mv_list__cover mod_cover js_mv" data-stat="y_new.index.mv.play_btn" data-vid="u00225z2kcu" data-id="1066482" hidefocus="true">
                                  <img class="mv_list__pic" src="//shp.qpic.cn/qqvideo_ori/0/u00225z2kcu_360_204/0" data-original="//shp.qpic.cn/qqvideo_ori/0/u00225z2kcu_360_204/0" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/mv_300.png?max_age=31536000';this.onerror=null;" alt="若只如初见" style="display: block; visibility: visible;">
                                  <i class="mod_cover__mask"></i><i class="mod_cover__icon_play"></i>
                              </a>
                              <h3 class="mv_list__title"><a href="//y.qq.com/portal/mv/v/u00225z2kcu.html#stat=y_new.index.mv.mvname" class="js_mv" data-stat="y_new.index.mv.mvname" data-vid="u00225z2kcu" data-id="1066482" title="若只如初见">若只如初见</a></h3>
                              <p class="mv_list__singer">
								   	<a href="https://y.qq.com/portal/singer/003XbbyD06iu1p.html#stat=y_new.index.mv.singername" class="js_singer" data-singermid="003XbbyD06iu1p" data-stat="y_new.index.mv.singername" data-singerid="13537" title="杨紫">杨紫</a>
								    <!--div class="mv_list__info">2016-12-22</div-->
							   </p>
							   <div class="mv_list__info"><span class="mv_list__listen"><i class="mv_list__listen_icon sprite"></i>9.6万</span></div>
							   <p></p>
                          </div>
                      </li>
                      <li class="mv_list__item" data-vid="e00224htw2q" data-id="1066514">
                          <div class="mv_list__item_box" style="visibility: visible;">
                              <a href="//y.qq.com/portal/mv/v/e00224htw2q.html#stat=y_new.index.mv.play_btn" class="mv_list__cover mod_cover js_mv" data-stat="y_new.index.mv.play_btn" data-vid="e00224htw2q" data-id="1066514" hidefocus="true">
                                  <img class="mv_list__pic" src="//shp.qpic.cn/qqvideo_ori/0/e00224htw2q_360_204/0" data-original="//shp.qpic.cn/qqvideo_ori/0/e00224htw2q_360_204/0" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/mv_300.png?max_age=31536000';this.onerror=null;" alt="新年这一刻" style="display: block; visibility: visible;">
                                  <i class="mod_cover__mask"></i><i class="mod_cover__icon_play"></i>
                              </a>
                              <h3 class="mv_list__title"><a href="//y.qq.com/portal/mv/v/e00224htw2q.html#stat=y_new.index.mv.mvname" class="js_mv" data-stat="y_new.index.mv.mvname" data-vid="e00224htw2q" data-id="1066514" title="新年这一刻">新年这一刻</a></h3>
                              <p class="mv_list__singer">
								  <a href="https://y.qq.com/portal/singer/003BLxYj1Smxh4.html#stat=y_new.index.mv.singername" class="js_singer" data-singermid="003BLxYj1Smxh4" data-stat="y_new.index.mv.singername" data-singerid="92117" title="SNH48">SNH48</a>
								  <!--div class="mv_list__info">2016-12-23</div-->
							  </p>
							  <div class="mv_list__info"><span class="mv_list__listen"><i class="mv_list__listen_icon sprite"></i>9.1万</span></div>
							  <p></p>
                          </div>
                      </li>
                      <li class="mv_list__item" data-vid="x0022tabkxl" data-id="1066213">
                          <div class="mv_list__item_box" style="visibility: visible;">
                              <a href="//y.qq.com/portal/mv/v/x0022tabkxl.html#stat=y_new.index.mv.play_btn" class="mv_list__cover mod_cover js_mv" data-stat="y_new.index.mv.play_btn" data-vid="x0022tabkxl" data-id="1066213" hidefocus="true">
                                  <img class="mv_list__pic" src="//shp.qpic.cn/qqvideo_ori/0/x0022tabkxl_360_204/0" data-original="//shp.qpic.cn/qqvideo_ori/0/x0022tabkxl_360_204/0" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/mv_300.png?max_age=31536000';this.onerror=null;" alt="Winter Bird" style="display: block; visibility: visible;">
                                  <i class="mod_cover__mask"></i><i class="mod_cover__icon_play"></i>
                              </a>
                              <h3 class="mv_list__title"><a href="//y.qq.com/portal/mv/v/x0022tabkxl.html#stat=y_new.index.mv.mvname" class="js_mv" data-stat="y_new.index.mv.mvname" data-vid="x0022tabkxl" data-id="1066213" title="Winter Bird">Winter Bird</a></h3>
                              <p class="mv_list__singer">
								  <a href="https://y.qq.com/portal/singer/0024qwXw1WtNNR.html#stat=y_new.index.mv.singername" class="js_singer" data-singermid="0024qwXw1WtNNR" data-stat="y_new.index.mv.singername" data-singerid="120734" title="AURORA">AURORA</a>
								  <!--div class="mv_list__info">2016-12-20</div-->
							  </p>
							  <div class="mv_list__info"><span class="mv_list__listen"><i class="mv_list__listen_icon sprite"></i>2.6万</span></div>
							  <p></p>
                          </div>
                      </li>
                      <li class="mv_list__item" data-vid="s00229pgcdr" data-id="1066438">
                          <div class="mv_list__item_box" style="visibility: visible;">
                              <a href="//y.qq.com/portal/mv/v/s00229pgcdr.html#stat=y_new.index.mv.play_btn" class="mv_list__cover mod_cover js_mv" data-stat="y_new.index.mv.play_btn" data-vid="s00229pgcdr" data-id="1066438" hidefocus="true">
                                  <img class="mv_list__pic" src="//shp.qpic.cn/qqvideo_ori/0/s00229pgcdr_360_204/0" data-original="//shp.qpic.cn/qqvideo_ori/0/s00229pgcdr_360_204/0" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/mv_300.png?max_age=31536000';this.onerror=null;" alt="너와 함께라면 (So Beautiful)" style="display: block; visibility: visible;">
                                  <i class="mod_cover__mask"></i><i class="mod_cover__icon_play"></i>
                              </a>
                              <h3 class="mv_list__title"><a href="//y.qq.com/portal/mv/v/s00229pgcdr.html#stat=y_new.index.mv.mvname" class="js_mv" data-stat="y_new.index.mv.mvname" data-vid="s00229pgcdr" data-id="1066438" title="너와 함께라면 (So Beautiful)">너와 함께라면 (So Beautiful)</a></h3>
                              <p class="mv_list__singer">
								  <a href="https://y.qq.com/portal/singer/000aCvbR26FuPd.html#stat=y_new.index.mv.singername" class="js_singer" data-singermid="000aCvbR26FuPd" data-stat="y_new.index.mv.singername" data-singerid="1252566" title="에스에프나인">에스에프나인</a>
								  <!--div class="mv_list__info">2016-12-21</div-->
							  </p>
							  <div class="mv_list__info"><span class="mv_list__listen"><i class="mv_list__listen_icon sprite"></i>1.7万</span></div>
							  <p></p>
                          </div>
                      </li>
                      <li class="mv_list__item" data-vid="a0022y2gmbh" data-id="1066280">
                          <div class="mv_list__item_box" style="visibility: visible;">
                              <a href="//y.qq.com/portal/mv/v/a0022y2gmbh.html#stat=y_new.index.mv.play_btn" class="mv_list__cover mod_cover js_mv" data-stat="y_new.index.mv.play_btn" data-vid="a0022y2gmbh" data-id="1066280" hidefocus="true">
                                  <img class="mv_list__pic" src="//shp.qpic.cn/qqvideo_ori/0/a0022y2gmbh_360_204/0" data-original="//shp.qpic.cn/qqvideo_ori/0/a0022y2gmbh_360_204/0" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/mv_300.png?max_age=31536000';this.onerror=null;" alt="Extrication" style="display: block; visibility: visible;">
                                  <i class="mod_cover__mask"></i><i class="mod_cover__icon_play"></i>
                              </a>
                              <h3 class="mv_list__title"><a href="//y.qq.com/portal/mv/v/a0022y2gmbh.html#stat=y_new.index.mv.mvname" class="js_mv" data-stat="y_new.index.mv.mvname" data-vid="a0022y2gmbh" data-id="1066280" title="Extrication">Extrication</a></h3>
                              <p class="mv_list__singer">
								  <a href="https://y.qq.com/portal/singer/0002aTzY3fLqTM.html#stat=y_new.index.mv.singername" class="js_singer" data-singermid="0002aTzY3fLqTM" data-stat="y_new.index.mv.singername" data-singerid="964135" title="郭修彧">郭修彧</a>
								  <!--div class="mv_list__info">2016-12-21</div-->
							  </p>
							  <div class="mv_list__info"><span class="mv_list__listen"><i class="mv_list__listen_icon sprite"></i>8764</span></div>
							  <p></p>
                          </div>
                      </li>
                      <li class="mv_list__item" data-vid="z0022ghiirf" data-id="1066344">
                          <div class="mv_list__item_box" style="visibility: visible;">
                              <a href="//y.qq.com/portal/mv/v/z0022ghiirf.html#stat=y_new.index.mv.play_btn" class="mv_list__cover mod_cover js_mv" data-stat="y_new.index.mv.play_btn" data-vid="z0022ghiirf" data-id="1066344" hidefocus="true">
                                  <img class="mv_list__pic" src="//shp.qpic.cn/qqvideo_ori/0/z0022ghiirf_360_204/0" data-original="//shp.qpic.cn/qqvideo_ori/0/z0022ghiirf_360_204/0" onerror="this.src='//y.gtimg.cn/mediastyle/global/img/mv_300.png?max_age=31536000';this.onerror=null;" alt="一直" style="display: block; visibility: visible;">
                                  <i class="mod_cover__mask"></i><i class="mod_cover__icon_play"></i>
                              </a>
                              <h3 class="mv_list__title"><a href="//y.qq.com/portal/mv/v/z0022ghiirf.html#stat=y_new.index.mv.mvname" class="js_mv" data-stat="y_new.index.mv.mvname" data-vid="z0022ghiirf" data-id="1066344" title="一直">一直</a></h3>
                              <p class="mv_list__singer">
								  <a href="https://y.qq.com/portal/singer/0014jga02JkDgx.html#stat=y_new.index.mv.singername" class="js_singer" data-singermid="0014jga02JkDgx" data-stat="y_new.index.mv.singername" data-singerid="90553" title="吴映洁">吴映洁</a>
								  <!--div class="mv_list__info">2016-12-21</div-->
							  </p>
							  <div class="mv_list__info"><span class="mv_list__listen"><i class="mv_list__listen_icon sprite"></i>5178</span></div>
							  <p></p>
                          </div>
                      </li>
				</ul>
            </div>
        </div>
    </div>
	
	<!-- 底部导航  start -->
	<%@include file="/WEB-INF/pages/fronts/common/footer.jsp"%>
	<!-- 底部导航  end -->	
	
	<script type="text/javascript">
		$(".mod_event").find("li a")
	</script>
 </body>
</html>
