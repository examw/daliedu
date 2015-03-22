package com.changh.eschool.action.order;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.dao.OrderDAO;
import com.changh.eschool.entity.Order;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.OrderService;

public class OrderListOfStuAction extends BaseAction{
	private int page=1;
	private int pagesize=10;
	private String criteria=" where 1 = 1 ";
	private List<Order> list;
	
	public List<Order> getList() {
		return list;
	}

	private OrderService orderService;
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public String execute()throws Exception
	{
		list = orderService.findByStuId(page, pagesize, criteria, "o.orderAddTime", "desc", ((Student)session.get("student")).getStuId());
		return "success";
	}
	public void setCriteria(String criteria) {
		if("all".equals(criteria)) this.criteria = OrderDAO.ALLORDER;
		else if("paid".equals(criteria)) this.criteria=OrderDAO.ALLPAID;
		else if("notpaid".equals(criteria)) this.criteria=OrderDAO.ALLNOTPAID;
		else if("canceled".equals(criteria)) this.criteria=OrderDAO.CANCELED;
		else this.criteria=OrderDAO.ALLOVERTIME;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	
}
