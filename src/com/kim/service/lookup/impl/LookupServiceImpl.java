package com.kim.service.lookup.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.kim.bean.Lookup;
import com.kim.bean.Params;
import com.kim.dao.lookup.ILookupMapper;
import com.kim.service.lookup.ILookupService;
import com.kim.util.StringUtils;

/**
 * 数据字典模块serviceImpl
 * ILookupService
 * 创建人:kim 
 * 时间：2017年03月23日  15:05:47
 * @version 1.0.0
 */
@Service("lookupService")
public class LookupServiceImpl implements ILookupService{

	@Resource
	private ILookupMapper lookupMapper;
	
	@Override
	public List<Lookup> findLookups(Params params){
		if(StringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return lookupMapper.findLookups(params);
	}
	
	@Override
	public int countLookup(Params params){
		return lookupMapper.countLookup(params);
	}

	@Override
	public Lookup getLookup(Integer id) {
		return lookupMapper.getLookup(id);
	}

	@Override
	public boolean saveLookup(Lookup lookup) {
		int count = lookupMapper.saveLookup(lookup);
		return count>0?true:false;
	}

	@Override
	public boolean updateLookup(Lookup lookup) {
		int count = lookupMapper.updateLookup(lookup);
		return count>0?true:false;
	}

	@Override
	public boolean deleteLookup(Params params) {
		int count = lookupMapper.deleteLookup(params);
		return count>0?true:false;
	}
}
