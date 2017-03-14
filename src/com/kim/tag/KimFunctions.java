package com.kim.tag;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;

import com.kim.util.StringUtils;
import com.kim.util.ip.TmIpUtil;

/**
 * 自定义函数标签
 * 类名: KingFunctions.java
 * 创建人: kim 
 * 创建时间：2016年5月31日 下午12:46:45 
 * @version 1.0.0
 */
public class KimFunctions {
	/**
	 * 日期格式化
	 * @Title: formatDate 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param date
	 * @param @param pattern
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	public static String formatDate(Date date,String pattern){
		return StringUtils.formatDate(date, pattern);
	}
	/**
	 * 集合数组长度
	 * @Title: getLength 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param collection
	 * @param @return  参数说明 
	 * @return int  返回类型 
	 * @throws
	 */
	public static int getLength(Collection collection){
		if(collection!=null){
			return collection.size();
		}else{
			return 0;
		}
	}
	/**
	 * 时间格式化
	 * @Title: getTimeFormat 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param startTime
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	public static String getTimeFormat(Date startTime){
		try{
			long startTimeMills = startTime.getTime();
			long endTimeMills = System.currentTimeMillis();
			long diff = (endTimeMills - startTimeMills)/1000;//秒
			long day_diff  = (long) Math.floor(diff/86400);//天
			StringBuffer buffer = new StringBuffer();
			if(day_diff<0){
				return "[error],时间越界...";
			}else{
				if(day_diff==0 && diff<60){
					if(diff==0)diff=1;
					buffer.append(diff+"秒前");
				}else if(day_diff==0 && diff<120){
					buffer.append("1 分钟前");
				}else if(day_diff==0 && diff<3600){
					buffer.append(Math.round(Math.floor(diff/60))+"分钟前");
				}else if(day_diff==0 && diff<7200){
					buffer.append("1小时前");
				}else if(day_diff==0 && diff<86400){
					buffer.append(Math.round(Math.floor(diff/3600))+"小时前");
				}else if(day_diff==1){
					buffer.append("1天前");
				}else if(day_diff<7){
					buffer.append(day_diff+"天前");
				}else if(day_diff <30){
					buffer.append(Math.round(Math.ceil( day_diff / 7 )) + " 星期前");
				}else if(day_diff >=30 && day_diff<=179 ){
					buffer.append(Math.round(Math.ceil( day_diff / 30 )) + "月前");
				}else if(day_diff >=180 && day_diff<365){
					buffer.append("半年前");
				}else if(day_diff>=365){
					buffer.append(Math.round(Math.ceil( day_diff /30/12))+"年前");
				}
			}
			return buffer.toString();
		}catch(Exception ex){
			return "";
		}
	}
	/**
	 * 根据数字查出索引
	 * @Title: getCharacter 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param num
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	public static String getCharacter(int num){
		return String.valueOf((char)(64+num));
	}
	/**
	 * 数字转为中文数字
	 * @Title: chinesCharacter 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param num
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	public static String chinesCharacter(int num){
	    String resultNumber = null;
	    if(num > 10000 || num < 0){
	        return "";
	    }
	    HashMap chnNumbers = new HashMap();
	    chnNumbers.put(0, "零");
	    chnNumbers.put(1, "一");
	    chnNumbers.put(2, "二");
	    chnNumbers.put(3, "三");
	    chnNumbers.put(4, "四");
	    chnNumbers.put(5, "五");
	    chnNumbers.put(6, "六");
	    chnNumbers.put(7, "七");
	    chnNumbers.put(8, "八");
	    chnNumbers.put(9, "九");
	 
	    HashMap unitMap = new HashMap();
	    unitMap.put(1, "");
	    unitMap.put(10, "十");
	    unitMap.put(100, "百");
	    unitMap.put(1000, "千");
	    int[] unitArray = {1000, 100, 10, 1};
	 
	    StringBuilder result = new StringBuilder();
	    int i = 0;
	    while(num > 0){
	        int n1 = num / unitArray[i];
	        if(n1 > 0){
	            result.append(chnNumbers.get(n1)).append(unitMap.get(unitArray[i]));
	        }
	        if(n1 == 0){
	            if(result.lastIndexOf("零") != result.length()-1){
	                result.append("零");
	            }
	        }
	        num = num % unitArray[i++];
	        if(num == 0){
	            break;
	        }
	    }
	    resultNumber = result.toString();
	    if(resultNumber.startsWith("零")){
	        resultNumber = resultNumber.substring(1);
	    }
	    if(resultNumber.startsWith("一十")){
	        resultNumber = resultNumber.substring(1);
	    }
	    return resultNumber;
	}
	
	/**
	 * @Title: getMoney 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param money
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	public static String getMoney(Double money){
		Trans2RMB t2r = new Trans2RMB();
		String s = t2r.cleanZero(t2r.splitNum(t2r.roundString(String.valueOf(money))));
		return s;
	}
	
	/**
	 * 查找ip对应的城市信息
	 * @Title: ipLocation 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param ip
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	public static String ipLocation(String ip){
		if(StringUtils.isEmpty(ip)){
			return "匿名";
		}
		return TmIpUtil.ipLocation(ip);
	}
	/**
	 * 查找内容索引
	 * @Title: indexOf 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param content
	 * @param @param search
	 * @param @return  参数说明 
	 * @return int  返回类型 
	 * @throws
	 */
	public static int indexOf(String content,String search){
		return content.indexOf(search);
	}
	
