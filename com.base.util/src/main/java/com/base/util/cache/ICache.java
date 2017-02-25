package com.base.util.cache;

import java.util.List;

import net.sf.ehcache.Element;

public interface ICache {

	/**
	 * 对象加入缓存
	 * @param key
	 * @param obj
	 * @throws Exception
	 */
	void put(String key, Object obj) throws Exception;
	
	/**
	 * 根据key获取缓存对象
	 * @param key
	 * @return
	 * @throws Exception
	 */
    Object get(String key) throws Exception;
    
    /**
     * 删除缓存对象
     * @param key
     * @throws Exception
     */
    boolean remove(String key) throws IllegalStateException;
	
	/**
	 * 根据key获取element
	 * @param key
	 * @return
	 * @throws Exception
	 */
	Element getElement(String key) throws Exception;
	
	/**
	 * 获取缓存中所有key值
	 * @return
	 */
	List<String> getKeys();
	
	/**
	 * 获取所有的缓存名
	 * @return
	 */
	String[] getCacheNames();
	
	/**
	 * 删除缓存
	 * @param cacheName 缓存名
	 */
	void removeCache(String cacheName);
	
	/**
	 * 删除缓存内容
	 * @param cacheName 缓存名
	 * @throws Exception 
	 */
	void clearCache(String cacheName);
	
	/**
	 * 删除所有缓存
	 */
	void removeAllCache();
}