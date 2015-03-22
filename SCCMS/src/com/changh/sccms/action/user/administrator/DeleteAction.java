package com.changh.sccms.action.user.administrator;

import com.changh.sccms.service.AdministratorService;

public class DeleteAction {
	//input 
	private int id;
	private boolean ok=false;
	
	public boolean isOk() {
		return ok;
	}
	public void setId(int id) {
		this.id = id;
	}
	//injection
	private AdministratorService administratorService;
	public void setAdministratorService(AdministratorService administratorService) {
			this.administratorService = administratorService;
	}
	public String execute()throws Exception
	{
		
		try{

				administratorService.deleteAdministrator(id);
				ok=true;
			
		}catch(Exception e)
		{
			throw e;
		}
		return "success";
	}
}
