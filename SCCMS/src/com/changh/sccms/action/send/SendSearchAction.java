package com.changh.sccms.action.send;

import java.util.Date;
import java.util.Map;

import com.changh.sccms.dao.OrderDAO;
import com.changh.sccms.dao.SendDAO;
import com.changh.sccms.service.SendService;

public class SendSearchAction {
	//input
	private String orderNo;
	private String stuUsername;
	private String stuMobile;
	private Date addDate;
	private Date confirmDate;
	private String status;
	//
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	//injection
	private SendService sendService;

	public void setSendService(SendService sendService) {
		this.sendService = sendService;
	}
	//output
	private Map<String,Object> sendList;
	
	public Map<String, Object> getSendList() {
		return sendList;
	}

	public String execute()throws Exception
	{
		StringBuffer buf = new StringBuffer();
		buf.append(status);
		buf.append(orderNo.equals("")?"":" and s.order.orderNo like '%"+orderNo+"%'");
		buf.append(stuUsername.equals("")?"":" and s.order.student.stuUsername like '%"+stuUsername+"%'");
		buf.append(stuMobile.equals("")?"":" and s.order.student.stuMobile like '%"+stuMobile+"%'");
		sendList=sendService.searchPage(page, pagesize, buf.toString(), addDate, confirmDate, sortname, sortorder);
		return "success";
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getStuUsername() {
		return stuUsername;
	}

	public void setStuUsername(String stuUsername) {
		this.stuUsername = stuUsername;
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

	public Date getConfirmDate() {
		return confirmDate;
	}

	public void setConfirmDate(Date confirmDate) {
		this.confirmDate = confirmDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		if("all".equals(status)) this.status = SendDAO.ALL;
		else if("notsend".equals(status)) this.status=SendDAO.PRESEND;
		else if("sending".equals(status)) this.status=SendDAO.SENDING;
		else this.status=SendDAO.SENT;
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
	
}
