package com.changh.sccms.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.OrderDAO;
import com.changh.sccms.entity.Order;

public class HibernateOrderDAO extends HibernateDaoSupport implements OrderDAO {
	
	//按条件查询并分页
	public List<Order> findPageByCriteria(final int page,final int pagesize,final
			String criteria,final String sortname,final String sortorder) throws Exception {
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="select o from Order o "+criteria+"order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
		}
	//在指定条件下的订单总数
	public long findTotal(String criteria) throws Exception {
		String hql = "select count(*) from Order o "+criteria;
		List<Long> list =this.getHibernateTemplate().find(hql);
		return list.get(0);
	}
	//生成订单
	public int save(final Order order) throws Exception {
		return (Integer) this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						session.save(order);
						//为什么save方法返回的id值并不是主键order_id而是id值？？
						//这么做不知道在并发量大的情况下是否正常，是否能保证就是刚刚生成的那条记录
						String hql ="select orderId from Order where id = "+order.getOrderId() ;
						Query query =session.createQuery(hql);
						int id = (Integer) query.list().get(0);
						session.evict(order);
						return id;
					}
				}
			);
	}
	//修改订单
	public void update(Order order) throws Exception {
		this.getHibernateTemplate().update(order);
	}
	//find by id
	public Order findById(int id) throws Exception {
		return (Order) this.getHibernateTemplate().get(Order.class, id);
	}
	//搜索
	public List<Order> search(String criteria,Date addDate,Date dealDate) throws Exception {
		StringBuffer hql = new StringBuffer(); 
		hql.append("from Order o ");
		hql.append(criteria);
		Object[] params=new Object[]{};
		if(addDate!=null&&dealDate!=null)
		{
			hql.append(" and o.orderAddTime > ?");
			hql.append(" and o.orderDealTime > ?");
			params[0]=addDate;
			params[1]=dealDate;
			return this.getHibernateTemplate().find(hql.toString(), params);
		}else if(addDate!=null&&dealDate==null)
		{
			hql.append(" and o.orderAddTime > ?");
			params[0]=addDate;
			return this.getHibernateTemplate().find(hql.toString(), params);
		}else if(addDate==null&&dealDate!=null)
		{
			hql.append(" and o.orderDealTime > ?");
			params[0]=dealDate;
			return this.getHibernateTemplate().find(hql.toString(), params);
		}
		return this.getHibernateTemplate().find(hql.toString());
	}
	//搜索2
	public List<Order> searchPage(final int page,final int pagesize,final String criteria,
			final Date addDate,final Date dealDate,final String sortname,final String sortorder)
			throws Exception {
		
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						StringBuffer hql = new StringBuffer(); 
						Query query=null;
						Object[] params = new Object[]{};
						hql.append("from Order o ");
						hql.append(criteria);
						if(addDate!=null&&dealDate!=null)
						{
							hql.append(" and o.orderAddTime > ?");
							hql.append(" and o.orderDealTime > ?");
							hql.append(" order by ");
							hql.append(sortname);
							hql.append(" ");
							hql.append(sortorder);
							query=session.createQuery(hql.toString());
							query.setDate(0, addDate);
							query.setDate(1, dealDate);
						}else if(addDate!=null&&dealDate==null)
						{
							hql.append(" and o.orderAddTime > ?");
							hql.append(" order by ");
							hql.append(sortname);
							hql.append(" ");
							hql.append(sortorder);
							query=session.createQuery(hql.toString());
							query.setDate(0, addDate);
						}else if(addDate==null&&dealDate!=null)
						{
							hql.append(" and o.orderDealTime > ?");
							hql.append(" order by ");
							hql.append(sortname);
							hql.append(" ");
							hql.append(sortorder);
							query=session.createQuery(hql.toString());
							query.setDate(0, dealDate);
						}
						else
						{
							hql.append(" order by ");
							hql.append(sortname);
							hql.append(" ");
							hql.append(sortorder);
							query=session.createQuery(hql.toString());
						}
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	public Order findByNo(String orderNo) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from Order where orderNo = ?";
		Object[] params = {orderNo};
		List<Order> list = this.getHibernateTemplate().find(hql, params);
		if(list.isEmpty()) return null;
		return list.get(0);
	}
	public List<Order> findByStuId(int stuId) throws Exception {
		String hql ="from Order o where o.student.stuId="+stuId;
		return this.getHibernateTemplate().find(hql);
	}
}
