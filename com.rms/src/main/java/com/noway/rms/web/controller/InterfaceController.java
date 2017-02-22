package com.noway.rms.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.Constants;
import com.noway.rms.entity.PUser;

@Controller
public class InterfaceController  {
	
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
	
}
