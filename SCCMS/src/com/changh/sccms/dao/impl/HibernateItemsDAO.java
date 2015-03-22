package com.changh.sccms.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.ItemsDAO;
import com.changh.sccms.entity.Items;

public class HibernateItemsDAO extends HibernateDaoSupport implements ItemsDAO{
	//根据订单号获得订单条目的集合
	public List<Items> findByOrderId(int orderId) throws Exception {
		String hql = "from Items i where i.orderId= "+orderId;
		
		return this.getHibernateTemplate().find(hql);
	}
	//增加订单条目
	public void save(Items item) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(item);
	}
}
