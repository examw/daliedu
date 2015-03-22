package com.changh.sccms.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.NewsClassDAO;
import com.changh.sccms.entity.NewClass;

public class HibernateNewClassDAO extends HibernateDaoSupport implements NewsClassDAO{

	@Override
	public boolean delete(int id) {
		this.getHibernateTemplate().delete(this.getHibernateTemplate().get(NewClass.class, id));
		return true;
	}

	@Override
	public boolean saveOrupdate(NewClass newclass) {
		this.getHibernateTemplate().saveOrUpdate(newclass);
		return true;
	}

	@Override
	public NewClass findById(int id) {
		// TODO Auto-generated method stub
		return (NewClass) this.getHibernateTemplate().get(NewClass.class, id);
	}

	@Override
	public Integer getTotal() {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().getMaxResults();
	}

	@Override
	public List<NewClass> findByPro(String pro,Object obj) {
		return this.getHibernateTemplate().find("from NewClass n where n."+pro+"=? order by n.orderId asc", obj);
	}

}
