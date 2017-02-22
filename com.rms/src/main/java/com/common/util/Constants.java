package com.common.util;

import java.util.ResourceBundle;

/**
 * 系统常量
 * 
 * @author 懂得
 *
 */
public class Constants {

	/** 获取properties配置文件属性 */
	public static ResourceBundle rb = null;
	
	public static final String SESSION_USER = "session_user"; 

	static {
		rb = ResourceBundle.getBundle("config");
	}
	
	

}
