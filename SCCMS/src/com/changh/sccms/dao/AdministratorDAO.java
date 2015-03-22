package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.Log;
import com.changh.sccms.entity.Student;

public interface AdministratorDAO {
	//找出所有的管理员
	public List<Administrator> findAll()throws Exception;
	//找指定id的管理员
	public Administrator findById(int id)throws Exception;
	//找指定用户名的管理员
	public Administrator findByUsername(String username);
	//找指定姓名的管理员
	public List<Administrator> findByName(String name)throws Exception;
	//修改管理员信息
	public void update(Administrator administrator)throws Exception;
	//删除
	public void delete(int id)throws Exception;
	//添加
	public void save(Administrator administrator)throws Exception;
	//搜索1
	public List<Administrator> search(String str,String searchName)throws Exception;
	//搜索2
	public List<Administrator> search(String content)throws Exception;
	//添加日志
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
	 * 删除十天前的日志
	 */
	public void deleteLog();
	
}
