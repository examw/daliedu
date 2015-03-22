package com.changh.sccms.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.ExpressCompanyDAO;
import com.changh.sccms.entity.ExpressCompany;

public class HibernateExpressCompanyDAO extends HibernateDaoSupport implements ExpressCompanyDAO{
	public void delete(int id) throws Exception {
		this.getHibernateTemplate().delete(findById(id));
	}
	public List<ExpressCompany> findAll() throws Exception {
		String hql ="from ExpressCompany";
		return this.getHibernateTemplate().find(hql);
	}
	public ExpressCompany findById(int id) throws Exception {
		return (ExpressCompany) this.getHibernateTemplate().get(ExpressCompany.class, id);
	};
	public List<ExpressCompany> findByName(String name) throws Exception {
		
		return null;
	}
	public void save(ExpressCompany expressCompany) throws Exception {

		this.getHibernateTemplate().save(expressCompany);
	}
	public List<ExpressCompany> search(String str, String searchName)
			throws Exception {
		String hql="from ExpressCompany where "+searchName+"=?";
		Object[] params=new Object[1];
		try
		{
			int id = Integer.parseInt(str);
			params[0]=id;
		}catch(Exception e)
		{
			params[0]=str;
		}
		
		List list=this.getHibernateTemplate().find(hql, params);
		return list;
	}
	public void update(ExpressCompany expressCompany) throws Exception {
		this.getHibernateTemplate().update(expressCompany);
		
	}
	

}
