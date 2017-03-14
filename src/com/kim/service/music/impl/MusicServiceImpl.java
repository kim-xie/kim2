package com.kim.service.music.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kim.bean.Music;
import com.kim.bean.Params;
import com.kim.dao.music.IMusicMapper;
import com.kim.service.music.IMusicService;
import com.kim.util.StringUtils;

/**
 * 音乐模块serviceImpl
 * IMusicService
 * 创建人:kim 
 * 时间：2016年10月05日  14:58:31
 * @version 1.0.0
 */
@Service("musicService")
public class MusicServiceImpl implements IMusicService{

	@Resource
	private IMusicMapper musicMapper;
	
	@Override
	public List<HashMap<String, Object>> findMusics(Params params){
		if(StringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return musicMapper.findMusics(params);
	}
	
	@Override
	public int countMusic(Params params){
		return musicMapper.countMusic(params);
	}

	@Override
	public Music getMusic(Integer id) {
		return musicMapper.getMusic(id);
	}

	@Override
	public boolean saveMusic(Music music) {
		int count = musicMapper.saveMusic(music);
		return count>0?true:false;
	}

	@Override
	public boolean updateMusic(Music music) {
		int count = musicMapper.updateMusic(music);
		return count>0?true:false;
	}

	@Override
	public boolean deleteMusic(Params params) {
		int count = musicMapper.deleteMusic(params);
		return count>0?true:false;
	}
}
