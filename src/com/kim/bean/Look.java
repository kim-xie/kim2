package com.kim.bean;
import java.io.Serializable;
/**
 * 文章浏览
 * Look 
 * 创建人:kim
 * 时间：2017年05月04日  22:54:41
 * qq：1134771121
 * email：1134771121@qq.com
 * @version 1.0.0
 */
public class Look implements Serializable {
	/** 
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = 1L;
	// 主键
	private String lookId;
	// 用户id
	private String userId;
	// 代码
	private String articleId;
	// 删除状态
	private Integer isDelete;
	// 创建时间
	private String createTime;
	// 更新时间
	private String updateTime;
	
	public Look(){
		super();
	}

	public String getLookId() {
		return lookId;
	}
	public void setLookId(String lookId) {
		this.lookId = lookId;
	}
	public String getUserId() {
			return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getArticleId() {
			return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
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
	
}
