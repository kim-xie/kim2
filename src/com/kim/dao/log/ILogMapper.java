package com.kim.dao.log;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kim.bean.Log;
import com.kim.bean.Params;

/**
 * 操作日志Mapper
 * ILogMapper
 * 创建人:king 
 * 时间：2016年05月20日 15:23:51
 * @version 1.0.0
 */
@Repository("logMapper")
public interface ILogMapper {

	/**
	 * com.king.dao.log 
	 * 方法名：findLogs
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月20日 15:23:51
	 * @param params
	 * @return 
	 * 返回类型：List<Log>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<Log> findLogs(Params params);
	
	/**
	 * 求总数
	 * com.king.dao.log 
	 * 方法名：count
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月20日 15:23:51
	 * @param id
	 * @return 
	 * 返回类型：List<Log>
	 * @exception 
	 * @since  1.0.0
	 */
	public int countLog(Params params);
	
	/**
	 * 
	 * com.king.dao.log 
	 * 方法名：getLog
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月20日 15:23:51
	 * @param id
	 * @return 
	 * 返回类型：List<Log>
	 * @exception 
	 * @since  1.0.0
	 */
	public Log getLog(Params params);
	
	/**
	 * 保存操作日志
	 * com.king.dao.log 
	 * 方法名：save
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月20日 15:23:51
	 * @param log
	 * @return 
	 * 返回类型：Log
	 * @exception 
	 * @since  1.0.0
	 */
	public int saveLog(Log log);
	
	/**
	 * 更新操作日志
	 * com.king.dao.log 
	 * 方法名：update
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月20日 15:23:51
	 * @param log
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int updateLog(Log log);
	
	/**
	 * 删除操作日志
	 * com.king.dao.log 
	 * 方法名：delete
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月20日 15:23:51 
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int deleteLog(Params params);
	
}
