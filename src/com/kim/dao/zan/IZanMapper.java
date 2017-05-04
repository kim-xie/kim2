package com.kim.dao.zan;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.kim.bean.Zan;
import com.kim.bean.Params;

/**
 * 文章点赞Mapper
 * IZanMapper
 * 创建人:kim 
 * 时间：2017年05月03日  10:28:33
 * @version 1.0.0
 */
@Repository("zanMapper")
public interface IZanMapper {

	/**
	 * com.kim.dao.zan 
	 * 方法名：findZans
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月03日  10:28:33
	 * @param params
	 * @return 
	 * 返回类型：List<Zan>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<Zan> findZans(Params params);
	
	/**
	 * 求总数
	 * com.kim.dao.zan 
	 * 方法名：count
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月03日  10:28:33
	 * @param id
	 * @return 
	 * 返回类型：List<Zan>
	 * @exception 
	 * @since  1.0.0
	 */
	public int countZan(Params params);
	
	/**
	 * com.kim.dao.zan 
	 * 方法名：getZan
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月03日  10:28:33
	 * @param id
	 * @return 
	 * 返回类型：List<Zan>
	 * @exception 
	 * @since  1.0.0
	 */
	public Zan getZan(Zan zan);
	
	/**
	 * 保存文章点赞
	 * com.kim.dao.zan 
	 * 方法名：save
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月03日  10:28:33
	 * @param zan
	 * @return 
	 * 返回类型：Zan
	 * @exception 
	 * @since  1.0.0
	 */
	public int saveZan(Zan zan);
	
	/**
	 * 更新文章点赞
	 * com.kim.dao.zan 
	 * 方法名：update
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月03日  10:28:33
	 * @param zan
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int updateZan(Zan zan);
	
	/**
	 * 删除文章点赞
	 * com.kim.dao.zan 
	 * 方法名：delete
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年05月03日  10:28:33 
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int deleteZan(Params params);
	
}
