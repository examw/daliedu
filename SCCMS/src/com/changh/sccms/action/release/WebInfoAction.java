package com.changh.sccms.action.release;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.changh.sccms.entity.WebInfo;
import com.changh.sccms.service.WebInfoService;
import com.changh.sccms.until.FreeMarkerUtil;
import com.changh.sccms.until.PropertiesUtil;

public class WebInfoAction {
	private WebInfo webInfo;
	private WebInfoService webInfoService;
	private boolean ok=false;

	public String execute(){
		webInfo = webInfoService.findWebInfo();
		String genFilePath = "/common/";
		HttpServletRequest request = ServletActionContext.getRequest();
		String rootPath= PropertiesUtil.getOptValue("rootPath");
		String htmlFileName = "foot1.html";
		Map<String, WebInfo> root = new HashMap<String, WebInfo>();
		root.put("webInfo",webInfo);
		boolean flag = FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,
				"/foot1.ftl", root, genFilePath, htmlFileName);
		setOk(flag);
		String foot2FileName = "foot2.html";
		Map<String, WebInfo> foot = new HashMap<String, WebInfo>();
		foot.put("webInfo",webInfo);
		boolean flag1 = FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,
				"/foot2.ftl", foot, genFilePath, foot2FileName);
		if(flag&&flag1){
			ok=true;
		}
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

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}
}
