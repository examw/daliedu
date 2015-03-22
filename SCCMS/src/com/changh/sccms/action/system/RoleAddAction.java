package com.changh.sccms.action.system;

import com.changh.sccms.entity.Role;
import com.changh.sccms.service.MenuService;

public class RoleAddAction {
	public Role role;
	public boolean ok= false;
	public MenuService menuService;
	
	public String execute(){
		menuService.saveOrUpdateRole(role);
		ok= true;
		return "success";
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
}
