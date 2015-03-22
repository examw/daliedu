package com.changh.sccms.action.user.administrator;

import com.changh.sccms.entity.Administrator;
import com.changh.sccms.service.AdministratorService;

public class LoadAction {
	//input
	private int id;
	//output
	private Administrator admin;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Administrator getAdmin() {
		return admin;
	}
	public void setAdmin(Administrator administrator) {
		this.admin = administrator;
	}
	//injection
	private AdministratorService administratorService;
	public void setAdministratorService(AdministratorService administratorService) {
		this.administratorService = administratorService;
	}
	public String execute() throws Exception{
		admin = administratorService.getAdministrator(id);
		return "success";
	}
}
