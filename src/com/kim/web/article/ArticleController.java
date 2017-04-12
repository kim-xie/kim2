package com.kim.web.article;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kim.bean.Article;
import com.kim.bean.Params;
import com.kim.bean.User;
import com.kim.core.CoreUtils;
import com.kim.service.article.IArticleService;
import com.kim.service.user.IUserService;
import com.kim.web.BaseController;

@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController{
	
	@Resource(name="articleService")
	private IArticleService articleService;
	@Resource(name="userService")
	private IUserService userService;
	
	/**
	 * 前往发表文章页面
	 * @Title: toResponse 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@RequestMapping("/common")
	public String toCommon() {
		return "fronts/article/common";
	}
	/**
	 * 将数据返回模板页面
	 * @Title: index 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/template")
	@ResponseBody
	public ModelAndView index(Params Params){
		List<HashMap<String, Object>> articles = articleService.findArticles(Params);
		int itemCount = articleService.countArticle(Params);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("articles", articles);
		modelAndView.addObject("itemCount", itemCount);
		modelAndView.setViewName("fronts/article/template");
		return modelAndView;
	}
	
	/**
	 * 加载数据
	 * @Title: loadData 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return List<HashMap<String,Object>>  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/loadData")
	public List<HashMap<String, Object>> loadData(Params Params){
		Params.setStatus(1);
		Params.setIsDelete(0);
		Params.setPageSize(12);
		List<HashMap<String, Object>> articles = articleService.findArticles(Params);
		return articles;
	}
	
	/**
	 * 添加内容
	 * @Title: saveArticle 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param article
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String saveArticle(Article article){
		if(article != null){
			User user = (User) request.getSession().getAttribute("user");
			article.setArticleId(CoreUtils.generateID());
			article.setUserId(user.getUserId());
			article.setIsTop(1);
			article.setIsDelete(0);
			article.setIsComment(1);
			article.setStatus(1);
			article.setPush(1);
			article.setComments(0);
			article.setHits(0);
			article.setCollections(0);
			article.setLoves(0);
			boolean flay = articleService.saveArticle(article);
			if(flay){
				return "success";
			}else{
				return "fail";
			}
		}else{
			return "error";
		}
	}
	/**
	 * 查询详情
	 * @Title: template 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/detail/{id}")
	public ModelAndView template(@PathVariable("id")String id){
		ModelAndView modelAndView = new ModelAndView();
		Article article = articleService.getArticle(id);
		Params param = new Params();
		param.setId(article.getUserId());
		User user = userService.getUser(param);
		modelAndView.setViewName("fronts/article/detail");
		modelAndView.addObject("article",article);
		modelAndView.addObject("user",user);
		return modelAndView;
	}
	/**
	 * 更新内容
	 * @Title: update 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param article
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(Article article){
		articleService.updateArticle(article);
		return "success";
	}
	
	/**
	 * 删除内容
	 * @Title: delete 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(Params Params){
		articleService.deleteArticle(Params);
		return "success";
	}
}
