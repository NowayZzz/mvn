package com.noway.rms.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.quartz.MailQuartz;
import com.noway.rms.web.controller.base.BaseController;

/**
 * 测试类
 * @author Noway
 *
 */
@Controller
@RequestMapping(value="test")
public class TestController extends BaseController {
	
	@Autowired
	private MailQuartz mailQuartz;
	
	@RequestMapping(value = "sendMail")
	@ResponseBody
	public String index() {
		mailQuartz.sendMail();
		return jsonResult(true, "已经发送邮件");
	}
	
}
