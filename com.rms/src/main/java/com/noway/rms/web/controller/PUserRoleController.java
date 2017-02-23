package com.noway.rms.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.toolkit.StringUtils;
import com.base.util.dwr.DwrUtil;
import com.noway.rms.entity.PUser;
import com.noway.rms.entity.PUserRole;
import com.noway.rms.service.PUserRoleService;
import com.noway.rms.service.PUserService;
import com.noway.rms.web.controller.base.BaseController;

/**
 *
 * @author Noway
 * 创建时间 2017-01-10
 */
@Controller
@RequestMapping("/rms/user_role")
public class PUserRoleController extends BaseController {

	@Autowired
	private PUserRoleService pUserRoleService;
	
	@Autowired
	private PUserService pUserService;

	/**
	 * 进入用户角色管理页面
	 * @return
	 */
	@RequestMapping()
	public String user() {
		return "rms/user_role";
	}

	/**
	 * 查询用户列表
	 * @param model
	 * @param response
	 * @param username
	 * @param dept
	 */
	@RequestMapping(value = "/user/list")
	@ResponseBody
	public String userList(HttpServletResponse response, String userSerchKey, int page, int rows) {
		EntityWrapper<PUser> ew = new EntityWrapper<PUser>();
		if(StringUtils.isNotEmpty(userSerchKey))
			ew.where("loginname like {0} or username like {1}", "'%"+ userSerchKey + "%'", "'%" + userSerchKey + "%'");
//			ew.or("loginname like '%{0}%' or username like '%{1}%'", userSerchKey, userSerchKey);
		Page<PUser> pup = new Page<PUser>(page, rows);
		Page<PUser> result = pUserService.selectPage(pup, ew);
		return jsonPage(result);
	}

	/**
	 * 根据用户id获取该用户的角色
	 * @param userId
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value="/role/list")
	@ResponseBody
	public String userRoleList(String userId, int page, int rows) {
		if(StringUtils.isEmpty(userId)){
			return jsonPage(null);
		}
//		Wrapper<PUserRole> prw = new EntityWrapper<PUserRole>();
//		prw.where("user_id={0}", userId);
		Page<PUserRole> prp = new Page<PUserRole>(page, rows);
		Page<PUserRole> result = pUserRoleService.selectPageByUserId(prp, userId);
		return jsonPage(result);
	}
	
	/**
	 * 根据用户id获取该用户未选择的角色
	 * @param userId
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value="/role/addlist")
	@ResponseBody
	public String userRoleAddList(String userId, int page, int rows) {
		if(StringUtils.isEmpty(userId)){
			return jsonPage(null);
		}
		Page<PUserRole> prp = new Page<PUserRole>(page, rows);
		Page<PUserRole> result = pUserRoleService.selectPageOtherByUserId(prp, userId);
		return jsonPage(result);
	}
	
	@RequestMapping(value="/add_role")
	@ResponseBody
	public String addRole(String userId,@RequestParam(value="ids[]") String ids[]) {
		List<PUserRole> prList = new ArrayList<PUserRole>();
		for (int i = 0; i < ids.length; i++) {
			PUserRole pr = new PUserRole();
			pr.setUserId(userId);
			pr.setRoleId(ids[i]);
			prList.add(pr);
			Wrapper<PUserRole> prw = new EntityWrapper<PUserRole>();
			prw.where("role_id={0}", ids[i]).where("user_id={0}", userId);
			PUserRole pr_exist = pUserRoleService.selectOne(prw);
			if(pr_exist!=null){
				return jsonResult(false, "请勿重复添加");
			}
		}
		pUserRoleService.insertBatch(prList);
		DwrUtil.noticeUser("noticeUser", "您的权限已经变更,请重新登录!", userId);
		return jsonResult(true, "添加成功");
	}
	
	@RequestMapping(value="/del_role")
	@ResponseBody
	public String delRole(String userId,@RequestParam(value="ids[]") List<String> ids) {
		pUserRoleService.deleteBatchIds(ids);
		DwrUtil.noticeUser("noticeUser", "您的权限已经变更,请重新登录!", userId);
		return jsonResult(true, "删除成功");
	}
	
	
}
