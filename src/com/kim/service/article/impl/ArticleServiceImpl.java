package com.kim.service.article.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kim.bean.Article;
import com.kim.bean.Params;
import com.kim.dao.article.IArticleMapper;
import com.kim.service.article.IArticleService;
import com.kim.util.StringUtils;

/**
 * 文章模块serviceImpl
 * IArticleService
 * 创建人:kim 
 * 时间：2017年03月21日  21:31:11
 * @version 1.0.0
 */
@Service("articleService")
public class ArticleServiceImpl implements IArticleService{

	@Resource
	private IArticleMapper articleMapper;
	
	@Override
	public List<HashMap<String, Object>> findArticles(Params params){
		if(StringUtils.isEmpty(params.getOrder())){
			params.setOrder("create_time desc");
		}
		params.setIsDelete(0);
		return articleMapper.findArticles(params);
	}
	
	@Override
	public int countArticle(Params params){
		return articleMapper.countArticle(params);
	}

	@Override
	public Article getArticle(String id) {
		return articleMapper.getArticle(id);
	}

	@Override
	public boolean saveArticle(Article article) {
		int count = articleMapper.saveArticle(article);
		return count>0 ? true : false;
	}

	@Override
	public boolean updateArticle(Article article) {
		int count = articleMapper.updateArticle(article);
		return count>0?true:false;
	}

	@Override
	public boolean deleteArticle(Params params) {
		int count = articleMapper.deleteArticle(params);
		return count>0?true:false;
	}

}
