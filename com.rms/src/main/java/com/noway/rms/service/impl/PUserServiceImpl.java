package com.noway.rms.service.impl;

import com.noway.rms.entity.PUser;
import com.noway.rms.mapper.PUserDaoMapper;
import com.noway.rms.service.PUserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
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
public class PUserServiceImpl extends ServiceImpl<PUserDaoMapper, PUser> implements PUserService {
	
}
