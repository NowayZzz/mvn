package com.noway.rms.service.init;

import org.springframework.beans.factory.annotation.Autowired;

import com.base.init.InitServiceInterface;
import com.noway.rms.entity.PResource;
import com.noway.rms.service.PResourceService;

public class SystemInitService  implements InitServiceInterface{
	
	@Autowired
	private PResourceService pResourceService;
	
	void init(){
		PResource pr_系统管理 = new PResource();
		pr_系统管理.setParentId("0");
		pr_系统管理.setName("系统管理");
		pr_系统管理.setIcon("icon-gear");
		pr_系统管理.setSort(99);
		pr_系统管理.setState("1");
		PResource pr_用户 = new PResource();
		pr_用户.setParentId(pr_系统管理.getId());
		pr_用户.setName("用户管理");
		pr_用户.setIcon("icon-user");
		pr_用户.setUrl("system/manager/user");
		pr_用户.setSort(1);
		pr_用户.setState("1");
		PResource pr_角色 = new PResource();
		pr_角色.setParentId("0");
		pr_角色.setName("角色管理");
		pr_角色.setIcon("icon-gear");
		pr_角色.setSort(2);
		pr_角色.setState("1");
		PResource pr_资源 = new PResource();
		pr_资源.setParentId("0");
		pr_资源.setName("资源管理");
		pr_资源.setIcon("icon-gear");
		pr_资源.setSort(3);
		pr_资源.setState("1");
		
	}
}
