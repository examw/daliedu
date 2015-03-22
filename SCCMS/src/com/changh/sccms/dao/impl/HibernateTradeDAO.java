package com.changh.sccms.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.TradeDAO;
import com.changh.sccms.entity.Trade;

public class HibernateTradeDAO extends HibernateDaoSupport implements TradeDAO{
	public void save(Trade trade) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(trade);
	}
	
	public List<Trade> findPageByCriteria(final int page, final int pagesize,
			final String sortname,final String sortorder,final String criteria)
			throws Exception {
		// TODO Auto-generated method stub
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql = null;
						if(criteria.contains("select t"))
						{
							hql= criteria+" order by t."+sortname+" "+sortorder;
						}else
						{
							hql = "from Trade "+criteria+" order by "+sortname+" "+sortorder;
						}
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	public long getTotal(String criteria) throws Exception {
		// TODO Auto-generated method stub
		String hql = null;
		if(criteria.contains("select t"))
		{
			hql= "select count(*) "+criteria.substring(criteria.indexOf("from"));
		}else
		{
			hql = "select count(*) from Trade "+criteria;
		}
		return (Long) this.getHibernateTemplate().find(hql).get(0);
	}
	public List<Trade> findByOrderId(int orderId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from Trade where orderId = ?";
		Object[] param={orderId};
		return this.getHibernateTemplate().find(hql, param);
	}
}
