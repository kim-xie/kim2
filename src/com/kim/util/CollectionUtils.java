package com.kim.util;

import java.io.Serializable;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

@SuppressWarnings({"unchecked", "rawtypes"})
public abstract class CollectionUtils {

	/**
	 * Return {@code true} if the supplied Collection is {@code null}
	 * or empty. Otherwise, return {@code false}.
	 * @param collection the Collection to check
	 * @return whether the given Collection is empty
	 */
	public static boolean isEmpty(Collection collection) {
		return (collection == null || collection.isEmpty());
	}

	/**
	 * Return {@code true} if the supplied Map is {@code null}
	 * or empty. Otherwise, return {@code false}.
	 * @param map the Map to check
	 * @return whether the given Map is empty
	 */
	public static boolean isEmpty(Map map) {
		return (map == null || map.isEmpty());
	}


    /**
     * Adds all elements in the iteration to the given collection.
     * 
     * @param collection  the collection to add to, must not be null
     * @param iterator  the iterator of elements to add, must not be null
     * @throws NullPointerException if the collection or iterator is null
     */
    public static void addAll(Collection collection, Iterator iterator) {
        while (iterator.hasNext()) {
            collection.add(iterator.next());
        }
    }
    
    /**
     * Adds all elements in the enumeration to the given collection.
     * 
     * @param collection  the collection to add to, must not be null
     * @param enumeration  the enumeration of elements to add, must not be null
     * @throws NullPointerException if the collection or enumeration is null
     */
    public static void addAll(Collection collection, Enumeration enumeration) {
        while (enumeration.hasMoreElements()) {
            collection.add(enumeration.nextElement());
        }
    }    
    
    /** 
     * Adds all elements in the array to the given collection.
     * 
     * @param collection  the collection to add to, must not be null
     * @param elements  the array of elements to add, must not be null
     * @throws NullPointerException if the collection or array is null
     */
    public static void addAll(Collection collection, Object[] elements) {
        for (int i = 0, size = elements.length; i < size; i++) {
            collection.add(elements[i]);
        }
    }


	/**
	 * Merge the given Properties instance into the given Map,
	 * copying all properties (key-value pairs) over.
	 * <p>Uses {@code Properties.propertyNames()} to even catch
	 * default properties linked into the original Properties instance.
	 * @param props the Properties instance to merge (may be {@code null})
	 * @param map the target Map to merge the properties into
	 */
	public static void mergePropertiesIntoMap(Properties props, Map map) {
		if (map == null) {
			throw new IllegalArgumentException("Map must not be null");
		}
		if (props != null) {
			for (Enumeration en = props.propertyNames(); en.hasMoreElements();) {
				String key = (String) en.nextElement();
				Object value = props.getProperty(key);
				if (value == null) {
					// Potentially a non-String value...
					value = props.get(key);
				}
				map.put(key, value);
			}
		}
	}


