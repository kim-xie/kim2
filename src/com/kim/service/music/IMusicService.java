package com.kim.service.music;

import java.util.HashMap;
import java.util.List;

import com.kim.bean.Music;
import com.kim.bean.Params;

/**
 * IMusicService
 * 创建人:kim 
 * 时间：2016年10月05日  14:58:31
 * @version 1.0.0
 * 
 */
public interface IMusicService {
	/**
	 * com.kim.service.music 
	 * 方法名：findMusics
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2016年10月05日  14:58:31
	 * @param params
	 * @return 
	 * 返回类型：List<Music>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<HashMap<String, Object>> findMusics(Params params);
	
	/**
	 * 求总数
	 * com.kim.dao.music 
	 * 方法名：count
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2016年10月05日  14:58:31
	 * @param id
	 * @return 
	 * 返回类型：List<Music>
	 * @exception 
	 * @since  1.0.0
	 */
	public int countMusic(Params params);
	
	/**
	 * com.kim.service.music 
	 * 方法名：findMusics
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2016年10月05日  14:58:31
	 * @param params
	 * @return 
	 * 返回类型：List<Music>
	 * @exception 
	 * @since  1.0.0
	 */
	public Music getMusic(Integer id);
	
	/**
	 * 保存音乐模块
	 * com.kim.service.music 
	 * 方法名：save
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2016年10月05日  14:58:31 
	 * @param music
	 * @return 
	 * 返回类型：Music
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean saveMusic(Music music);
	
	/**
	 * 更新音乐模块
	 * com.kim.service.music 
	 * 方法名：update
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2016年10月05日  14:58:31
	 * @param music
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean updateMusic(Music music);
	
	/**
	 * 删除音乐模块
	 * com.kim.service.music 
	 * 方法名：delete
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2016年10月05日  14:58:31
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean deleteMusic(Params params);
}
