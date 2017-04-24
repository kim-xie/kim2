<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<title>留言板</title>
		<meta name="Author" content="kim">
		<meta name="Keywords" content="留言板">
		<%@include file="/WEB-INF/pages/common/common.jsp"%>
		<style type="text/css">
			*{margin:0;padding:0;}
			body{/* background:url("${basePath}/resources/imgs/share/bg.jpg")top center; */font-size:12px;font-family:"微软雅黑";color:#666;/* background-attachment:fixed; */}
			img{vertical-align:middle;}
			/*timeline start*/
			.wrap{position:absolute;z-index:0;width:100%;height:100%;}
			.wrap .timeline{width:980px;padding: 70px 20px 20px 20px;margin:0 auto;position:relative;}
			.wrap .timeline .t_line{width:5px;background:#ccc;position:absolute;left:50px;top:85px;z-index:-1}
			.wrap .timeline .t_send{width:898px;height:200px;}
			.wrap .timeline .t_send .t_header{float:left;}
			.wrap .timeline .t_send .t_header img{border-radius:33px;}
			.wrap .timeline .t_send .t_icon{width:13px;height:16px;float:left;margin: 27px 0 0 10px;}
			.wrap .timeline .t_send .t_box{margin-top:5px;width:808px;background:#fff;float:left;border-radius:5px;box-shadow:1px 1px 1em #bdb9b9;position:relative;padding:10px 0;}
			.wrap .timeline .t_send .t_box .t_face{padding:0 10px;}
			.wrap .timeline .t_send .t_box .t_msg{width:748px;height:80px;border:1px solid #ccc;margin:0 auto;padding:10px;overflow:auto;} 
			.wrap .timeline .t_send .t_box .t_msg img{margin:2px;}
			.wrap .timeline .t_send .t_box .t_title{padding-bottom:10px;font-size:16px;text-align:center;font-weight:600;color:#999}
			.wrap .timeline .t_send .t_box .t_face_btn{float:left;margin: 15px 0 0 16px;}
			.wrap .timeline .t_send .t_box .t_send_btn{float:right;width:80px;height:32px;background:#3498db;text-decoration:none;	text-align:center;line-height:32px;font-size:14px;color:#fff;margin:8px 9px 0 0;border-radius:5px;}
			.wrap .timeline .t_send .t_box .t_send_btn:hover{background:#209df1;}
			.wrap .timeline .t_send .t_box .t_face_con{width:365px;border:1px solid #ccc;background:#fff;box-shadow: 1px 2px 6px 0px #000;position:absolute;left:26px;top:180px;padding:5px;display:none;z-index:1;}
			.wrap .timeline .t_send .t_box .t_face_con ul li{list-style:none;float:left;margin:2px;	cursor: pointer;}
			.wrap .timeline .t_all{position:relative;overflow:hidden;}
			.wrap .timeline .t_all .t_ul{margin-top:0px;}
			.wrap .timeline .t_all .t_ul .l_header{float:left;}
			.wrap .timeline .t_all .t_ul .t_list{margin:20px 0;}
			.wrap .timeline .t_all .t_ul .t_list .l_icon{width:13px;height:16px;float:left;margin:6px 0 0 10px;}
			.wrap .timeline .t_all .t_ul .t_list .l_icon .icon-iconzuosanjiao{font-size:22px;color:#f5f2f2;}
			.wrap .timeline .t_all .t_ul .t_list .l_header img{border-radius:33px;}
			.wrap .timeline .t_all .t_ul .t_list .l_msg{position:relative;max-width:777px;min-height:36px;background:#f5f2f2;border-radius:10px;padding:14px 16px 30px 16px;font-size:14px;overflow:hidden;word-wrap:break-word;word-break:normal;}
			.wrap .timeline .t_all .t_ul .t_list .l_msg .time{position:absolute;bottom:5px;left:16px;}
			.wrap .timeline .t_all .t_ul .t_list .l_msg .version{position:absolute;bottom:5px;right:16px;}
			.clear{clear:both;}
			/*end timeline*/
			#arrow{position:fixed;top:50%;right:30px;}
			*html #arrow{position:absolute;top:expression(eval(document.documentElement.scrollTop));margin-top:350px;}
			#arrow ul li{display:block;height:20px;width:20px;background:url(${basePath}/resources/imgs/bg/icons.png) no-repeat 0 0;cursor:pointer;-webkit-transition:all 0.2s ease-out;-moz-transition:all 0.2s ease-out;-o-transition:all 0.2s ease-out;transition:all 0.2s ease-out;}
			#arrow ul li:active{background-color:#000;}
			#arrow ul .arrow_active{background-color:#000;-webkit-transition:all 0.1s ease-in;-moz-transition:all 0.1s ease-in;-o-transition:all 0.1s ease-in;transition:all 0.1s ease-in;}
			#arrow ul .arrowup{background-position:0px -26px;margin-bottom:10px;}
			#arrow ul .arrowdown{background-position:0px 0px;}
			
		</style>
	</head>
	<body>
		<!-- 顶部导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/header.jsp"%>
		<!-- 顶部导航  end -->
		
		<!--timeline start-->
		<div class="wrap">
			<div class="timeline">
				<div class="t_line"></div>
				
				<div class="t_send">
					<div class="t_header">
						<img src="${basePath}/resources/imgs/user/small.png" alt="kim" width="66" height="66"/>
					</div>
					<div class="t_icon"></div>
					
					<div class="t_box">
						<p class="t_title">您的反馈是我们前进的动力!</p>
						<div class="t_msg" contenteditable="true"></div> 
						<p class="t_face">
							<a href="javascript:void(0);" class="t_face_btn">
								<img src="${basePath}/resources/imgs/face/cza_thumb.gif" alt="表情" width="22" height="22" />
								<span class="facemotion">表情</span>
							</a>
							<a href="javascript:void(0);" class="t_send_btn" onclick="saveFeedBack(this);">发 表</a>
						</p>
						<div class="t_face_con">
							<ul id="q_ul">
								<li><img src="${basePath}/resources/imgs/face/zz2_thumb.gif" title="[织]" width="22" height="22"></li>
								<li><img src="${basePath}/resources/imgs/face/horse2_thumb.gif" title="[神马]"></li>
								<li><img src="${basePath}/resources/imgs/face/fuyun_thumb.gif" title="[浮云]"></li>
								<li><img src="${basePath}/resources/imgs/face/geili_thumb.gif" title="[给力]"></li>
								<li><img src="${basePath}/resources/imgs/face/wg_thumb.gif" title="[围观]"></li>
								<li><img src="${basePath}/resources/imgs/face/vw_thumb.gif" title="[威武]"></li>
								<li><img src="${basePath}/resources/imgs/face/panda_thumb.gif" title="[熊猫]"></li>
								<li><img src="${basePath}/resources/imgs/face/rabbit_thumb.gif" title="[兔子]"></li>
								<li><img src="${basePath}/resources/imgs/face/otm_thumb.gif" title="[奥特曼]"></li>
								<li><img src="${basePath}/resources/imgs/face/j_thumb.gif" title="[囧]"></li>
								<li><img src="${basePath}/resources/imgs/face/hufen_thumb.gif" title="[互粉]"></li>
								<li><img src="${basePath}/resources/imgs/face/liwu_thumb.gif" title="[礼物]"></li>
								<li><img src="${basePath}/resources/imgs/face/smilea_thumb.gif" title="[呵呵]"></li>
								<li><img src="${basePath}/resources/imgs/face/tootha_thumb.gif" title="[嘻嘻]"></li>
								<li><img src="${basePath}/resources/imgs/face/laugh.gif" title="[哈哈]"></li>
								<li><img src="${basePath}/resources/imgs/face/tza_thumb.gif" title="[可爱]"></li>
								<li><img src="${basePath}/resources/imgs/face/kl_thumb.gif" title="[可怜]"></li>
								<li><img src="${basePath}/resources/imgs/face/kbsa_thumb.gif" title="[挖鼻屎]"></li>
								<li><img src="${basePath}/resources/imgs/face/cj_thumb.gif" title="[吃惊]"></li>
								<li><img src="${basePath}/resources/imgs/face/shamea_thumb.gif" title="[害羞]"></li>
								<li><img src="${basePath}/resources/imgs/face/zy_thumb.gif" title="[挤眼]"></li>
								<li><img src="${basePath}/resources/imgs/face/bz_thumb.gif" title="[闭嘴]"></li>
								<li><img src="${basePath}/resources/imgs/face/bs2_thumb.gif" title="[鄙视]"></li>
								<li><img src="${basePath}/resources/imgs/face/lovea_thumb.gif" title="[爱你]"></li>
								<li><img src="${basePath}/resources/imgs/face/sada_thumb.gif" title="[泪]"></li>
								<li><img src="${basePath}/resources/imgs/face/heia_thumb.gif" title="[偷笑]"></li>
								<li><img src="${basePath}/resources/imgs/face/qq_thumb.gif" title="[亲亲]"></li>
								<li><img src="${basePath}/resources/imgs/face/sb_thumb.gif" title="[生病]"></li>
								<li><img src="${basePath}/resources/imgs/face/mb_thumb.gif" title="[太开心]"></li>
								<li><img src="${basePath}/resources/imgs/face/ldln_thumb.gif" title="[懒得理你]"></li>
								<li><img src="${basePath}/resources/imgs/face/yhh_thumb.gif" title="[右哼哼]"></li>
								<li><img src="${basePath}/resources/imgs/face/zhh_thumb.gif" title="[左哼哼]"></li>
								<li><img src="${basePath}/resources/imgs/face/x_thumb.gif" title="[嘘]"></li>
								<li><img src="${basePath}/resources/imgs/face/cry.gif" title="[衰]"></li>
								<li><img src="${basePath}/resources/imgs/face/wq_thumb.gif" title="[委屈]"></li>
								<li><img src="${basePath}/resources/imgs/face/t_thumb.gif" title="[吐]"></li>
								<li><img src="${basePath}/resources/imgs/face/k_thumb.gif" title="[打哈气]"></li>
								<li><img src="${basePath}/resources/imgs/face/bba_thumb.gif" title="[抱抱]"></li>
								<li><img src="${basePath}/resources/imgs/face/angrya_thumb.gif" title="[怒]"></li>
								<li><img src="${basePath}/resources/imgs/face/yw_thumb.gif" title="[疑问]"></li>
								<li><img src="${basePath}/resources/imgs/face/cza_thumb.gif" title="[馋嘴]"></li>
								<li><img src="${basePath}/resources/imgs/face/88_thumb.gif" title="[拜拜]"></li>
								<li><img src="${basePath}/resources/imgs/face/sk_thumb.gif" title="[思考]"></li>
								<li><img src="${basePath}/resources/imgs/face/sweata_thumb.gif" title="[汗]"></li>
								<li><img src="${basePath}/resources/imgs/face/sleepya_thumb.gif" title="[困]"></li>
								<li><img src="${basePath}/resources/imgs/face/sleepa_thumb.gif" title="[睡觉]"></li>
								<li><img src="${basePath}/resources/imgs/face/money_thumb.gif" title="[钱]"></li>
								<li><img src="${basePath}/resources/imgs/face/sw_thumb.gif" title="[失望]"></li>
								<li><img src="${basePath}/resources/imgs/face/cool_thumb.gif" title="[酷]"></li>
								<li><img src="${basePath}/resources/imgs/face/hsa_thumb.gif" title="[花心]"></li>
								<li><img src="${basePath}/resources/imgs/face/hatea_thumb.gif" title="[哼]"></li>
								<li><img src="${basePath}/resources/imgs/face/gza_thumb.gif" title="[鼓掌]"></li>
								<li><img src="${basePath}/resources/imgs/face/dizzya_thumb.gif" title="[晕]"></li>
								<li><img src="${basePath}/resources/imgs/face/bs_thumb.gif" title="[悲伤]"></li>
								<li><img src="${basePath}/resources/imgs/face/crazya_thumb.gif" title="[抓狂]"></li>
								<li><img src="${basePath}/resources/imgs/face/h_thumb.gif" title="[黑线]"></li>
								<li><img src="${basePath}/resources/imgs/face/yx_thumb.gif" title="[阴险]"></li>
								<li><img src="${basePath}/resources/imgs/face/nm_thumb.gif" title="[怒骂]"></li>
								<li><img src="${basePath}/resources/imgs/face/hearta_thumb.gif" title="[心]"></li>
								<li><img src="${basePath}/resources/imgs/face/unheart.gif" title="[伤心]"></li>
								<li><img src="${basePath}/resources/imgs/face/pig.gif" title="[猪头]"></li>
								<li><img src="${basePath}/resources/imgs/face/ok_thumb.gif" title="[ok]"></li>
								<li><img src="${basePath}/resources/imgs/face/ye_thumb.gif" title="[耶]"></li>
								<li><img src="${basePath}/resources/imgs/face/good_thumb.gif" title="[good]"></li>
								<li><img src="${basePath}/resources/imgs/face/no_thumb.gif" title="[不要]"></li>
								<li><img src="${basePath}/resources/imgs/face/z2_thumb.gif" title="[赞]"></li>
								<li><img src="${basePath}/resources/imgs/face/come_thumb.gif" title="[来]"></li>
								<li><img src="${basePath}/resources/imgs/face/sad_thumb.gif" title="[弱]"></li>
								<li><img src="${basePath}/resources/imgs/face/lazu_thumb.gif" title="[蜡烛]"></li>
								<li><img src="${basePath}/resources/imgs/face/clock_thumb.gif" title="[钟]"></li>
								<li><img src="${basePath}/resources/imgs/face/cake.gif" title="[蛋糕]"></li>
								<li><img src="${basePath}/resources/imgs/face/m_thumb.gif" title="[话筒]"></li>
								<li><img src="${basePath}/resources/imgs/face/weijin_thumb.gif" title="[围脖]"></li>
								<li><img src="${basePath}/resources/imgs/face/lxhzhuanfa_thumb.gif" title="[转发]"></li>
								<li><img src="${basePath}/resources/imgs/face/lxhluguo_thumb.gif" title="[路过这儿]"></li>
								<li><img src="${basePath}/resources/imgs/face/bofubianlian_thumb.gif" title="[bofu变脸]"></li>
								<li><img src="${basePath}/resources/imgs/face/gbzkun_thumb.gif" title="[gbz困]"></li>
								<li><img src="${basePath}/resources/imgs/face/boboshengmenqi_thumb.gif" title="[生闷气]"></li>
								<li><img src="${basePath}/resources/imgs/face/chn_buyaoya_thumb.gif" title="[不要啊]"></li>
								<li><img src="${basePath}/resources/imgs/face/daxiongleibenxiong_thumb.gif" title="[dx泪奔]"></li>
								<li><img src="${basePath}/resources/imgs/face/cat_yunqizhong_thumb.gif" title="[运气中]"></li>
								<li><img src="${basePath}/resources/imgs/face/youqian_thumb.gif" title="[有钱]"></li>
								<li><img src="${basePath}/resources/imgs/face/cf_thumb.gif" title="[冲锋]"></li>
								<li><img src="${basePath}/resources/imgs/face/camera_thumb.gif" title="[照相机]"></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="t_all">
					<div class="t_ul"></div>
				</div>
				<div class="clear"></div>
		
			</div>
		</div> 
		<!--end timeline-->
		
		<div id="arrow">
			<ul>
				<li class="arrowup"></li>
				<li class="arrowdown"></li>
			</ul>
		</div>
		
		<script type="text/javascript" src="${basePath}/resources/js/three.min.js"></script>
		<script type="text/javascript">
			/*格式化时间*/
			function timeFormate(time){
				return time<10 ? "0" + time:time;
			};
			
			// 初始化
			//var message = sessionStorage.getItem("message");
			//var message = localStorage.getItem("message");
			
			$(function(){
				loadData(0,10);
				var wH = $(window).height();
				$(".t_line").height(wH-100);
				$(".t_all").height(wH-300);
				$(".t_msg").text("请在这里输入您的反馈信息...").css("color","#999");
				
				//if(message){
				//	$(".t_ul").html(message);
				//	eachLi();
				//}
				
				
			});
			
			// 点击显示表情
			$(".t_face_btn").click(function(e){
				$(".t_face_con").toggle(500);
				e.stopPropagation();
			});
			
			// 选中QQ表情添加到文本框
			$("#q_ul").find("li").click(function(){
				var img = $(this).find("img").clone();
				if($(".t_msg").text()=="请在这里输入您的反馈信息..."){
					$(".t_msg").text("").append(img);
				}else{
					$(".t_msg").append(img);
				}
			});
			
			
			var mark = false;
			var $index = 0;
			function ResizeLi(){
				var allHeight = $(".t_all").height();
				var liHeight = 0;
				var ulMt = parseInt($(".t_all .t_ul ").css("margin-top"));
				if(ulMt != 0){
					window.location.href = window.location.href;
				} 
				$(".t_ul .t_list").each(function(i){
					liHeight += $(this).height()+20;
					if((liHeight > allHeight) && !mark){
						//alert(liHeight+"--"+allHeight+"--"+listLen +"--"+$(this).index())
						mark = true;
						$index = $(this).index() - 1;
					}
					if((liHeight > allHeight) && mark){
						//alert(mark+"--"+$index)
						$(".t_ul .t_list:gt("+$index+")").find(".l_header").removeClass("fadeInLeft").addClass("fadeOutLeft");
						$(".t_ul .t_list:gt("+$index+")").find(".l_icon").removeClass("fadeInRight").addClass("fadeOutRight");
						$(".t_ul .t_list:gt("+$index+")").find(".l_msg").removeClass("fadeInRight").addClass("fadeOutRight");
					}
				});
			}
			
			//加载数据
			function loadData(pageNo,pageSize){
				var params = {pageNo:pageNo,pageSize:pageSize,order:"create_time desc"};
				$.ajax({
					type: "get",
					url: "${basePath}/feedback/findFeedBacks",
					data: params,
					success: function(data){
						var dataLen = data.feedBacks.length;
						for(var i=0;i<dataLen;i++){
							$(".t_ul").append( "<div class='t_list'>"+
												"	<div class='l_header animated fadeInLeft'><img src='${basePath}/"+data.users[i].headerPic+"' width='66' height='66'/></div>"+
												"	<div class='l_icon animated fadeInRight'><i class='iconfont icon-iconzuosanjiao'></i></div>"+
											    "	<div class='l_msg animated fadeInRight'>"+data.feedBacks[i].feedBack+
												"		<span class='time'>"+data.feedBacks[i].createTime+"</span>"+
												"		<span class='version'>version: "+data.feedBacks[i].appVersion+"</span>"+
												"	</div>"+
												"</div>");
						}
						ResizeLi();
					}
				});
			}
			
			// 点击发布
			var headerPic = '<%=session.getAttribute("headerPic")%>';
			function saveFeedBack(obj){
				$(".t_face_con").hide(500);
				var feedBack = $(".t_msg").html();
				if(feedBack == "" || feedBack == "请在这里输入您的反馈信息..."){
					$(".t_msg").focus();
					return;
				}
				var params = {feedBack:feedBack,appVersion:"1.0.0"};
				var layerIndex = "";
				$.ajax({
					type: "post",
					url: "${basePath}/feedback/save",
					data: params,
					beforeSend: function(XMLHttpRequest){
						layerIndex = layer.load(0, {shade:0.1});
					},
					success: function(data){
						//关闭加载层
						layer.close(layerIndex);
						
						if(data == "success"){
							layer.msg("发表成功！", {icon:6,shade:0.1,time:2000,shadeClose:true}); //1-打钩 2-打叉 3-问号 4-锁 5-悲伤 6-笑脸
							$(".t_ul").prepend("<div class='t_list'>"+
												"	<div class='l_header animated fadeInLeft'><img src='${basePath}/"+headerPic+"' width='66' height='66'/></div>"+
												"	<div class='l_icon animated fadeInRight'><i class='iconfont icon-iconzuosanjiao'></i></div>"+
											    "	<div class='l_msg animated fadeInRight'>"+$('.t_msg').html()+
												"		<span class='time'>刚刚</span>"+
												"		<span class='version'>version: 1.0.0</span>"+
												"	</div>"+
												"</div>");
							// 存储到浏览器session中，浏览器关闭，即消失
							//sessionStorage.setItem("message",$(".t_all").html());
							$(".t_msg").html("").focus();
							ResizeLi();
							// 本地存储，浏览器关闭仍然存在
							//localStorage.setItem("message",$(".t_all").html());
							//localStorage.removeItem("message");
						}else if(data == "fail"){
							layer.msg("发表失败！", {icon: 5,shade:0.1,time:2000,shadeClose:true}); 
						}
					},
					complete: function(XMLHttpRequest, textStatus){
						layer.close(layerIndex);
					}
				});
			};
			
			
			/* 输入框操作 */
			$(".t_msg").focus(function(){
				if($(this).html()!="" && $(this).html()=="请在这里输入您的反馈信息..."){
					$(this).text("").css({"font-size":"14px","color":"#333","border":"1px solid #3498db"});
				}else{
					$(this).css({"font-size":"14px","color":"#333","border":"1px solid #3498db"});
				}
			}).blur(function(){
				if($(this).html()==""){
					$(".t_msg").html("请在这里输入您的反馈信息...").css({"font-size":"14px","color":"#999","border":"1px solid #ccc"});
				}
			});
			
			/* 文档点击事件 */
			$(document).click(function(){
				$(".t_face_con").hide(500);
			});
			
			/* chrome\ie */
			document.body.onmousewheel = function(event) {
			    event = event || window.event;
			    onmousewheel(event);	
			};
			/* firefox\safari */
			document.body.addEventListener("DOMMouseScroll", function(event) {
				event = event || window.event;
				onmousewheel(event);
			});
			var scrollIndex = scrollLen = marTopUp = marTopDown = nowTime = 0;
			function onmousewheel(event){
				event = event || window.event;
				if(event.detail<0 || event.wheelDelta>0){
					scrollDown();
					//alert("向上滚动")
				}else{
					scrollUp();
					//alert("向下滚动")
				}
			}
			
			$(".arrowdown").click(function(){
				scrollUp();
			});
			$(".arrowup").click(function(){
				scrollDown();
			});
			
			/* 向上滚动  */
			function scrollUp(){
				if(new Date()- nowTime > 600){
					nowTime = new Date();
					if(scrollIndex < $(".t_ul .t_list").length - $index - 1 && mark){
						scrollIndex++;
						scrollLen = ($(".t_ul .t_list").length - $index -1) - scrollIndex;
						marTopUp += ($(".t_ul .t_list").eq(scrollIndex -1).height()+20);
						//alert(scrollIndex + "--" + scrollLen + "--" +marTopUp)
						$(".t_all .t_ul ").css("margin-top",-marTopUp + marTopDown);
						$(".t_ul .t_list").eq(scrollIndex -1).find(".l_header").removeClass("fadeInLeft").addClass("fadeOutLeft");
						$(".t_ul .t_list").eq(scrollIndex -1).find(".l_icon").removeClass("fadeInRight").addClass("fadeOutRight");	
						$(".t_ul .t_list").eq(scrollIndex -1).find(".l_msg").removeClass("fadeInRight").addClass("fadeOutRight");
						$(".t_ul .t_list").eq($index + scrollIndex).find(".l_header").removeClass("fadeOutLeft").addClass("fadeInLeft");
						$(".t_ul .t_list").eq($index + scrollIndex).find(".l_icon").removeClass("fadeOutRight").addClass("fadeInRight");	
						$(".t_ul .t_list").eq($index + scrollIndex).find(".l_msg").removeClass("fadeOutRight").addClass("fadeInRight");	
					}else{
						layer.msg("数据加载已经到底了...",{icon:6,shade:0.1,time:2000,shadeClose:true});
					}
				}
			}
			/* 向下滚动  */
			function scrollDown(){
				if(new Date()- nowTime > 600){
					nowTime = new Date();
					if(scrollIndex > 0 && mark){
						//alert(scrollIndex + "--" + scrollLen + "--" +marTopUp)
						marTopDown += ($(".t_ul .t_list").eq(scrollIndex - 1).height()+20);
						$(".t_all .t_ul ").css("margin-top",-marTopUp + marTopDown);
						$(".t_ul .t_list").eq(scrollIndex - 1).find(".l_header").removeClass("fadeOutLeft").addClass("fadeInLeft");
						$(".t_ul .t_list").eq(scrollIndex - 1).find(".l_icon").removeClass("fadeOutRight").addClass("fadeInRight");
						$(".t_ul .t_list").eq(scrollIndex - 1).find(".l_msg").removeClass("fadeOutRight").addClass("fadeInRight");	
						$(".t_ul .t_list").eq($index + scrollIndex).find(".l_header").removeClass("fadeInLeft").addClass("fadeOutLeft");
						$(".t_ul .t_list").eq($index + scrollIndex).find(".l_icon").removeClass("fadeInRight").addClass("fadeOutRight");		
						$(".t_ul .t_list").eq($index + scrollIndex).find(".l_msg").removeClass("fadeInRight").addClass("fadeOutRight");
						scrollIndex--;
						scrollLen = ($(".t_ul .t_list").length - $index -1) - scrollIndex;
					}else{
						layer.msg("数据加载已经到顶了...",{icon:6,shade:0.1,time:2000,shadeClose:true});
					}
				}
			}
			
			
			/* 反馈页面背景  */
			var container;
			var camera, scene, projector, renderer;
			var PI2 = Math.PI * 2;
			var programFill = function ( context ) {
				context.beginPath();
				context.arc( 0, 0, 1, 0, PI2, true );
				context.closePath();
				context.fill();
			}
			var programStroke = function ( context ) {
				context.lineWidth = 0.05;
				context.beginPath();
				context.arc( 0, 0, 1, 0, PI2, true );
				context.closePath();
				context.stroke();
			}
			var mouse = { x: 0, y: 0 }, INTERSECTED;
			init();
			animate();
			function init() {
				//container = document.createElement( 'div' );
				container = $( 'body' ).get(0);
				container.id = 'bgc';
				container.style.position = 'relative';
				container.style.zIndex = '0';
				//document.body.appendChild( container );
				camera = new THREE.PerspectiveCamera( 70, $(window).width() / $(window).height(), 1, 10000 );
				camera.position.set( 0, 300, 500 );
				scene = new THREE.Scene();
				for ( var i = 0; i < 100; i ++ ) {
					var particle = new THREE.Particle( new THREE.ParticleCanvasMaterial( { color: Math.random() * 0x808080 + 0x808080, program: programStroke } ) );
					particle.position.x = Math.random() * 800 - 400;
					particle.position.y = Math.random() * 800 - 400;
					particle.position.z = Math.random() * 800 - 400;
					particle.scale.x = particle.scale.y = Math.random() * 10 + 10;
					scene.add( particle );
				}
				projector = new THREE.Projector();
				renderer = new THREE.CanvasRenderer();
				renderer.setSize( $(window).width(), $(window).height()-4 );
				container.appendChild( renderer.domElement );
				document.addEventListener( 'mousemove', onDocumentMouseMove, false );
				window.addEventListener( 'resize', onWindowResize, false );
			}

			function onWindowResize() {
				var wH = $(window).height();
				$(".t_line").height(wH-100);
				$(".t_all").height(wH-300);
				ResizeLi();
				camera.aspect = $(window).width() / $(window).height();
				camera.updateProjectionMatrix();
				renderer.setSize( $(window).width(), $(window).height()-4);
			}
			function onDocumentMouseMove( event ) {
				event.preventDefault();
				mouse.x = ( event.clientX / window.innerWidth ) * 2 - 1;
				mouse.y = - ( event.clientY / window.innerHeight ) * 2 + 1;
			}
			//
			function animate() {
				requestAnimationFrame( animate );
				render();
			}
			var radius = 600;
			var theta = 0;
			function render() {
				// rotate camera
				theta += 0.2;
				camera.position.x = radius * Math.sin( theta * Math.PI / 360 );
				camera.position.y = radius * Math.sin( theta * Math.PI / 360 );
				camera.position.z = radius * Math.cos( theta * Math.PI / 360 );
				camera.lookAt( scene.position );
				// find intersections
				camera.updateMatrixWorld();
				var vector = new THREE.Vector3( mouse.x, mouse.y, 0.5 );
				projector.unprojectVector( vector, camera );
				var ray = new THREE.Ray( camera.position, vector.subSelf( camera.position ).normalize() );
				var intersects = ray.intersectObjects( scene.children );
				if ( intersects.length > 0 ) {
					if ( INTERSECTED != intersects[ 0 ].object ) {
						if ( INTERSECTED ) INTERSECTED.material.program = programStroke;
						INTERSECTED = intersects[ 0 ].object;
						INTERSECTED.material.program = programFill;
					}
				} else {
					if ( INTERSECTED ) INTERSECTED.material.program = programStroke;
					INTERSECTED = null;
				}
				renderer.render( scene, camera );
			}
		
		</script>
	</body>
</html>
