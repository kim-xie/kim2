package com.kim.bean;
import java.io.Serializable;
/**
 * 用户模块
 * User 
 * 创建人:kim
 * 时间：2016年09月04日  11:53:31
 * qq：1134771121
 * email：1134771121@qq.com
 * @version 1.0.0
 */
public class User implements Serializable {
	
	private static final long serialVersionUID = 1L;
	// 主键
	private String userId;
	// 名称
	private String name;
	// 密码
	private String password;
	// IP
	private String ip;
	// IP地址
	private String ipAddress;
	// 头像
	private String headerPic;
	// 地址
	private String address;
	// 激活码
	private String activeCode;
	// 用户级别
	private Integer level;
	// 激活状态
	private Integer isActive;
	// 禁用状态
	private Integer isForbid;
	// 删除状态
	private Integer isDelete;
	// 邮箱
	private String email;
	// 性别
	private Integer sex;
	// 年龄
	private Integer age;
	// 电话
	private String tel;
	// qq
	private Integer qq;
	// 微信
	private String weixin;
	// 个人简介
	private String description;
	// 创建时间
	private String createTime;
	// 更新时间
	private String updateTime;
	// 角色ID
	private Integer roleID;
	
	public User(){
		super();
	}
	public User(String userId){
		this.userId = userId;
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getHeaderPic() {
		return headerPic;
	}

	public void setHeaderPic(String headerPic) {
		this.headerPic = headerPic;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getActiveCode() {
		return activeCode;
	}

	public void setActiveCode(String activeCode) {
		this.activeCode = activeCode;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	public Integer getIsForbid() {
		return isForbid;
	}

	public void setIsForbid(Integer isForbid) {
		this.isForbid = isForbid;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Integer getQq() {
		return qq;
	}

	public void setQq(Integer qq) {
		this.qq = qq;
	}

	public String getWeixin() {
		return weixin;
	}

	public void setWeixin(String weixin) {
		this.weixin = weixin;
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

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getRoleID() {
		return roleID;
	}

	public void setRoleID(Integer roleID) {
		this.roleID = roleID;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
