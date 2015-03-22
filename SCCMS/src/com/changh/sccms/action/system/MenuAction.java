package com.changh.sccms.action.system;

import java.util.ArrayList;
import java.util.List;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.Menu;
import com.changh.sccms.service.MenuService;

public class MenuAction extends BaseAction{
	private List<Menu> list = new ArrayList<Menu>();
	private MenuService menuService;
	public String execute(){
		Administrator admin = (Administrator) session.get("admin");
		String menuId = admin.getRole().getMenuId();
		String[] str = menuId.split(";");
		ArrayList<Integer> list1 = new ArrayList<Integer>();
		for(int i=0;i<str.length;i++){
			list1.add(Integer.parseInt(str[i]));
		}
		list = menuService.findMenuById(list1,1001);
		for(Menu m:list){
			m.setChildren(menuService.findMenuById(list1, m.getId()));
		}
		/*for(Menu m:list1){
			if(m.getMenuPid()==1001){
				list.add(m);
			}
		}
		for(Menu m:list){
			List<Menu> list2 = new ArrayList<Menu>();
			for(Menu m1:list1){
				if(m1.getMenuPid().equals(m.getId())){		
					List<Menu> list3 = new ArrayList<Menu>();
					for(Menu m2 :list1){
						if(m2.getMenuPid().equals(m1.getId())){
							list3.add(m2);
						}
					}
					m1.setChildren(list3);
				    list2.add(m1);
				}
			}
			m.setChildren(list2);
				}*/
		return "success";
	}
	
	
	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}


	public List<Menu> getList() {
		return list;
	}


	public void setList(List<Menu> list) {
		this.list = list;
	}
	
}
