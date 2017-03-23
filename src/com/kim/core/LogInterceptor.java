package com.kim.core;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.ServletContextAware;

import com.kim.bean.Log;
import com.kim.bean.User;
import com.kim.dao.log.ILogMapper;
import com.kim.util.StringUtils;
/**
 * 类名: LogInterceptor.java
 * 创建人: kim 
 * 创建时间：2016年5月20日 下午2:07:41 
 * @version 1.0.0
 */
@Aspect
public class LogInterceptor implements ServletContextAware {
	// 注入上下文应用拿到ip和username
	private ServletContext application;
	
	// 注入mapper
	@Resource(name="logMapper")
	private ILogMapper logMapper;
	
	// 配置环绕通知
	@Around("execution(* com.kim.service..*.*(..))")
	public Object doBasicProfiling(ProceedingJoinPoint point) throws Throwable {
		
		//System.out.println("进来了吗？");
		
		// 获取方法名
		String methodName = point.getSignature().getName();
		
		// 获取模块名
		String content = null;
		if(StringUtils.isNotEmpty(methodName) && methodName.indexOf("User")!=-1){
			content = "user";
		}else if(StringUtils.isNotEmpty(methodName) && methodName.indexOf("Music")!=-1){
			content = "music";
		}else if(StringUtils.isNotEmpty(methodName) && methodName.indexOf("Article")!=-1){
			content = "article";
		}else if(StringUtils.isNotEmpty(methodName) && methodName.indexOf("Comment")!=-1){
			content = "comment";
		}else if(StringUtils.isNotEmpty(methodName) && methodName.indexOf("Fan")!=-1){
			content = "fan";
		}else{content = "other";}
		
		//System.out.println(content);
		
		// 判断是否是登录过滤登录操作
		if(StringUtils.isNotEmpty(methodName) && methodName.equals("getUser||findUserByUserName||checkUserEmail")){
			return  point.proceed();
		}
		
		// 获取目标对象
		Object classObj = point.getTarget();
		
		// 操作开始时间
		long start = System.currentTimeMillis();
		
		//切点进程
		Object object = point.proceed();
		
		// 操作结束时间
		long end = System.currentTimeMillis();
		
		// 操作总时长
		long time = (end - start);
		
		// 调用方法的参数
		Object[] params = point.getArgs();
		
		// 字符串并接
		StringBuilder builder = new StringBuilder("");
		if(params.length>0){
			for (int i = 0; i < params.length; i++) {
				builder.append(String.valueOf(params[i]));
				if(i<params.length-1){
					builder.append(",");
				}
			}
		}
		
		//执行的类名
		String className = classObj.getClass().getName();
		
		//返回类型
		String returnType = null;
		if(object!=null){
			returnType = object.getClass().getName();
		}
		
		//保存日记到数据库
		try {
			saveLog(className,methodName,time,content);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("【Service AOP拦截】【Class："+className+"】【Method："+methodName+"】【ReturnType："+returnType+"】【Time："+time+"ms】");
		return object;
	}
	
	//保存方法
	private void saveLog(String className,String methodName,long time,String content){
		Log log = new Log();
		User user = (User) application.getAttribute("user_log");
		
		//如果注册用户没有ip则需要在应用上下文中获取
//		HttpServletRequest request = (HttpServletRequest) application.getAttribute("request_log");
//		log.setIp(TmIpUtil.getIpAddress(request));
//		log.setIpAddress(TmIpUtil.ipLocation(request));
		
		log.setLogId(CoreUtils.generateID());
		log.setClassName(className);
		log.setUserId(user.getUserId());
		log.setMethod(methodName);
		log.setTime(time);
		log.setIp(user.getIp());
		log.setIpAddress(user.getIpAddress());
		log.setUserName(user.getName());
		log.setModel(content);
		log.setDescription(user.getName()+"调用了"+methodName+"方法");
		log.setIsDelete(0);
		logMapper.saveLog(log);
	}
	
	@Override
	public void setServletContext(ServletContext application) {
		this.application = application;
	}
}
