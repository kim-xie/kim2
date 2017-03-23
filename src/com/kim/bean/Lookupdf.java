package com.kim.bean;
import java.io.Serializable;
/**
 * 数据字典模块
 * Lookupdf 
 * 创建人:kim
 * 时间：2017年03月23日  15:13:38
 * qq：1134771121
 * email：1134771121@qq.com
 * @version 1.0.0
 */
public class Lookupdf implements Serializable {
	// 主键
	private String lookupdfId;
	// 用户id
	private String userId;
	// 代码
	private String code;
	// 名称
	private String name;
	// 描述
	private String description;
	// 删除状态
	private Integer isDelete;
	// 创建时间
	private String createTime;
	// 更新时间
	private String updateTime;
	// 发布状态
	private Integer status;
	
	public Lookupdf(){
		super();
	}

	public String getLookupdfId() {
		return lookupdfId;
	}
	public void setLookupdfId(String lookupdfId) {
		this.lookupdfId = lookupdfId;
	}
	public String getName() {
			return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
			return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
			return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUserId() {
			return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
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
	
}
