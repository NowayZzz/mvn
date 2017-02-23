package com.base.util.dwr;

import java.util.Collection;

import org.directwebremoting.Browser;
import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.ScriptSessionFilter;
import org.directwebremoting.WebContextFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DwrUtil {

	protected static final Logger logger = LoggerFactory.getLogger(DwrUtil.class);
	
	public void onPageLoad(String userId) {
        ScriptSession session = WebContextFactory.get().getScriptSession();
        session.setAttribute("userId", userId);
    }
	
	/*public static void pushMessage(ScriptSessionFilter filter, Runnable task) {
		try {
			Browser.withAllSessionsFiltered(filter , task );
		} catch (Exception e) {
			logger.error("推送消息失败:" + e.getMessage());
		}
	}*/

	public static void noticeUser(final String funName, final String data, final String userId) {
		
		//自定义过滤条件
		ScriptSessionFilter scriptSessionFilter = new ScriptSessionFilter() {
			public boolean match(ScriptSession session) {
				if (session.getAttribute("userId") == null)
					return false;
				else
					logger.debug("session.getAttribute('userId')==="+session.getAttribute("userId").toString());
					return session.getAttribute("userId").toString().equals(userId);
//				return true;
			}
		};
		
		Runnable task = new Runnable() {
			private ScriptBuffer script = new ScriptBuffer();
			public void run() {
				script.appendCall(funName, data);
//				script.appendCall("showMessage",  data);
				Collection<ScriptSession> sessions = Browser.getTargetSessions();
				for (ScriptSession scriptSession : sessions) {
					scriptSession.addScript(script);
				}
			}
		};
		
		Browser.withAllSessionsFiltered(scriptSessionFilter , task);
	}
}