package com.kim.bean;
import java.io.Serializable;
/**
 * 操作日志
 * Log 
 * 创建人:kim
 * 时间：2016年05月20日 15:23:51
 * qq：1134771121
 * email：1134771121@qq.com
 * @version 1.0.0
 */
public class Log implements Serializable {
	/**  
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)  
	 */  
	private static final long serialVersionUID = 1L;
	// 主键
	private String logId;
	// 类名
	private String className;
	// 描述
	private String description;
	// 创建时间
	private String createTime;
	// 用户id
	private String userId;
	// 操作人
	private String userName;
	// 操作方法
	private String method;
	// 操作时长
	private Long time;
	// 操作的ip
	private String ip;
	// ip地址
	private String ipAddress;
	// 操作的模块
	private String model;
	//是否已删除
	private Integer isDelete;
	
	
	public Log(){
		super();
	}

	public String getLogId() {
		return logId;
	}
	public void setLogId(String logId) {
		this.logId = logId;
	}
	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public Long getTime() {
		return time;
	}

	public void setTime(Long time) {
		this.time = time;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

}
