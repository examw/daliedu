package com.changh.eschool.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.AskOrComplainDAO;
import com.changh.eschool.entity.AskOrComplain;

public class HibernateAskOrComplainDAO extends HibernateDaoSupport implements AskOrComplainDAO{
	public AskOrComplain findById(int acId) throws Exception {
		// TODO Auto-generated method stub
		String hql ="from AskOrComplain ac left join fetch ac.tbReplies  r where ac.acId = ?";
		Object[] params={acId};
		List<AskOrComplain> list= this.getHibernateTemplate().find(hql,params);
		if(list.isEmpty()) return null;
		return list.get(0);
	}
	public List<AskOrComplain> findPageByCriteria(final int page,final  int pagesize,
			final String sortname,final  String sortorder, final String criteria)
			throws Exception {
		// TODO Auto-generated method stub
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="select ac from AskOrComplain ac "+criteria+" order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	public long findTotal(String criteria) throws Exception {
		// TODO Auto-generated method stub
		String hql = "select count(*) from AskOrComplain ac "+criteria;
		List<Long> list =this.getHibernateTemplate().find(hql);
		return list.get(0);
	}
	public void save(AskOrComplain ac) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(ac);
	}
	public void update(AskOrComplain ac) throws Exception {
		this.getHibernateTemplate().update(ac);
	};
		
}
