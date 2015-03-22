package com.changh.sccms.action.order;

import java.util.Map;

import com.changh.sccms.dao.OrderDAO;
import com.changh.sccms.service.OrderService;

public class ListAction {
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	//Ìõ¼þ
	private String criteria;
	
	public String getCriteria() {
		return criteria;
	}
	public void setCriteria(String criteria) {
		if("all".equals(criteria)) this.criteria = OrderDAO.ALLORDER;
		else if("paid".equals(criteria)) this.criteria=OrderDAO.ALLPAID;
		else if("notpaid".equals(criteria)) this.criteria=OrderDAO.ALLNOTPAID;
		else if("canceled".equals(criteria)) this.criteria=OrderDAO.CANCELED;
		else if("userCancel".equals(criteria)) this.criteria=OrderDAO.USERCANCEL;
		else this.criteria=OrderDAO.ALLOVERTIME;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public String getSortname() {
		return sortname;
	}
	public void setSortname(String sortname) {
		this.sortname = sortname;
	}
	public String getSortorder() {
		return sortorder;
	}
	public void setSortorder(String sortorder) {
		this.sortorder = sortorder;
	}
	//output
	private Map<String,Object> orderList;

	public Map<String, Object> getOrderList() {
		return orderList;
	}
	private OrderService orderService;

	public void setOrderList(Map<String, Object> orderList) {
		this.orderList = orderList;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public String execute() throws Exception
	{
		orderList = orderService.findPageByCriteria(page, pagesize,criteria, sortname, sortorder);
		return "success";
	}
}
