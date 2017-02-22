package com.noway.rms.web.controller.base;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.plugins.Page;

public abstract class BaseController {
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/** ============================     requset    =================================================  */

	/**
	 * 获取当前请求对象
	 * @return
	 */
	public static HttpServletRequest getRequest(){
		try{
			return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		}catch(Exception e){
			return null;
		}
	}
	
	@ExceptionHandler(RuntimeException.class)
	@ResponseBody
	public String HandlerExceptionResolver(RuntimeException runtimeException){
		return jsonResult(false, "出现异常"+runtimeException.getMessage());
	}
	
	
	/**
	 * <p>
	 * 转换为 bootstrap-table 需要的分页格式 JSON
	 * </p>
	 * 
	 * @param page
	 *            分页对象
	 * @return
	 */
	protected String jsonPage(Page<?> page) {
		JSONObject jo = new JSONObject();
		jo.put("total", page.getTotal());
		jo.put("rows", page.getRecords());
		return jo.toString();
	}
	
	/**
	 * 返回json
	 * @param success
	 * @param message
	 * @return
	 */
	protected String jsonResult(boolean success, String message) {
		JSONObject jo = new JSONObject();
		jo.put("success", success);
		jo.put("message", message);
		return jo.toString();
	}
	
	/**
	 * 返回表单数据
	 * @param data
	 * @return
	 */
	protected String jsonResult(Object data) {
		return JSONObject.toJSON(data).toString();
	}

	/**
	 * getParameter系列的方法主要用于处理“请求数据”，是服务器端程序获取浏览器所传递参数的主要接口。
	 * @param name 表单name属性
	 * @return
	 */
	public String getParameter(String name) {
		return getRequest().getParameter(name);
	}
	
	/**
	 * getParameterValues这个方法是获得传过来的参数名相同的一个数组;
	 * @param name
	 * @return
	 */
	public String[] getParameterValues(String name){
		return getRequest().getParameterValues(name);
	}
	
	/**
	 * getAttribute这个方法是提取放置在某个共享区间的对象
	 * @param name
	 * @return
	 */
	public Object getAttribute(String name){
		return  getRequest().getSession().getAttribute(name);
	}
	
	/**
	 * 返回的是相对路径，工程的项目的相对路径
	 * @return
	 */
	public String getContextPath() {
		return getRequest().getContextPath();
	}
	
	/**
	 * 重定向至地址 url
	 * @param url 请求地址
	 * @return
	 */
	protected String redirectTo( String url ) {
		StringBuffer rto = new StringBuffer("redirect:");
		rto.append(url);
		return rto.toString();
	}
	
	/**
	 * 获取页面地址url
	 * @param path
	 * @return
	 */
	protected static String getViewPath( String path ){
		StringBuffer viewPath = new StringBuffer();
		viewPath.append(path);
		return viewPath.toString();
	}
	
	/**
	 * 生成随机数
	 * @param count 生成个数
	 * @return String
	 */
	protected String getRandomNum(int count){
		Random ra = new Random();
		String random="";
		for(int i=0;i<count;i++){
			random+=ra.nextInt(9);
		}
		return random;
	}
	
}
 