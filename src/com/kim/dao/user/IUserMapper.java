package com.kim.dao.user;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.kim.bean.User;
import com.kim.bean.Params;

/**
 * 用户模块Mapper
 * IUserMapper
 * 创建人:kim 
 * 时间：2016年09月04日  11:53:31
 * @version 1.0.0
 */
@Repository("userMapper")
public interface IUserMapper {

	/**
	 * Regist
	 * @Title: regist 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param regist  参数说明 
	 * @return void  返回类型 
	 * @throws
	 */
	int saveUser(User user);
	/**
	 * @Title: findUserByUserName 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param userName
	 * @param @return  参数说明 
	 * @return User  返回类型 
	 * @throws
	 */
	int findUserByUserName(String name); 
	
	/**
	 * @Title: checkUserEmail 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param userEmail
	 * @param @return  参数说明 
	 * @return boolean  返回类型 
	 * @throws
	 */
	int checkUserEmail(String email);
	/**
	 * @Title: active 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param activeCode
	 * @param @return  参数说明 
	 * @return User  返回类型 
	 * @throws
	 */
	User active(String activeCode);
	/**
	 * @Title: updateActive 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param activeCode
	 * @param @return  参数说明 
	 * @return int  返回类型 
	 * @throws
	 */
	void updateActive(String activeCode);
	
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
	 * @Title: count 
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
	int updateUser(User user);
	/**
	 * 删除用户
	 * @Title: deleteUser 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return    设定文件 
	 * @return int    返回类型 
	 * @throws
	 */
	int deleteUser(Params params);
	
}
