package com.changh.sccms.action.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.changh.sccms.service.MenuService;
import com.changh.sccms.until.GridDataUtil;

public class SubMenuAction {
	private Integer id;
	private Map<String, Object> menuMap = new HashMap<String, Object>();
	private MenuService menuService;
	public String  execute(){
		List list = menuService.findByPidMenu(id);
		menuMap = GridDataUtil.gridMap(list, list.size());
		return "success";
	}
	public Map<String, Object> getMenuMap() {
		return menuMap;
	}

	public void setMenuMap(Map<String, Object> menuMap) {
		this.menuMap = menuMap;
	}	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	
}
