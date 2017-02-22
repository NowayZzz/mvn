package com.noway.rms.web.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.toolkit.StringUtils;
import com.noway.rms.entity.PRole;
import com.noway.rms.entity.PUser;
import com.noway.rms.service.PRoleService;
import com.noway.rms.web.controller.base.BaseController;

/**
 *
 * @author Noway
 * 创建时间 2017-01-10
 */
@Controller
@RequestMapping("/rms/role")
public class PRoleController extends BaseController {

	@Autowired
	private PRoleService pRoleService;

	@RequestMapping(method = RequestMethod.GET)
	public String role() {
		return "rms/role_index";
	}

	/**
	 * 实现加载时、查询时的list动作
	 * @param name
	 * @param page
	 * @param rows
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public String list(String name,int page, int rows) {
		Wrapper<PRole> ew = new EntityWrapper<PRole>();
		if(StringUtils.isNotEmpty(name))
			ew.like("name", name);
		Page<PRole> prPage = new Page<>(page, rows);
		Page<PRole> result = pRoleService.selectPage(prPage, ew);
		return jsonPage(result);
	}


	/**
	 * 添加新角色页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toadd")
	public String add() {
		return "rms/role_add";
	}

 
	/**
	 * 负责创建角色，并与数据库层交互
	 * @param model
	 * @param response
	 * @param role
	 */
	@RequestMapping(value = "/add")
	@ResponseBody
	public String create(PRole prole) {
		Wrapper<PRole> prw = new EntityWrapper<PRole>();
		prw.where("name={0}", prole.getName());
		PRole pr = pRoleService.selectOne(prw);
		if (null != pr ) {
			return jsonResult(false, "角色名已存在");
		}
		
		prole.setStatus("1");
		boolean bool = pRoleService.insert(prole);
		if(bool){
			return jsonResult(true, "新增角色成功");
		}else{
			return jsonResult(true, "新增角色失败");
		}
	}


	@RequestMapping(value = "/toedit")
	public String updateUserPage(Model model, String id) {
		model.addAttribute("id", id);
		return "rms/role_edit";
	}
	
	@RequestMapping(value = "/preedit")
	@ResponseBody
	public String updateUserPage(String id) {
		return jsonResult(pRoleService.selectById(id));
		
	}
	
	/**
	 * 更新角色名字、状态等
	 * @param model
	 * @param response
	 * @param id
	 * @param name
	 * @param status
	 */
	@RequestMapping(value = "/update")
	@ResponseBody
	public String update(PRole prole) {
		try {
			pRoleService.updateById(prole);
			return jsonResult(true, "更新成功");
		} catch (Exception e) {
			e.printStackTrace();
			return jsonResult(false, "更新角色失败");
		}
		
	}

}
