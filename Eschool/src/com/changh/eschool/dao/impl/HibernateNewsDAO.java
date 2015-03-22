package com.changh.eschool.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.NewsDAO;
import com.changh.eschool.entity.AskOrComplain;
import com.changh.eschool.entity.News;

public class HibernateNewsDAO extends HibernateDaoSupport implements NewsDAO {

	@Override
	public void save(News ac) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(ac);
	}

	@Override
	public void update(News ac) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(ac);
	}

	@Override
	public News findById(Integer newsId) throws Exception {
		// TODO Auto-generated method stub
		String hql ="from News ac where ac.id = ?";
		Object[] params={newsId};
		List<News> list= this.getHibernateTemplate().find(hql,params);
		if(list.isEmpty()) return null;
		return list.get(0);
	}

	@Override
	public List<News> findPageByCriteria(final int page,final  int pagesize,
			final String sortname, final String sortorder,final  String criteria)
			throws Exception {
		// TODO Auto-generated method stub
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="select ac from News ac "+criteria+" order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}

	@Override
	public long findTotal(String criteria) throws Exception {
		// TODO Auto-generated method stub
		String hql = "select count(*) from News ac "+criteria;
		List<Long> list =this.getHibernateTemplate().find(hql);
		return list.get(0);
	}

}
