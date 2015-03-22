package com.changh.sccms.service.impl;

import java.util.List;

import com.changh.sccms.dao.ExpressCompanyDAO;
import com.changh.sccms.entity.ExpressCompany;
import com.changh.sccms.service.ExpressCompanyService;

public class ExpressCompanyServiceImpl implements ExpressCompanyService
{
	private ExpressCompanyDAO expressCompanyDao;
	public void setExpressCompanyDao(ExpressCompanyDAO expressCompanyDao) {
		this.expressCompanyDao = expressCompanyDao;
	}
	public void addCompany(ExpressCompany company) throws Exception {

		expressCompanyDao.save(company);
	}
	public List<ExpressCompany> companyList() throws Exception {
		
		return expressCompanyDao.findAll();
	}
	public void deleteCompany(int id) throws Exception {
		expressCompanyDao.delete(id);
	}
	public ExpressCompany getCompany(int id) throws Exception {
		
		return expressCompanyDao.findById(id);
	}
	public ExpressCompany getCompany(String name) throws Exception {
		
		return (ExpressCompany) expressCompanyDao.findByName(name);
	}
	public List<ExpressCompany> searchCompany(String str, String searchName)
			throws Exception {

		return expressCompanyDao.search(str, searchName);
	}
	public void updateCompany(ExpressCompany company) throws Exception {
		// TODO Auto-generated method stub
		expressCompanyDao.update(company);
	}
	
}
