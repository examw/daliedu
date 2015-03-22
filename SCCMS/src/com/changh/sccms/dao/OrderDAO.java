package com.changh.sccms.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.Order;
import com.changh.sccms.until.Constant;

public interface OrderDAO {
	//定义条件常量
	public static final String ALLORDER="where 1=1 ";
	public static final String ALLPAID=" where o.orderStatus = "+Constant.FINISH;	//
	public static final String ALLNOTPAID=" where o.orderStatus = "+Constant.WAIT_PAY;
	public static final String ALLOVERTIME=" where o.orderStatus = "+Constant.OVERTIME;
	public static final String CANCELED=" where o.orderStatus = "+Constant.CANCELED;
	public static final String USERCANCEL=" where o.orderStatus = "+Constant.USERCANCEL;
	//条件分页
	public List<Order> findPageByCriteria(int page,int pagesize,String criteria,String sortname,String sortorder)throws Exception;
	//获取指定条件的总记录数
	public long findTotal(String criteria)throws Exception;
	//findbyid
	public Order findById(int id) throws Exception;
	//findByno
	public Order findByNo(String orderNo)throws Exception;
	//添加
	public int save(Order order)throws Exception;
	//更新
	public void update(Order order) throws Exception;
	//搜索 按一堆条件搜索
	public List<Order> search(String criteria,Date addDate,Date dealDate)throws Exception;
	public List<Order> searchPage(int page,int pagesize,String criteria,Date addDate,Date dealDate,String sortname,String sortorder)throws Exception;
	/**
	 * 查找学员的订单
	 * @param stuId
	 * @return
	 * @throws Exception
	 */
	public List<Order> findByStuId(int stuId) throws Exception;
}
