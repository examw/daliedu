package com.changh.sccms.action.user.student;

import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.Order;
import com.changh.sccms.service.OrderService;
import com.changh.sccms.until.GridDataUtil;

public class SearchOrderAction {
	//input
	private Integer stuId;
	private Map<String ,Object> orderList;
	private OrderService orderService;
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public String execute() throws Exception
	{
		List<Order> list = orderService.findByStuId(stuId);
		orderList = GridDataUtil.gridMap(list,list.size());
		return "success";
	}
	

	public Integer getStuId() {
		return stuId;
	}


	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}


	public Map<String ,Object> getOrderList() {
		return orderList;
	}


	public void setOrderList(Map<String ,Object> orderList) {
		this.orderList = orderList;
	}
	
}
