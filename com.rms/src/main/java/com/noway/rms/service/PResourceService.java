package com.noway.rms.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.noway.rms.entity.PResource;

/**
 * <p>
 *   服务类
 * </p>
 *
 * @author Noway
 * 创建时间 2017-01-10
 */
public interface PResourceService extends IService<PResource> {
	/**
	 * 根据用户id获取该用户的资源权限
	 * @param userId
	 * @return
	 */
	List<PResource> selectResourceListTreeByUserId(String userId);

	
	List<PResource> getPResourceListTree(String parentId);
}
