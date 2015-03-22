package com.changh.eschool.action.system;

import com.changh.eschool.until.PropertiesUtil;

public class TurnClassLimitAction {
	private boolean ok;
	public String turn(){
		String current = PropertiesUtil.getOptValue("classLimitButton");
		if(current==null)
			PropertiesUtil.setOptValue("classLimitButton", "on");
		else if("on".equals(current)){
			PropertiesUtil.setOptValue("classLimitButton", "off");
		}else
			PropertiesUtil.setOptValue("classLimitButton", "on");
		ok = true;
		return "success";
	}
	
	public String getValue(){
		String current = PropertiesUtil.getOptValue("classLimitButton");
		if(current == null || "on".equals(current)){
			ok = true;
		}else{
			ok = false;
		}
		return "success";
	}

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}
}
