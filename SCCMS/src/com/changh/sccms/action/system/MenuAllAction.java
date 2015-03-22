package com.changh.sccms.action.system;

import java.util.ArrayList;
import java.util.List;


import com.changh.sccms.entity.Menu;
import com.changh.sccms.service.MenuService;

public class MenuAllAction {
	private List<Menu> list ;
	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public MenuService menuService;
	public String execute(){
		list = menuService.findByPidMenu(1001);
		for(Menu m:list){
			List<Menu> list1 = menuService.findByPidMenu(m.getId());
			if(list1!=null&&list.size()!=0){
				for(Menu m1:list1){
					m1.setChildren(menuService.findByPidMenu(m1.getId()));
				}
			}
			m.setChildren(list1);
			
		}
		return "success";
	}

	public List<Menu> getList() {
		return list;
	}

	public void setList(List<Menu> list) {
		this.list = list;
	}
}
