package com.changh.sccms.action.order;

import java.util.Map;

import com.changh.sccms.dao.OrderDAO;
import com.changh.sccms.service.OrderService;
import com.changh.sccms.until.Escape;

public class SearchByPNameAction {
	private String content;
	private String status;
	//
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	
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
		this.sortname = "o."+sortname;
	}
	public String getSortorder() {
		return sortorder;
	}
	public void setSortorder(String sortorder) {
		this.sortorder = sortorder;
	}
	
	private Map<String,Object> orderList;
	public Map<String, Object> getOrderList() {
		return orderList;
	}
	public void setContent(String content) {
		this.content = " ,Items i where o.orderId = i.orderId and i.itemName like '%" + Escape.unescape(content)+"%' ";
	}
	public void setStatus(String status) {
		if("all".equals(status)) this.status = "";
		else if("paid".equals(status)) this.status=" and o.orderStatus in (1,2) ";
		else if("notpaid".equals(status)) this.status=" and o.orderStatus = 0";
		else this.status=" and o.orderStatus = 4 ";
	}
	private OrderService orderService;
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public String execute()throws Exception
	{
		orderList = orderService.findPageByCriteria(page, pagesize, content+status, sortname, sortorder);
		return "success";
	}
}
