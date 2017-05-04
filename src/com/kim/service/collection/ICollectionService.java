package com.kim.service.collection;

import java.util.List;

import com.kim.bean.Collections;
import com.kim.bean.Params;

/**
 * ICollectionService
 * 创建人:kim 
 * 时间：2017年05月03日  10:30:21
 * @version 1.0.0
 * 
 */
public interface ICollectionService {
	/**
	 * com.kim.service.collection 
	 * 方法名：findCollections
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月03日  10:30:21
	 * @param params
	 * @return 
	 * 返回类型：List<Collection>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<Collections> findCollections(Params params);
	
	/**
	 * 求总数
	 * com.kim.dao.collection 
	 * 方法名：count
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月03日  10:30:21
	 * @param id
	 * @return 
	 * 返回类型：List<Collection>
	 * @exception 
	 * @since  1.0.0
	 */
	public int countCollection(Params params);
	
	/**
	 * com.kim.service.collection 
	 * 方法名：findCollections
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月03日  10:30:21
	 * @param params
	 * @return 
	 * 返回类型：List<Collection>
	 * @exception 
	 * @since  1.0.0
	 */
	public Collections getCollection(Collections collection);
	
	/**
	 * 保存文章收藏
	 * com.kim.service.collection 
	 * 方法名：save
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月03日  10:30:21 
	 * @param collection
	 * @return 
	 * 返回类型：Collection
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean saveCollection(Collections collection);
	
	/**
	 * 更新文章收藏
	 * com.kim.service.collection 
	 * 方法名：update
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月03日  10:30:21
	 * @param collection
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean updateCollection(Collections collection);
	
	/**
	 * 删除文章收藏
	 * com.kim.service.collection 
	 * 方法名：delete
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月03日  10:30:21
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean deleteCollection(Params params);
}
