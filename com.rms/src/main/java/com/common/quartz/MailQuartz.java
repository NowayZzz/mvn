package com.common.quartz;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.velocity.VelocityEngineUtils;

public class MailQuartz {
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private VelocityEngine velocityEngine;
	
	public void sendMail(){
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper ;
		try {
			helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom("spring_mail_test");
			helper.setTo("hbzp0428@163.com");
			helper.setSubject("spring邮件测试");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("name", "剪刀嘴");
			map.put("age", "26");
			String emailText = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "template.vm", "utf-8",  map);
			
			helper.setText(emailText, true);
			
			ClassPathResource image = new ClassPathResource("logo.jpg");
			helper.addInline("logo", image);
			
			javaMailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		
	}
}
