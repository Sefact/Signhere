package com.signhere.utils;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Component
public class Session {
	//singleton생성위한 session class
		
		/* Session영역으로부터 attribute 값을 가져 오기 위한 method  */
	    public Object getAttribute(String name) throws Exception {
	        return (Object) RequestContextHolder.getRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_SESSION);
	    }
	 
	    /* Session영역에 attribute 설정 method */
	    public void setAttribute(String name, Object object) throws Exception {
	        RequestContextHolder.getRequestAttributes().setAttribute(name, object, RequestAttributes.SCOPE_SESSION);
	    }
	 
	    /* Session영역에 설정된 attribute 삭제 */
	    public void removeAttribute(String name) throws Exception {
	        RequestContextHolder.getRequestAttributes().removeAttribute(name, RequestAttributes.SCOPE_SESSION);
	    }
	 
	    /* Session영역의 SessionId값을 가져오기 위한 Method */
	    public String getSessionId() throws Exception  {
	        return RequestContextHolder.getRequestAttributes().getSessionId();
	    }
	}
