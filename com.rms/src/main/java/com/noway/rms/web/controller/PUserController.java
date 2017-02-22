package com.noway.rms.web.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.toolkit.StringUtils;
import com.noway.rms.entity.PUser;
import com.noway.rms.service.PUserService;
import com.noway.rms.web.controller.base.BaseController;

/**
 *
 * @author Noway
 * 创建时间 2017-01-10
 */
@Controller
@RequestMapping("/rms/user")
public class PUserController extends BaseController {

	@Autowired
	private PUserService pUserService;
	
	/**
	 * 进入用户管理页面
	 * @return
	 */
	@RequestMapping()
	public String user() {
		return "rms/user_index";
	}

	/**
	 * 查询用户列表
	 * @param model
	 * @param response
	 * @param username
	 * @param dept
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public String userList(HttpServletResponse response, String loginname,String username, int page, int rows) {
		EntityWrapper<PUser> ew = new EntityWrapper<PUser>();
		if(StringUtils.isNotEmpty(loginname))
			ew.like("loginname", loginname);
		if(StringUtils.isNotEmpty(username))
			ew.like("username", username);
		Page<PUser> pup = new Page<PUser>(page, rows);
		Page<PUser> result = pUserService.selectPage(pup, ew);
		return jsonPage(result);
	}

	/**
	 * 创建用户页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toadd")
	public String addUserPage() {
		return "rms/user_add";
	}

	/**
	 * 创建用户
	 * 
	 * @param model
	 * @param response
	 * @param role
	 */
	@RequestMapping(value = "/add")
	@ResponseBody
	public String createUser(HttpServletResponse response,PUser puser) {
		Wrapper<PUser> puw = new EntityWrapper<PUser>();
		puw.where("loginname={0}", puser.getLoginname());
		PUser pu = pUserService.selectOne(puw);
		if (null != pu ) {
			return jsonResult(false, "用户已存在");
		}
		
		puser.setCreatetime(new Date());
		puser.setState("1");
		boolean bool = pUserService.insert(puser);
		if(bool){
			return jsonResult(true, "新增用户成功");
		}else{
			return jsonResult(true, "新增用户失败");
		}
	}
	
	/**
	 * 用户页面
	 * @param model
	 * @param response
	 * @param username
	 */
	@RequestMapping(value = "/toedit")
	public String updateUserPage(Model model, String id) {
		model.addAttribute("id", id);
		return "rms/user_edit";
	}
	
	/**
	 *获取编辑页面的用户数据 
	*/
	@RequestMapping(value = "/preedit")
	@ResponseBody
	public String updateUserPage(String id) {
		return jsonResult(pUserService.selectById(id));
		
	}
	
	/**
	 * 更新用户
	 * @param model
	 * @param response
	 * @param user
	 */
	@RequestMapping(value = "/update")
	@ResponseBody
	public String updateUser(PUser puser) {
		try {
			pUserService.updateById(puser);
			return jsonResult(true, "更新成功");
		} catch (Exception e) {
			e.printStackTrace();
			return jsonResult(false, "更新用户失败");
		}
	}
	
	/**
	 * 删除用户
	 * @param model
	 * @param response
	 * @param ids
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public String deleteUserS(String[] ids) {
		try {
			pUserService.deleteBatchIds(Arrays.asList(ids));
			return jsonResult(true, "删除成功");
		} catch (Exception e) {
			e.printStackTrace();
			return jsonResult(true, "用户删除失败!");
		}
		
	}
	
}
