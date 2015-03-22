package com.changh.sccms.action.system;

import java.util.List;

import com.changh.sccms.entity.Role;
import com.changh.sccms.service.MenuService;

public class RoleListAction {
	private List<Role> list;
	private MenuService menuService;
	
	public String execute(){
		 setList(menuService.findAll());
	
		return "success";
	}
	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	public List<Role> getList() {
		return list;
	}
	public void setList(List<Role> list) {
		this.list = list;
	}

}
