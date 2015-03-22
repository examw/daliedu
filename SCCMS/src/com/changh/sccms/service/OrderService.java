package com.changh.sccms.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.CartItem;
import com.changh.sccms.entity.Order;
import com.changh.sccms.entity.Send;
import com.changh.sccms.entity.Student;
import com.changh.sccms.entity.Trade;

public interface OrderService {
	//条件分页
	public Map<String,Object> findPageByCriteria(int page,int pagesize,String criteria,String sortname,String sortorder)throws Exception;
	//findById
	public Order findById(int id)throws Exception;
	//更新
	public void update(Order order)throws Exception;
	public void update(Order order,Send send,Trade trade) throws Exception;
	//不分页的条件搜索
	public List<Order> search(String criteria,Date addDate,Date dealDate)throws Exception;
	//分页的条件搜索
	public Map<String,Object> search(int page,int pagesize,String criteria,Date addDate,Date dealDate,String sortname,String sortorder)throws Exception;
	//退单
	public void cancelOrder(int orderId,int mode,double card,double cash,String content)throws Exception;
	//添加
	public void addOrder(Order order)throws Exception;
	//修改价格
	public Order updatePrice(String orderNo,double money)throws Exception;
	//申请发票
	public Order updateForApplyInvoice(String orderNo,Send send)throws Exception;
	//判断是不是添加送货单
	public boolean findIsExistBookSend(int orderId)throws Exception;
	//全手动开通订单
	public boolean updateForManualPay(Order order,Send send,Trade trade)throws Exception;
	//用户详细信息
	public Student LoadStu(int stuId)throws Exception;
	/**
	 * 查找学员的订单
	 * @param stuId
	 * @return
	 * @throws Exception
	 */
	public List<Order> findByStuId(int stuId) throws Exception;
	//2014.03.15
	public Order saveOrder(int stuId,List<CartItem> cart)throws Exception;
}
