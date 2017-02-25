package com.base.util.cache.impl;

import java.util.List;

import com.base.util.cache.EhacheManager;
import com.base.util.cache.ICache;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

public class EhcacheCacheImpl implements ICache {

	public static CacheManager manager = EhacheManager.getInstance();
	
	private Cache ehcache;
	
	public EhcacheCacheImpl(String cacheName) {
		ehcache = manager.getCache(cacheName);
	}

	@Override
	public void put(String key, Object obj) throws Exception {
		Element elemnt = new Element(key,obj);
		ehcache.put(elemnt);
	}

	@Override
	public Object get(String key) throws Exception {
		Element element = ehcache.get(key);
		if(null == element){
			return null;
		}
		return element.getObjectValue();
	}

	@Override
	public boolean remove(String key) throws IllegalStateException{
		return ehcache.remove(key);
	}
	
	/**
	 * 根据key获取element
	 * @param key
	 * @return
	 * @throws Exception
	 */
	@Override
	public Element getElement(String key) throws Exception {
		Element element = ehcache.get(key);
		return element;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<String> getKeys(){
		return ehcache.getKeys();
	}

	@Override
	public String[] getCacheNames(){
		return manager.getCacheNames();
	}

	@Override
	public void removeCache(String cacheName){
		manager.removeCache(cacheName);
	}
	
	@Override
	public void clearCache(String cacheName){
		List<String> keys = getKeys();
		for (String string : keys) {
			remove(string);
		}
	}

	@Override
	public void removeAllCache() {
		manager.removeAllCaches();
	}
}