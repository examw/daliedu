package com.changh.sccms.service;

import java.util.List;

import com.changh.sccms.entity.Menu;
import com.changh.sccms.entity.Role;

public interface MenuService {
	public List<Menu> findByPidMenu(int pid);
	/**
	 * 修改或者保存
	 * @param m
	 */
	public void saveOrUpdate(Menu m);
	/**
	 * 
	 * @param menuId
	 * @param pid
	 * @return
	 */
	public List<Menu> findMenuById(List list,int pid);
	/**
	 * 删除
	 */
	public boolean delete(int id);
	/**
	 * 角色查找
	 */
	public List<Role> findAll();
	/**
	 * 修改或者添加角色
	 */
	public void saveOrUpdateRole(Role role);
	/**
	 * 删除角色
	 */
	public void deleteRole(int id);
	/**
	 * 查看
	 */
	public Role findById(int id);
}
