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
		mailInfo.setSubject("Kim技术分享平台-验证邮箱");
				
		StringBuffer demo = new StringBuffer();
		
		demo.append("<!DOCTYPE html>"+
					"<html>"+
					"	<head>"+
					"		<base target='_blank'>"+
					"		<meta charset='UTF-8' />"+
					"	</head>"+
					"	<body>"+
					"		<table cellpadding='0' cellspacing='0' style='background-color:#e5eaf1; width:100%; height:500px;'>"+
					"			<tbody>"+
					"				<tr>"+
					"					<td>"+
					"					<table align='center' cellpadding='0' cellspacing='0' style='width:775px; margin: 40px auto 10px; border-radius: 5px;'>"+
					"						<tbody>"+
					"							<tr cellpadding='0' cellspacing='0'>"+
					"								<td cellpadding='0' cellspacing='0'><img src='javascript:;' style='display:block;'></td>"+
					"							</tr>"+
					"							<tr style=''>"+
					"								<td style=' height:100%; width: 100%  ' url='url' repeat-y='repeat-y'>"+
					"								<table align='left' cellpadding='0' cellspacing='0' style=' padding: 30px 57px 35px  ' url='url' no-repeat='no-repeat' right='right' top='top' fff='fff' color:='color:' font-size:='font-size:' px='px' margin-left:10px='margin-left:10px' width:755px='width:755px' border-radius:='border-radius:'>"+
					"									<tbody>"+
					"										<tr>"+
					"											<td style='width: 755px;'>"+
					"												<h1 style='margin: 10px 0 0 0; line-height:50px; color: #386fb7; font-size: 22px;  font-weight: bold;'>请验证您的邮箱</h1>"+
					"											</td>"+
					"										</tr>"+
					"										<tr>"+
					"											<td>"+
					"												<p style='margin: 0; line-height:37px;'>亲爱的 <span style='font-weight: bold;'>"+user.getName()+"</span> ,您好！</p>"+
					"											</td>"+
					"										</tr>"+
					"										<tr>"+
					"											<td style=''>"+
					"												<p style='margin: 0; line-height:37px;'>欢迎加入kim技术分享平台</p>"+
					"											</td>"+
					"										</tr>"+
					"										<tr>"+
					"											<td>"+
					"												<p style='margin: 0; line-height:37px;'>请点击下面的按钮进行邮箱验证，以便保证您的网站功能使用和账号安全</p>"+
					"											</td>"+
					"										</tr>"+
					"										<tr>"+
					"											<td style=''>"+
					"												<a href='http://localhost:8080/kim/user/active?activeCode="+user.getActiveCode()+"' style='width: 160px; height: 42px; background-color: #386fb7; font-weight: normal; font-size: 20px; color: white; text-align: center; text-decoration: none; display: block; line-height: 42px; margin:5px 0 13px; ' target='_blank'>点击验证</a>"+
					"											</td>"+
					"										</tr>"+
					"										<tr>"+
					"											<td>"+
					"												<p style='margin: 0; line-height:27px; font-size:14px;'>如果您并未申请kim技术分享平台账号，可能是其他用户误输入了您的邮箱地址。请忽略此邮件，或与我们联系。</p>"+
					"											</td>"+
					"										</tr>"+
					"										<tr>"+
					"											<td style='width: 755px;'>"+
					"												<p style='margin: 0; line-height:30px; margin-top:24px;'>kim技术分享平台管理团队</p>"+
					"											</td>"+
					"										</tr>"+
					"										<tr>"+
					"											<td>"+
					"												<p style='margin: 0; line-height:20px; font-size:14px; margin-bottom: 15px; color: #c1c1c1; '>(这是一封自动产生的email，请勿回复。)</p>"+
					"											</td>"+
					"										</tr>"+
					"									</tbody>"+
					"								</table>"+
					"							</td>"+
					"						</tr>"+
					"					</tbody>"+
					"				</table>"+
					"				<table align='center' cellpadding='0' cellspacing='0' style='margin:0 auto;margin-bottom: 50px; width: 755px; '>"+
					"					<tbody>"+
					"						<tr style='font-size:12px; color: #bac1cb;'>"+
					"							<td align='left'><a href='#' target='_blank'></a></td>"+
					"							<td align='left' style='width:340px; margin-left:10px; '>"+
					"								<span style=''><span style='font-weight:bold; margin-left:10px;'>kim技术分享平台</span> - 专业技术分享平台</span>"+
					"							</td>"+
					"							<td align='right' style='width:340px; margin-left:10px;'>"+
					"								<span style='margin-right:10px;'>Powered by © <span style='border-bottom:1px dashed #ccc;z-index:1' t='7' onclick='return false;' data='2017-2018'>2017-2018</span> KIM.CN</span>"+
					"							</td>"+
					"							<td align='right'><a href='#' target='_blank'></a></td>"+
					"						</tr>"+
					"					</tbody>"+
					"				</table>"+
					"				</td>"+
					"			</tr>"+
					"		</tbody>"+
					"	</table>"+
					" </body>"+
					"</html>");
		
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
			if(user.getIsActive().equals(1)){
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
