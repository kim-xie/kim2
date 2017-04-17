package com.kim.bean;
import java.io.Serializable;
import java.util.Date;
/**
 * 意见反馈
 * FeedBack 
 * 创建人:kim
 * 时间：2017年04月16日  23:34:04
 * qq：1134771121
 * email：1134771121@qq.com
 * @version 1.0.0
 */
public class FeedBack implements Serializable {
	/** 
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = 1L;
	// 主键
	private String feedbackId;
	// 用户id
	private String userId;
	// 反馈信息
	private String feedBack;
	// 应用版本
	private String appVersion;
	// 描述
	private String description;
	// 删除状态
	private Integer isDelete;
	// 创建时间
	private Date createTime;
	// 更新时间
	private String updateTime;
	// 发布状态
	private Integer status;
	
	public FeedBack(){
		super();
	}

	public String getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(String feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFeedBack() {
		return feedBack;
	}

	public void setFeedBack(String feedBack) {
		this.feedBack = feedBack;
	}

	public String getAppVersion() {
		return appVersion;
	}

	public void setAppVersion(String appVersion) {
		this.appVersion = appVersion;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
