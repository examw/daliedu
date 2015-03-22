package com.changh.sccms.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.changh.sccms.dao.MenuDAO;
import com.changh.sccms.entity.Menu;
import com.changh.sccms.entity.Role;
import com.changh.sccms.service.MenuService;

public class MenuServiceImpl implements MenuService {
	private MenuDAO menuDao;

	public List<Menu> findByPidMenu(int pid) {
		return menuDao.findByPidMenu(pid);
	}

	public MenuDAO getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(MenuDAO menuDao) {
		this.menuDao = menuDao;
	}

	public void saveOrUpdate(Menu m) {
		menuDao.saveOrUpdate(m);
	}

	public boolean delete(int id) {
		return menuDao.delete(id);
	}

	public List<Role> findAll() {
		return menuDao.findAll();
	}

	public void saveOrUpdateRole(Role role) {
		 menuDao.saveOrUpdateRole(role);
	}

	public void deleteRole(int id) {
		menuDao.deleteRole(id);
	}

	public Role findById(int id) {
		return menuDao.findById(id);
	}

	public List<Menu> findMenuById(List list,int pid) {
		return  menuDao.findByAdmin(pid, list);
		
	}

}
