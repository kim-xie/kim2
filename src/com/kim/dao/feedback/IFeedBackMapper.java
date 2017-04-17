package com.kim.dao.feedback;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.kim.bean.FeedBack;
import com.kim.bean.Params;

/**
 * 意见反馈Mapper
 * IFeedBackMapper
 * 创建人:kim 
 * 时间：2017年04月16日  23:34:04
 * @version 1.0.0
 */
@Repository("feedbackMapper")
public interface IFeedBackMapper {

	/**
	 * com.kim.dao.feedback 
	 * 方法名：findFeedBacks
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年04月16日  23:34:04
	 * @param params
	 * @return 
	 * 返回类型：List<FeedBack>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<FeedBack> findFeedBacks(Params params);
	
	/**
	 * 求总数
	 * com.kim.dao.feedback 
	 * 方法名：count
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年04月16日  23:34:04
	 * @param id
	 * @return 
	 * 返回类型：List<FeedBack>
	 * @exception 
	 * @since  1.0.0
	 */
	public int countFeedBack(Params params);
	
	/**
	 * com.kim.dao.feedback 
	 * 方法名：getFeedBack
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年04月16日  23:34:04
	 * @param id
	 * @return 
	 * 返回类型：List<FeedBack>
	 * @exception 
	 * @since  1.0.0
	 */
	public FeedBack getFeedBack(Integer id);
	
	/**
	 * 保存意见反馈
	 * com.kim.dao.feedback 
	 * 方法名：save
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年04月16日  23:34:04
	 * @param feedback
	 * @return 
	 * 返回类型：FeedBack
	 * @exception 
	 * @since  1.0.0
	 */
	public int saveFeedBack(FeedBack feedback);
	
	/**
	 * 更新意见反馈
	 * com.kim.dao.feedback 
	 * 方法名：update
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年04月16日  23:34:04
	 * @param feedback
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int updateFeedBack(FeedBack feedback);
	
	/**
	 * 删除意见反馈
	 * com.kim.dao.feedback 
	 * 方法名：delete
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年04月16日  23:34:04 
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int deleteFeedBack(Params params);
	
}
