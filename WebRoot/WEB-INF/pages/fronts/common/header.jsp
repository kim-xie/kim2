<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
	/* 顶部导航  start */
	#topNav{position:fixed;top:0;left:0;z-index:1993;width:100%;height:50px;background:#333;}
	#topNav #navWrap{width:1180px;height:100%;margin:0 auto;}
	#topNav #navWrap #navLogo{float:left;/* width:15%; */height:100%;}
	#topNav #navWrap #navLogo a{display:block;width:100%;height:100%;}
	
	#topNav #navWrap #navList{float:left;/* width:55%; */height:100%;}
	#topNav #navWrap #navList .navList_list{width:100%;height:100%;}
	#topNav #navWrap #navList .navList_list li{float:left;padding:13px 12px 15px 12px;border-top:4px solid transparent;}
	#topNav #navWrap #navList .navList_list li:hover{border-top:4px solid #3498db;background:#666;}
	#topNav #navWrap #navList .navList_list li.active a{color:#3498db;}
	#topNav #navWrap #navList .navList_list li a{display:block;text-decoration:none;font-size:16px;color:#fff;}
	
	#topNav #navWrap #navInfo{float:right;/* width:30%; */height:100%;}
	#topNav #navWrap #navInfo .search-hd{position:relative;float:left;width:50px;height:100%;transition: width .5s;}
	#topNav #navWrap #navInfo .search-hd:before{content: "";position: absolute;top: 10px;left: 0;height: 30px;border-left: 1px solid #112429;margin-left: -1px;}
	#topNav #navWrap #navInfo .search-hd .search-status {position: absolute;left: 0;visibility: hidden; opacity: 0;transition: opacity .5s;}
	#topNav #navWrap #navInfo .search-hd .search-status .search-filter {position: relative;float: left;width: 100px;height: 50px;}
	#topNav #navWrap #navInfo .search-hd .search-status .search-filter:before {content: "";position: absolute;top: 18px;right: 0;height: 14px;width: 1px;background-color: #f2f3f4;}
	#topNav #navWrap #navInfo .search-hd .search-status .search-filter > a {display: block;height: 30px;margin: 10px 0;padding-left: 28px;font-size: 14px;color: #fff;line-height: 30px;}
	#topNav #navWrap #navInfo .search-hd .search-status .search-filter > a .icon-icontabdown {margin-left:3px;font-size: 18px;color: #b6c1c9;}
	#topNav #navWrap #navInfo .search-hd .search-status .search-select {position: absolute;left: 100px;float: left;width: 26px;height: 50px;transition: width .2s;}
	#topNav #navWrap #navInfo .search-hd .search-status .search-select .search-val {float: left;width: 0;background:transparent;border-color: transparent;height: 20px;margin: 10px 0;padding: 3px 5px;font-size: 14px;color: #fff;line-height: 20px;transition: width .2s;-webkit-box-sizing: content-box;box-sizing: content-box;}
	#topNav #navWrap #navInfo .search-hd .search-status .options {display: none;z-index: 90;position: absolute;top: 50px;left: 0;width: 100%;background-color: #fff;box-shadow: 0px 1px 2px rgba(0,0,0,.1);}
	#topNav #navWrap #navInfo .search-hd .search-status .options li {height: 36px;line-height: 36px;}
	#topNav #navWrap #navInfo .search-hd .search-status .options li a {display: block;padding: 0 12px 0 28px;font-size: 14px;color: #7a8e9d;}
	#topNav #navWrap #navInfo .search-hd .search-status .options li a:hover {color: #3498DB;background:#999;}
	#topNav #navWrap #navInfo .search-hd .search-hd-btn {position: absolute;right: 0;z-index: 10;float: left;width: 49px;height: 50px;padding: 0;opacity: 1;}
	#topNav #navWrap #navInfo .search-hd .search-hd-btn:before {content: "";position: absolute;top: 10px;right: 0;height: 30px;border-right: 1px solid #112429;}
	#topNav #navWrap #navInfo .search-hd .search-hd-btn .icon-iconsearch {display: block;font-size: 28px;color: #d4dce2;margin-top: 20px;text-align: center;transition: color .2s;}
	#topNav #navWrap #navInfo .search-hd.on{ width: 308px;}
	#topNav #navWrap #navInfo .search-hd.on .search-status{visibility: visible;opacity: 1;}
	#topNav #navWrap #navInfo .search-hd.on .search-select{width: 170px;}
	#topNav #navWrap #navInfo .search-hd.on .search-select .search-val {width: 156px;}
	#topNav #navWrap #navInfo .search-hd .search-hd-btn .icon-iconsearch:hover {color: #3498db;}
	
	#topNav #navWrap #navInfo .navInfo_list{display:inline-block;height:100%;}
	#topNav #navWrap #navInfo .navInfo_list .list_item{position:relative;float:left;border-top:4px solid transparent;}
	#topNav #navWrap #navInfo .navInfo_list .list_item:hover{border-top:4px solid #3498db;background:#666;}
	#topNav #navWrap #navInfo .navInfo_list .list_item a{display:block;text-decoration:none;font-size:16px;}
	#topNav #navWrap #navInfo .navInfo_list .list_item a .listIcon{display:block;padding:15px 12px 13px 12px;}
	#topNav #navWrap #navInfo .navInfo_list .list_item a .avatar{display:block;width:30px;height:30px;border-radius:50%;padding:7px 12px 9px 12px;}
	#topNav #navWrap #navInfo .navInfo_list .list_item .triangle-top{display:none;position:absolute;top:45px;left:50%;z-index:90;margin-left:-10px;width:0; height:0; border-bottom:10px solid #333;border-left:10px solid transparent;border-right:10px solid transparent;}
	#topNav #navWrap #navInfo .navInfo_list .list_item .quick-list{display:none;position:absolute;top:55px;right:0;z-index:90;box-shadow: 0px 1px 2px rgba(0,0,0,.1);}
	#topNav #navWrap #navInfo .navInfo_list .list_item .quick-list li a{display:block;width:130px;height:32px;font-size:14px;color:#7a8e9d;line-height:32px;background-color: #333;}
	#topNav #navWrap #navInfo .navInfo_list .list_item .quick-list li a i{float:left;margin-left:20px;margin-right:6px;font-size:18px;color:#647587;line-height:32px;}
	#topNav #navWrap #navInfo .navInfo_list .list_item .quick-list li:hover a{color:#3498DB;background-color:#EFF3F5;}
	/* 顶部导航  end */
	
	
	
