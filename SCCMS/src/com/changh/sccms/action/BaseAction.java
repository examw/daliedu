package com.changh.sccms.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.changh.sccms.test.TestLog4j;

public class BaseAction implements SessionAware,
		RequestAware,ServletRequestAware{
	protected Map<String,Object> session;
	protected Map<String,Object> request;
	protected HttpServletRequest httpRequest;

	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
		
	}

	public void setServletRequest(HttpServletRequest httpRequest) {
		this.httpRequest = httpRequest;
		
	}

}

