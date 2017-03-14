package com.kim.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {
	/**
	 * @throws ParseException 
	 * @Title: main 
	 * @Description: TODO(日期格式转换) 
	 * @param @param args  参数说明 
	 * @return void  返回类型 
	 * @throws
	 */
	public Date DateFormate(Date date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(date);
		Date d = sdf.parse(s);
		System.out.println(s);
		System.out.println(d);
		return d;
	}
	@org.junit.Test
	public void testDate() throws ParseException{
		//Date date = new Date();
		DateFormate(new Date());
	}
	
	@org.junit.Test
	public void testSession(){
		/**
		 * 获取数据库的连接
		 */
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		System.out.println(ac);
		/**
		 * 获取SqlSession连接
		 */
		SqlSessionFactory sqlSessionFactory = ac.getBean("sqlSessionFactoryBean",SqlSessionFactory.class);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.getConnection();
		System.out.println(sqlSession);
	}
	/**
	 * @Title: testUserService 
	 * @Description: TODO(测试UserService) 
	 * @param   参数说明 
	 * @return void  返回类型 
	 * @throws
	 */
	@org.junit.Test
	public void testUserService(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		System.out.println(ac);
	}
	/**
	 * @throws ParseException 
	 * @throws ParseException 
	 * @Title: testUserService 
	 * @Description: TODO(测试ContentService) 
	 * @param   参数说明 
	 * @return void  返回类型 
	 * @throws
	 */
	@org.junit.Test
	public void testContentService() throws ParseException{
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		System.out.println(ac);
		
		SqlSessionFactory sqlSessionFactory = ac.getBean("sqlSessionFactoryBean",SqlSessionFactory.class);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		System.out.println(sqlSession);
		
		//ContentMapper contentMapper = ac.getBean("contentMapper",ContentMapper.class);
		
		
	}
	//获取项目路径
	public static void main(String[] args) {
		System.out.println(System.getProperty("user.dir"));
	}
	
}
