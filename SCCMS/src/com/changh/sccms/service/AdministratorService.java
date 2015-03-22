package com.changh.sccms.service;

import java.util.List;

import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.Log;

public interface AdministratorService {
	//findAll
	public List<Administrator> administratorList() throws Exception;
	//findById
	public Administrator getAdministrator(int id)throws Exception;
	//findByUsername
	public Administrator getAdministrator(String username);
	//add
	public void addAdministrator(Administrator administrator)throws Exception;
	//update
	public void updateAdministrator(Administrator administrator) throws Exception;
	public void update(Administrator admin)throws Exception; 
	//delete
	public void deleteAdministrator(int id)throws Exception;
	//search
	public List<Administrator> searchAdministrator(String str,String searchName)throws Exception;
	public List<Administrator> searchAdministrator(String content) throws Exception;
	/**
	 * save log
	 */
	public void saveLog(Log log) throws Exception;
	/**
	 * 精确查找
	 * @param page
	 * @param pagesize
	 * @param sortname
	 * @param sortorder
	 * @param str
	 * @param searchName
	 * @return
	 * @throws Exception
	 */
	public List<Log> findLog(int page,int pagesize,String sortname,String sortorder,String str,String searchName) throws Exception;
	/**
	 * 时间段的日志
	 * @param date
	 * @param page
	 * @param pagesize
	 * @param sortname
	 * @param sortorder
	 * @return
	 * @throws Exception
	 */
	public List<Log> selectLog(String date,int page,int pagesize,String sortname,String sortorder) throws Exception;
	/**
	 * total
	 * @param searchName
	 * @param str
	 * @return
	 * @throws Exception
	 */
	public int getSearchTotal(String searchName,String str) throws Exception;
	/**
	 *	时间total
	 * @param date
	 * @return
	 */
	public int getTotal(String date);
	/**
	 * 删除十天以前的日志
	 */
	public void deleteLog();
}
