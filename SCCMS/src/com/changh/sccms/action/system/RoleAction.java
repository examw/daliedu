package com.changh.sccms.action.system;

import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.Role;
import com.changh.sccms.service.MenuService;
import com.changh.sccms.until.GridDataUtil;

public class RoleAction {
	private Map<String,Object> map;
	private MenuService menuService;
	
	public String execute(){
		List<Role> list = menuService.findAll();
		map = GridDataUtil.gridMap(list, list.size());
		return "success";
	}
	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	public Map<String,Object> getMap() {
		return map;
	}
	public void setMap(Map<String,Object> map) {
		this.map = map;
	}
}
