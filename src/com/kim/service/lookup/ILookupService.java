package com.kim.service.lookup;

import java.util.List;

import com.kim.bean.Lookup;
import com.kim.bean.Params;

/**
 * ILookupService
 * 创建人:kim 
 * 时间：2017年03月23日  15:05:47
 * @version 1.0.0
 * 
 */
public interface ILookupService {
	/**
	 * com.kim.service.lookup 
	 * 方法名：findLookups
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月23日  15:05:47
	 * @param params
	 * @return 
	 * 返回类型：List<Lookup>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<Lookup> findLookups(Params params);
	
	/**
	 * 求总数
	 * com.kim.dao.lookup 
	 * 方法名：count
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月23日  15:05:47
	 * @param id
	 * @return 
	 * 返回类型：List<Lookup>
	 * @exception 
	 * @since  1.0.0
	 */
	public int countLookup(Params params);
	
	/**
	 * com.kim.service.lookup 
	 * 方法名：findLookups
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月23日  15:05:47
	 * @param params
	 * @return 
	 * 返回类型：List<Lookup>
	 * @exception 
	 * @since  1.0.0
	 */
	public Lookup getLookup(Integer id);
	
	/**
	 * 保存数据字典模块
	 * com.kim.service.lookup 
	 * 方法名：save
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月23日  15:05:47 
	 * @param lookup
	 * @return 
	 * 返回类型：Lookup
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean saveLookup(Lookup lookup);
	
	/**
	 * 更新数据字典模块
	 * com.kim.service.lookup 
	 * 方法名：update
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月23日  15:05:47
	 * @param lookup
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean updateLookup(Lookup lookup);
	
	/**
	 * 删除数据字典模块
	 * com.kim.service.lookup 
	 * 方法名：delete
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月23日  15:05:47
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean deleteLookup(Params params);
}
