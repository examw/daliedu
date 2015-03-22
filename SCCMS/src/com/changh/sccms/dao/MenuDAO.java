package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.Menu;
import com.changh.sccms.entity.Role;

public interface MenuDAO {
	/**
	 * 查找子菜单
	 * @param pid
	 * @return
	 */
	public List<Menu> findByPidMenu(int pid);
	/**
	 * 按用户定制菜单
	 * @param pid
	 * @param list
	 * @return
	 */
	public List<Menu> findByAdmin(int pid,List list);
	/**
	 * 按id查找菜单
	 * @param id
	 * @return
	 */
	public Menu findMenuById(int id);
	/**
	 * 修改或保存
	 * @param m
	 */
	public void saveOrUpdate(Menu m);
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
