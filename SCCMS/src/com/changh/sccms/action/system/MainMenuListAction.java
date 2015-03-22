package com.changh.sccms.action.system;

import com.changh.sccms.entity.Menu;
import com.changh.sccms.service.MenuService;
/**
* @Title: MainMenuListAction.java
* @Package com.changh.sccms.action.system
* @Description: TODO(菜单列表)
* @author Failymiss jiangwei3457@163.com  
* @date 2013-6-10 下午3:24:09
* @version V1.0
 */
public class MainMenuListAction {
	private Object[] obj =new Object[1];
	private MenuService menuService;
	
	public String execute(){
		Menu mainMenu = menuService.findByPidMenu(0).get(0);
		mainMenu.setChildren(menuService.findByPidMenu(mainMenu.getId()));
		obj[0]=mainMenu;
		return "success";
	}
	
	

	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}



	public Object[] getObj() {
		return obj;
	}



	public void setObj(Object[] obj) {
		this.obj = obj;
	}
	
}
