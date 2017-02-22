package com.noway.rms.web.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.noway.rms.entity.PRole;
import com.noway.rms.entity.PRoleResource;
import com.noway.rms.service.PRoleResourceService;
import com.noway.rms.service.PRoleService;
import com.noway.rms.web.controller.base.BaseController;

@Controller
@RequestMapping(value = "rms/role_resource")
public class PRoleResourceController extends BaseController {

	@Autowired
	PRoleService pRoleService;
	
	@Autowired
	PRoleResourceService pRoleResourceService;
	
	@RequestMapping()
	public String node(Model model) {
		return "rms/role_resource"; 
	}
	/**
	 * 根据角色查找节点
	 * @param model
	 * @param response
	 * @param role_id
	 */
	@RequestMapping(value = "resource/list")
	@ResponseBody
	public String node_list(String roid) {
		List<HashMap<String, Object>> result = pRoleResourceService.getResourceTreeByRoidAndParentId(roid, 0+"");
		return jsonResult(result);

	}
	/**
	 * 查询roleList
	 * @param model
	 * @param response
	 * @param roleName
	 * @param page
	 * @param rows
	 */
	@RequestMapping(value = "role/list")
	@ResponseBody
	public String role_list(String name, int page, int rows) {
		Wrapper<PRole> prw = new EntityWrapper<PRole>();
		prw.like("name", name);
		Page<PRole> pr = new Page<PRole>(page, rows);
		Page<PRole> result = pRoleService.selectPage(pr, prw);
		return jsonPage(result);
	}
	
	/**
	 * 更新角色的节点
	 * @param model
	 * @param response
	 * @param role_id
	 * @param node_list
	 */
	@RequestMapping(value = "resource/save")
	@ResponseBody
	public String saveNodeList(String roid,@RequestParam(value="resource_list[]")String[] resource_list) {
		List<PRoleResource> prrList = new ArrayList<PRoleResource>();
		for (String resource_id : resource_list) {
			PRoleResource prr = new PRoleResource();
			prr.setRoleId(roid);
			prr.setResourceId(resource_id);
			prrList.add(prr);
		}
		pRoleResourceService.updateRoleResource(roid,prrList);
		return jsonResult(true, "更新成功");
	}	
}