package com.kim.service.user.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.kim.bean.User;
import com.kim.bean.Params;
import com.kim.dao.user.IUserMapper;
import com.kim.service.user.IUserService;
import com.kim.util.StringUtils;

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
	
	@Override
	public List<User> findUsers(Params params){
		if(StringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return userMapper.findUsers(params);
	}
	
	@Override
	public int countUser(Params params){
		return userMapper.countUser(params);
	}

	@Override
	public User getUser(Params params) {
		return userMapper.getUser(params);
	}

	@Override
	public boolean saveUser(User user) {
		int count = userMapper.saveUser(user);
		return count>0?true:false;
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
