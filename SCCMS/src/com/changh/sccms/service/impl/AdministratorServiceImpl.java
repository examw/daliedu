package com.changh.sccms.service.impl;

import java.util.Date;
import java.util.List;

import com.changh.sccms.dao.AdministratorDAO;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.Log;
import com.changh.sccms.service.AdministratorService;

public class AdministratorServiceImpl implements AdministratorService {
	//injection
	private AdministratorDAO administratorDao;
	public List<Administrator>  administratorList() throws Exception{
		return administratorDao.findAll();
	}
	public void setAdministratorDao(AdministratorDAO administratorDao) {
		this.administratorDao = administratorDao;
	}
	//find by id
	public Administrator getAdministrator(int id) throws Exception {

		return administratorDao.findById(id);
	}
	//添加管理员
	public void addAdministrator(Administrator administrator) throws Exception {
		//添加时间为系统当前时间
		administrator.setAdmAddTime(new Date());
		//登录次数默认为0
		administrator.setAdmLoginNumbers(0);
		administratorDao.save(administrator);
	}
	//修改管理员
	public void updateAdministrator(Administrator administrator) throws Exception {
		//只修改部分信息
		Administrator admin = administratorDao.findById(administrator.getAdmId());
		admin.setAdmUsername(administrator.getAdmUsername());
		admin.setAdmName(administrator.getAdmName());
		admin .setAdmPassword(administrator.getAdmPassword());
		admin.setAdmRole(administrator.getAdmRole());
		admin.setAdmStatus(administrator.getAdmStatus());
		admin.setRole(administrator.getRole());
		//administratorDao.update(admin);//	加事务这句不写
	}
	public void update(Administrator admin) throws Exception {
		// TODO Auto-generated method stub
		administratorDao.update(admin);
	}
	//删除管理员
	public void deleteAdministrator(int id)throws Exception{
		administratorDao.delete(id);
	}
	//搜索
	public List<Administrator> searchAdministrator(String str, String searchName) throws Exception {
		return administratorDao.search(str, searchName);
	}
	//简单搜索
	public List<Administrator> searchAdministrator(String content) throws Exception {
		return administratorDao.search(content);
	}
	//find by username
	public Administrator getAdministrator(String username)  {
		return administratorDao.findByUsername(username);
	}
	public void saveLog(Log log) throws Exception {
		administratorDao.saveLog(log);	
	}
	public List<Log> findLog(int page, int pagesize, String sortname,
			String sortorder, String str, String searchName) throws Exception {
		// TODO Auto-generated method stub
		return administratorDao.findLog(page, pagesize, sortname, sortorder, str, searchName);
	}
	public List<Log> selectLog(String date, int page, int pagesize,
			String sortname, String sortorder) throws Exception {
		
		return administratorDao.selectLog(date, page, pagesize, sortname, sortorder);
	}
	public int getSearchTotal(String searchName, String str) throws Exception {
		// TODO Auto-generated method stub
		return administratorDao.getSearchTotal(searchName, str);
	}
	public int getTotal(String date) {
		// TODO Auto-generated method stub
		return administratorDao.getTotal(date);
	}
	public void deleteLog() {
		administratorDao.deleteLog();
	}
}
