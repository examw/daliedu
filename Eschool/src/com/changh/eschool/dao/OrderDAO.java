package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.Order;
import com.changh.eschool.until.Constant;

public interface OrderDAO {
	//定义条件常量
	public static final String ALLORDER=" where 1=1 ";
	public static final String ALLEXCEPTCANCEL=" where o.orderStatus in ("+Constant.FINISH+","+Constant.WAIT_PAY+") ";
	public static final String ALLPAID=" where o.orderStatus =" + Constant.FINISH ;
	public static final String ALLNOTPAID=" where o.orderStatus = "+Constant.WAIT_PAY;
	public static final String ALLOVERTIME=" where o.orderStatus = "+Constant.OVERTIME;
	public static final String CANCELED=" where o.orderStatus = "+Constant.CANCELED;
	public static final String USERCANCEL=" where o.orderStatus = "+Constant.USERCANCEL;
	//条件分页
	public List<Order> findPageByCriteria(int page,int pagesize,String criteria,String sortname,String sortorder)throws Exception;
	public List<Order> findPageByItemKeywords(final int page,final int pagesize,final
			int stuId,final String keywords,final String sortname,final String sortorder) throws Exception;
	//获取指定条件的总记录数
	public long findTotal(String criteria)throws Exception;
	//findbyid
	public Order findById(int id) throws Exception;
	//findbyNo
	public Order findByNo(String orderNo)throws Exception;
	//添加
	public int save(Order order)throws Exception;
	//更新
	public void update(Order order) throws Exception;
	//find items by order id
	public List<Items> findItemsByOrderId(int orderId)throws Exception;
	//find by stuId
	public List<Order>  findItemsByStuId(int stuId,int status)throws Exception;
	//delete
	public boolean delete(int id)throws Exception;
	//search
	public Order findBy2Id(int orderId,int stuId)throws Exception;
}
