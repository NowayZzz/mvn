package com.noway.rms.mapper;

import com.noway.rms.entity.PUserRole;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

/**
 *
 * @author Noway
 * 创建时间 2017-01-10
 */
public interface PUserRoleDaoMapper extends BaseMapper<PUserRole> {
	List<PUserRole> selectPageByUserId(Pagination page, String userId);
	
	/**
	 * 获取用户未选的角色,分页
	 * @param pur
	 * @param userId
	 * @return
	 */
	List<PUserRole> selectPageOtherByUserId(Page<PUserRole> pur, String userId);
}