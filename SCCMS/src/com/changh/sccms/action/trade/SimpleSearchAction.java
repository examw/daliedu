package com.changh.sccms.action.trade;

import java.util.Map;

import com.changh.sccms.service.TradeService;
import com.changh.sccms.until.Escape;

public class SimpleSearchAction {
	private String str;
	private String searchName;
	private String scope;
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	private Map<String,Object> tradeList;
	private TradeService tradeService;
	public String execute()throws Exception
	{
		String criteria = null;
		if("stuUsername".equals(searchName))
		{
			criteria = "select t from Trade t,Student s where t.stuId = s.stuId and s.stuUsername like '%"+str+"%' ";
		}else if("orderNo".equals(searchName))
		{
			criteria = "where tradeOrderNo like '%"+str+"%' ";
		}
		tradeList = tradeService.findAll(page, pagesize, sortname, sortorder, criteria);
		return "success" ;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = Escape.unescape(str);
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
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
	public Map<String, Object> getTradeList() {
		return tradeList;
	}
	public void setTradeService(TradeService tradeService) {
		this.tradeService = tradeService;
	}
	
}
