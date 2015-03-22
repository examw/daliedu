package com.changh.sccms.action.system;

import com.changh.sccms.entity.WebInfo;
import com.changh.sccms.service.WebInfoService;

public class SaveOrUpdateWebInfoAction {
	private WebInfoService webInfoService;
	private boolean ok =false;
	private WebInfo  webInfo;
	
	public String execute(){
		webInfoService.saveOrUpdate(webInfo);
		ok = true;
		return "success";
	}
	public void setWebInfoService(WebInfoService webInfoService) {
		this.webInfoService = webInfoService;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public WebInfo getWebInfo() {
		return webInfo;
	}
	public void setWebInfo(WebInfo webInfo) {
		this.webInfo = webInfo;
	}
	
}
