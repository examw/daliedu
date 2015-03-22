package com.changh.eschool.action.member;

import java.util.Date;
import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.Order;
import com.changh.eschool.service.OrderService;
import com.changh.eschool.until.Constant;

public class PayOrderAction extends BaseAction{
	private int orderId;
	private boolean ok;
	private OrderService orderService;
	
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public boolean isOk() {
		return ok;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public String execute()throws Exception
	{
		//Order order = orderService.findById(orderId);
		List<Items> list = orderService.findItemsByOrderId(orderId);
		if(isOverdue(list))
		{
			Order order = orderService.findById(orderId);
			order.setOrderStatus(Constant.OVERTIME);
			orderService.update(order);
			ok = false;
		}else
			ok = true;
		return "success";
	}
	private boolean isOverdue(List<Items> list)
	{
		for(Items item:list)
		{
			if(item.getItemOverTime().compareTo(new Date())<0)//过期时间在今天之前表示已经过期
			{
				return true;
			}
		}
		return false;
	}
}
