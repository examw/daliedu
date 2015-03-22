package com.changh.sccms.action.system;

import com.changh.sccms.service.AdministratorService;

public class DeleteLogAction {
	private boolean ok=false;
	private AdministratorService administratorService;
	
	public String execute(){
		administratorService.deleteLog();
		ok= true;
		return "success";
	}

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}

	public void setAdministratorService(AdministratorService administratorService) {
		this.administratorService = administratorService;
	}
}
