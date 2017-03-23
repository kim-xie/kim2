package com.kim.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController extends BaseController{
	/**
	 * 前台页面
	 * @Title: index 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	@RequestMapping("/index")
	public String index(){
		return "fronts/index";
	}
	
	@RequestMapping("/index1")
	public String index1(){
		return "fronts/index1";
	}
	
	@RequestMapping("/login")
	public String login(){
		return "fronts/login";
	}
	
	@RequestMapping("/error")
	public String error(){
		return "common/error";
	}
	
	@RequestMapping("/tologin")
	public String login1(){
		return "fronts/login1";
	}
	
	@RequestMapping("/regist")
	public String regist(){
		return "fronts/regist";
	}
	
	@RequestMapping("/logout")
	public String logout(){
		session.invalidate();
		return "fronts/login";
	}
	
	/**
	 * 后台页面
	 * @Title: index 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	@RequestMapping("/admin/index")
	public String adminIndex(){
		return "admins/index";
	}
	
	@RequestMapping("/admin/login")
	public String adminLogin(){
		return "admins/login";
	}
	
	@RequestMapping("/admin/error")
	public String adminError404(){
		return "admins/common/error404";
	}
	
}
