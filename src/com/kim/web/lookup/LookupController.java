package com.kim.web.lookup;

import java.util.List;
import javax.annotation.Resource;
import com.kim.web.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kim.bean.Lookup;
import com.kim.bean.Params;
import com.kim.bean.User;
import com.kim.service.lookup.ILookupService;

/**
 * 数据字典模块web
 * LookupController
 * 创建人:kim
 * 时间：2017年03月23日  15:05:47
 * @version 1.0.0
 */
@Controller
@RequestMapping("/lookup")
public class LookupController extends BaseController{
	
	@Resource(name="lookupService")
	private ILookupService lookupService;
	
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
		return "lookup/list";
	}
	
	/**
	 * 查询所有Lookup返回模板页面
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
		List<Lookup> lookups = lookupService.findLookups(params);
		int count = lookupService.countLookup(params);
		modelAndView.setViewName("lookup/template");
		modelAndView.addObject("lookups",lookups);
		modelAndView.addObject("itemCount",count);
		return modelAndView;
	}
	/**
	 * 添加保存Lookup
	 * @Title: saveLookup 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param lookup
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/save")
	public String saveLookup(Lookup lookup){
		if(lookup != null){
			User userSession = (User) request.getSession().getAttribute("user");
			lookup.setUserId(userSession.getUserId());
			lookup.setName(userSession.getName());
			lookup.setIsDelete(0);
			boolean faly = lookupService.saveLookup(lookup);
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
	 * 查询Lookup详情
	 * @Title: getLookup 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/detail/{id}")
	public ModelAndView getLookup(@PathVariable("id")Integer id){
		ModelAndView modelAndView = new ModelAndView();
		Lookup lookup = lookupService.getLookup(id);
		modelAndView.setViewName("lookup/detail");
		modelAndView.addObject("lookup",lookup);
		return modelAndView;
	}
	/**
	 * 更新Lookup
	 * @Title: updateLookup 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateLookup(Lookup lookup){
		return lookupService.updateLookup(lookup)?"success":"fail";
	}
	
	/**
	 * 删除Lookup
	 * @Title: deleteLookup 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deleteLookup(Params Params){
		return lookupService.deleteLookup(Params)?"success":"fail";
	}
}
