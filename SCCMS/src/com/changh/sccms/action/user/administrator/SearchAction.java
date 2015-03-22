package com.changh.sccms.action.user.administrator;

import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.Administrator;
import com.changh.sccms.service.AdministratorService;
import com.changh.sccms.until.Escape;
import com.changh.sccms.until.GridDataUtil;

public class SearchAction {
	//input
	private String content;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = Escape.unescape(content);
	}
	//output
	private Map<String,Object> adminList;
	
	public Map<String, Object> getAdminList() {
		return adminList;
	}
	//inject
	private AdministratorService AdministratorService;
	
	public String execute() throws Exception{
		List<Administrator> list = AdministratorService.searchAdministrator(content);
		adminList = GridDataUtil.gridMap(list,list.size());
		return "success";
	}
	public void setAdministratorService(AdministratorService AdministratorService) {
		this.AdministratorService = AdministratorService;
	}
}
