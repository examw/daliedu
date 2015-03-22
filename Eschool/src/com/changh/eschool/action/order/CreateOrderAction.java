package com.changh.eschool.action.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.CartItem;
import com.changh.eschool.entity.Order;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.CartService;
import com.changh.eschool.service.OrderService;
import com.changh.eschool.until.Escape;

public class CreateOrderAction extends BaseAction{
	private String truename;
	private String mobile;
	private OrderService orderService;
	private CartService cartService;
	private Map<String,Object> data = new HashMap<String,Object>();
	
	public Map<String, Object> getData() {
		return data;
	}
	public void setTruename(String truename) {
		this.truename = Escape.unescape(truename);
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	public String execute()throws Exception
	{
		Student student  = (Student)session.get("student");
		List<CartItem> cart = cartService.getBuyPros();
		//老学员价的处理，老学员的定义
		double money = cartService.getTotalRMoney();
		try{
			Order order = orderService.addOrder(student, truename, mobile, money, cart);
			//清空购物车
			cartService.remove();
			//删除cookie
			Cookie cp = new Cookie("package","");
			Cookie cg = new Cookie("grade","");
			cp.setPath("/");
			cg.setPath("/");
			cp.setMaxAge(0);
			cg.setMaxAge(0);
			httpResponse.addCookie(cp);
			httpResponse.addCookie(cg);
			data.put("ok", true);
			data.put("orderId", order.getOrderId());
		}catch(NullPointerException e1)
		{
			e1.printStackTrace();
			data.put("ok",	false);
		}catch(Exception e)
		{
			e.printStackTrace();
			throw e;
		}
		return "success";
				
	}
}
