package com.changh.eschool.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.RechargeRecordDAO;
import com.changh.eschool.entity.RechargeRecord;

public class HibernateRechargeRecordDAO extends HibernateDaoSupport implements RechargeRecordDAO{
	public List<RechargeRecord> findByStuId(int stuId) throws Exception {
		// TODO Auto-generated method stub
		String hql ="from RechargeRecord r where r.student.stuId = "+stuId;
		return this.getHibernateTemplate().find(hql);
	}
	public void save(RechargeRecord record) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(record);
	}
	public RechargeRecord findFreeCard(int stuId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from RechargeRecord r where r.student.stuId = ? and r.rcIsPresent = 1 and r.rcType = 0";
		Object[] param={stuId};
		List<RechargeRecord> list =  (List<RechargeRecord>) this.getHibernateTemplate().find(hql,param);
		if(list.isEmpty()) return null;
		return list.get(0);
	}
		
	public RechargeRecord findByCardId(int cardId) throws Exception {
		// TODO Auto-generated method stub
		String hql ="from RechargeRecord where rcCardId = "+cardId;
		List<RechargeRecord> list = this.getHibernateTemplate().find(hql);
		if(list.isEmpty())
		{
			return null;
		}
		return list.get(0);
	}
	public List<RechargeRecord> findPageByStuId(final int stuId,final  int page,
			final int pagesize, final String sortname, final String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from RechargeRecord rc where rc.student.stuId = ? order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setInteger(0, stuId);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	public long findTotalByStuId(int stuId) throws Exception {
		// TODO Auto-generated method stub
		String hql="select count(*) from RechargeRecord rc where rc.student.stuId = ? ";
		Object[] params = {stuId};
		return (Long) this.getHibernateTemplate().find(hql, params).get(0);
	}
}
