<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>首页</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<meta name="Author" content="kim">
		<meta name="Keywords" content="Keywords1,Keywords2,Keywords3">
		<meta name="Description" content="This is my page">
		<%@include file="/WEB-INF/pages/common/common.jsp"%>
	</head>
	<style>
		body{ background-color: #eff3f5;}
		.uploadBox{width:1180px;margin:0 auto;padding-top:30px;}
		/* 文章发表栏  start */
		.fb_box{width:670px;height:110px;overflow:hidden;margin:30px auto;}
	 	.fb_box .publicBar{height:100%;background:url("${basePath}/resources/imgs/share/nav224.png")no-repeat;}
	 	.fb_box .publicBar li{float:left;width:140px;height:100%;}
	 	.fb_box .publicBar li a{width:100%;height:100%;display:block;}
	 	.fb_box .publicBar li:hover{background:#B5CC5F;opacity:0.3}
	 	.fb_box .publicBar li.on{background:#B5CC5F;opacity:0.3}
	 	.fb_box .publicBar li.user{width:110px;height:100%;position:relative;}
	 	.fb_box .publicBar li.user img{width:112px;height:100%;position:absolute;}
	 	.fb_box .publicBar li.user:hover{background:transparent;opacity:1;}
		/* 文章发表栏  end */
		
		/*文本编辑器 start*/
		.editerBox{width:670px;margin:30px auto;}
		.editerBox .input{width:496px;height:30px;font-size:16px;font-weight:600;text-indent:0.5em;}
		.editerBox .editer{width:650px;height:100%;background:#fff;overflow:hidden;padding:10px;}
		.editerBox .editer .title{width:100%;height:30px;margin:10px 0;display:block;font-size:18px;font-weight:600;}
		.editerBox .editer .title input{width:599px;height:30px;font-size:16px;font-weight:600;text-indent:0.5em;}
		.editerBox .editer .upload_pic{position:relative;height:320px;border:1px dashed #ccc;text-align:center;margin:20px 0;}
		.editerBox .editer .upload_pic .txt-pic{line-height:320px;font-size:20px;color:#999;font-weight:600;}
		.editerBox .editer .upload_pic .txt-pic #preview{position:absolute;top:0;left:0;}
		.editerBox .editer .upload_pic .txt-pic a{text-decoration: none;}
		.editerBox .editer p{float:left;font-size:14px;font-weight:600;margin:20px 0;}
		.editerBox .editer p .fabiao{display:inline-block;height:30px;line-height:30px;}
		.editerBox .editer p .fabiao .submit{height:100%;padding:0 10px;margin-left:19px;outline:none;border:none;background:#0033ff;transition:1s;border-radius:5px;cursor:pointer;font-size:14px;font-weight:600;color:#fff;}
		.editerBox .editer p .fabiao .submit:hover{background:#0033cc;transition:1s;}
		/*文本编辑器 end*/
		
		/* 音乐上传 start */
		.musicUploadBox{width:670px;margin:30px auto;display:none;}
		.musicUploadBox .input{width:571px;height:30px;font-size:16px;font-weight:600;text-indent:0.5em;}
		.musicUploadBox .input.m_category{width:575px;}
		.musicUploadBox .editer{width:650px;height:100%;background:#fff;overflow:hidden;padding:10px;}
		.musicUploadBox .editer .upload_pic,.upload_music{position:relative;height:320px;border:1px dashed #ccc;text-align:center;margin:20px 0;}
		.musicUploadBox .editer .upload_pic #prograssbar{position:absolute;top:-20px;left:0;height:10px;background:green;width:0%;}
		.musicUploadBox .editer .upload_music{height:80px;}
		.musicUploadBox .editer .upload_pic .m-pic{line-height:320px;font-size:20px;color:#999;font-weight:600;}
		.musicUploadBox .editer .upload_music .m-src{line-height:80px;font-size:20px;color:#999;font-weight:600;}
		.musicUploadBox .editer .upload_pic .m-pic #img{position:absolute;top:0;left:0;}
		.musicUploadBox .editer .upload_pic .m-pic,.m-src a{text-decoration: none;}
		.musicUploadBox .editer p{float:left;font-size:14px;font-weight:600;margin:20px 0;}
		.musicUploadBox .editer p .fabiao{display:inline-block;height:30px;line-height:30px;}
		.musicUploadBox .editer p .fabiao .submit{height:100%;padding:0 10px;outline:none;border:none;background:#0033ff;transition:1s;border-radius:5px;cursor:pointer;font-size:14px;font-weight:600;color:#fff;}
		.musicUploadBox .editer p .fabiao .submit:hover{background:#0033cc;transition:1s;}
		/* 音乐上传 end */

	</style>
	  <link rel="stylesheet" type="text/css" href="${basePath}/resources/js/umeditor/themes/default/css/umeditor.css">
	  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.config.js"></script>
	  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.min.js"></script>
	  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.js"></script>
	  <script type="text/javascript" src="${basePath}/resources/js/kim_upload.js"></script>
	<body>
		<!-- 顶部导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/header.jsp"%>
		<!-- 顶部导航  end -->
		
		<!-- 左侧导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/left.jsp"%>
		<!-- 左侧导航  end -->
		
		<!-- 内容区域  start -->
		<div id="mainWrap" style="margin-top:50px;">
			<div class="uploadBox">
				 <!-- 发表文章栏目   start -->
				 <div class="fb_box">
				 	<ul class="publicBar">
					 	<li class="user">
						 	<a href="" target="_blank">
						 		<img src="${basePath}/resources/imgs/user/small.png" alt="头像">
						 	</a>
					 	</li>
					 	<li class="on">
						 	<a href="javascript:void(0);" target="_blank" class="fb_aritcle"></a>
					 	</li>
					 	<li>
						 	<a href="javascript:void(0);" target="_blank" class="fb_pic"></a>
					 	</li>
					 	<li>
						 	<a href="javascript:void(0);" target="_blank" class="fb_music"></a>
					 	</li>
					 	<li>
						 	<a href="javascript:void(0);" target="_blank" class="fb_video"></a>
					 	</li>
				 	</ul>
				 </div>
				 <!-- 发表文章栏目  end -->
				 
				 <!--文本编辑器 start-->
				 <div class="editerBox">
				 	<div class="editer">
				 		<span class="title">
				 			标题:
				 			<input type="text" placeholder="请输入标题不得超过50个字" maxlength="50" class="txt_title">
				 		</span>
				 		<span class="description title">
				 			描述:
				 			<input type="text" placeholder="描述不得超过200个字" maxlength="200" class="txt_description">
				 		</span>
				 		<div class="upload_pic">
				 			<!-- <input type="file" id="file" onchange="uploadContentImg(this)" style="display:none;"> -->
				 			<span class="txt-pic">
				 				<a href="javascript:void(0);" onclick="openBrowse(this,'#preview')">请添加封面图片</a>
				 				<img id="preview" src="" data-dir="imgs/contentImg" width="548" height="318" style="display:none;">
				 			</span>
				 		</div>
						<script id="myEditor" type="text/plain" style="width:650px;height:300px;margin:10px 0;overflow-X:hidden;overflow-Y:auto;"></script>
				 		<p>
							标签：
							<input type="text" class="input" placeholder="请输入标签" maxlength="40">	
							<span class="fabiao">
								<input type="button" class="submit" value="发表文章" onclick="saveContent(this);">
							</span>
				 		</p>
				 	</div>
				 </div>
				 <!--文本编辑器 end-->
				 
				 <!--音乐上传 -->
				 <div class="musicUploadBox">
				 	<div class="editer">
				 		<div class="upload_pic">
				 			<input type="file" id="file" onchange="uploadFile()" style="display:none;">
				 			<span class="m-pic">
				 				<a href="javascript:void(0);" onclick="openBrowse(this,'#img')">请添加封面图片</a>
				 				<img id="img" src="" data-img="" width="548" data-dir="mp3/img" height="318" style="display:none;">
				 			</span>
				 			<!-- <span id="prograssbar"></span> -->
				 		</div>
				 		
				 		<div class="upload_music">
				 			<input type="file" id="file" accept="image/jpg,image/jpeg,image/png,image/gif,audio/mp3" onchange="uploadFile()" style="display:none;">
				 			<span class="m-src">
				 				<a href="javascript:void(0);" onclick="openBrowse(this,'#audio')">请添加音乐</a>
				 				<audio id="audio" src="" data-link="" data-dir="mp3/song"></audio>
				 			</span>
				 		</div>
				 		
				 		<p>
				 			音乐描述：
				 			<input type="text" class="input m_description" placeholder="描述不得超过500个字" maxlength="500">
				 		</p>
				 		
				 		<p>
							音乐标题：
							<input type="text" class="input m_title" readonly="readonly" placeholder="音乐标题">	
				 		</p>
				 		
				 		<p>
							演唱歌手：
							<input type="text" class="input m_singer" readonly="readonly" placeholder="演唱歌手">	
				 		</p>
				 		
				 		<p>
							音乐大小：
							<input type="text" class="input m_size" readonly="readonly" placeholder="音乐文件大小">	
				 		</p>
				 		
				 		<p>
							播放时长：
							<input type="text" class="input m_time" readonly="readonly" placeholder="音乐播放时长">	
				 		</p>
				 		
				 		<p>
							音乐类型：
							<select class="input m_category">
								<option value="">--请选择--</option>
								<option value="1">流行</option>
								<option value="2">摇滚</option>
								<option value="3">民谣</option>
								<option value="4">名族风</option>
								<option value="5">重金属</option>
								<option value="6">轻音乐</option>
								<option value="7">黑暗</option>
								<option value="8">爵士</option>
								<option value="9">乡村</option>
								<option value="10">古典</option>
								<option value="11">拉丁</option>
								<option value="12">儿童</option>
								<option value="13">迷幻</option>
							</select>	
				 		</p>
				 		
				 		<p style="text-align:center;float: none;">
				 			<span class="fabiao">
								<input type="button" class="submit" value="保存音乐" onclick="saveMusic(this);">
							</span>
				 		</p>
				 	</div>
				 </div>
				 <!--音乐上传 end-->
			
			</div>
		</div>
		<!-- 内容区域  end -->
		
		<!-- 底部导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/footer.jsp"%>
		<!-- 底部导航  end -->
		<script type="text/javascript"> 
			//实例化编辑器
			var um = UM.getEditor("myEditor");
			
			//获得整个html的内容
			function getAllHtml(myEditor){
		        return UM.getEditor(myEditor).getAllHtml();
		    }
			
			//获取富文本编辑器的带有格式的文本
			function getPlainTxt(myEditor){
				return UM.getEditor(myEditor).getPlainTxt();
			}
			
			//获取富文本编辑器的纯文本内容
			function getEditText(myEditor){
				return UM.getEditor(myEditor).getContentTxt();
			}
			//给某个富文本框赋值
			function setEditorText(message,myEditor){
				 UM.getEditor(myEditor).setContent(message, false);//清空富文本编辑器
			}
			
			 /* 发表文章栏目  */
			 $(".fb_aritcle").click(function(){
				 $(this).parent().addClass("on").siblings().removeClass("on");
				 $(".musicUploadBox").slideUp();
				 $(".editerBox").slideDown();
			 });
			 /* 发表音乐栏目  */
			 $(".fb_music").click(function(){
				 $(this).parent().addClass("on").siblings().removeClass("on");
				 $(".editerBox").slideUp();
				 $(".musicUploadBox").slideDown();
			 });
			 /* 公告栏触发事件  */
			 $(".soup li").click(function(){
				 $(this).addClass("open").siblings().removeClass("open");
			 });
			 
			/*发表文章*/
			function saveContent(obj){
				var titleVal = $(".txt_title").val();
				var description = $(".txt_description").val();
				var img = $(".txt-pic img").attr("src");
				var contentVal = getPlainTxt("myEditor");
				var tagval = $("p .input").val();
				
				if(!titleVal || !description || !img || !contentVal || !tagval){
					loading("请填写完整内容",4);
					return false;
				}
				var params = {title:titleVal,description:description,image:img,content:contentVal,tag:tagval};
				$.ajax({
					type:"post",
					url:basePath+"/content/save.do",
					data:params,
					beforeSend:function(){loading("文章发表中请等待...",5);},
					success:function(data){
						var data = data.trim();
						if(data == "fail" || data=="error"){
							loading("文章发表失败...",5);
						}
						if(data == "success"){
							loading("文章发表成功...",5);
							location.reload();
							$(".editerBox").slideUp();
							$(".nav-tabs #content").trigger("click");
						}
					}
				}); 
			};
			
			// 音乐上传成功的回调函数
			var audioDom = document.getElementById("audio");
			function uploadsuccess(dom,jdata){
				if(jdata.target=="#img"){
					$(jdata.target).css("display","block").data("img",jdata.url).attr("src",basePath+jdata.url);
				}else if(jdata.target=="#preview"){
					$(jdata.target).css("display","block").attr("src",basePath+jdata.url);
				}else if(jdata.target=="#audio"){
					$(jdata.target).attr("src",basePath+jdata.url).data("link",jdata.url);
					$(jdata.target).attr("controls","controls").prev().hide();
					var name = jdata.name;
					var title = name.split("-")[1].trim().split(".")[0];
					var singer = name.split("-")[0];
					$(".m_size").val(jdata.size);
					$(".m_title").val(title);
					$(".m_singer").val(singer);
					
					audioDom.oncanplaythrough = function(){
						var time = this.duration;
						var m = Math.floor(time / 60) ;
						var s = Math.floor(time % 60);
						if(m<10) m = "0"+m;
						if(s<10) s = "0"+s;
						$(".m_time").val(m+":"+s);
					};
				}
			}
			/*发表音乐*/
			function saveMusic(obj){ //http://localhost:8080/MyBoke
				var img = $("#img").attr("src").substring(28);
				var src = $("#audio").attr("src").substring(28);
				var title = $(".m_title").val();
				var description = $(".m_description").val();
				var singer = $(".m_singer").val();
				var size = $(".m_size").val();
				var time = $(".m_time").val();
				var category_id = $(".m_category").val();
				
				if(!title || !description || !img || !category_id || !src || !singer || !size || !time){
					loading("请填写完整内容",4);
					return false;
				}
				var params = {title:title,description:description,img:img,categoryId:category_id,src:src,singer:singer,size:size,time:time};
				//alert(JSON.stringify(params));
				//return;
				$.ajax({
					type:"post",
					url:basePath+"/music/save.do",
					data:params,
					beforeSend:function(){loading("音乐发表中请等待...",5);},
					success:function(data){
						var data = data.trim();
						if(data == "fail" || data=="error"){
							loading("音乐发表失败...",5);
						}
						if(data == "success"){
							loading("音乐发表成功...",5);
							location.reload();
							$(".musicUploadBox").slideUp();
							$(".nav-tabs #music").trigger("click");
						}
					}
				}); 
			};
		</script>
	</body>
</html>
