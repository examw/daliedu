package com.changh.sccms.action.trade;

import java.util.Date;
import java.util.Map;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.service.TradeService;

public class SearchAction extends BaseAction {
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	private Map<String,Object> tradeList;
	private TradeService tradeService;
	private String orderId;
	private String type;
	private Date before;
	private Date after;
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
	public Map<String, Object> getTradeList() {
		return tradeList;
	}
	public void setTradeService(TradeService tradeService) {
		this.tradeService = tradeService;
	}
	public String execute()throws Exception
	{

			tradeList = tradeService.search(page, pagesize, sortname, sortorder,before,after,orderId,type);
		return "success";
	}
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getBefore() {
		return before;
	}
	public void setBefore(Date before) {
		this.before = before;
	}
	public Date getAfter() {
		return after;
	}
	public void setAfter(Date after) {
		this.after = after;
	}
	
}
