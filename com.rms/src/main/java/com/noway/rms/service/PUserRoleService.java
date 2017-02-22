package com.noway.rms.service;

import com.noway.rms.entity.PUserRole;

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
public interface PUserRoleService extends IService<PUserRole> {
	/**
	 * 获取用户的角色,分页
	 * @param pur
	 * @param userId
	 * @return
	 */
	Page<PUserRole> selectPageByUserId(Page<PUserRole> pur, String userId);
	
	/**
	 * 获取用户未选的角色,分页
	 * @param pur
	 * @param userId
	 * @return
	 */
	Page<PUserRole> selectPageOtherByUserId(Page<PUserRole> pur, String userId);

}
