package com.kim.core;

import java.util.UUID;

public class CoreUtils {
	/**
	 * 生成32位随机不重复的字符串ID
	 */
	public static String generateID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
}
