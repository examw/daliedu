package com.changh.sccms.service;

import java.util.List;

import com.changh.sccms.entity.ExpressCompany;

public interface ExpressCompanyService {
	//findAll
	public List<ExpressCompany> companyList() throws Exception;
	//findById
	public ExpressCompany getCompany(int id)throws Exception;
	//findByUsername
	public ExpressCompany getCompany(String name) throws Exception;
	//add
	public void addCompany(ExpressCompany company)throws Exception;
	//update
	public void updateCompany(ExpressCompany company) throws Exception;
	//delete
	public void deleteCompany(int id)throws Exception;
	//search
	public List<ExpressCompany> searchCompany(String str,String searchName)throws Exception;
}
