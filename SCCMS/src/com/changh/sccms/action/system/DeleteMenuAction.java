package com.changh.sccms.action.system;

import java.util.HashMap;
import java.util.Map;

import com.changh.sccms.service.MenuService;
import com.changh.sccms.until.LGDataUtil;

public class DeleteMenuAction {
	private Integer id;
	private MenuService menuService;
	private Map map = new HashMap();
	public String execute(){
		if(menuService.delete(id)){
			map = LGDataUtil.gridMap("", false, null);
		}else{
			map = LGDataUtil.gridMap("ÏµÍ³Òì³££¬É¾³ýÊ§°Ü", true, null);
		}
		return "success";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
