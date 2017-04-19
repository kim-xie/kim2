package com.kim.web.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kim.bean.Params;
import com.kim.bean.User;
import com.kim.service.user.IUserService;
import com.kim.util.StringUtils;
import com.kim.util.ip.TmIpUtil;
import com.kim.web.BaseController;

/**
 * 用户模块web
 * UserController
 * 创建人:kim
 * 时间：2016年09月04日  11:53:31
 * @version 1.0.0
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
	
	@Resource(name="userService")
	private IUserService userService;
	
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
		return "user/list";
	}
	
	/**
	 * 注册
	 * @Title: list 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(User user) {
		if (user != null) {
			if (StringUtils.isNotEmpty(user.getName()) && StringUtils.isNotEmpty(user.getPassword()) && StringUtils.isNotEmpty(user.getEmail())) {
				user.setUserId(StringUtils.getUuid());
				user.setName(user.getName());
				user.setPassword(StringUtils.md5Base64(user.getPassword()));
				user.setActiveCode(StringUtils.getUuid());
				user.setHeaderPic("/resources/imgs/user/small.png");
				user.setIp(TmIpUtil.getIpAddress(request));
				user.setIpAddress(TmIpUtil.ipLocation(request));
				user.setIsActive(0);
				user.setIsForbid(0);
				user.setEmail(user.getEmail());
				user.setRoleId(1);
				user.setIsDelete(0);
				if (userService.saveUser(user)){
					return "success";
				}else{
					return "fail";
				}
			} else {
				return "null";
			}
		} else {
			return "error";
		}
	};
	
	/**
	 * 激活
	 * @Title: active 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param   参数说明 
	 * @return void  返回类型 
	 * @throws
	 */
	@RequestMapping("/active")
	public String active(){
		String activeCode = request.getParameter("activeCode");
		String flay = userService.active(activeCode);
		if(flay == "error"){
			return "fronts/user/activeError";
		}else if(flay == "fail"){
			return "fronts/user/activeFail";
		}else {
			return "fronts/user/activeSuccess";
		}
	}
	
	/**
	 * 校验用户名
	 * @Title: list 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/checkName")
	public String checkName(Params params){
		if(params != null){
			User user = userService.getUser(params);
			if(user != null && user.getName().equals(params.getName())){
				return "nameCorrect";
			}else{
				return "nameError";
			}
		}
		return "false";
	}
	/**
	 * 注册邮箱校验
	 * @Title: checkUserEmail
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param userEmail
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/checkEmail")
	public String checkEmail(String userEmail) {
		if (StringUtils.isEmail(userEmail)) {
			boolean email = userService.checkUserEmail(userEmail);
			if(email){
				return "EmailIsAlive";
			}else{
				return "EmailIsCorrect";
			}
		} else {
			return "emailError";
		}
	}
	
	/**
	 * 登录
	 * @Title: list 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/login")
	public String login(Params params){
		if(params != null){
			if(params.getVerifyCode() == null){
				params.setPassword(StringUtils.md5Base64(params.getPassword()));
				User user = userService.getUser(params);
				if(user != null && user.getName().equals(params.getName()) && user.getPassword().equals(params.getPassword()) && user.getIsActive().equals(1) && user.getIsForbid().equals(0) && user.getIsDelete().equals(0)){
					//将用户信息放到session中
					session.setAttribute("user",user);
					session.setAttribute("headerPic",user.getHeaderPic());
					//日记监控用户行为和获取请求参数
					request.getServletContext().setAttribute("user_log", user);
					//将登陆请求参数放到应用上下文中
					request.getServletContext().setAttribute("request_log", request);
					return "success";
				}else if(user.getIsActive().equals(0)){
					return "isNotActive";
				}else if(user.getIsForbid().equals(1)){
					return "isForbid";
				}else if(user.getIsDelete().equals(1)){
					return "isDelete";
				}else{
					return "pswError";
				}
			}else{
				//验证码验证
				/*if(params.getVerifyCode().equalsIgnoreCase(yzm)){
					//
				}*/
			}
			
		}
		return "false";
	}
	
	/**
	 * 查询所有User返回模板页面
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
		List<User> users = userService.findAllUsers(params);
		int count = userService.countUser(params);
		modelAndView.setViewName("fronts/user/template");
		modelAndView.addObject("users",users);
		modelAndView.addObject("itemCount",count);
		return modelAndView;
	}
	/**
	 * 添加保存User
	 * @Title: saveUser 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param user
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/save")
	public String saveUser(User user){
		if(user != null){
			User userSession = (User) request.getSession().getAttribute("user");
			user.setUserId(userSession.getUserId());
			user.setName(userSession.getName());
			user.setIsDelete(0);
			boolean faly = userService.saveUser(user);
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
	 * 查询User详情
	 * @Title: getUser 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/detail/{id}")
	public ModelAndView getUser(@PathVariable("id")Integer id,Params params){
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.getUser(params);
		modelAndView.setViewName("fronts/user/detail");
		modelAndView.addObject("user",user);
		return modelAndView;
	}
	/**
	 * 更新User
	 * @Title: updateUser 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateUser(User user){
		return userService.updateUser(user)?"success":"fail";
	}
	
	/**
	 * 删除User
	 * @Title: deleteUser 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deleteUser(Params Params){
		return userService.deleteUser(Params)?"success":"fail";
	}
}
