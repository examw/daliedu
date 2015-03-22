package com.changh.sccms.action.user.administrator;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.Role;
import com.changh.sccms.service.AdministratorService;
import com.changh.sccms.service.MenuService;

public class AddAction  extends BaseAction{
	//	input
	private Administrator admin;
	private Integer roleId;

	public Administrator getAdmin() {
		return admin;
	}
	public void setAdmin(Administrator admin) {
		this.admin = admin;
	}
	//output
	private boolean ok=false;
	public boolean isOk() {
		return ok;
	}
	//injection
	private AdministratorService AdministratorService;
	private MenuService menuService;
 	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	public void setAdministratorService(AdministratorService AdministratorService) {
		this.AdministratorService = AdministratorService;
	}
	public String execute()throws Exception
	{
		try{
			Role r = menuService.findById(roleId);
			admin.setRole(r);
			AdministratorService.addAdministrator(admin);
			ok=true;
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
}
