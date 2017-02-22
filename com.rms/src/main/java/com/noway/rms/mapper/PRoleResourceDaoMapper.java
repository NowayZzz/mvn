package com.noway.rms.mapper;

import com.noway.rms.entity.PRoleResource;

import java.util.HashMap;
import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

/**
 *
 * @author Noway
 * 创建时间 2017-01-10
 */
public interface PRoleResourceDaoMapper extends BaseMapper<PRoleResource> {
	
	List<PRoleResource> selectPageByRoid(Pagination page, String roid);
	
	List<HashMap<String, Object>> selectResourceByRoidAndParentId(String roid, String parentId);
}