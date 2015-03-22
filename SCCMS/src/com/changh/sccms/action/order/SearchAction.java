package com.changh.sccms.action.order;

import java.util.Date;
import java.util.Map;

import com.changh.sccms.dao.OrderDAO;
import com.changh.sccms.service.OrderService;
import com.changh.sccms.until.Escape;

public class SearchAction {
	//input
	private String orderId;
	private String stuUsername;
	private String stuName;
	private String stuMobile;
	private String admUsername;
	private Date addDate;
	private Date dealDate;
	private String status;
	//
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	
	private Map<String ,Object> orderList;
	private OrderService orderService;
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	

	public String execute() throws Exception
	{
		StringBuffer buf = new StringBuffer();
		buf.append(status);
		buf.append(orderId.equals("")?"":" and o.orderNo like '%"+orderId+"%'");
		buf.append(stuUsername.equals("")?"":" and o.student.stuUsername like '%"+stuUsername+"%'");
		buf.append(stuName.equals("")?"":" and o.student.stuName like '%"+stuName+"%'");
		buf.append(stuMobile.equals("")?"":" and o.student.stuMobile like '%"+stuMobile+"%'");
		buf.append(admUsername.equals("")?"":" and o.admUsername like '%"+admUsername+"%'");
		orderList=orderService.search(page, pagesize, buf.toString(), addDate, dealDate, sortname, sortorder);
		return "success";
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getStuUsername() {
		return stuUsername;
	}
	public void setStuUsername(String stuUsername) {
		this.stuUsername = stuUsername;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = Escape.unescape(stuName);
	}


	public String getStuMobile() {
		return stuMobile;
	}


	public void setStuMobile(String stuMobile) {
		this.stuMobile = stuMobile;
	}


	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public Date getDealDate() {
		return dealDate;
	}
	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		if("all".equals(status)) this.status = OrderDAO.ALLORDER;
		else if("paid".equals(status)) this.status=OrderDAO.ALLPAID;
		else if("notpaid".equals(status)) this.status=OrderDAO.ALLNOTPAID;
		else this.status=OrderDAO.ALLOVERTIME;
	}
	public Map<String, Object> getOrderList() {
		return orderList;
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
		this.sortname = "o."+sortname;
	}


	public String getSortorder() {
		return sortorder;
	}


	public void setSortorder(String sortorder) {
		this.sortorder = sortorder;
	}


	public String getAdmUsername() {
		return admUsername;
	}


	public void setAdmUsername(String admUsername) {
		this.admUsername = Escape.unescape(admUsername);
	}
	
}
