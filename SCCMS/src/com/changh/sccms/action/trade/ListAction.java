package com.changh.sccms.action.trade;

import java.util.Map;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.dao.TradeDAO;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.service.TradeService;

public class ListAction extends BaseAction{
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	private String criteria;
	private Map<String,Object> tradeList;
	private TradeService tradeService;
	
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
	public String getCriteria() {
		return criteria;
	}
	public void setCriteria(String criteria) {
		this.criteria = criteria.equals("all")?TradeDAO.ALL:criteria.equals("recharge")?TradeDAO.RECHARGE:criteria.equals("buyclass")?TradeDAO.BUYCLASS:TradeDAO.OTHER;
	}
	public Map<String, Object> getTradeList() {
		return tradeList;
	}
	public void setTradeService(TradeService tradeService) {
		this.tradeService = tradeService;
	}
	public String execute()throws Exception
	{	
		tradeList = tradeService.findAll(page, pagesize, sortname, sortorder, criteria);
		return "success";
	}
}
