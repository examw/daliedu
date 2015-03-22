package com.changh.sccms.action.user.administrator;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.service.AdministratorService;
import com.changh.sccms.service.MenuService;

public class UpdateAction extends BaseAction{
	//	input
	private Administrator admin;
	private Integer roleId;
	public void setAdmin(Administrator admin) {
		this.admin = admin;
	}
	
	public Administrator getAdmin() {
		return admin;
	}

	// output
	private boolean ok=false;
	
	public boolean isOk() {
		return ok;
	}
		//injection
		private AdministratorService AdministratorService;
		private MenuService menuService;
		public void setAdministratorService(AdministratorService AdministratorService) {
			this.AdministratorService = AdministratorService;
		}
	public String execute()throws Exception
	{
		try{
			admin.setRole(menuService.findById(roleId));
			AdministratorService.updateAdministrator(admin);
			System.out.println(admin.getRole().getRoleId());
			ok=true;
		}catch(NullPointerException e)
		{
			e.printStackTrace();
			ok=false;
		}catch(Exception e)
		{
			throw e;
		}
		return "success";
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
}
