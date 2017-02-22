package com.noway.rms.service.impl;

import com.noway.rms.entity.PUserRole;
import com.noway.rms.mapper.PUserRoleDaoMapper;
import com.noway.rms.service.PUserRoleService;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *   服务实现类
 * </p>
 *
 * @author Noway
 * 创建时间 2017-01-10
 */
@Service
public class PUserRoleServiceImpl extends ServiceImpl<PUserRoleDaoMapper, PUserRole> implements PUserRoleService {

	@Autowired
	PUserRoleDaoMapper pUserRoleDaoMapper;

	@Override
	public Page<PUserRole> selectPageByUserId(Page<PUserRole> pur, String userId) {
		pur.setRecords(pUserRoleDaoMapper.selectPageByUserId(pur, userId));
		return pur;
	}
	
	@Override
	public Page<PUserRole> selectPageOtherByUserId(Page<PUserRole> pur, String userId) {
		pur.setRecords(pUserRoleDaoMapper.selectPageOtherByUserId(pur, userId));
		return pur;
	}
}
