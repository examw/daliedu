package com.changh.sccms.dao.impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.AddressDAO;
import com.changh.sccms.entity.Address;

public class HibernateAddressDAO extends HibernateDaoSupport implements AddressDAO{

	public Address findById(int addrId) throws Exception {
		// TODO Auto-generated method stub
		return (Address) this.getHibernateTemplate().get(Address.class, addrId); 
	}
}
