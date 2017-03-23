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
		<meta name="Keywords" content="">
		<meta name="Description" content="">
		<%@include file="/WEB-INF/pages/common/common.jsp"%>
	</head>
  	<style>
  		/* 音乐上传 start */
		.musicUploadBox{width:570px;margin:30px auto;}
		.musicUploadBox .editer{width:570px;height:100%;background:#fff;overflow:hidden;padding:10px;}
		.musicUploadBox .editer .upload_pic,.upload_music{position:relative;width:570px;height:218px;border:1px dashed #ccc;text-align:center;margin:20px 0;}
		.musicUploadBox .editer .upload_pic #prograssbar{position:absolute;top:-20px;left:0;height:10px;background:green;width:0%;}
		.musicUploadBox .editer .upload_music{height:60px;}
		.musicUploadBox .editer .upload_pic .m-pic{line-height:218px;font-size:20px;color:#999;font-weight:600;}
		.musicUploadBox .editer .upload_music .m-src{line-height:60px;font-size:20px;color:#999;font-weight:600;}
		.musicUploadBox .editer .upload_pic .m-pic #img{position:absolute;top:0;left:0;}
		.musicUploadBox .editer .upload_pic .m-pic,.m-src a{text-decoration: none;}
		.musicUploadBox .editer p{float:left;font-size:14px;font-weight:600;margin:12px 0;}
		.musicUploadBox .editer p .input{width:487px;height:30px;font-size:16px;font-weight:600;text-indent:0.5em;}
		.musicUploadBox .editer p .fabiao{height:30px;line-height:30px;padding:0 18px;}
		.musicUploadBox .editer p .fabiao .submit{padding:10px 25px;outline:none;border:none;background:#0033ff;transition:1s;border-radius:5px;cursor:pointer;font-size:14px;font-weight:600;color:#fff;}
		.musicUploadBox .editer p .fabiao .submit:hover{background:#0033cc;transition:1s;}
		/* 音乐上传 end */
  	</style>
  	<body>
  	
    	<!--音乐上传 -->
		<div class="musicUploadBox">
		 	<div class="editer">
		 		<div class="upload_pic uploadFile">
		 			<input type="file" id="file" accept="image/jpg,image/jpeg,image/png,image/gif" onchange="uploadFile(this)" style="display:none;">
		 			<span class="m-pic">
		 				<a href="javascript:void(0);" onclick="openBrowse(this,'#img')">请添加封面图片</a>
		 				<img id="img" src="" data-img="" width="548" data-dir="music/img" height="218" style="display:none;">
		 			</span>
		 			<!-- <span id="prograssbar"></span>  -->
		 		</div>
		 		
		 		<div class="upload_music uploadFile">
		 			<input type="file" id="file" accept="audio/mp3" onchange="uploadFile(this)" style="display:none;">
		 			<span class="m-src">
		 				<a href="javascript:void(0);" onclick="openBrowse(this,'#audio')">请添加音乐</a>
		 				<audio id="audio" src="" data-link="" data-dir="music/mp3"></audio>
		 			</span>
		 		</div>
		 		
		 		<div class="upload_lrc uploadFile">
		 			<input type="file" id="file" onchange="uploadFile(this)" style="display:none;">
		 			<span class="m-src">
		 				<a href="javascript:void(0);" onclick="openBrowse(this,'#lrc')">请添加歌词</a>
		 				<textarea id="lrc" data-link="" data-dir="music/lrc"></textarea>
		 			</span>
		 		</div>
		 		
		 		<p>
		 			音乐描述：
		 			<input type="text" class="input m_description" placeholder="描述不得超过200个字" maxlength="200">
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
					所属专辑：
					<input type="text" class="input m_album"  placeholder="所属专辑">	
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
						<input type="button" class="submit" value="确认上传" onclick="saveMusic(this);">
					</span>
		 		</p>
		 	</div>
		 </div>
		 <!--音乐上传 end-->
		 
		 <script type="text/javascript" src="${basePath}/resources/js/upload.js"></script>
		 <script type="text/javascript">
			
			// 音乐上传成功的回调函数
			var audioDom = document.getElementById("audio");
			function uploadsuccess(dom,jdata){
				if(jdata.target=="#img"){
					$(jdata.target).css("display","block").data("img",jdata.url).attr("src",basePath+jdata.url);
				}else if(jdata.target=="#preview"){
					$(jdata.target).css("display","block").attr("src",basePath+jdata.url);
				}else if(jdata.target=="#lrc"){
					$(jdata.target).text(jdata.url);
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
				var image = $("#img").attr("src").substring(21);
				var playSrc = $("#audio").attr("src").substring(21);
				var title = $(".m_title").val();
				var album = $(".m_album").val();
				var descriptions = $(".m_description").val();
				var singer = $(".m_singer").val();
				var size = $(".m_size").val();
				var time = $(".m_time").val();
				var category_id = $(".m_category").val();
				
				if(!title || !descriptions || !image || !category_id || !playSrc || !singer || !size || !time || !album){
					loading("请填写完整内容",4);
					return false;
				}
				var params = {title:title,descriptions:descriptions,image:image,categoryId:category_id,playSrc:playSrc,singer:singer,size:size,time:time,album:album};
				alert(JSON.stringify(params));
				//return;
				$.ajax({
					type:"post",
					url: adminPath+"/music/save",
					data: params,
					//beforeSend:function(){loading("音乐发表中请等待...",5,true);},
					success:function(data){
						alert(data)
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
