package com.changh.sccms.action.system;

import java.util.HashMap;
import java.util.Map;

import com.changh.sccms.service.MenuService;
import com.changh.sccms.until.LGDataUtil;

public class DeleteRoleAction {
	private Integer roleId;
	private MenuService menuService;
	private Map map = new HashMap();
	
	public String execute(){
		menuService.deleteRole(roleId);
		map= LGDataUtil.gridMap("", false, null);
		return "success";
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	public Map getMap() {
		return map;
	}
	public void setMap(Map map) {
		this.map = map;
	}
}
