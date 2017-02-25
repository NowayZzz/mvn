package com.noway.rms.web.controller;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.base.util.cache.impl.EhcacheCacheImpl;
import com.common.util.Constants;
import com.noway.rms.entity.PUser;

public class OnlineUser implements HttpSessionListener{
	
	private Logger logger = LoggerFactory.getLogger(OnlineUser.class);
	
	private int count;//统计在线人数
	
	EhcacheCacheImpl ehcache = new EhcacheCacheImpl("onLineUserCache");
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		count++;
		logger.info("当前session用户个数:"+count);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		count--;
		PUser pu = (PUser) se.getSession().getAttribute(Constants.SESSION_USER);
		if(null == pu)
			return ;
		try {
			logger.debug("开始移除缓存登录用户:"+pu.getLoginname()+"["+pu.getUsername()+"]");
			ehcache.remove(pu.getLoginname());
			logger.info("当前登录用户个数:"+ehcache.getKeys().size());
			logger.info("当前session用户个数:"+count);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("在线统计登录人数移除缓存失败");
		}
	}
	
}
