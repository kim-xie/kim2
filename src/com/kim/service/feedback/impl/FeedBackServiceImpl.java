package com.kim.service.feedback.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.kim.bean.FeedBack;
import com.kim.bean.Params;
import com.kim.dao.feedback.IFeedBackMapper;
import com.kim.service.feedback.IFeedBackService;
import com.kim.util.StringUtils;

/**
 * 意见反馈serviceImpl
 * IFeedBackService
 * 创建人:kim 
 * 时间：2017年04月16日  23:34:04
 * @version 1.0.0
 */
@Service("feedbackService")
public class FeedBackServiceImpl implements IFeedBackService{

	@Resource
	private IFeedBackMapper feedbackMapper;
	
	@Override
	public List<FeedBack> findFeedBacks(Params params){
		if(StringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return feedbackMapper.findFeedBacks(params);
	}
	
	@Override
	public int countFeedBack(Params params){
		return feedbackMapper.countFeedBack(params);
	}

	@Override
	public FeedBack getFeedBack(Integer id) {
		return feedbackMapper.getFeedBack(id);
	}

	@Override
	public boolean saveFeedBack(FeedBack feedback) {
		int count = feedbackMapper.saveFeedBack(feedback);
		return count>0?true:false;
	}

	@Override
	public boolean updateFeedBack(FeedBack feedback) {
		int count = feedbackMapper.updateFeedBack(feedback);
		return count>0?true:false;
	}

	@Override
	public boolean deleteFeedBack(Params params) {
		int count = feedbackMapper.deleteFeedBack(params);
		return count>0?true:false;
	}
}
