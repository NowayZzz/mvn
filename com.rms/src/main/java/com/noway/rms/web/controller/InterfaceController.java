package com.noway.rms.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.plugins.Page;
import com.base.util.cache.impl.EhcacheCacheImpl;
import com.common.util.Constants;
import com.noway.rms.entity.PUser;
import com.noway.rms.web.controller.base.BaseController;

@Controller
public class InterfaceController extends BaseController {
	
	private Logger logger = LoggerFactory.getLogger(InterfaceController.class);
	
	@RequestMapping(value = "interface")
	public String home(Model model, HttpSession session) {
		PUser user = (PUser) session.getAttribute(Constants.SESSION_USER);
		model.addAttribute("user", user);
		return "interface";
	}
	
	@RequestMapping(value = "toLogin")
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping(value = "onLineUser")
	public String onLineUser() {
		return "onLineUser";
	}
	
	@RequestMapping(value = "onLineUser/list")
	@ResponseBody
	public String onLineUserList(HttpServletResponse response, int page, int rows) throws Exception {
		EhcacheCacheImpl ehcache = new EhcacheCacheImpl("onLineUserCache");
		List<PUser> puList = new ArrayList<PUser>();
		for (String loginname : ehcache.getKeys()) {
			puList.add((PUser) ehcache.get(loginname));
		}
		int total = puList.size();
		int fromIndex = (page-1)*rows;
		int endIndex = page*rows>total?total: page*rows;
		
		Page<PUser> pup = new Page<PUser>();
		pup.setTotal(total);
		
		pup.setRecords(puList.subList(fromIndex, endIndex));
		return jsonPage(pup);
	}
	
}
