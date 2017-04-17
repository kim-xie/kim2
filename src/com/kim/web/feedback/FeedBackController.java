package com.kim.web.feedback;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kim.bean.FeedBack;
import com.kim.bean.Params;
import com.kim.bean.User;
import com.kim.service.feedback.IFeedBackService;
import com.kim.service.user.IUserService;
import com.kim.util.StringUtils;
import com.kim.web.BaseController;

/**
 * 意见反馈web
 * FeedBackController
 * 创建人:kim
 * 时间：2017年04月16日  23:34:04
 * @version 1.0.0
 */
@Controller
@RequestMapping("/feedback")
public class FeedBackController extends BaseController{
	
	@Resource(name="feedbackService")
	private IFeedBackService feedbackService;
	@Resource(name="userService")
	private IUserService userService;
	
	/**
	 * 添加保存FeedBack
	 * @Title: saveFeedBack 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param feedback
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String saveFeedBack(FeedBack feedback){
		if(feedback != null){
			User userSession = (User) request.getSession().getAttribute("user");
			feedback.setFeedbackId(StringUtils.getUuid());
			feedback.setUserId(userSession.getUserId());
			feedback.setIsDelete(0);
			feedback.setStatus(0);
			boolean faly = feedbackService.saveFeedBack(feedback);
			if(faly){
				return "success";
			}else{
				return "fail";
			}
		}else{
			return "error";
		}
	}
	/**
	 * findFeedBacks
	 * @Title: updateFeedBack 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/findFeedBacks",method=RequestMethod.GET)
	public Map<String,Object> findFeedBacks(Params params){
		Map<String,Object> model = new HashMap<String,Object>();
		List<FeedBack> feedBacks = feedbackService.findFeedBacks(params);
		int count = feedbackService.countFeedBack(params);
		List<User> users = new ArrayList<User>();
		for(FeedBack feedBack:feedBacks){
			Params param = new Params();
			param.setUserId(feedBack.getUserId());
			User user = userService.getUser(param);
			users.add(user);
		}
		model.put("feedBacks",feedBacks);
		model.put("users",users);
		model.put("itemCount",count);
		return model;
	}
	/**
	 * 更新FeedBack
	 * @Title: updateFeedBack 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateFeedBack(FeedBack feedback){
		return feedbackService.updateFeedBack(feedback)?"success":"fail";
	}
	
	/**
	 * 删除FeedBack
	 * @Title: deleteFeedBack 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deleteFeedBack(Params Params){
		return feedbackService.deleteFeedBack(Params)?"success":"fail";
	}
}
