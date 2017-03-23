package com.kim.service.lookupdf.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.kim.bean.Lookupdf;
import com.kim.bean.Params;
import com.kim.dao.lookupdf.ILookupdfMapper;
import com.kim.service.lookupdf.ILookupdfService;
import com.kim.util.StringUtils;

/**
 * 数据字典模块serviceImpl
 * ILookupdfService
 * 创建人:kim 
 * 时间：2017年03月23日  15:13:38
 * @version 1.0.0
 */
@Service("lookupdfService")
public class LookupdfServiceImpl implements ILookupdfService{

	@Resource
	private ILookupdfMapper lookupdfMapper;
	
	@Override
	public List<Lookupdf> findLookupdfs(Params params){
		if(StringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return lookupdfMapper.findLookupdfs(params);
	}
	
	@Override
	public int countLookupdf(Params params){
		return lookupdfMapper.countLookupdf(params);
	}

	@Override
	public Lookupdf getLookupdf(Integer id) {
		return lookupdfMapper.getLookupdf(id);
	}

	@Override
	public boolean saveLookupdf(Lookupdf lookupdf) {
		int count = lookupdfMapper.saveLookupdf(lookupdf);
		return count>0?true:false;
	}

	@Override
	public boolean updateLookupdf(Lookupdf lookupdf) {
		int count = lookupdfMapper.updateLookupdf(lookupdf);
		return count>0?true:false;
	}

	@Override
	public boolean deleteLookupdf(Params params) {
		int count = lookupdfMapper.deleteLookupdf(params);
		return count>0?true:false;
	}
}
