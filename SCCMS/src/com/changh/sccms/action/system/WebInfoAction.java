package com.changh.sccms.action.system;

import com.changh.sccms.entity.WebInfo;
import com.changh.sccms.service.WebInfoService;

public class WebInfoAction {
	private WebInfo webInfo;
	private WebInfoService webInfoService;

	public String execute(){
		webInfo = webInfoService.findWebInfo();
		return "success";
	}

	public void setWebInfoService(WebInfoService webInfoService) {
		this.webInfoService = webInfoService;
	}

	public WebInfo getWebInfo() {
		return webInfo;
	}

	public void setWebInfo(WebInfo webInfo) {
		this.webInfo = webInfo;
	}
}
