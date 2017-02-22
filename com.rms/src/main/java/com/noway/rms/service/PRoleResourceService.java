package com.noway.rms.service;

import com.noway.rms.entity.PRoleResource;

import java.util.HashMap;
import java.util.List;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *   服务类
 * </p>
 *
 * @author Noway
 * 创建时间 2017-01-10
 */
public interface PRoleResourceService extends IService<PRoleResource> {
	
	Page<PRoleResource> selectPageByRoid(Page<PRoleResource> prr, String roid);
	
	List<HashMap<String, Object>> getResourceTreeByRoidAndParentId(String roid, String parentId);

	boolean updateRoleResource(String roid, List<PRoleResource> prrList);
}
