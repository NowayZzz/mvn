package com.noway.rms.web.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.common.util.Constants;

public class AccessInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AccessInterceptor.class);
	
	private List<String> noFilters;
	private String loginPage;
	
	public void setNoFilters(List<String> noFilters) {
		this.noFilters = noFilters;
	}
	
	public List<String> getNoFilters() {
		return noFilters;
	}

	public String getLoginPage() {
		return loginPage;
	}
	
	public void setLoginPage(String loginPage) {
		this.loginPage = loginPage;
	}
	

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object o) throws Exception {
		
		String uri = request.getRequestURI();
		
		logger.debug("验证URI："+uri);
		boolean beFilter = true;
        for (String s : noFilters) {
            if (StringUtils.contains(uri, s)) {
                beFilter = false;
                break;
            }
        }
        
        //log.debug("是否要检查Session："+beFilter);
        if (beFilter) {
        	logger.debug("检查Session："+uri);
//        	Object obj = null;
        	if(null == request.getSession().getAttribute(Constants.SESSION_USER) || request.getHeader("REFERER")==null){
        		
        		//log.debug("Session为空");
        		response.setStatus(401);
        		if (request.getHeader("X-Requested-With") != null) {
        			logger.debug("非法请求,强制登录ajax");
        			ajax401Return(response);
        		} else {
        			logger.debug("非法请求,强制登录");
        			response.sendRedirect(request.getContextPath() + loginPage);
        		}
        		return false;
        	}
        }
        
        //log.debug("AccessInterceptor 通过");
		return true;
	}
	
	private void ajax401Return(HttpServletResponse response) {
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.write("{title:'登录超时',message:'请重新登录'}");
			out.flush();
		} catch (IOException e) {
			logger.error(e.getMessage());
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}
	
}
