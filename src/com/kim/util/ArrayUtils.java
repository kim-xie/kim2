package com.kim.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class ArrayUtils {
	
	/**
	 * 将一个array转为根据keys转为map
	 * @param array
	 * @param keys
	 * @return
	 */
	public static Map<String, Object> toMap(Object[] array,String...keys) {
		if(array == null) return new LinkedHashMap<String, Object>();
		Map<String, Object> m = new LinkedHashMap<String, Object>();
		for(int i = 0; i < keys.length; i++) {
			if(array.length == i ) {
				break;
			}
			m.put(keys[i], array[i]);
		}
		return m;
	}
	
	/**
	 * 求两个List的交集
	 * @param <T>
	 * @param list1
	 * @param list2
	 * @return
	 */
	public static <T> List<T> intersect(List<T> list1, List<T> list2) {
		Map<T, Boolean> map = new HashMap<T, Boolean>();
		List<T> result = new ArrayList<T>();
		for (T obj : list1) {
			if (!map.containsKey(obj)) {
				map.put(obj, Boolean.FALSE);
			}
		}
		for (T obj : list2) {
			if (map.containsKey(obj)) {
				map.put(obj, Boolean.TRUE);
			}
		}

		for (Entry<T, Boolean> e : map.entrySet()) {
			if (e.getValue().equals(Boolean.TRUE)) {
				result.add(e.getKey());
			}
		}

		return result;
	}
}
