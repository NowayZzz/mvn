package com.noway.rms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.noway.rms.entity.PResource;
import com.noway.rms.mapper.PResourceDaoMapper;
import com.noway.rms.service.PResourceService;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Noway 创建时间 2017-01-10
 */
@Service
public class PResourceServiceImpl extends ServiceImpl<PResourceDaoMapper, PResource> implements PResourceService {
	
	@Autowired
	private PResourceDaoMapper pResourceDaoMapper;

	public List<PResource> selectResourceListTreeByUserId(String userId, String parentId) {
		// Map<String, String> map = new HashMap<String, String>();
		List<PResource> moduleList = pResourceDaoMapper.selectModuleIdByUserIdParentId(userId, parentId);// 从顶层查找各模块查找
		if (!moduleList.isEmpty()) {
			for (PResource rr : moduleList) {
				List<PResource> list_ = selectResourceListTreeByUserId(userId, rr.getId());
				if (!list_.isEmpty()) {
					rr.setChildren(list_);
				}
			}
		}
		return moduleList;
	}

	@Override
	public List<PResource> selectResourceListTreeByUserId(String userId) {
		return selectResourceListTreeByUserId(userId, "0");// 从顶层开始查找
	}
	
	/**
	 * 直接查找节点树
	 * 
	 * @param pid
	 * @return
	 */
	public List<PResource> getPResourceListTree(String parentId) {
		List<PResource> list = pResourceDaoMapper.selectChildIdByParentId(parentId);
		if (!list.isEmpty()) {
			for (PResource n : list) {
				List<PResource> list_ = getPResourceListTree(n.getId());
				if (!list_.isEmpty()) {
					n.setChildren(list_);
				}
			}
		}
		return list;
	}
}
