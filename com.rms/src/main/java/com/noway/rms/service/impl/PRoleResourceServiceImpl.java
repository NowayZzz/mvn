package com.noway.rms.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.noway.rms.entity.PRoleResource;
import com.noway.rms.mapper.PRoleResourceDaoMapper;
import com.noway.rms.service.PRoleResourceService;

/**
 * <p>
 *   服务实现类
 * </p>
 *
 * @author Noway
 * 创建时间 2017-01-10
 */
@Service
public class PRoleResourceServiceImpl extends ServiceImpl<PRoleResourceDaoMapper, PRoleResource> implements PRoleResourceService {

	@Autowired
	PRoleResourceDaoMapper pRoleResourceDaoMapper;
	
	@Override
	public Page<PRoleResource> selectPageByRoid(Page<PRoleResource> pur, String roid) {
		pur.setRecords(pRoleResourceDaoMapper.selectPageByRoid(pur, roid));
		return pur;
	}

	@Override
	public List<HashMap<String, Object>> getResourceTreeByRoidAndParentId(String roid, String parentId) {
		List<HashMap<String, Object>> list = pRoleResourceDaoMapper.selectResourceByRoidAndParentId(roid, parentId);
		if (!list.isEmpty()) {
			for (HashMap<String, Object> n : list) {
				List<HashMap<String, Object>> list1 = getResourceTreeByRoidAndParentId(roid,n.get("id").toString());
				if (!list1.isEmpty()) {
					n.put("children", list1);
				}
			}
		}
		return list;
	}

	@Override
	public boolean updateRoleResource(String roid, List<PRoleResource> prrList) {
		Wrapper<PRoleResource> prrw = new EntityWrapper<PRoleResource>();
		prrw.where("role_id={0}", roid);
		delete(prrw);//删除该角色的所有节点
		insertBatch(prrList);//写入新节点
		return true;
	}
	
}
