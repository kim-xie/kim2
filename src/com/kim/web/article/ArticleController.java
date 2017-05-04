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
import com.kim.bean.Collections;
import com.kim.bean.Look;
import com.kim.bean.Params;
import com.kim.bean.User;
import com.kim.bean.Zan;
import com.kim.core.CoreUtils;
import com.kim.service.article.IArticleService;
import com.kim.service.collection.ICollectionService;
import com.kim.service.look.ILookService;
import com.kim.service.user.IUserService;
import com.kim.service.zan.IZanService;
import com.kim.util.StringUtils;
import com.kim.web.BaseController;

@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController{
	
	@Resource(name="articleService")
	private IArticleService articleService;
	@Resource(name="userService")
	private IUserService userService;
	@Resource(name="zanService")
	private IZanService zanService;
	@Resource(name="collectionService")
	private ICollectionService collectionService;
	@Resource(name="lookService")
	private ILookService lookService;
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
		Params.setPageSize(10);
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
			
			Collections newCollection = new Collections();
			newCollection.setCollectionId(CoreUtils.generateID());
			newCollection.setArticleId(article.getArticleId());
			newCollection.setIsDelete(1);
			collectionService.saveCollection(newCollection);
			
			Zan newZan = new Zan();
			newZan.setZanId(CoreUtils.generateID());
			newZan.setArticleId(article.getArticleId());
			newZan.setIsDelete(1);
			zanService.saveZan(newZan);
			
			Look newLook = new Look();
			newLook.setLookId(CoreUtils.generateID());
			newLook.setArticleId(article.getArticleId());
			newLook.setIsDelete(0);
			lookService.saveLook(newLook);
			
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
		param.setUserId(article.getUserId());
		User user = userService.getUser(param);
		modelAndView.setViewName("fronts/article/detail");
		modelAndView.addObject("article",article);
		modelAndView.addObject("user",user);
		return modelAndView;
	}
	/**
	 * 文章跳转编辑页面
	 * @Title: template 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/toEdit/{id}")
	public ModelAndView toEdit(@PathVariable("id")String id){
		ModelAndView modelAndView = new ModelAndView();
		Article article = articleService.getArticle(id);
		Params param = new Params();
		param.setUserId(article.getUserId());
		User user = userService.getUser(param);
		modelAndView.setViewName("fronts/article/common");
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
	@RequestMapping(value="/{userId}/update/{id}/{type}",method=RequestMethod.POST)
	public String update(@PathVariable("userId")String userId,@PathVariable("id")String id,@PathVariable("type")String type){
		Article newArticle = new Article();
		newArticle.setArticleId(id);
		Article article = articleService.getArticle(id);
		Params param = new Params();
		param.setArticleId(id);
		if(type.equals("hit")){
			Look oldLook = new Look();
			if(lookService.countLook(param) > 1){
				oldLook.setArticleId(id);
				oldLook.setUserId(userId);
			}else{
				oldLook.setArticleId(id);
			}
			Look look = lookService.getLook(oldLook);
			Look newLook = new Look();
			if(StringUtils.isEmpty(look.getUserId()) && look.getIsDelete().equals(0)){
				newLook.setLookId(look.getLookId());
				newLook.setUserId(userId);
				newArticle.setHits(article.getHits()+1);
				lookService.updateLook(newLook);
			}else if(look.getUserId().equals(userId)){
				newArticle.setHits(article.getHits());
			}else{
				newLook.setLookId(CoreUtils.generateID());
				newLook.setArticleId(id);
				newLook.setUserId(userId);
				newLook.setIsDelete(0);
				newArticle.setHits(article.getHits()+1);
				lookService.saveLook(newLook);
			}
		}else if(type.equals("collection")){
			Collections oldCollection = new Collections();
			Collections newCollection = new Collections();
			
			if(collectionService.countCollection(param) > 1){
				oldCollection.setArticleId(id);
				oldCollection.setUserId(userId);
			}else{
				oldCollection.setArticleId(id);
			}
			Collections collection = collectionService.getCollection(oldCollection);
			if(StringUtils.isEmpty(collection.getUserId()) && collection.getIsDelete().equals(1) ){
				newCollection.setCollectionId(collection.getCollectionId());
				newCollection.setUserId(userId);
				newCollection.setIsDelete(0);
				newArticle.setCollections(article.getCollections()+1);
				collectionService.updateCollection(newCollection);
			}else if(collection.getUserId().equals(userId)){
				newCollection.setCollectionId(collection.getCollectionId());
				if(collection.getIsDelete().equals(0)){
					newCollection.setIsDelete(1);
					newArticle.setCollections(article.getCollections()-1);
				}else{
					newCollection.setIsDelete(0);
					newArticle.setCollections(article.getCollections()+1);
				}
				collectionService.updateCollection(newCollection);
			}else{
				newCollection.setCollectionId(CoreUtils.generateID());
				newCollection.setArticleId(id);
				newCollection.setUserId(userId);
				newCollection.setIsDelete(0);
				newArticle.setCollections(article.getCollections()+1);
				collectionService.saveCollection(newCollection);
			}
		}else if(type.equals("zan")){
			Zan oldZan = new Zan();
			Zan newZan = new Zan();
			if(zanService.countZan(param) > 1){
				oldZan.setArticleId(id);
				oldZan.setUserId(userId);
			}else{
				oldZan.setArticleId(id);
			}
			Zan zan = zanService.getZan(oldZan);
			if(StringUtils.isEmpty(zan.getUserId()) && zan.getIsDelete().equals(1)){
				newZan.setZanId(zan.getZanId());
				newZan.setUserId(userId);
				newZan.setIsDelete(0);
				newArticle.setLoves(article.getLoves()+1);
				zanService.updateZan(newZan);
			}else if(zan.getUserId().equals(userId)){
				newZan.setZanId(zan.getZanId());
				if(zan.getIsDelete().equals(0)){
					newZan.setIsDelete(1);
					newArticle.setLoves(article.getLoves()-1);
				}else{
					newZan.setIsDelete(0);
					newArticle.setLoves(article.getLoves()+1);
				}
				zanService.updateZan(newZan);
			}else{
				newZan.setZanId(CoreUtils.generateID());
				newZan.setArticleId(id);
				newZan.setUserId(userId);
				newZan.setIsDelete(0);
				newArticle.setLoves(article.getLoves()+1);
				zanService.saveZan(newZan);
			}
		}
		
		boolean flay = articleService.updateArticle(newArticle);
		if(flay ){
			Article article2 = articleService.getArticle(id);
			if((article2.getLoves() > article.getLoves())){
				return "addZan";
			}else if((article2.getLoves() < article.getLoves())){
				return "removeZan";
			}else if((article2.getCollections() > article.getCollections())){
				return "addCollection";
			}else if((article2.getCollections() < article.getCollections())){
				return "removeCollection";
			}else{
				return "addHit";
			}
		}else{
			return "fail";
		}
		
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
		if(articleService.deleteArticle(Params)){
			return "success";
		}else{
			return "fail";
		}
	}
}
