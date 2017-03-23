package com.kim.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * Article实体类
 * 类名: Article.java
 * 创建人: kim 
 * 创建时间：2016年4月7日 下午5:13:48 
 * @version 1.0.0
 */
public class Article implements Serializable{
	//实现IO序列化 可以以流的形式输出
	private static final long serialVersionUID = 1L;
	//主键
	private String articleId;
	//用户
	private String userId;
	//标题
	private String title;
	//子标题
	private String subTitle;
	//内容
	private String article;
	//描述
	private String description;
	//静态链接
	private String staticLink;
	//是否置顶 1--置顶  0--未置顶
	private Integer isTop;
	//是否删除 1--删除  0--未删除
	private Integer isDelete;
	//是否允许评论 1--允许  0--未允许
	private Integer isComment;
	//发布状态  1--发布  0--未发布
	private Integer status;
	//是否精华  1--精华  0--未精华
	private Integer push;
	//评论数
	private Integer comments;
	//点击数
	private Integer hits;
	//收藏数
	private Integer collections;
	//喜欢数
	private Integer loves;
	//标签
	private String tag;
	//栏目id
	private String channelId;
	//分类id
	private String categoryId;
	//分类名称
	private String categoryName;
	//类型
	private String type;
	//封面图片
	private String image;
	//封面图片宽度
	private String width;
	//封面图片高度
	private String height;
	//缩略图
	private String thumnail;
	//创建时间
	private Date createTime;
	//更新时间
	private String updateTime;
	//关键字
	private String Keyword;
	
	//无参构造器
	public Article() {
		super();
	}
	//有参构造器
	public Article(String articleId) {
		this.articleId = articleId;
	}
	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	public String getArticle() {
		return article;
	}
	public void setArticle(String article) {
		this.article = article;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getStaticLink() {
		return staticLink;
	}
	public void setStaticLink(String staticLink) {
		this.staticLink = staticLink;
	}
	public Integer getIsTop() {
		return isTop;
	}
	public void setIsTop(Integer isTop) {
		this.isTop = isTop;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	public Integer getIsComment() {
		return isComment;
	}
	public void setIsComment(Integer isComment) {
		this.isComment = isComment;
	}
	public Integer getComments() {
		return comments;
	}
	public void setComments(Integer comments) {
		this.comments = comments;
	}
	public Integer getHits() {
		return hits;
	}
	public void setHits(Integer hits) {
		this.hits = hits;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getPush() {
		return push;
	}
	public void setPush(Integer push) {
		this.push = push;
	}
	public Integer getCollections() {
		return collections;
	}
	public void setCollections(Integer collections) {
		this.collections = collections;
	}
	public Integer getLoves() {
		return loves;
	}
	public void setLoves(Integer loves) {
		this.loves = loves;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getChannelId() {
		return channelId;
	}
	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getThumnail() {
		return thumnail;
	}
	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
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
	
	public String getKeyword() {
		return Keyword;
	}
	public void setKeyword(String Keyword) {
		this.Keyword = Keyword;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
