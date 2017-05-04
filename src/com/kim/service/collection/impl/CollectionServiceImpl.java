package com.kim.service.collection.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.kim.bean.Collections;
import com.kim.bean.Params;
import com.kim.dao.collection.ICollectionMapper;
import com.kim.service.collection.ICollectionService;
import com.kim.util.StringUtils;

/**
 * 文章收藏serviceImpl
 * ICollectionService
 * 创建人:kim 
 * 时间：2017年05月03日  10:30:21
 * @version 1.0.0
 */
@Service("collectionService")
public class CollectionServiceImpl implements ICollectionService{

	@Resource
	private ICollectionMapper collectionMapper;
	
	@Override
	public List<Collections> findCollections(Params params){
		if(StringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return collectionMapper.findCollections(params);
	}
	
	@Override
	public int countCollection(Params params){
		return collectionMapper.countCollection(params);
	}

	@Override
	public Collections getCollection(Collections collection) {
		return collectionMapper.getCollection(collection);
	}

	@Override
	public boolean saveCollection(Collections collection) {
		int count = collectionMapper.saveCollection(collection);
		return count>0?true:false;
	}

	@Override
	public boolean updateCollection(Collections collection) {
		int count = collectionMapper.updateCollection(collection);
		return count>0?true:false;
	}

	@Override
	public boolean deleteCollection(Params params) {
		int count = collectionMapper.deleteCollection(params);
		return count>0?true:false;
	}
}
