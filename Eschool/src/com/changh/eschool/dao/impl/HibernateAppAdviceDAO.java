package com.changh.eschool.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.AppAdviceDAO;
import com.changh.eschool.entity.AppAdvice;

public class HibernateAppAdviceDAO extends HibernateDaoSupport implements AppAdviceDAO{
	@Override
	public List<AppAdvice> findPageByCriteria(final String criteria,final  int page,
			final int pagesize,final  String sortname, final String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return (List<AppAdvice>) this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "from AppAdvice " + criteria
								+ " order by " + sortname + " " + sortorder;
						Query query = session.createQuery(hql);
						query.setFirstResult((page - 1) * pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				});
	}
	@Override
	public long getTotalByCriteria(String criteria) throws Exception {
		// TODO Auto-generated method stub
		String hql = "select count(*) from AppAdvice "+criteria;
		return (Long) this.getHibernateTemplate().find(hql).get(0);
	}
	@Override
	public void save(AppAdvice advice) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(advice);
	}
}
