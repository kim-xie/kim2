package com.kim.web.lookupdf;

import java.util.List;
import javax.annotation.Resource;
import com.kim.web.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kim.bean.Lookupdf;
import com.kim.bean.Params;
import com.kim.bean.User;
import com.kim.service.lookupdf.ILookupdfService;

/**
 * 数据字典模块web
 * LookupdfController
 * 创建人:kim
 * 时间：2017年03月23日  15:13:38
 * @version 1.0.0
 */
@Controller
@RequestMapping("/lookupdf")
public class LookupdfController extends BaseController{
	
	@Resource(name="lookupdfService")
	private ILookupdfService lookupdfService;
	
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
		return "lookupdf/list";
	}
	
	/**
	 * 查询所有Lookupdf返回模板页面
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
		List<Lookupdf> lookupdfs = lookupdfService.findLookupdfs(params);
		int count = lookupdfService.countLookupdf(params);
		modelAndView.setViewName("lookupdf/template");
		modelAndView.addObject("lookupdfs",lookupdfs);
		modelAndView.addObject("itemCount",count);
		return modelAndView;
	}
	/**
	 * 添加保存Lookupdf
	 * @Title: saveLookupdf 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param lookupdf
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/save")
	public String saveLookupdf(Lookupdf lookupdf){
		if(lookupdf != null){
			User userSession = (User) request.getSession().getAttribute("user");
			lookupdf.setUserId(userSession.getUserId());
			lookupdf.setName(userSession.getName());
			lookupdf.setIsDelete(0);
			boolean faly = lookupdfService.saveLookupdf(lookupdf);
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
	 * 查询Lookupdf详情
	 * @Title: getLookupdf 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/detail/{id}")
	public ModelAndView getLookupdf(@PathVariable("id")Integer id){
		ModelAndView modelAndView = new ModelAndView();
		Lookupdf lookupdf = lookupdfService.getLookupdf(id);
		modelAndView.setViewName("lookupdf/detail");
		modelAndView.addObject("lookupdf",lookupdf);
		return modelAndView;
	}
	/**
	 * 更新Lookupdf
	 * @Title: updateLookupdf 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateLookupdf(Lookupdf lookupdf){
		return lookupdfService.updateLookupdf(lookupdf)?"success":"fail";
	}
	
	/**
	 * 删除Lookupdf
	 * @Title: deleteLookupdf 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deleteLookupdf(Params Params){
		return lookupdfService.deleteLookupdf(Params)?"success":"fail";
	}
}
