package com.kim.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kim.bean.User;
import com.kim.util.StringUtils;

public class LoginIntercetor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		
		System.out.println("登录拦截器进来了吗..........");
		
		User user =(User)request.getSession().getAttribute("user");
		
		if(user!=null){
			//放行
			return true;
		}else{
			//执行是一个ajax请求还是一个普通请求
			String requestType = request.getHeader("X-Requested-With");
			//如果是ajax请求
			if(StringUtils.isNotEmpty(requestType) && requestType.equalsIgnoreCase("XMLHttpRequest")){
				response.getWriter().print("logout");
			}else{
				response.sendRedirect(request.getContextPath()+"/login");
			}
			return false;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		
		System.out.println("请求结束执行的方法..........");
		
	}
	@Override
	public void afterCompletion(HttpServletRequest request,HttpServletResponse response, Object handler, Exception ex)throws Exception {
		
		System.out.println("响应已经被渲染成功后执行的方法..........");
		
	}

}
