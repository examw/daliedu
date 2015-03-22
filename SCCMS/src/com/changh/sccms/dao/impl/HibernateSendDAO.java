package com.changh.sccms.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.SendDAO;
import com.changh.sccms.entity.Send;
import com.changh.sccms.entity.Student;

public class HibernateSendDAO extends HibernateDaoSupport implements SendDAO {
	//find by id
	public Send findById(int sendId) throws Exception {
		return (Send) this.getHibernateTemplate().get(Send.class, sendId);
	}
	//按条件搜索，分页
	public List<Send> findPageByCriteria(final int page,final  int pagesize,
			final String criteria, final String sortname,final  String sortorder)
			throws Exception {
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from Send "+criteria+"order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	//指定条件下的总数
	public long findTotal(String criteria) throws Exception {
		String hql = "select count(*) from Send s "+criteria;
		List<Long> list =this.getHibernateTemplate().find(hql);
		return list.get(0);
	}
//	搜索
	public List<Send> search(String str, String searchName) throws Exception {
		String hql="from Send s where "+searchName+"=?";
		Object[] params=new Object[1];
		try
		{
			int id = Integer.parseInt(str);
			params[0]=id;
		}catch(Exception e)
		{
			params[0]=str;
		}
		
		List list=this.getHibernateTemplate().find(hql, params);
		return list;
	}
	//更新
	public void update(Send send) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(send);
	}
	//根据订单号查询
	public List<Send> findByOrderId(int orderId) throws Exception {
		String hql = "from Send s where s.order.orderId = ?";
		Object[] param = new Object[]{orderId};
		return this.getHibernateTemplate()
				.find(hql,param);
	}
	//生成寄送单
	public void save(Send send) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(send);
	}
	//搜索
	public List<Send> searchPage(String criteria, Date addDate, Date confirmDate)
			throws Exception {
		StringBuffer hql = new StringBuffer(); 
		hql.append("from Send s ");
		hql.append(criteria);
		Object[] params=new Object[]{};
		if(addDate!=null&&confirmDate!=null)
		{
			hql.append(" and s.sendAddTime > ?");
			hql.append(" and s.sendConfirmTime > ?");
			params[0]=addDate;
			params[1]=confirmDate;
			return this.getHibernateTemplate().find(hql.toString(), params);
		}else if(addDate!=null&&confirmDate==null)
		{
			hql.append(" and s.sendAddTime > ?");
			params[0]=addDate;
			return this.getHibernateTemplate().find(hql.toString(), params);
		}else if(addDate==null&&confirmDate!=null)
		{
			hql.append(" and s.sendConfirmTime > ?");
			params[0]=confirmDate;
			return this.getHibernateTemplate().find(hql.toString(), params);
		}
		return this.getHibernateTemplate().find(hql.toString());
	}
	//搜索2
	public List<Send> searchPage(final int page, final int pagesize,final  String criteria,
			final Date addDate, final Date confirmDate,final  String sortname,final  String sortorder)
			throws Exception {
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						StringBuffer hql = new StringBuffer(); 
						Query query=null;
						hql.append("from Send s ");
						hql.append(criteria);
						if(addDate!=null&&confirmDate!=null)
						{
							hql.append(" and s.sendAddTime > ?");
							hql.append(" and s.sendConfirmTime > ?");
							query=session.createQuery(hql.toString());
							query.setDate(0, addDate);
							query.setDate(1, confirmDate);
						}else if(addDate!=null&&confirmDate==null)
						{
							hql.append(" and s.sendAddTime > ?");
							query=session.createQuery(hql.toString());
							query.setDate(0, addDate);
						}else if(addDate==null&&confirmDate!=null)
						{
							hql.append(" and s.sendConfirmTime > ?");
							query=session.createQuery(hql.toString());
							query.setDate(0, confirmDate);
						}
						else
						{
							query=session.createQuery(hql.toString());
						}
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	public void deleteWhenCancelOrder(int orderId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "delete from Send s where s.order.orderId = ? and s.sendStatus = 0";
		Object[] param = {orderId};
		this.getHibernateTemplate().bulkUpdate(hql, param);
	}
	public boolean findIsExist(int orderId,int sendType) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from Send s where s.order.orderId = ? and s.sendType = ?";
		Object[] param = {orderId,sendType};
		List<Send> list = this.getHibernateTemplate().find(hql, param);
		return !list.isEmpty();
	}
}
