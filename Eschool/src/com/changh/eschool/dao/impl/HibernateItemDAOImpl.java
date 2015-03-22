package com.changh.eschool.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.ItemDAO;
import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.Order;
import com.changh.eschool.entity.Question;

public class HibernateItemDAOImpl extends HibernateDaoSupport implements ItemDAO{
	public void save(Items item) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(item);
	}

	public void delete(int itemId) {
		String hql ="select item from Items item where item.itemId="+itemId;
		Items item = (Items) this.getHibernateTemplate().find(hql).get(0);
		String hql1 ="select order from Order order where order.orderId="+item.getOrderId();
		Order order  = (Order) this.getHibernateTemplate().find(hql1).get(0);
		order.setOrderPrice(order.getOrderPrice()-item.getItemRPrice());
		if(item.getItemPresent()!=null&&!item.getItemPresent().trim().equals(""))
		{
			order.setOrderSendDetail(order.getOrderSendDetail().replace(item.getItemPresent(), ""));
			order.setOrderIsNeedSend(isNeedSend(order.getOrderSendDetail())==null?0:1);
		}
		order.setOrderMoney(order.getOrderMoney()-item.getItemRPrice());
		this.getHibernateTemplate().delete(item);
		if(order.getOrderPrice()<=0){
			this.getHibernateTemplate().delete(order);
		}
	}
	private String isNeedSend(String content) {
		// 有赠送的情况，肯定还没有送
		if(content==null)return null;
		String[] list = content.split(";");
		StringBuffer buf = new StringBuffer();
		for(String s:list)
		{
			if(s.indexOf("教材")!=-1||s.indexOf("书")!=-1)
			{
				buf.append(s);
				buf.append(";");
			}
		}
		return buf.length()==0?null:buf.substring(0, buf.length()-1);
	}
	public List<Items> findByOrderId(int orderId) throws Exception {
		// TODO Auto-generated method stub
		String hql ="select item from Items item where item.orderId = ?";
		Object[] param = {orderId};
		return this.getHibernateTemplate().find(hql, param);
	}

	public List findByExamId(final int examId,final int itemPType) {
		return (List)this.getHibernateTemplate().execute(
					new HibernateCallback() {
						public Object doInHibernate(Session session) throws HibernateException,
								SQLException {
							List list = new ArrayList();
							String hql ="select i.productId from Items i where i.examId="+examId+" and i.itemPType="+itemPType+" group by i.productId order by count(i.productId) desc";			
							Query query=session.createQuery(hql);
							query.setFirstResult(0);
							query.setMaxResults(5);
							List<Integer> list1 = query.list();
							if(itemPType==1){
								for(Integer gradeId:list1){
									String hql1 ="select g from Grade g where g.gradeId="+gradeId;
									Query query1 = session.createQuery(hql1);
									if(query1.list().size()>0)
										list.add(query1.list().get(0));
								}
							}else if(itemPType==0){
								for(Integer pkgId:list1){
									String hql1 ="select cp from ClassPackage cp where cp.pkgId="+pkgId;
									Query query1 = session.createQuery(hql1);
									if(query1.list().size()>0)
										list.add(query1.list().get(0));
								}	
							}
							
							return list;
						}
					}
				);
		
	}
	public List findHot( ) {
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session) throws HibernateException,
							SQLException {
						String hql ="select count(i.itemName),i.itemName,i.productId,i.itemPType,i.examId  from Items i group by i.itemName,i.productId ,i.itemPType,i.examId order by count(i.itemName) desc";			
						Query query=session.createQuery(hql);
						query.setFirstResult(0);
						query.setMaxResults(10);			
						return query.list();
					}
				}
			);
	
	}
	
	public List<Question> findPage(final int page,final  int pagesize, final String sortname,
			final String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from Question q join fetch q.student s order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}

	public Order findByItemId(int itemId) {
		String hql ="select item from Items item where item.itemId="+itemId;
		Items item = (Items) this.getHibernateTemplate().find(hql).get(0);
		String hql1 ="select order from Order order where order.orderId="+item.getOrderId();
		Order order  = (Order) this.getHibernateTemplate().find(hql1).get(0);
		return order;
	}
	//2014.03.17
	@Override
	public Items findById(int itemId) {
		// TODO Auto-generated method stub
		return  (Items) this.getHibernateTemplate().get(Items.class, itemId);
	}
	//2014.03.18
	@Override
	public void update(Items item) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(item);
	}
}