	/**
	 * Check whether the given Collection contains the given element instance.
	 * <p>Enforces the given instance to be present, rather than returning
	 * {@code true} for an equal element as well.
	 * @param collection the Collection to check
	 * @param element the element to look for
	 * @return {@code true} if found, {@code false} else
	 */
	public static boolean containsInstance(Collection collection, Object element) {
		if (collection != null) {
			for (Object candidate : collection) {
				if (candidate == element) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * Return {@code true} if any element in '{@code candidates}' is
	 * contained in '{@code source}'; otherwise returns {@code false}.
	 * @param source the source Collection
	 * @param candidates the candidates to search for
	 * @return whether any of the candidates has been found
	 */
	public static boolean containsAny(Collection source, Collection candidates) {
		if (isEmpty(source) || isEmpty(candidates)) {
			return false;
		}
		for (Object candidate : candidates) {
			if (source.contains(candidate)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Return the first element in '{@code candidates}' that is contained in
	 * '{@code source}'. If no element in '{@code candidates}' is present in
	 * '{@code source}' returns {@code null}. Iteration order is
	 * {@link Collection} implementation specific.
	 * @param source the source Collection
	 * @param candidates the candidates to search for
	 * @return the first present object, or {@code null} if not found
	 */
	public static Object findFirstMatch(Collection source, Collection candidates) {
		if (isEmpty(source) || isEmpty(candidates)) {
			return null;
		}
		for (Object candidate : candidates) {
			if (source.contains(candidate)) {
				return candidate;
			}
		}
		return null;
	}

	/**
	 * Find a single value of the given type in the given Collection.
	 * @param collection the Collection to search
	 * @param type the type to look for
	 * @return a value of the given type found if there is a clear match,
	 * or {@code null} if none or more than one such value found
	 */
	public static <T> T findValueOfType(Collection<?> collection, Class<T> type) {
		if (isEmpty(collection)) {
			return null;
		}
		T value = null;
		for (Object element : collection) {
			if (type == null || type.isInstance(element)) {
				if (value != null) {
					// More than one value found... no clear single value.
					return null;
				}
				value = (T) element;
			}
		}
		return value;
	}


	/**
	 * Determine whether the given Collection only contains a single unique object.
	 * @param collection the Collection to check
	 * @return {@code true} if the collection contains a single reference or
	 * multiple references to the same instance, {@code false} else
	 */
	public static boolean hasUniqueObject(Collection collection) {
		if (isEmpty(collection)) {
			return false;
		}
		boolean hasCandidate = false;
		Object candidate = null;
		for (Object elem : collection) {
			if (!hasCandidate) {
				hasCandidate = true;
				candidate = elem;
			}
			else if (candidate != elem) {
				return false;
			}
		}
		return true;
	}

	/**
	 * Find the common element type of the given Collection, if any.
	 * @param collection the Collection to check
	 * @return the common element type, or {@code null} if no clear
	 * common type has been found (or the collection was empty)
	 */
	public static Class<?> findCommonElementType(Collection collection) {
		if (isEmpty(collection)) {
			return null;
		}
		Class<?> candidate = null;
		for (Object val : collection) {
			if (val != null) {
				if (candidate == null) {
					candidate = val.getClass();
				}
				else if (candidate != val.getClass()) {
					return null;
				}
			}
		}
		return candidate;
	}

	/**
	 * Marshal the elements from the given enumeration into an array of the given type.
	 * Enumeration elements must be assignable to the type of the given array. The array
	 * returned will be a different instance than the array given.
	 */
	public static <A,E extends A> A[] toArray(Enumeration<E> enumeration, A[] array) {
		ArrayList<A> elements = new ArrayList<A>();
		while (enumeration.hasMoreElements()) {
			elements.add(enumeration.nextElement());
		}
		return elements.toArray(array);
	}

	/**
	 * Adapt an enumeration to an iterator.
	 * @param enumeration the enumeration
	 * @return the iterator
	 */
	public static <E> Iterator<E> toIterator(Enumeration<E> enumeration) {
		return new EnumerationIterator<E>(enumeration);
	}


	/**
	 * Iterator wrapping an Enumeration.
	 */
	private static class EnumerationIterator<E> implements Iterator<E> {

		private Enumeration<E> enumeration;

		public EnumerationIterator(Enumeration<E> enumeration) {
			this.enumeration = enumeration;
		}

		public boolean hasNext() {
			return this.enumeration.hasMoreElements();
		}

		public E next() {
			return this.enumeration.nextElement();
		}

		public void remove() throws UnsupportedOperationException {
			throw new UnsupportedOperationException("Not supported");
		}
	}

	public static boolean contains(Collection<String> collection, String element, boolean ignoreCase) {
		if (ignoreCase) {
			for (String candidate : collection) {
				if ((element == null && candidate == null) || (element != null && element.equalsIgnoreCase(candidate)) || (candidate != null && candidate.equalsIgnoreCase(element))) return true;
			}
			return false;
		} else {
			return collection.contains(element);
		}
	}
	
	public static boolean containsAny(Collection<String> source, Collection<String> candidates, boolean ignoreCase) {
		if (isEmpty(source) || isEmpty(candidates)) {
			return false;
		}
		for (String candidate : candidates) {
			if (contains(source, candidate, ignoreCase)) {
				return true;
			}
		}
		return false;
	}

	public static boolean remove(Collection<String> collection, String element, boolean ignoreCase) {
		if (ignoreCase) {
			boolean find = false;
			String findElement = null;
			for (String candidate : collection) {
				if ((element == null && candidate == null) || (element != null && element.equalsIgnoreCase(candidate)) || (candidate != null && candidate.equalsIgnoreCase(element))) {
					find = true;
					findElement = candidate;
					break;
				}
			}
			if (find) return collection.remove(findElement);
			return find;
		} else {
			return collection.remove(element);
		}
	}
	
	public static int indexOf(Collection<String> collection, String element, boolean ignoreCase) {
		if (ignoreCase) {
			int i = 0;
			for (String candidate : collection) {
				if ((element == null && candidate == null) || (element != null && element.equalsIgnoreCase(candidate)) || (candidate != null && candidate.equalsIgnoreCase(element))) {
					return i;
				}
				i++;
			}
		} else {
			int i = 0;
			for (String candidate : collection) {
				if ((element == null && candidate == null) || (element != null && element.equals(candidate)) || (candidate != null && candidate.equals(element))) {
					return i;
				}
				i++;
			}
		}
		return -1;
	}

	public static <K, V> boolean mapContainsKey(Map<K, V> map, K key, boolean ignoreCase) {
		if (ignoreCase) {
			String keyStr = key == null ? null : key.toString();
			for (K candidate : map.keySet()) {
				String candidateStr = candidate == null ? null : candidate.toString();
				if ((keyStr == null && candidateStr == null) || (keyStr != null && keyStr.equalsIgnoreCase(candidateStr)) || (candidateStr != null && candidateStr.equalsIgnoreCase(keyStr))) return true;
			}
			return false;
		} else {
			return map.containsKey(key);
		}
	}

	public static <K, V> V mapGet(Map<K, V> map, K key, boolean ignoreCase) {
		if (ignoreCase) {
			String keyStr = key == null ? null : key.toString();
			for (K candidate : map.keySet()) {
				String candidateStr = candidate == null ? null : candidate.toString();
				if ((keyStr == null && candidateStr == null) || (keyStr != null && keyStr.equalsIgnoreCase(candidateStr)) || (candidateStr != null && candidateStr.equalsIgnoreCase(keyStr))) return map.get(candidate);
			}
			return null;
		} else {
			return map.get(key);
		}
	}
	
	
	public static <K, V> void sortListMap(List<Map<K, V>> list, String... mapKeys) {
		if (list == null || list.isEmpty()) return;
		
		Collections.sort(list, new SortMapByKey(mapKeys));
	}
	
	public static class SortMapByKey<K, V> implements Comparator<Map<K, V>>, Serializable {

		private static final long serialVersionUID = -8550801159965193628L;
		
		private final String[] keys;
		
		public SortMapByKey(String... keys) {
			this.keys = keys;
		}
		
		@Override
		public int compare(Map<K, V> o1, Map<K, V> o2) {
			for (String key : this.keys) {
				String o1ValStr = o1.get(key) == null ? "" : o1.get(key).toString();
				String o2ValStr = o2.get(key) == null ? "" : o2.get(key).toString();
				
				if (!o1ValStr.equals(o2ValStr))
					return Collator.getInstance(Locale.CHINESE).compare(o1ValStr, o2ValStr);
			}
			
			return 0;
		}
	}

}
