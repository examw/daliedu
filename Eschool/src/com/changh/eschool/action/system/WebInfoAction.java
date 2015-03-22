package com.changh.eschool.action.system;

import com.changh.eschool.entity.WebInfo;
import com.changh.eschool.service.WebInfoService;

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
