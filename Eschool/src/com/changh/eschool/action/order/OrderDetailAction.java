package com.changh.eschool.action.order;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.Order;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.OrderService;

public class OrderDetailAction extends BaseAction{
	private int orderId;
	private OrderService orderService;
	private Order order;
	private List<Items> items;
	private Integer number;
	private String present;
	private String payType;
	
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getPresent() {
		return present;
	}
	public void setPresent(String present) {
		this.present = present;
	}
	public Integer getNumber() {
		return number;
	}
	public Order getOrder() {
		return order;
	}
	public List<Items> getItems() {
		return items;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public String execute()throws Exception
	{
		Student student = (Student) session.get("student");
		if(student==null)
		{
			items = null;
			number = null;
		}else
		{
			order = orderService.findById(orderId);
			//订单号里的学员id与学员id不一致时,order置为空
			//这里可以稍微优化一下，修改Dao用两个条件
			if(order!=null&&!order.getStudent().getStuId().equals(student.getStuId()))
			{
				order = null;
			}
			items = orderService.findItemsByOrderId(orderId);
			number = items.size();
		}
		return "success";
	}
}
