package com.changh.eschool.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.TradeDAO;
import com.changh.eschool.entity.Trade;

public class HibernateTradeDAO extends HibernateDaoSupport implements TradeDAO{
	public void save(Trade trade) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(trade);
	}
	@Override
	public List<Trade> findPageByStuId(final int stuId, final int tradeType, final int page,
			final int pagesize, final String sortname, final String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from Trade t where t.stuId = ? and t.tradeType = ? and t.orderId is null order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setInteger(0, stuId);
						query.setInteger(1, tradeType);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	@Override
	public long findTotalByStuId(int stuId, int tradeType) throws Exception {
		// TODO Auto-generated method stub
		String hql="select count(*) from Trade t where t.stuId = ? and t.tradeType = ? and t.orderId is null";
		Object[] params = {stuId,tradeType};
		return (Long) this.getHibernateTemplate().find(hql, params).get(0);
	}
}
