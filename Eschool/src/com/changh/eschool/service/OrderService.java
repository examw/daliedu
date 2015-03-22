package com.changh.eschool.service;

import java.util.List;

import com.changh.eschool.entity.CartItem;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.MyLesson;
import com.changh.eschool.entity.Order;
import com.changh.eschool.entity.Send;
import com.changh.eschool.entity.Student;

public interface OrderService {
	//条件分页
	public List<Order> findPageByCriteria(int page,int pagesize,String criteria,String sortname,String sortorder)throws Exception;
	//findById
	public Order findById(int id)throws Exception;
	//更新
	public void update(Order order) throws Exception;
	//添加
	public void addOrder(Order order)throws Exception;
	public Order addOrder(Student student,String truename,String mobile,double money,List<CartItem> cart)throws Exception;
	//find by stuid
	public List<Order> findByStuId(int page,int pagesize,String criteria,String sortname,String sortorder,int stuId)throws Exception;
	//find items by orderid
	public List<Items> findItemsByOrderId(int orderId)throws Exception;
	/**
	 * 学员购买的套餐
	 * @param stuId
	 * @return
	 */
	public List<Integer> findMyPackage(int stuId)throws Exception ;
 	//查找学员购买了的课程
	public MyLesson findMyLesson(int stuId,int status);
		//查找学员过期的班级
	public List<Grade> findOverLesson(int stuId,int status);
	//查询一定条件下的订单个数
	public int findTotal(String criteria,int stuId)throws Exception;
	public int findTotal(String criteria,String keywords)throws Exception;
	//删除根据id订单
	public boolean deleteOrder(int orderId)throws Exception;
	//search
	public List<Order> findByKeywords(int page,int pagesize,String criteria,String sortname,String sortorder,int stuId,String keywords)throws Exception;
	//根据id取消订单
	public Student cancelOrder(Student stu,int orderId)throws Exception;
	//支付后更新订单
	/**
	 * @param orderId  订单号
	 * @param tradeNo 	淘宝或其他支付方式的交易号，或学习卡卡号
	 * @param money	交易金额
	 * @param tradeType 交易类型
	 * @param body	交易商品描述，包括赠送东西
	 * @param stu 交易学员
	 * @throws Exception
	 */
	public boolean updateAfterPay(String orderId,String tradeNo,String money,String tradeType,String body,Student stu)throws Exception;
	//由学习卡支付后更新订单
	public boolean updatePayByCard(int orderId,Student stu)throws Exception;
	//大额分次支付
	public boolean updateMultipay(String orderId,String tradeNo,String money,String tradeType,String body,Student stu)throws Exception;
	//找出那些已支付未送的寄送单
	public Send findSendNoAddress(int stuId)throws Exception;
	//根据orderid 和 stuid共同查找订单
	public Order findBy2Id(int orderId,int stuId)throws Exception;
	public boolean updateFromAliPost(String orderNo, String tradeNo,
			String money, String tradeType, String body)throws Exception;
	
	public Order saveOrder(Student stu,double money, Items item) throws Exception;
	//2014.03.18
	public void updateItem(Integer itemId,String s,String gid);
}
