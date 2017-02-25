package com.base.util.cache;

import net.sf.ehcache.CacheManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EhacheManager {

	static Logger log = LoggerFactory.getLogger(EhacheManager.class);

	private EhacheManager() {
	}

	private static class Inner { // 私有的静态内部类
		static CacheManager cacheManager = CacheManager.getInstance();
	}

	public static CacheManager getInstance() {
		return Inner.cacheManager;
	}

}