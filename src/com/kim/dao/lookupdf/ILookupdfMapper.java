package com.kim.dao.lookupdf;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.kim.bean.Lookupdf;
import com.kim.bean.Params;

/**
 * 数据字典模块Mapper
 * ILookupdfMapper
 * 创建人:kim 
 * 时间：2017年03月23日  15:13:38
 * @version 1.0.0
 */
@Repository("lookupdfMapper")
public interface ILookupdfMapper {

	/**
	 * com.kim.dao.lookupdf 
	 * 方法名：findLookupdfs
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月23日  15:13:38
	 * @param params
	 * @return 
	 * 返回类型：List<Lookupdf>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<Lookupdf> findLookupdfs(Params params);
	
	/**
	 * 求总数
	 * com.kim.dao.lookupdf 
	 * 方法名：count
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月23日  15:13:38
	 * @param id
	 * @return 
	 * 返回类型：List<Lookupdf>
	 * @exception 
	 * @since  1.0.0
	 */
	public int countLookupdf(Params params);
	
	/**
	 * com.kim.dao.lookupdf 
	 * 方法名：getLookupdf
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月23日  15:13:38
	 * @param id
	 * @return 
	 * 返回类型：List<Lookupdf>
	 * @exception 
	 * @since  1.0.0
	 */
	public Lookupdf getLookupdf(Integer id);
	
	/**
	 * 保存数据字典模块
	 * com.kim.dao.lookupdf 
	 * 方法名：save
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月23日  15:13:38
	 * @param lookupdf
	 * @return 
	 * 返回类型：Lookupdf
	 * @exception 
	 * @since  1.0.0
	 */
	public int saveLookupdf(Lookupdf lookupdf);
	
	/**
	 * 更新数据字典模块
	 * com.kim.dao.lookupdf 
	 * 方法名：update
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月23日  15:13:38
	 * @param lookupdf
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int updateLookupdf(Lookupdf lookupdf);
	
	/**
	 * 删除数据字典模块
	 * com.kim.dao.lookupdf 
	 * 方法名：delete
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月23日  15:13:38 
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int deleteLookupdf(Params params);
	
}
