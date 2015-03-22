package com.changh.eschool.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.changh.eschool.dao.ItemDAO;
import com.changh.eschool.dao.LessonCardDAO;
import com.changh.eschool.dao.OrderDAO;
import com.changh.eschool.entity.CartItem;
import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.LessonCard;
import com.changh.eschool.entity.Order;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.CartService;
import com.changh.eschool.service.LessonCardService;
import com.changh.eschool.until.Constant;

public class LessonCardServiceImpl implements LessonCardService{
	//injection
	private LessonCardDAO LessonCardDao;
	private OrderDAO orderDao;
	private ItemDAO itemDao;
	private CartService cartService;
	
	public void setLessonCardDao(LessonCardDAO LessonCardDao)throws Exception {
		this.LessonCardDao = LessonCardDao;
	}
	
	public void setOrderDao(OrderDAO orderDao) {
		this.orderDao = orderDao;
	}
	
	public OrderDAO getOrderDao() {
		return orderDao;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public int recharge(int cardId,String password,int money) throws Exception {
		/**
		 * 学习卡充值
		 * 1，核对学习卡的卡号密码及是否过期，充值金额大于余额
		 * 2，充值成功,更新学习卡状态
		 * 3，下单,注意类型一定要是管理员开课
		 */
		LessonCard card = LessonCardDao.findById(cardId);
		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
		String str = format.format(new Date());
		Date today = format.parse(str);
		//卡号和密码都正确而且没有过期并且没有充值过
		if(card!=null&&card.getCardPassword().equals(password))
		{
			Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("student");
			if(student==null) return -4;//登录已经失效
			if(card.getCardOverTime().compareTo(today)<0)
			{
				return -1; //学习卡有效期已过
			}
			if(card.getCardUseTime()!=null) return -3; //已被使用
			//更新学习卡状态
			card.setStuId(student.getStuId());
			card.setCardUseTime(new Date());
			LessonCardDao.update(card);
			String includeIds = card.getIncludeClassIds();
			//拆分字符串
			String pkgIds = includeIds.split("\\|")[0];
			if(pkgIds.split(":").length>1){
				pkgIds = pkgIds.split(":")[1];
			}else{
				pkgIds = null;
			}
			String gradeIds = includeIds.split("\\|")[1];
			if(gradeIds.split(":").length>1){
				gradeIds = gradeIds.split(":")[1];
			}else{
				gradeIds = null;
			}
			//模拟一个购物车
			List<CartItem> cart = cartService.getProFromIds(pkgIds, gradeIds);
			//下单
			Order order = new Order();
			order.setStudent(student);
			order.setOrderInvoice(0);
			order.setOrderStatus(Constant.FINISH); //订单状态
			order.setOrderPayment(Constant.ADMIN); //管理员后台开课
			order.setOrderNote("充值补课卡,模拟管理员后台开课");
			order.setOrderMoney(0);
			order.setOrderAddTime(new Date());
			order.setOrderPayType("0:0");
			order.setOrderPrice(0);
			order.setAdmId(0);
			order.setOrderDealTime(new Date());
			int orderid = orderDao.save(order);
			// ////////////////////////////////
			order.setOrderId(orderid);
			// ////////////
			// 循环购物车生成订单条目
			for (CartItem cartitem : cart) {
				 Items item = cartitem.getItem();
				 item.setOrderId(orderid);
				 itemDao.save(item);	
			}
			cartService.remove();	//清空购物车
			return 200;//充值成功，返回充值的金额
		}
		return 0; //卡号或者密码错误
	}

	public void setItemDao(ItemDAO itemDao) {
		this.itemDao = itemDao;
	}
}  

