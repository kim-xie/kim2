package com.kim.core;

import javax.servlet.ServletContext;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ServletContextAware;

import com.kim.util.StringUtils;

/**
 * 路径核心类 类名: BasePathExpsoer.java 创建人: king 创建时间：2016年4月21日 下午2:23:22
 * 
 * @version 1.0.0
 */
public class BasePathExpsoer implements ServletContextAware {

	private ServletContext application;
	@SuppressWarnings("unused")
	private ApplicationContext context;

	private String rootPath;

	public void init() {
		if (StringUtils.isEmpty(rootPath)) {
			rootPath = application.getContextPath();
		}
		application.setAttribute("rootPath", rootPath);
		application.setAttribute("resPath", rootPath + "/resources");
	}

	@Override
	public void setServletContext(ServletContext application) {
		this.application = application;
	}

	public void setRootPath(String rootPath) {
		this.rootPath = rootPath;
	}

}
