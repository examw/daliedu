package com.changh.sccms.action.send;

import java.util.Map;

import com.changh.sccms.dao.SendDAO;
import com.changh.sccms.service.SendService;

public class SendListAction {
	private Map<String,Object> sendList;
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	private String status;
	public Map<String, Object> getSendList() {
		return sendList;
	}
	private SendService sendService;
	public void setSendService(SendService sendService) {
		this.sendService = sendService;
	}
	
	public String execute()throws Exception
	{
		sendList = sendService.findPageByCriteria(page, pagesize, status, sortname, sortorder);
		return "success";
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		if(("all").equals(status))this.status=SendDAO.ALL;
		else if("notsend".equals(status)) this.status=SendDAO.PRESEND;
		else if("sending".equals(status))this.status=SendDAO.SENDING;
		else this.status = SendDAO.SENT;
	}
	
}
