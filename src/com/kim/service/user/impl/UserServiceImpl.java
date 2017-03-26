package com.kim.service.user.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kim.bean.MailInfo;
import com.kim.bean.Params;
import com.kim.bean.User;
import com.kim.dao.user.IUserMapper;
import com.kim.service.user.IUserService;
import com.kim.util.SimpleMail;

/**
 * 用户模块serviceImpl
 * IUserService
 * 创建人:kim 
 * 时间：2016年09月04日  11:53:31
 * @version 1.0.0
 */
@Service("userService")
public class UserServiceImpl implements IUserService{

	@Resource
	private IUserMapper userMapper;

	/**
	 * 登录方法
	 */
	@Override
	public User getUser(Params params) {
		return userMapper.getUser(params);
	}
	/**
	 * 注册方法
	 */
	@Override
	public boolean saveUser(User user) {
		
		int count = userMapper.saveUser(user);
		
		MailInfo mailInfo = new MailInfo();
		mailInfo.setMailServerHost("smtp.163.com");
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);
		mailInfo.setUsername("jy_xdj@163.com");
		mailInfo.setPassword("xdj123");
		mailInfo.setFromAddress("jy_xdj@163.com");
		mailInfo.setToAddress(user.getEmail());
		mailInfo.setSubject("Kim技术分享平台激活邮箱");
				
		StringBuffer demo = new StringBuffer();
		demo.append("<div style='margin:0 auto; width:700px; box-shadow:0 0 10px rgba(0, 0, 0, 0.2); font-family:'Helvetica Neue',Helvetica,Arial,Microsoft YaHei,sans-serif;'>"+
				"		<div style='padding-left:180px; height:60px; line-height:63px; border-radius:3px 3px 0 0; font-size:18px; font-weight:100; color:#fff; background:url() #337ab7 no-repeat 15px; overflow:hidden;'>请激活您的帐号</div>"+
				"		<div style='padding:15px 30px 93px; min-height:350px; font-size:14px; word-wrap:break-word; border:#c5c5c5 solid; border-width:0 1px; line-height:24px; overflow:hidden; position:relative;'>	"+
				"			<p><strong>Hi，<span style='border-bottom:1px dashed #ccc;z-index:1' t='7' onclick='return false;' data='"+user.getName()+"'>"+user.getName()+"</span>：</strong></p>"+
				"			<p style='padding:5px 0; text-indent:2em;'>您收到这封邮件，是由于在 kim技术分享平台（kim） 进行了新用户注册而使用了这个邮箱地址。如果您并没有访问过 kim技术分享平台（kim），或没有进行上述操作，请忽略这封邮件，您不需要退订或进行其他任何操作，很抱歉打扰您。</p>"+
				"			<b style='display:block; margin-top:30px; color:#c00;'>帐号激活说明</b>"+
				"			<p style='padding:5px 0; text-indent:2em;'>如果您是 kim技术分享平台（kim） 的新用户，或在修改您的注册 Email 时使用了本地址，我们需要对您的地址有效性进行验证以避免垃圾邮件或地址被滥用。</p>"+
				"			<p>您只需点击下面的链接，即可激活您的帐号，<span style='color:#c00;'>为了保障帐号的安全性，请在2小时完成验证</span>：</p>"+
				"			<div style='margin:10px 0; padding:10px; border:1px #67c4f0 solid; text-align:left; font-size:14px; background:#d9edf7;'>"+
				"				<a href='http://localhost:8080/kim/user/active?activeCode='"+user.getActiveCode()+"' target='_blank' style='color:#05a;'>http://localhost:8080/kim/user/active?activeCode='"+user.getActiveCode()+"</a>"+
				"			</div>"+
				"			<p style='color:#666;'>(如果上面不是链接形式，请将该地址手工粘贴到浏览器地址栏再访问)</p>"+
				"			<p>感谢您的访问，祝您使用愉快！</p>"+
				"			<div style='left:0; bottom:0; right:0; padding:15px; height:48px; background:#f0f0f0; text-align:right; position:absolute;'>"+
				"				<a style='color:#05a; text-decoration:none; font-weight:700;' href='http://www.kim.com/' target='_blank'> kim技术分享平台（kim） </a>管理组敬上<br>"+
				"				<span style='border-bottom:1px dashed #ccc;' t='5' times=' 09:36'>2017-02-28</span> 09:36:12"+
				"			</div>"+
				"         </div>"+
				"         <div style='height:10px; border-radius:0 0 3px 3px; border: 1px solid #c5c5c5; border-top: none; background:#337ab7 url() repeat-x;'></div>"+
				"     </div>");
		mailInfo.setContent(demo.toString());
		SimpleMail.sendHtmlMail(mailInfo);
		
		return count > 0 ? true:false;
	}
	/**
	 * 邮箱注册校验
	 */
	@Override
	public boolean checkUserEmail(String email) {
		int count = userMapper.checkUserEmail(email);
		return count>0?true:false;
	}
	/**
	 * 用户名校验
	 */
	@Override
	public boolean findUserByUserName(String name) {
		int count = userMapper.findUserByUserName(name);
		return count>0?true:false;
	}
	/**
	 * 激活
	 */
	@Override
	public String active(String activeCode) {
		User user = userMapper.active(activeCode);
		
		if(user != null ){
			if(user.getIsActive()==1){
				return "fail";
			}else{
				userMapper.updateActive(activeCode);
				return "success";
			}
		}else{
			return "error";
		}
		
	}
	@Override
	public List<User> findAllUsers(Params params) {
		List<User> users = userMapper.findAllUsers(params);
		return users;
	}
	@Override
	public int countUser(Params params) {
		return userMapper.countUser(params);
	}
	@Override
	public boolean updateUser(User user) {
		int count = userMapper.updateUser(user);
		return count>0?true:false;
	}
	@Override
	public boolean deleteUser(Params params) {
		int count = userMapper.deleteUser(params);
		return count>0?true:false;
	}
	
	
	
}
