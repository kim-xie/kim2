<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>写文章</title>
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
		/*文本编辑器 start*/
		.editerBox{width:1160px;margin:30px auto;margin-top:80px;background:#fff;border:#ddd 1px solid;border-radius:4px;padding:10px;}
		.editerBox .editer{width:100%;height:100%;background:#fff;overflow:hidden;}
		.editerBox .editer .headerWrap:after{content:" ";display:block;clear:both;height:0;overflow:hidden;}
		.editerBox .editer .leftBox{display:inline-block;width:56%;float:left;}
		.editerBox .editer .leftBox .title{display:inline-block;width:100%;height:30px;margin:10px 0;font-size:18px;font-weight:500;}
		.editerBox .editer .leftBox .title span{display:inline-block;width:10%;height:30px;line-height: 30px;}
		.editerBox .editer .leftBox .title input{display:inline-block;width:88%;height:30px;float:right;font-size:14px;font-weight:500;text-indent:0.5em;color:#666;}
		.editerBox .editer .rightBox{display:inline-block;width:40%;float:right;}
		.editerBox .editer .rightBox .upload_pic{position:relative;height:350px;border:1px dashed #ccc;text-align:center;margin:10px 0 0 0;overflow:hidden;}
		.editerBox .editer .rightBox .upload_pic .txt-pic{line-height:320px;font-size:20px;color:#999;font-weight:600;}
		.editerBox .editer .rightBox .upload_pic .txt-pic #preview{position:absolute;top:0;left:0;cursor:pointer;}
		.editerBox .editer .rightBox .upload_pic .txt-pic p{position:absolute;z-index:2;bottom:-36px;left:0;cursor:pointer;width:100%;height:36px;line-height:36px;background:#000;opacity:0;transition:bottom 0.6s,opacity 0.6s}
		.editerBox .editer .rightBox .upload_pic .txt-pic:hover p{bottom:0;opacity:0.5;transition:bottom 0.6s,opacity 0.6s}
		.editerBox .editer .rightBox .upload_pic .txt-pic p a{color:#fff;}
		.editerBox .editer .rightBox .upload_pic .txt-pic p:hover a{color:#0076e3;}
		.editerBox .editer .rightBox .upload_pic .txt-pic a{text-decoration: none;color:#666;}
		.editerBox .editer .rightBox .upload_pic .txt-pic a:hover{color:#0076e3;}
		/* 分类标签 start */
		.editerBox .editer .select{padding:5px 0px;width:100%;margin:0 auto;font-size:12px;}
		.editerBox .editer .select .select-list{border-bottom:#eee 1px dashed;}
		.editerBox .editer .select li{list-style:none;padding:10px 0 5px 72px;}
		.editerBox .editer .select dl{zoom:1;position:relative;line-height:24px;}
		.editerBox .editer .select dt{width:100px;margin-bottom:5px;position:absolute;top:0;left:-100px;text-align:right;color:#666;height:24px;line-height:24px;font-size:14px;}
		.editerBox .editer .select dd{float:left;display:inline;margin:0 0 5px 5px;}
		.editerBox .editer .select a{display:inline-block;white-space:nowrap;height:24px;padding:0 10px;text-decoration:none;color:#039;border-radius:2px;}
		.editerBox .editer .select .selected a{color:#fff;background-color:#3498db;}
		.editerBox .editer .select-result dt{font-weight:bold;font-size:14px;}
		.editerBox .editer .select dl:after{content:" ";display:block;clear:both;height:0;overflow:hidden;}
		.editerBox .editer .select-no{color:#999;}
		.editerBox .editer .select .select-result a:hover{background-position:right -15px;}
		.editerBox .editer .select .select-result a{padding-right:20px;background:#3498db url("${basePath}/resources/imgs/contentDetail/close.gif") right 9px no-repeat;}
		.editerBox .editer .select .selected a{color:#fff;background-color:#3498db;}
		.editerBox .editer .select a:hover{color:#3498db;background-color:#f3edc2;}
		/* 分类标签 end */
		.editerBox .editer .articleWrap{margin-top:20px;border-top:2px dashed #ddd;}
		.editerBox .editer .articleWrap p{width:100%;height:32px;line-height:32px;padding: 5px 0;text-align:left;}
		.editerBox .editer .articleWrap p span{display:inline-block;font-size:18px;font-weight:500;}
		
		/* 发表文章 */
		.editerBox .editer p.sendWrap{font-size:14px;font-weight:600;margin:20px auto;text-align:center;}
		.editerBox .editer p.sendWrap .fabiao{display:inline-block;width:20%;height:36px;line-height:36px;}
		.editerBox .editer p.sendWrap .fabiao .submit{width:100%;height:100%;padding:0 10px;outline:none;border:none;background:#3498db;transition:1s;border-radius:8px;cursor:pointer;font-size:14px;font-weight:600;color:#fff;}
		.editerBox .editer p.sendWrap .fabiao .submit:hover{background:#0033cc;transition:1s;}
		/*文本编辑器 end*/
		
	</style>
	  <link rel="stylesheet" type="text/css" href="${basePath}/resources/editor/css/editormd.min.css">
	  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/editor/js/editormd.min.js"></script>
	  <script type="text/javascript" src="${basePath}/resources/js/kim_upload.js"></script>
	<body>
		<input type="hidden" class="nav_model" value="写文章">
		<!-- 顶部导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/header.jsp"%>
		<!-- 顶部导航  end -->
		
		<!-- 内容区域  start -->
		<div id="mainWrap">
			 <!--文本编辑器 start-->
			 <div class="editerBox">
			 	<div class="editer">
			 		<div class="headerWrap">
			 			<div class="leftBox">
				 			<span class="title">
					 			<span>标题:</span>
					 			<input type="text" placeholder="标题不得超过50个字" maxlength="50" class="txt_title" value="${article.title}">
					 		</span>
					 		<span class="description title">
					 			<span>介绍:</span>
					 			<input type="text" placeholder="介绍不得超过200个字" maxlength="200" class="txt_description" value="${article.description}">
					 		</span>
					 		<span class="title">
					 			<span>标签:</span>
							 	<ul class="select">
									<li class="select-list">
										<dl id="select1">
											<dt>前端：</dt>
											<dd class="select-all selected" onclick="addTag(this)"><a href="javascript:void(0)" title="全部">全部</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="javascript">javascript</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="jquery">jquery</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="angular">angular</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="bootstrap">bootstrap</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="vue">vue</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="react">react</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="html/css">html/css</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="node">node</a></dd>
										</dl>
									</li>
									<li class="select-list">
										<dl id="select2">
											<dt>后台：</dt>
											<dd class="select-all selected" onclick="addTag(this)"><a href="javascript:void(0)" title="全部">全部</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="java">java</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="spring">spring</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="springMvc">springMvc</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="mybatis">mybatis</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="struts2">struts2</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="habernate">habernate</a></dd>
										</dl>
									</li>
									<li class="select-list">
										<dl id="select3">
											<dt>数据库：</dt>
											<dd class="select-all selected" onclick="addTag(this)"><a href="javascript:void(0)" title="全部">全部</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="mysql">mysql</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="mongodb">mongodb</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="oracle">oracle</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="db2">db2</a></dd>
										</dl>
									</li>
									<li class="select-list">
										<dl id="select4">
											<dt>其他：</dt>
											<dd class="select-all selected" onclick="addTag(this)"><a href="javascript:void(0)" title="全部">全部</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="前端安全">前端安全</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="性能优化">性能优化</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="类库框架">类库框架</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="面试经验">面试经验</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="手机移动">手机移动</a></dd>
											<dd onclick="addTag(this)"><a href="javascript:void(0)" title="工具介绍">工具介绍</a></dd>
										</dl>
									</li>
									<li class="select-result">
										<dl>
											<dt>已选标签：</dt>
											<dd class="select-no">暂时没有选择的标签</dd>
										</dl>
									</li>
								</ul>
					 		</span>
				 		</div>
				 		
				 		<div class="rightBox">
				 			<div class="upload_pic">
				 				<input type="file" id="file" onchange="uploadFile()" style="display:none;"> 
					 			<span class="txt-pic">
					 				<a class="uploadPic" href="javascript:void(0);" onclick="openBrowse(this,'#preview')">请添加封面图片</a>
					 				<img id="preview" src="" data-dir="imgs/contentImg" width="100%" height="100%">
					 			</span>
					 		</div>
				 		</div>
			 		</div>
			 		
			 		<div class="articleWrap">
			 			<p><span>文章正文:</span></p>
			 			<div id="editormd">
			 				<textarea style="display:none;">${article.article}</textarea>
			 			</div>
			 		</div>
			 		
			 		<p class="sendWrap">
						<span class="fabiao">
							<input type="button" class="submit" value="发表文章" onclick="saveContent(this);">
						</span>
			 		</p>
			 		
			 	</div>
			 </div>
			 <!--文本编辑器 end-->
		</div>
		<!-- 内容区域  end -->
		
		<!-- 底部导航  start -->
		<%@include file="/WEB-INF/pages/fronts/common/footer.jsp"%>
		<!-- 底部导航  end -->
		<script type="text/javascript"> 
			var Editor;
			$(function() {
				//初始化文本编辑器
	        	   Editor = editormd("editormd", {
	                   width   				: "99.8%",
	                   path    				: basePath + "/resources/editor/lib/",
	                   pluginPath    		: basePath + "/resources/editor/plugins/",
	                   saveHTMLToTextarea 	: true,//保存html到textarea
	                   htmlDecode			: false,//开启html标签解析
	                   mode                 : "gfm",          //gfm or markdown
	                   theme                : "default",
	                   name                 : "",
	                   value                : "",             // value for CodeMirror, if mode not gfm/markdown
	                   markdown             : "",
	                   appendMarkdown       : "",             // if in init textarea value not empty, append markdown to textarea
	                   delay                : 0,            // Delay parse markdown to html, Uint : ms
	                   autoLoadModules      : true,           // Automatic load dependent module files
	                   watch                : true,
	                   placeholder          : "Enjoy Markdown! coding now...",
	                   gotoLine             : true,
	                   codeFold             : true,
	                   autoHeight           : false,
	           		   autoFocus            : true,
	                   autoCloseTags        : true,
	                   searchReplace        : true,
	                   syncScrolling        : false,
	                   readOnly             : false,
	                   tabSize              : 4,
	           		   indentUnit           : 4,
	                   lineNumbers          : true,
	           		   lineWrapping         : true,
	           		   autoCloseBrackets    : true,
	           		   showTrailingSpace    : true,
	           		   matchBrackets        : true,
	           		   indentWithTabs       : true,
	           		   styleSelectedText    : true,
	                   matchWordHighlight   : true,           // options: true, false, "onselected"
	                   styleActiveLine      : true,           // Highlight the current line
	                   dialogLockScreen     : true,
	                   dialogShowMask       : true,
	                   dialogDraggable      : true,
	                   dialogMaskBgColor    : "#fff",
	                   dialogMaskOpacity    : 0.1,
	                   fontSize             : "14px",
	                   disabledKeyMaps      : [],
	                   onload               : function() {
	                	   $("#editormd").css("min-height","260px");
	                	   $(".editormd-preview").css("min-height","260px");
	                	   $("#editormd").height($(".editormd-preview-container").innerHeight());
	                	   $(".editormd-preview").height($(".editormd-preview-container").innerHeight());
	                   },
	                   onresize             : function() {},
	                   onchange             : function() {},
	                   onwatch              : null,
	                   onunwatch            : null,
	                   onpreviewing         : function() {
	                	   
	                   },
	                   onpreviewed          : function() {
	                	   
	                   },
	                   onfullscreen         : function() {},
	                   onfullscreenExit     : function() {},
	                   onscroll             : function() {},
	                   onpreviewscroll      : function() {},
	                   
	                   imageUpload          : false,
	                   imageFormats         : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
	                   imageUploadURL       : "",
	                   crossDomainUpload    : false,
	                   uploadCallbackURL    : "",
	                   
	                   toc                  : true,           // Table of contents
	                   tocm                 : false,           // Using [TOCM], auto create ToC dropdown menu
	                   tocTitle             : "",             // for ToC dropdown menu btn
	                   tocDropdown          : false,
	                   tocContainer         : "",
	                   tocStartLevel        : 1,              // Said from H1 to create ToC
	                   pageBreak            : true,           // Enable parse page break [========]
	                   atLink               : true,           // for @link
	                   emailLink            : true,           // for email address auto link
	                   taskList             : true,          // Enable Github Flavored Markdown task lists
	                   emoji                : true,          // :emoji: , Support Github emoji, Twitter Emoji (Twemoji);
	                                                          // Support FontAwesome icon emoji :fa-xxx: > Using fontAwesome icon web fonts;
	                                                          // Support Editor.md logo icon emoji :editormd-logo: :editormd-logo-1x: > 1~8x;
	                   tex                  : true,          // TeX(LaTeX), based on KaTeX
	                   flowChart            : true,          // flowChart.js only support IE9+
	                   sequenceDiagram      : true,          // sequenceDiagram.js only support IE9+
	                   previewCodeHighlight : true,
	                           
	                   toolbar              : true,           // show/hide toolbar
	                   toolbarIcons : function() {
	                       // Or return editormd.toolbarModes[name]; // full, simple, mini
	                       // Using "||" set icons align right.
	                       return [ "undo", "redo", "|", 
	                                "bold", "del", "italic", "quote", "ucwords", "uppercase", "lowercase", "|", 
	                                "h1", "h2", "h3", "h4", "h5", "h6", "|", 
	                                "list-ul", "list-ol", "hr", "|",
	                                "link", "reference-link", "image", "code", "preformatted-text", "code-block", "table", "datetime", "emoji", "html-entities", "pagebreak", "|",
	                                "watch", "preview", "fullscreen", "clear"
	                              ]
	                   },
	               });
				
				
				/* 显示修改的图片  */
				if(isNotEmpty("${article.image}")){
					$("#preview").show().attr("src","${article.image}").css("z-index","1");
					$(".txt-pic").append("<p><a class='editPic' href='javascript:void(0);' style='font-size:16px;'>编辑封面图片</a></p>");
					$(".txt-pic a.editPic").attr("onclick","openBrowse(this,'#preview')");
				}else{
					$("#preview").hide().css("z-index","-1");
				}
				
				/* 选中修改的标签  */
				if(isNotEmpty("${article.tag}")){
					var tags = "${article.tag}".split(",");
					for(var i=0;i<tags.length;i++){
						$(".select .select-list").find("dd a[title='"+tags[i]+"']").parent().trigger("click");
					}
				}else{
					
				}
				
            });
			
			//上传成功后回调
			function uploadsuccess(dom,jdata){
				if(jdata.target=="#preview"){
					$(jdata.target).show().attr("src",basePath+jdata.url).css("z-index","1");
					$(".txt-pic").append("<p><a class='editPic' href='javascript:void(0)' style='font-size:16px;'>编辑封面图片</a></p>");
					$(".txt-pic a.editPic").attr("onclick","openBrowse(this,'#preview')");
				}
			}
			
			//选择标签
			function addTag(obj){
				var parentDom = $(obj).parent();
				$(obj).addClass("selected").siblings().removeClass("selected");
				if ($(obj).hasClass("select-all")) {
					if(parentDom.attr("id").indexOf("1")!=-1){
						$("#selectA").remove();
					}else if(parentDom.attr("id").indexOf("2")!=-1){
						$("#selectB").remove();
					}else if(parentDom.attr("id").indexOf("3")!=-1){
						$("#selectC").remove();
					}else if(parentDom.attr("id").indexOf("4")!=-1){
						$("#selectD").remove();
					}
				}else{
					var copyDom = "";
					var copyDomId = "";
					if(parentDom.attr("id").indexOf("1")!=-1){
						copyDom = $("#selectA");
						copyDomId = "selectA";
					}else if(parentDom.attr("id").indexOf("2")!=-1){
						copyDom = $("#selectB");
						copyDomId = "selectB";
					}else if(parentDom.attr("id").indexOf("3")!=-1){
						copyDom = $("#selectC");
						copyDomId = "selectC";
					}else if(parentDom.attr("id").indexOf("4")!=-1){
						copyDom = $("#selectD");
						copyDomId = "selectD";
					}
					if (copyDom.length > 0) {
						copyDom.find("a").html($(obj).text());
					} else {
						$(".select-result dl").append($(obj).clone().attr({"id": copyDomId,"onclick": "removeTag(this)"}));
					}
				}
				if($(".select-result dd").length > 1) {
					$(".select-no").hide();
				}else{
					$(".select-no").show();
				}
			}
		
			//删除选中的标签
			function removeTag(obj){
				var removeDom = "";
				if($(obj).attr("id").indexOf("A")!=-1){
					removeDom = $("#select1 .select-all");
				}else if($(obj).attr("id").indexOf("B")!=-1){
					removeDom = $("#select2 .select-all");
				}else if($(obj).attr("id").indexOf("C")!=-1){
					removeDom = $("#select3 .select-all");
				}else if($(obj).attr("id").indexOf("D")!=-1){
					removeDom = $("#select4 .select-all");
				}
				removeDom.addClass("selected").siblings().removeClass("selected");
				$(obj).remove();
			}
			
			//获取标签
			function getTag(){
				var selectTag = $(".select-result").find("dd.selected a");
				var tags = [];
				selectTag.each(function(){
					tags.push($(this).text());
				});
				return tags.join(",");
			}
			 
			/*发表文章*/
			function saveContent(obj){
				var titleVal = $(".txt_title").val();
				var description = $(".txt_description").val();
				var img = $(".txt-pic img").attr("src");
				var contentVal = Editor.getMarkdown();  //.getHTML();.getMarkdown();
				var tagval = getTag();
				
				if(!titleVal || !description || !img || !contentVal || !tagval){
					layer.msg("请填写完整内容...");
					return false;
				}
				var params = {title:titleVal,description:description,image:img,article:contentVal,tag:tagval};
				$.ajax({
					type: "post",
					url: basePath+"/article/save",
					data: params,
					beforeSend:function(){layer.msg("文章发表中请等待...");},
					success:function(data){
						if(data == "fail" || data=="error"){
							layer.msg("文章发表失败...");
						}
						if(data == "success"){
							layer.msg("文章发表成功...");
							setTimeout(function(){
								window.location.href = "${basePath}/index";
							},2000);
						}
					}
				}); 
			};
			
			
			
			
		</script>
	</body>
</html>
