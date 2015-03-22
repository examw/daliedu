package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.ExpressCompany;

public interface ExpressCompanyDAO {
	//找出所有的快递公司
	public List<ExpressCompany> findAll()throws Exception;
	//找指定id的快递公司
	public ExpressCompany findById(int id)throws Exception;
	//找指定名称的快递公司
	public List<ExpressCompany> findByName(String name)throws Exception;
	//修改快递公司信息
	public void update(ExpressCompany expressCompany)throws Exception;
	//删除
	public void delete(int id)throws Exception;
	//添加
	public void save(ExpressCompany expressCompany)throws Exception;
	//搜索
	public List<ExpressCompany> search(String str,String searchName)throws Exception;
}
