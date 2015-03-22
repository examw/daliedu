package com.changh.eschool.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.AddressDAO;
import com.changh.eschool.entity.Address;

public class HibernateAddressDAO extends HibernateDaoSupport implements AddressDAO{
	public List<Address> findByStuId(int stuId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from Address where stuId = "+stuId;
		return this.getHibernateTemplate().find(hql);
	}
	public void save(Address address) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(address);
	}
	public void update(Address address) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(address);
	}
	public Address findById(int aid) throws Exception {
		// TODO Auto-generated method stub
		return (Address) this.getHibernateTemplate().get(Address.class, aid);
	}
	public Address findDefault(int stuId) throws Exception {
		// TODO Auto-generated method stub
		String hql ="from Address where stuId = "+stuId +" and addrIsDefault = 1";
		List<Address> list = this.getHibernateTemplate().find(hql);
		if(list.isEmpty())
		{
			return null;
		}
		return list.get(0);
	}
}
