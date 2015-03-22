package com.changh.sccms.action.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.CartItem;
import com.changh.sccms.entity.Order;
import com.changh.sccms.entity.Student;
import com.changh.sccms.service.CartService;
import com.changh.sccms.service.OrderService;
import com.changh.sccms.until.Escape;

public class CreateOrderAction extends BaseAction{
	private Integer stuId;
	private String pkgIds,gradeIds;
	private OrderService orderService;
	private CartService cartService;
	private Map<String,Object> data = new HashMap<String,Object>();
	
	public Map<String, Object> getData() {
		return data;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	public String execute()throws Exception
	{
		List<CartItem> cart = cartService.getProFromIds(pkgIds, gradeIds);
		System.out.println(cart.size());
		try{
			Order order = orderService.saveOrder(stuId, cart);
			//Çå¿Õ¹ºÎï³µ
			cartService.remove();
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
	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}
	public String getPkgIds() {
		return pkgIds;
	}
	public void setPkgIds(String pkgIds) {
		this.pkgIds = pkgIds;
	}
	public String getGradeIds() {
		return gradeIds;
	}
	public void setGradeIds(String gradeIds) {
		this.gradeIds = gradeIds;
	}
}
