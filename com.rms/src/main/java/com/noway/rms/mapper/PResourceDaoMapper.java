package com.noway.rms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.noway.rms.entity.PResource;

/**
 *
 * @author Noway
 * 创建时间 2017-01-10
 */
public interface PResourceDaoMapper extends BaseMapper<PResource> {
	List<PResource> selectModuleIdByUserIdParentId(@Param("userId") String userId,@Param("parentId") String parentId);
	
	List<PResource> selectChildIdByParentId(String parentId);
}