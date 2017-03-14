package com.kim.web.music;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.kim.web.BaseController;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kim.bean.Music;
import com.kim.bean.Params;
import com.kim.service.music.IMusicService;

/**
 * 音乐模块web
 * MusicController
 * 创建人:kim
 * 时间：2016年10月05日  14:58:31
 * @version 1.0.0
 */
@Controller
@RequestMapping("/admin/music")
public class AdminMusicController extends BaseController{
	
	@Resource(name="musicService")
	private IMusicService musicService;
	
	/**
	 * 跳转到列表页面
	 * @Title: list 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@RequestMapping("/list")
	public String list(Params params){
		return "/admins/music/list";
	}
	
	/**
	 * 查询所有Music返回模板页面
	 * @Title: template 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/template")
	public ModelAndView template(Params params){
		ModelAndView modelAndView = new ModelAndView();
		List<HashMap<String, Object>> musics = musicService.findMusics(params);
		int count = musicService.countMusic(params);
		modelAndView.setViewName("/fronts/music/template");
		modelAndView.addObject("musics",musics);
		modelAndView.addObject("itemCount",count);
		return modelAndView;
	}
	/**
	 * @throws JSONException 
	 * 添加保存Music
	 * @Title: saveMusic 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param music
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/save")
	public String saveMusic(Music music) throws JSONException{
		if(music != null){
			//User userSession = (User) request.getSession().getAttribute("user");
			//music.setId(userSession.getId());
			//music.setName(userSession.getName());
			music.setUserId(1);
		  	//music.setLrc("");
		  	music.setCollections(0);
		  	music.setLoves(0);
		  	music.setListens(0);
		  	music.setComments(0);
			music.setIsDelete(0);
			System.out.println(JSONUtil.serialize(music));
			boolean faly = musicService.saveMusic(music);
			System.out.println(faly);
			if(faly){
				return "success";
			}else{
				return "fail";
			}
		}else{
			return "error";
		}
	}
	/**
	 * 查询Music详情
	 * @Title: getMusic 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/detail/{id}")
	public ModelAndView getMusic(@PathVariable("id")Integer id){
		ModelAndView modelAndView = new ModelAndView();
		Music music = musicService.getMusic(id);
		modelAndView.setViewName("music/detail");
		modelAndView.addObject("music",music);
		return modelAndView;
	}
	/**
	 * 更新Music
	 * @Title: updateMusic 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateMusic(Music music){
		return musicService.updateMusic(music)?"success":"fail";
	}
	
	/**
	 * 删除Music
	 * @Title: deleteMusic 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deleteMusic(Params Params){
		return musicService.deleteMusic(Params)?"success":"fail";
	}
}
