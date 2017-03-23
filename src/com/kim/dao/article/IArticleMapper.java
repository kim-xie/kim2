package com.kim.dao.article;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kim.bean.Article;
import com.kim.bean.Params;

/**
 * 文章模块Mapper
 * IArticleMapper
 * 创建人:kim 
 * 时间：2017年03月21日  21:31:11
 * @version 1.0.0
 */
@Repository("articleMapper")
public interface IArticleMapper {

	/**
	 * com.kim.dao.article 
	 * 方法名：findArticles
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月21日  21:31:11
	 * @param params
	 * @return 
	 * 返回类型：List<Article>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<Article> findArticles(Params params);
	
	/**
	 * 求总数
	 * com.kim.dao.article 
	 * 方法名：count
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月21日  21:31:11
	 * @param id
	 * @return 
	 * 返回类型：List<Article>
	 * @exception 
	 * @since  1.0.0
	 */
	public int countArticle(Params params);
	
	/**
	 * com.kim.dao.article 
	 * 方法名：getArticle
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月21日  21:31:11
	 * @param id
	 * @return 
	 * 返回类型：List<Article>
	 * @exception 
	 * @since  1.0.0
	 */
	public Article getArticle(Integer id);
	
	/**
	 * 保存文章模块
	 * com.kim.dao.article 
	 * 方法名：save
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月21日  21:31:11
	 * @param article
	 * @return 
	 * 返回类型：Article
	 * @exception 
	 * @since  1.0.0
	 */
	public int saveArticle(Article article);
	
	/**
	 * 更新文章模块
	 * com.kim.dao.article 
	 * 方法名：update
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月21日  21:31:11
	 * @param article
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int updateArticle(Article article);
	
	/**
	 * 删除文章模块
	 * com.kim.dao.article 
	 * 方法名：delete
	 * 创建人：kim 
	 * 手机号码:18378311282
	 * 时间：2017年03月21日  21:31:11 
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int deleteArticle(Params params);
	
}