	/**
	 * 两个对象相等
	 * @param object1
	 * @param object2
	 * @return
	 */
	public static boolean equals(Object object1, Object object2) {
		return (object1 == null && object2 == null) || (object1 != null && object2 != null && object1.toString().equals(object2.toString()));
	}
	/**
	 * 两个对象不相等
	 * @param object1
	 * @param object2
	 * @return
	 */
	public static boolean notEquals(Object object1, Object object2) {
		return !equals(object1, object2);
	}
	/**
	 * 判断空对象
	 * @param object
	 * @return
	 */
	public static boolean isNull(Object object) {
		return object == null;
	}
	/**
	 * 判断空字符串
	 * @param string
	 * @return
	 */
	public static boolean isEmpty(String string) {
		return string == null || "".equals(string.trim());
	}
	
	/**
	 * 对象连接
	 * @param object
	 * @param split
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String join(Object object, String split) {
		if (object == null || "".equals(object.toString()))
			return "";
		
		Collection<Object> temps = new ArrayList<Object>();
		if (Collection.class.isAssignableFrom(object.getClass())) {
			temps.addAll((Collection<Object>) object);
		} else if (object.getClass().isArray()) {
			temps.addAll(Arrays.asList((Object[]) object));
		} else {
			temps.add(object);
		}
		
		String str = "";
		for (Object temp : temps) {
			String s = temp.toString();
			if (s.toString() != null && !"".equals(s)) {
				if (str.length() > 0)
					str += split;
				str += s;
			}
		}
		return str;
	}
	
	public static boolean objectCollectionContains(Collection<?> collection, Object object) {
		return collection == null ? false : collection.contains(object);
	}
	
	public static boolean stringCollectionContains(Collection<?> collection, Object object) {
		return collection == null ? false : collection.contains(object != null ? object.toString() : null);
	}
	
	public static boolean objectArrayContains(Object[] array, Object object) {
		return array == null ? false : Arrays.asList(array).contains(object);
	}
	
	public static boolean stringArrayContains(Object[] array, Object object) {
		return array == null ? false : Arrays.asList(array).contains(object != null ? object.toString() : null);
	}
	
	public static Object iff(boolean condition, Object obj1, Object obj2) {
		return condition ? obj1 : obj2;
	}
	
	public static boolean toBoolean(Object object) {
		return object != null && (Boolean.TRUE.equals(object) || "true".equalsIgnoreCase(object.toString()));
	}
	
	/**
	 * 方法测试
	 * @Title: main 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param args  参数说明 
	 * @return void  返回类型 
	 * @throws
	 */
	public static void main(String[] args) {
		//char A 65
		//B 66
		//C 67
		//D 68
//		for(int i=1;i<=26;i++){
//			System.out.println(getCharacter(i));
//		}
//		System.out.println(getMoney(1275.48787d));
		
		System.out.println(ipLocation("127.0.0.1"));
	}
}
