package com.kim.service.look.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.kim.bean.Look;
import com.kim.bean.Params;
import com.kim.dao.look.ILookMapper;
import com.kim.service.look.ILookService;
import com.kim.util.StringUtils;

/**
 * 文章浏览serviceImpl
 * ILookService
 * 创建人:kim 
 * 时间：2017年05月04日  22:54:41
 * @version 1.0.0
 */
@Service("lookService")
public class LookServiceImpl implements ILookService{

	@Resource
	private ILookMapper lookMapper;
	
	@Override
	public List<Look> findLooks(Params params){
		if(StringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return lookMapper.findLooks(params);
	}
	
	@Override
	public int countLook(Params params){
		return lookMapper.countLook(params);
	}

	@Override
	public Look getLook(Look look) {
		return lookMapper.getLook(look);
	}

	@Override
	public boolean saveLook(Look look) {
		int count = lookMapper.saveLook(look);
		return count>0?true:false;
	}

	@Override
	public boolean updateLook(Look look) {
		int count = lookMapper.updateLook(look);
		return count>0?true:false;
	}

	@Override
	public boolean deleteLook(Params params) {
		int count = lookMapper.deleteLook(params);
		return count>0?true:false;
	}
}
