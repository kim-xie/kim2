package com.kim.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.struts2.json.JSONUtil;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;


public class GatherUtils {
	
	/*@Resource
	private IMusicMapper musicMapper;*/
	
	public static String getHtmlSource(String netLink,String charset){
		StringBuffer buffer = new StringBuffer();
		try {
			URL url = new URL(netLink);
			URLConnection connection = url.openConnection();
			connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2547.0 Safari/537.36");
			InputStream inputStream = connection.getInputStream();
			InputStreamReader reader = new InputStreamReader(inputStream, charset);
			BufferedReader bufferedReader = new BufferedReader(reader);
			String line = null;
			while((line =bufferedReader.readLine())!=null){
				buffer.append(line+"\n");
			}
			bufferedReader.close();
			reader.close();
			inputStream.close();
			return buffer.toString();
		} catch (Exception e) {
			return "error";
		}
	}
	
	/*private void setContentData(Content content){
		content.setUserId(1);
		content.setUserName("king");
		content.setHeaderPic("/resources/imgs/header_pic/header_pic.jpg");
		content.setIsTop(1);
		content.setIsDelete(0);
		content.setIsComment(1);
		content.setStatus(1);
		content.setPush(1);
		content.setComments(0);
		content.setHits(0);
		content.setCollections(0);
		content.setLoves(0);
		content.setSubTitle(null);
		content.setStaticLink(null);
	}*/
	/**
	 * 抓取UI网页内容
	 * @Title: handlerContent 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param   参数说明 
	 * @return void  返回类型 
	 * @throws
	 */
	/*@Test
	public void handlerContent(){
		
		Content conten = new Content();	
		setContentData(conten);
		
	    String htmlsource = getHtmlSource("http://www.ui.cn/","utf-8");
		Document document = Jsoup.parse(htmlsource);
		
		Elements es = document.getElementsByClass("cover");
		for(Element e : es){
			Set<String> set = new HashSet<>();
			Elements elements = e.getElementsByTag("a");
			for (Element element : elements) {
				String href = element.attr("href");
				if(StringUtils.isNotEmpty(href) && href.startsWith("http://")){
					href = href.replace(href, "");
				}else{
					href = "http://www.ui.cn" + href;
					set.add(href);
				}
			}
			Elements imgs = e.getElementsByTag("img");
			for (Element element : imgs) {
				String src = element.attr("data-original");
				if(src != null){
					System.out.println("封面图片是:"+src);
					conten.setImage(src);
				}else{
					conten.setImage(null);
				}
			}
			//URL地址循环，进行抓取
			for (String url:set) {
				try {
					Document doc = Jsoup.connect(url).get();
					if(doc!=null){
						//标题
						String title = doc.getElementsByTag("h1").eq(0).text();
						//标签
						Elements tagDoms = doc.getElementsByClass("hd-info-t");
						for(Element tagDom : tagDoms){
							String tag = tagDom.getElementsByTag("span").eq(0).text();
							System.out.println("标签是:"+tag);
							conten.setTag(tag);
						}
						//抓取内容
						Elements contentDom = doc.getElementsByClass("cont");
						String content = contentDom.html();
						
						conten.setTitle(title);
						conten.setContent(content);
						conten.setDescription(title);
						System.out.println("标题是:"+title);
						System.out.println("内容是:"+content);
						
						System.out.println(JSONUtil.serialize(conten));
						
						int flay = contentMapper.saveContent(conten);
						
						System.out.println("采集成功--------"+flay);
					}
					
				} catch (Exception e1) {
					e1.printStackTrace();
					continue;
				}
			}
		}
	}*/
	/**
	 * 抓取酷我音乐网页音乐
	 * @Title: handlerMusic 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param   参数说明 
	 * @return void  返回类型 
	 * @throws
	 */
	@Test
	public void handlerMusic(){
		
	    String htmlsource = getHtmlSource("http://www.kuwo.cn/bang/index","utf-8");
		Document document = Jsoup.parse(htmlsource);
		
		Elements es = document.getElementsByClass("listMusic");
		for(Element e : es){
			Set<String> set = new HashSet<>();
			Elements elements = e.getElementsByTag("a");
			for (Element element : elements) {
				String href = element.attr("href");
				if(StringUtils.isNotEmpty(href) && href.startsWith("http://www.kuwo.cn/yinyue/")){
					set.add(href);
				}
			}
			
			//URL地址循环，进行抓取
			for (String url:set) {
				try {
					Document doc = Jsoup.connect(url).get();
					HashMap<String,Object> map = new HashMap<String,Object>();
					if(doc!=null){
						//歌名
						String title = doc.getElementById("lrcName").text();
						if(StringUtils.isNotEmpty(title)){
							map.put("title",title);
							System.out.println("歌名是:"+title);
						}
						//专辑
						Elements tagDoms = doc.getElementsByClass("album");
						for(Element tagDom:tagDoms){
							String tag = tagDom.getElementsByTag("span").eq(0).text();
							if(StringUtils.isNotEmpty(tag)){
								System.out.println("专辑是:"+tag);
							}
						}
						//歌手
						String singer = doc.getElementsByClass("artist").eq(1).text();
						if(StringUtils.isNotEmpty(singer)){
							map.put("singer",singer);
							System.out.println("歌手是:"+singer);
						}
						//歌词
						String lrc = doc.getElementById("lrcContent").html();
						if(StringUtils.isNotEmpty(lrc)){
							map.put("lrc",lrc);
							System.out.println("歌词是:"+lrc);
						}
						//封面图片
						Elements picDoms = doc.getElementsByClass("musiciPic");
						Set<String> setPic = new HashSet<>();
						for(Element picDom:picDoms){
							String href = picDom.getElementsByTag("a").attr("href");
							if(StringUtils.isNotEmpty(href) && href.startsWith("http://")){
								setPic.add(href);
							}
						}
						for (String picUrl:setPic) {
								Document picDoc = Jsoup.connect(picUrl).get();
								if(picDoc!=null){
									Element imgDom = picDoc.getElementById("artistContent");
									String img = imgDom.getElementsByTag("img").eq(0).attr("data-src");
									if(StringUtils.isNotEmpty(img)){
										System.out.println("封面图片是:"+img);
										map.put("img",img);
									}
								}
							}
						/*Music music = new Music();
						music.setCategoryId(1);
						music.setComments(0);
						music.setHits(0);
						music.setIsDelete(0);
						music.setLoves(0);
						music.setStatus(1);
						music.setUserId(1);
						music.setTitle(title);
						music.setLrc(lrc);
						musicMapper.save(music);*/
					}
					
				} catch (Exception e2) {
					e2.printStackTrace();
					continue;
				}
			}
		}
	}
	
	
	/**
	 * 抓取网易云音乐网页音乐
	 * @Title: handlerMusic 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param   参数说明 
	 * @return void  返回类型 
	 * @throws
	 */
	@Test
	public void handlerWangYiYunMusic(){
		
	    String htmlsource = getHtmlSource("http://music.163.com/#/discover/toplist?id=19723756","utf-8");
		Document document = Jsoup.parse(htmlsource);
		
		Elements es = document.getElementsByClass("m-table");
		for(Element e : es){
			Set<String> set = new HashSet<>();
			Elements elements = e.getElementsByTag("tr");
			for (Element element : elements) {
				String href = element.attr("href");
				if(StringUtils.isNotEmpty(href) && href.startsWith("http://www.kuwo.cn/yinyue/")){
					set.add(href);
				}
			}
			
			//URL地址循环，进行抓取
			for (String url:set) {
				try {
					Document doc = Jsoup.connect(url).get();
					HashMap<String,Object> map = new HashMap<String,Object>();
					if(doc!=null){
						//歌名
						String title = doc.getElementById("lrcName").text();
						if(StringUtils.isNotEmpty(title)){
							map.put("title",title);
							System.out.println("歌名是:"+title);
						}
						//专辑
						Elements tagDoms = doc.getElementsByClass("album");
						for(Element tagDom:tagDoms){
							String tag = tagDom.getElementsByTag("span").eq(0).text();
							if(StringUtils.isNotEmpty(tag)){
								System.out.println("专辑是:"+tag);
							}
						}
						//歌手
						String singer = doc.getElementsByClass("artist").eq(1).text();
						if(StringUtils.isNotEmpty(singer)){
							map.put("singer",singer);
							System.out.println("歌手是:"+singer);
						}
						//歌词
						String lrc = doc.getElementById("lrcContent").html();
						if(StringUtils.isNotEmpty(lrc)){
							map.put("lrc",lrc);
							System.out.println("歌词是:"+lrc);
						}
						//封面图片
						Elements picDoms = doc.getElementsByClass("musiciPic");
						Set<String> setPic = new HashSet<>();
						for(Element picDom:picDoms){
							String href = picDom.getElementsByTag("a").attr("href");
							if(StringUtils.isNotEmpty(href) && href.startsWith("http://")){
								setPic.add(href);
							}
						}
						for (String picUrl:setPic) {
								Document picDoc = Jsoup.connect(picUrl).get();
								if(picDoc!=null){
									Element imgDom = picDoc.getElementById("artistContent");
									String img = imgDom.getElementsByTag("img").eq(0).attr("data-src");
									if(StringUtils.isNotEmpty(img)){
										System.out.println("封面图片是:"+img);
										map.put("img",img);
									}
								}
							}
						/*Music music = new Music();
						music.setCategoryId(1);
						music.setComments(0);
						music.setHits(0);
						music.setIsDelete(0);
						music.setLoves(0);
						music.setStatus(1);
						music.setUserId(1);
						music.setTitle(title);
						music.setLrc(lrc);
						musicMapper.save(music);*/
					}
					
				} catch (Exception e2) {
					e2.printStackTrace();
					continue;
				}
			}
		}
	}
}