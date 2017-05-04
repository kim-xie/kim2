package com.kim.service.zan;

import java.util.List;

import com.kim.bean.Zan;
import com.kim.bean.Params;

/**
 * IZanService
 * 创建人:kim 
 * 时间：2017年05月03日  10:28:33
 * @version 1.0.0
 * 
 */
public interface IZanService {
	/**
	 * com.kim.service.zan 
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
	 * com.kim.service.zan 
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
	public Zan getZan(Zan zan);
	
	/**
	 * 保存文章点赞
	 * com.kim.service.zan 
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
	public boolean saveZan(Zan zan);
	
	/**
	 * 更新文章点赞
	 * com.kim.service.zan 
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
	public boolean updateZan(Zan zan);
	
	/**
	 * 删除文章点赞
	 * com.kim.service.zan 
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
	public boolean deleteZan(Params params);
}
