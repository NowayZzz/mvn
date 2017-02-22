package com.noway.rms.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.Constants;
import com.noway.rms.entity.PResource;
import com.noway.rms.entity.PUser;
import com.noway.rms.service.PResourceService;
import com.noway.rms.service.PUserService;
import com.noway.rms.web.controller.base.BaseController;

@Controller
public class LoginController extends BaseController {
	
	@Autowired
	private PUserService pUserService;
	
	@Autowired
	private PResourceService pResourceService;
	
	@RequestMapping(value = "login")
	public String index(Model model, HttpSession session, PUser user) {
//		JSON<String> json = new JSON<String>();
		if (StringUtils.isBlank(user.getLoginname()) || StringUtils.isBlank(user.getPassword())) {
			model.addAttribute("errMsg", "用户名或密码不能为空");
			return "login";
		}
		logger.info("----------------用户登录验证--------------------");
		
		//判断用户是否在系统用户中
		Map<String,Object> searcheMap = new HashMap<String,Object>();
		searcheMap.put("loginname", user.getLoginname());
		List<PUser> pUserList = pUserService.selectByMap(searcheMap);
//		systemUserService.checkLoginName(user.getLoginname());
		if ( null == pUserList || pUserList.size() == 0){
			model.addAttribute("errMsg", "用户不存在");
			return "signin";
		} 
		
		PUser pUser = pUserList.get(0);
		if (!user.getPassword().equals(pUser.getPassword())) {
//			if (!MD5Utils.getMD5(user.getPassword()).equals(pUser.getPassword())) {
			model.addAttribute("errMsg", "密码不正确");
			return "signin";
		}
		
		logger.info("----------------用户{}登录成功--------------------",pUser.getLoginname());
		session.setAttribute(Constants.SESSION_USER, pUser);
		
		List<PResource> menuList = pResourceService.selectResourceListTreeByUserId(pUser.getId());
		
		session.setAttribute("menuList", menuList);	
		return "redirect:/interface";
	}
	
	@RequestMapping(value="/loginout")
	public String signout_page(HttpSession session) {
		session.invalidate();
		
		return "redirect:/signin";
	}
}
