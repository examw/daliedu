 package com.changh.eschool.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;


public class BaseAction implements SessionAware,
		RequestAware,ServletRequestAware,ServletResponseAware{
	protected Map<String,Object> session;
	protected Map<String,Object> request;
	protected HttpServletRequest httpRequest;
	protected HttpServletResponse httpResponse;
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
		
	}

	public void setServletRequest(HttpServletRequest httpRequest) {
		this.httpRequest = httpRequest;
		
	}
	public void setServletResponse(HttpServletResponse httpResponse){
		this.httpResponse = httpResponse;
	}
}