</style>
	<!-- 顶部导航  start -->
	<div id="topNav">
		<div id="navWrap">
			<div id="navLogo"><a href="#"><img alt="logo" src="${basePath}/resources/imgs/logo/logo.png"></a></div>
			<div id="navList">
				<ul class="navList_list">
				    <li class="active"><a href="#">首页</a></li>
				    <li><a href="#">学习</a></li>
				    <li><a href="#">作品</a></li>
				    <li><a href="#">素材</a></li>
				    <li><a href="#">经验</a></li>
				    <li><a href="${basePath}/music/list">音乐</a></li>
				</ul>
			</div>
			<div id="navInfo">
				<div class="search-hd">
					<form action="http://s.ui.cn/index.html" method="get" id="searchForm">
						<div class="search-status">
							<div class="search-filter">
								<a href="javascript:;"><span class="tit">音乐</span><i class="iconfont icon-icontabdown"></i></a>							
								<ul class="options">
									<li><a href="javascript:;" data-rel="project">作品</a></li>
									<li><a href="javascript:;" data-rel="aricle">文章</a></li>
									<li><a href="javascript:;" data-rel="music">音乐</a></li>
									<li><a href="javascript:;" data-rel="matter">素材</a></li>
									<li><a href="javascript:;" data-rel="study">学习</a></li>
									<li><a href="javascript:;" data-rel="experience">经验</a></li>
								</ul>
							</div>
							<div class="search-select">
								<input type="text" class="search-val" placeholder="请输入您要查找的内容" autocomplete="off" value="" name="keywords" id="keywords">
								<ul class="options">
									<li><a href="javascript:;">按专辑搜索</a></li>
									<li><a href="javascript:;">按歌名搜索</a></li>
									<li><a href="javascript:;">按歌手搜索</a></li>
									<li><a href="javascript:;">按歌词搜索</a></li>
								</ul>
							</div>
						</div>
						<input type="hidden" name="type" value="project" id="sType">
						<a class="search-hd-btn" href="javascript:;"><i class="iconfont icon-iconsearch"></i></a>
					</form>
				</div>
				<ul class="navInfo_list">
					<li class="list_item">
						<a class="quick-toggle" href="javascript:;">
							<i class="iconfont icon-icon-cloud-upload fz28 listIcon" style="color:#CED7DE"></i>
						</a>
						<ul class="quick-menu" style="display: none;">
							<li><a href="http://upload.ui.cn/work.html"><i class="iconfont icon-up-pic"></i>上传作品</a></li>
							<li><a href="http://upload.ui.cn/exp.html"><i class="iconfont icon-up-experience"></i>上传经验</a></li>
						</ul>
					</li>
				    <li class="list_item">
						<a class="quick-toggle new" href="javascript:;">
							<i class="iconfont icon-bell1 fz30 listIcon" style="color:#CED7DE"></i>															
						</a>
						<div id="quickTab" class="quick-menu quick-tab" style="display: none;">
							<ul class="tab-bar cl">
								<li rel="letter" class="on">
									<a href="javascript:;">
										<i class="icon-envelope-thin"></i>
									</a>
								</li>
								<li rel="comment">
									<a href="javascript:;">
										<i class="icon-comment"></i>
									</a>
								</li>
								<li rel="collect">
									<a href="javascript:;">
										<i class="icon-star"></i>
									</a>
								</li>
								<li rel="praise">
									<a href="javascript:;">
										<i class="icon-leaf-line"></i>
									</a>
								</li>
								<li rel="fans">
									<a href="javascript:;">
										<i class="icon-fans"></i>
									</a>
								</li>
								<li rel="system">
									<a href="javascript:;">
										<i class="icon-horn"></i>
									</a>
								</li>
							</ul>
							
							<div class="tab-wrap">
								<!-- 1私信、2评论、3收藏、4赞、5粉丝、6通知 -->
								<ul class="tab-cont" style="display: block;"><!-- 01私信 -->
									<li class="tab-info-none">没有私信类消息</li>
								</ul>
								<ul class="tab-cont" style="display: none;"><!-- 02评论 -->
									<li class="tab-info-none">没有评论类消息</li>
								</ul>
								<ul class="tab-cont" style="display: none;"><!-- 03收藏 -->
									<li class="tab-info-none">没有收藏类消息</li>
								</ul>
								<ul class="tab-cont" style="display: none;"><!-- 04点赞 -->
									<li class="tab-info-none">没有点赞类消息</li>
								</ul>
								<ul class="tab-cont" style="display: none;"><!-- 05粉丝 -->
									<li class="tab-info-none">没有粉丝类消息</li>
								</ul>
								<ul class="tab-cont" style="display: none;"><!-- 06通知 -->
									<li class="tab-info-none">没有通知类消息</li>
								</ul>
							</div>
						</div>
					</li>
				    <li class="list_item">
				    	<a href="#"><img class="avatar" alt="userPic" src="${basePath}/resources/imgs/user/small.png"></a>
			    		<div class="triangle-top"></div>
				    	<ul class="quick-list" >
							<li><a href="#"><i class="iconfont icon-10"></i>我的作品</a></li>
							<li><a href="#"><i class="iconfont icon-fonticonstar02"></i>我的收藏</a></li>
							<li><a href="#"><i class="iconfont icon-iconmusic"></i>我的音乐</a></li>
							<li><a href="#"><i class="iconfont icon-user-info"></i>修改资料</a></li>
							<li><a href="${basePath}/logout"><i class="iconfont icon-end01"></i>退出登录</a></li>
						</ul>
				    </li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 顶部导航  end -->
	<script type="text/javascript"> 
		
		$(".search-hd-btn").bind("click",function(e){
			stopBubble(e);
			$(".search-hd").toggleClass("on");
			if($(".search-hd").hasClass("on")){
				$(this).find(".icon-iconsearch").css("color","#3498DB");
			}else{
				$(".search-hd-btn").hover(function(){
					$(this).find(".icon-iconsearch").css("color","#3498DB");
				},function(){
					$(this).find(".icon-iconsearch").css("color","");
				}); 
			}
		});
		
		$(".search-select .search-val").bind({"focus":function(e){
				stopBubble(e);
				$(this).next().show();
			}/* ,"blur":function(){
				$(this).next().hide();
				$(".search-hd-btn").trigger("click");
			}  */
		});
		
		$(".search-filter").hover(function(){
			$(this).find(".options").show();
		},function(){
			$(this).find(".options").hide();
		});
		
		$(".list_item .avatar").hover(function(){
			$(".list_item .triangle-top, .quick-list").show();
		},function(){
			$(".list_item .triangle-top, .quick-list").hide();
		});
		
		$(".search-filter .options").find("a").click(function(e){
			stopBubble(e);
			var filterVal = $(this).text();
			$(".search-filter .tit").text(filterVal);
		});
		$(".search-select .options").find("a").click(function(e){
			stopBubble(e);
			var filterVal = $(this).text();
			$(".search-select .search-val").val(filterVal);
		});
		
		$(document).click(function(){
			if($(".search-hd").hasClass("on")){
				$(".search-hd-btn").trigger("click");
			}
		});
		
	</script>