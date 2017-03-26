package com.kim.service.user;

import java.util.List;

import com.kim.bean.User;
import com.kim.bean.Params;

/**
 * IUserService
 * 创建人:kim 
 * 时间：2016年09月04日  11:53:31
 * @version 1.0.0
 * 
 */
public interface IUserService {
	
	/**
	 * @Title: regist 
	 * @Description: TODO(注册) 
	 * @param @param regist
	 * @param @return  参数说明 
	 * @return boolean  返回类型 
	 * @throws
	 */
	boolean saveUser(User user);
	/**
	 * @Title: findUserByUserName 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param userName
	 * @param @return  参数说明 
	 * @return User  返回类型 
	 * @throws
	 */
	boolean findUserByUserName(String name); 
	/**
	 * @Title: checkUserEmail 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param userEmail
	 * @param @return  参数说明 
	 * @return boolean  返回类型 
	 * @throws
	 */
	boolean checkUserEmail(String email);
	/**
	 * @Title: active 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param activeCode
	 * @param @return  参数说明 
	 * @return User  返回类型 
	 * @throws
	 */
	String active(String activeCode);
	
	/**
	 * @Title: loginIn 
	 * @Description: TODO(登录) 
	 * @param @param login
	 * @param @return  参数说明 
	 * @return User  返回类型 
	 * @throws
	 */
	User getUser(Params params);
	
	/**
	 * @Title: findAllUsers 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return  参数说明 
	 * @return List<User>  返回类型 
	 * @throws
	 */
	List<User> findAllUsers(Params params);
	/**
	 * @Title: countUser 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param userParams
	 * @param @return  参数说明 
	 * @return int  返回类型 
	 * @throws
	 */
	int countUser(Params params);
	
	/**
	 * 修改用户信息
	 * @Title: updateUser 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param user
	 * @param @return    设定文件 
	 * @return int    返回类型 
	 * @throws
	 */
	boolean updateUser(User user);
	/**
	 * 删除用户
	 * @Title: deleteUser 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return    设定文件 
	 * @return int    返回类型 
	 * @throws
	 */
	boolean deleteUser(Params params);
}
