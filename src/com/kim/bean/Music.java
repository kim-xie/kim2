package com.kim.bean;
import java.io.Serializable;
/**
 * 音乐模块
 * Music 
 * 创建人:kim
 * 时间：2016年10月05日  14:58:31
 * qq：1134771121
 * email：1134771121@qq.com
 * @version 1.0.0
 */
public class Music implements Serializable {
	/** 
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = 1L;
	// 主键
	private Integer id;
	// 分类id
	private Integer userId;
	// 分类id
	private Integer categoryId;
	// 标题
	private String title;
	// 歌手
	private String singer;
	// 专辑
	private String album;
	// 時長
	private String time;
	// 大小
	private Integer size;
	// 播放路径
	private String playSrc;
	// 封面图
	private String image;
	// 歌词
	private String lrc;
	// 删除状态
	private Integer isDelete;
	// 喜欢数
	private Integer loves;
	// 收听数
	private Integer listens;
	// 收藏数
	private Integer collections;
	// 评论数
	private Integer comments;
	// 评论数
	private String descriptions;
	// 创建时间
	private String createTime;
	// 更新时间
	private String updateTime;
	
	
	public Music(){
		super();
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSinger() {
		return singer;
	}

	public void setSinger(String singer) {
		this.singer = singer;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public String getPlaySrc() {
		return playSrc;
	}

	public void setPlaySrc(String playSrc) {
		this.playSrc = playSrc;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getLrc() {
		return lrc;
	}

	public void setLrc(String lrc) {
		this.lrc = lrc;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public Integer getLoves() {
		return loves;
	}

	public void setLoves(Integer loves) {
		this.loves = loves;
	}

	public Integer getListens() {
		return listens;
	}

	public void setListens(Integer listens) {
		this.listens = listens;
	}

	public Integer getCollections() {
		return collections;
	}

	public void setCollections(Integer collections) {
		this.collections = collections;
	}

	public Integer getComments() {
		return comments;
	}

	public void setComments(Integer comments) {
		this.comments = comments;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
