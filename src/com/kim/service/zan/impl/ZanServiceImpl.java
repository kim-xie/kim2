package com.kim.service.zan.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kim.bean.Zan;
import com.kim.bean.Params;
import com.kim.dao.zan.IZanMapper;
import com.kim.service.zan.IZanService;
import com.kim.util.StringUtils;

/**
 * 文章点赞serviceImpl
 * IZanService
 * 创建人:kim 
 * 时间：2017年05月03日  10:28:33
 * @version 1.0.0
 */
@Service("zanService")
public class ZanServiceImpl implements IZanService{

	@Resource
	private IZanMapper zanMapper;
	
	@Override
	public List<Zan> findZans(Params params){
		if(StringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return zanMapper.findZans(params);
	}
	
	@Override
	public int countZan(Params params){
		return zanMapper.countZan(params);
	}

	@Override
	public boolean saveZan(Zan zan) {
		int count = zanMapper.saveZan(zan);
		return count>0?true:false;
	}

	@Override
	public boolean updateZan(Zan zan) {
		int count = zanMapper.updateZan(zan);
		return count>0?true:false;
	}

	@Override
	public boolean deleteZan(Params params) {
		int count = zanMapper.deleteZan(params);
		return count>0?true:false;
	}

	@Override
	public Zan getZan(Zan zan) {
		return zanMapper.getZan(zan);
	}
	
}
