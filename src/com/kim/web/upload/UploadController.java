package com.kim.web.upload;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kim.util.ImageUtil;
import com.kim.util.StringUtils;
import com.kim.util.TmFileUtil;
import com.kim.web.BaseController;

@Controller
@RequestMapping("/upload")
public class UploadController extends BaseController{
	/**
	 * 调转到头像上传页面
	 * @Title: index 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@RequestMapping("/toUpload")
	public String index(){
		return "upload/upload";
	}
	/**
	 * 音乐上传
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param file
	 * @param @param request
	 * @param @param response
	 * @param @return
	 * @param @throws IllegalStateException
	 * @param @throws IOException
	 * @param @throws JSONException  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/file")
	public String uploadMusic(@RequestParam("doc") MultipartFile file) throws IllegalStateException, IOException, JSONException{
		//获取原文件名
		String oldName = file.getOriginalFilename();
		// 文件大小
		long size = file.getSize();
		// 文件大小单位为KB
		String sizeString = TmFileUtil.countFileSize(size);
		// 生成的新的文件名
		String newFileName = TmFileUtil.generateFileName(oldName, 10, "yyyyMMddHHmmss");
		//获取文件后缀
		String ext = oldName.substring(oldName.lastIndexOf(".")+1);
		//獲取文件的目錄
		String dir = request.getParameter("dir");
		if(StringUtils.isEmpty(dir))dir = "imgs";
		String fpath = "/resources/"+dir+"/";
		@SuppressWarnings("deprecation")
		String path = request.getRealPath(fpath);
		String url = fpath + newFileName;
		File parent = new File(path);
		if(!parent.exists())parent.mkdirs();
		//上传文件到目标文件夹--文件的赋值
		file.transferTo(new File(parent, newFileName));// 文件上传
		
		/*String url = null;
		if(TmStringUtils.isNotEmpty(ext)&& ext.equalsIgnoreCase("mp3")){
			@SuppressWarnings("deprecation")
			String path = request.getRealPath("/resources/mp3/song");
			File parent = new File(path);
			if(!parent.exists())parent.mkdirs();
			//上传文件到目标文件夹--文件的赋值
			file.transferTo(new File(parent, newFileName));// 文件上传
			// 保存路径
			url = "/resources/mp3/song/"+newFileName;
		}
		
		if(TmStringUtils.isNotEmpty(ext)&& ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("jpeg") || ext.equalsIgnoreCase("png") ||ext.equalsIgnoreCase("gif")){
			@SuppressWarnings("deprecation")
			String path = request.getRealPath("/resources/mp3/img");
			File parent = new File(path);
			if(!parent.exists())parent.mkdirs();
			//上传文件到目标文件夹--文件的赋值
			file.transferTo(new File(parent, newFileName));// 文件上传
			// 保存路径
			url = "/resources/mp3/img/"+newFileName;
		}*/
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", oldName);// 文件的原始名称
		map.put("newName", newFileName);// 文件的新名称
		map.put("ext", ext);// 文件的后缀
		map.put("size", size);// 文件的真实大小
		map.put("url",url);// 获取文件的具体服务器的目录
		return JSONUtil.serialize(map);
	}
	
	/**
	 * @Title: upload 
	 * @Description: TODO(头像上传) 
	 * @param @param file
	 * @param @return
	 * @param @throws IllegalStateException
	 * @param @throws IOException
	 * @param @throws JSONException  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody 
	@RequestMapping(method=RequestMethod.POST,value="/upload")
	public String upload(@RequestParam("doc") MultipartFile file)
			throws IllegalStateException, IOException, JSONException {
		
		if(!file.isEmpty()){
			
			@SuppressWarnings("deprecation")
			String path = request.getRealPath("/resources/imgs/header_pic");
			File parent = new File(path);
			if(!parent.exists())parent.mkdirs();
			
			System.out.println("获取文件数据================="+file.getBytes());
			System.out.println("获取文件的MINE类型================="+file.getContentType());
			System.out.println("获取文件的名称================="+file.getName());
			System.out.println("获取上传文件的原名================="+file.getOriginalFilename());
			System.out.println("获取文件的大小================="+file.getSize());
			System.out.println("判断是否有文件上传================="+file.isEmpty());
			
			// 装载要返回的数据
			HashMap<String, Object> map = new HashMap<String,Object>();
			// 上传时的文件名
			String oldName = file.getOriginalFilename();
			// 文件大小
			long size = file.getSize();
			// 文件大小单位为KB
			String sizeString = TmFileUtil.countFileSize(size);
			// 文件后缀名
			String ext = TmFileUtil.getExtNoPoint(oldName);
			// 生成的新的文件名
			String newFileName = TmFileUtil.generateFileName(oldName, 10, "yyyyMMddHHmmss");
			// 保存路径
			String url = "/resources/imgs/header_pic/"+newFileName;
			// 转存文件
			file.transferTo(new File(parent, newFileName));
			
			map.put("oldname",oldName);
			map.put("ext",ext);
			map.put("sizeString",sizeString);
			map.put("size",size);
			map.put("name",newFileName);
			map.put("url",url);
			
			return JSONUtil.serialize(map);
		}else{
			return null;
		}
	}
	/**
	 * @Title: cutImages 
	 * @Description: TODO(头像裁剪) 
	 * @param @return
	 * @param @throws IOException  参数说明 
	 * @return HashMap<String,Object>  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/cutImg",method=RequestMethod.POST)
	public String cutImages() throws IOException{
		//拿到上传的图片
		String bigSrc = request.getParameter("bgsrc");
		//头像裁剪：必须图片是覆盖
		//拿到目标图片
		String smallSrc = request.getParameter("smallsrc");
		
		if(!bigSrc.isEmpty() && !smallSrc.isEmpty()){
			//上传图片的路径
			String realpath = contextProvider.getApplicationRealPath(bigSrc);
			//裁剪后存放的目标路径
			String targetPath = contextProvider.getApplicationRealPath(smallSrc);
			
			//根据路径创建文件
			File file = new File(targetPath);
			//拿到文件所在的目录
			File pFile = file.getParentFile();
			//如果不存在进行创建
			if(!pFile.exists())pFile.mkdirs();
			
			//获取图片裁剪的具体尺寸
			Integer x = Integer.parseInt(request.getParameter("x"));
			Integer y = Integer.parseInt(request.getParameter("y"));
			Integer w = Integer.parseInt(request.getParameter("w"));
			Integer h = Integer.parseInt(request.getParameter("h"));
			
			//裁剪图片
			ImageUtil.cutImage(realpath,targetPath,x,y,w,h);
			
			//上传的原图删除调
			new File(realpath).delete();
			
			return "success";
			
		}else{
			return "fail";
		}
	}
}