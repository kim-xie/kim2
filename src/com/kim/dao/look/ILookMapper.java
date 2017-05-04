package com.kim.dao.look;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.kim.bean.Look;
import com.kim.bean.Params;

/**
 * 文章浏览Mapper
 * ILookMapper
 * 创建人:kim 
 * 时间：2017年05月04日  22:54:41
 * @version 1.0.0
 */
@Repository("lookMapper")
public interface ILookMapper {

	/**
	 * com.kim.dao.look 
	 * 方法名：findLooks
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月04日  22:54:41
	 * @param params
	 * @return 
	 * 返回类型：List<Look>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<Look> findLooks(Params params);
	
	/**
	 * 求总数
	 * com.kim.dao.look 
	 * 方法名：count
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月04日  22:54:41
	 * @param id
	 * @return 
	 * 返回类型：List<Look>
	 * @exception 
	 * @since  1.0.0
	 */
	public int countLook(Params params);
	
	/**
	 * com.kim.dao.look 
	 * 方法名：getLook
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月04日  22:54:41
	 * @param id
	 * @return 
	 * 返回类型：List<Look>
	 * @exception 
	 * @since  1.0.0
	 */
	public Look getLook(Look look);
	
	/**
	 * 保存文章浏览
	 * com.kim.dao.look 
	 * 方法名：save
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月04日  22:54:41
	 * @param look
	 * @return 
	 * 返回类型：Look
	 * @exception 
	 * @since  1.0.0
	 */
	public int saveLook(Look look);
	
	/**
	 * 更新文章浏览
	 * com.kim.dao.look 
	 * 方法名：update
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月04日  22:54:41
	 * @param look
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int updateLook(Look look);
	
	/**
	 * 删除文章浏览
	 * com.kim.dao.look 
	 * 方法名：delete
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月04日  22:54:41 
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int deleteLook(Params params);
	
}
