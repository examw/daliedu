package com.changh.sccms.action.system;

import java.util.HashMap;
import java.util.Map;

import com.changh.sccms.entity.Menu;
import com.changh.sccms.service.MenuService;
import com.changh.sccms.until.LGDataUtil;

public class SaveOrUpdateMenuAction {
	private String text;
	private String menuNumber;
	private Integer id;
	private Integer menuPid;
	private String icon;
	private String menuAddress;
	private Map map = new HashMap();
	private Boolean isError =true;
	
	public Boolean getIsError() {
		return isError;
	}

	public void setIsError(Boolean isError) {
		this.isError = isError;
	}

	private MenuService menuService;
	private String message="";
	
	public String execute(){
		try {
			Menu m = new Menu();
			m.setIcon(icon);
			if(id!=null){
				m.setId(id);
			}
			m.setMenuAddress(menuAddress);
			m.setMenuNumber(menuNumber);
			m.setMenuPid(menuPid);
			m.setText(text);
			menuService.saveOrUpdate(m);
			isError= false;
		} catch (Exception e) {
			e.printStackTrace();
			isError= true;
			message ="系统出错，添加失败";
		}
		map = LGDataUtil.gridMap(message, isError, null);
		return "success";
	}
	
	public String getMenuAddress() {
		return menuAddress;
	}
	public void setMenuAddress(String menuAddress) {
		this.menuAddress = menuAddress;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getMenuNumber() {
		return menuNumber;
	}
	public void setMenuNumber(String menuNumber) {
		this.menuNumber = menuNumber;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMenuPid() {
		return menuPid;
	}
	public void setMenuPid(Integer menuPid) {
		this.menuPid = menuPid;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Map getMap() {
		return map;
	}

	public void setMap(Map map) {
		this.map = map;
	}
}
