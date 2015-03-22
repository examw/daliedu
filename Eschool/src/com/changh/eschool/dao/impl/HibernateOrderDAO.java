package com.changh.eschool.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.OrderDAO;
import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.Order;

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
						String hql="select distinct o from Order o "+criteria+" order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
		}
	@SuppressWarnings("unchecked")
	public List<Order> findPageByItemKeywords(final int page,final int pagesize,final
			int stuId,final String keywords,final String sortname,final String sortorder) throws Exception {
			List<Object[]> list1 =  (List<Object[]>)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//String sql ="select distinct ec.* from tbExamCategory ec join (select pc.* from (select cp.* from (select i.* from tbItems i join tbOrder o on i.order_id = o.order_id where o.stu_id ="+stuId+" and o.order_status in (1,2,3)) temp,tbClassPackage cp where (temp.productId = cp.pkg_id and temp.item_pType=0)) temp2 join tbPackageCategory pc on pc.pType_id = temp2.pType_id) pc2 on ec.exam_id = pc2.exam_id";
						String sql = "{Call proc_get_distinct_order_by_stuId(?,?,?,?,?,?) }"; //调用存储过程
						SQLQuery query = session.createSQLQuery(sql);
						query.setInteger(0, stuId);
						query.setInteger(1, page);
						query.setInteger(2, pagesize);
						query.setString(3, keywords);
						query.setString(4, sortname);
						query.setString(5, sortorder);
						return query.list();
					}
				});
			List<Order> list = new ArrayList<Order>();
			for(Object[] obj:list1)
			{
				Order order = new Order();
				order.setId((Integer) obj[1]);
				order.setOrderId((Integer) obj[2]);
				order.setOrderNo((String) obj[3]);
				order.setOrderMoney((Double) obj[5]);
				order.setOrderStatus((Integer)obj[7]);
				order.setOrderPayment((Integer)obj[8]);
				order.setOrderAddTime((Date)obj[9]);
				list.add(order);
			}
			return list;
	}
	//在指定条件下的订单总数
	public long findTotal(String criteria) throws Exception {
		String hql = "select count(distinct o.orderId) from Order o "+criteria;
		List<Long> list =this.getHibernateTemplate().find(hql);
		return list.get(0);
	}
	//生成订单，返回刚生成的主键id
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
	//find items by order id
	public List<Items> findItemsByOrderId(int orderId) throws Exception {
		// TODO Auto-generated method stub
		String hql ="from Items where orderId="+orderId;
		return this.getHibernateTemplate().find(hql);
	}
	//find by stuId
	public List<Order> findItemsByStuId(int stuId,int status) throws Exception {
		String hql="";
		if(status==-1){
			hql ="select order from Order order where order.student.stuId="+stuId;
		}else{
			hql ="select order from Order order where order.student.stuId="+stuId
						+" and order.orderStatus= "+status;
		}	
		List<Order> list=this.getHibernateTemplate().find(hql);
		return list;
	}
	public boolean delete(int id) throws Exception {
		// TODO Auto-generated method stub
		Order order = findById(id);
		if(order==null) return false;
		this.getHibernateTemplate().delete(order);
		return true;
	}
	public Order findByNo(String orderNo) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from Order where orderNo = ?";
		Object[] params = {orderNo};
		List<Order> list = this.getHibernateTemplate().find(hql, params);
		if(list.isEmpty()) return null;
		return list.get(0);
	}
	public Order findBy2Id(int orderId, int stuId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from Order o where o.orderId = ? and o.student.stuId = ?";
		Object[] params = {orderId,stuId};
		List<Order> list = this.getHibernateTemplate().find(hql, params);
		if(list.isEmpty()) return null;
		return list.get(0);
	}
}
