package com.changh.sccms.action.system;

import java.util.HashMap;
import java.util.Map;

import com.changh.sccms.entity.Role;
import com.changh.sccms.service.MenuService;
import com.changh.sccms.until.LGDataUtil;

public class SaveOrUpdateRoleAction {
	private String menuId;
	private String roleDescribe;
	private Integer roleId;
	private String roleName;
	private Map map = new HashMap();
	private MenuService menuService;
	public String execute(){
		Role role = new Role();
		if(roleId!=null){
			role.setRoleId(roleId);
		}
		role.setMenuId(menuId);
		role.setRoleName(roleName);
		role.setRoleDescribe(roleDescribe);
		menuService.saveOrUpdateRole(role);
		map =LGDataUtil.gridMap("", false, null);
		return "success";
	}
	
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getRoleDescribe() {
		return roleDescribe;
	}
	public void setRoleDescribe(String roleDescribe) {
		this.roleDescribe = roleDescribe;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Map getMap() {
		return map;
	}
	public void setMap(Map map) {
		this.map = map;
	}
	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
}
