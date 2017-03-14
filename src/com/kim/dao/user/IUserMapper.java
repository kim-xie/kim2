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
	 * com.kim.dao.user 
	 * 方法名：findUsers
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2016年09月04日  11:53:31
	 * @param params
	 * @return 
	 * 返回类型：List<User>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<User> findUsers(Params params);
	
	/**
	 * 求总数
	 * com.kim.dao.user 
	 * 方法名：count
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2016年09月04日  11:53:31
	 * @param id
	 * @return 
	 * 返回类型：List<User>
	 * @exception 
	 * @since  1.0.0
	 */
	public int countUser(Params params);
	
	/**
	 * com.kim.dao.user 
	 * 方法名：getUser
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2016年09月04日  11:53:31
	 * @param id
	 * @return 
	 * 返回类型：List<User>
	 * @exception 
	 * @since  1.0.0
	 */
	public User getUser(Params params);
	
	/**
	 * 保存用户模块
	 * com.kim.dao.user 
	 * 方法名：save
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2016年09月04日  11:53:31
	 * @param user
	 * @return 
	 * 返回类型：User
	 * @exception 
	 * @since  1.0.0
	 */
	public int saveUser(User user);
	
	/**
	 * 更新用户模块
	 * com.kim.dao.user 
	 * 方法名：update
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2016年09月04日  11:53:31
	 * @param user
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int updateUser(User user);
	
	/**
	 * 删除用户模块
	 * com.kim.dao.user 
	 * 方法名：delete
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2016年09月04日  11:53:31 
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int deleteUser(Params params);
	
}
