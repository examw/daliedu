package com.changh.eschool.action.system;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import com.changh.eschool.action.BaseAction;

public class GetOnlineCountAction extends BaseAction{
	private Map<String,Object> map = new HashMap<String,Object>();
	public String execute(){
		ServletContext application = httpRequest.getSession().getServletContext();
		Long count = (Long) application.getAttribute("onlineCount");
		Map map = ((Map)application.getAttribute("courseOnline"));
		map.put("onlineCount", count==null?0:count);
		map.put("courseOnline",map==null?0:map.size());
		return "success";
	}
	public Map<String, Object> getMap() {
		return map;
	}
	
}
