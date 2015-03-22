package com.changh.sccms.action.user.administrator;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.Administrator;
import com.changh.sccms.service.AdministratorService;
import com.changh.sccms.until.GridDataUtil;



public class ListAction {
	//output
	private Map<String,Object> adminList = new HashMap<String, Object>();
	//inject
	private AdministratorService administratorService;
	public String execute() throws Exception{
		List<Administrator> list = administratorService.administratorList();
		adminList = GridDataUtil.gridMap(list,list.size());
		return "success";
	}
	public Map<String, Object> getAdminList() {
		return adminList;
	}
	public void setAdminList(Map<String, Object> adminList) {
		this.adminList = adminList;
	}
	
	public void setAdministratorService(AdministratorService administratorService) {
		this.administratorService = administratorService;
	}
}
