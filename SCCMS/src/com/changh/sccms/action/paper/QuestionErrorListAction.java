package com.changh.sccms.action.paper;

import java.util.Map;

import com.changh.sccms.service.ExamQuestionErrorService;

public class QuestionErrorListAction {
	private String dealOrNot;
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	private Map<String,Object> errorList;
	private ExamQuestionErrorService examQuestionErrorService;
	public String execute()throws Exception
	{
		String criteria = "notdeal".equals(dealOrNot)?" where eqr.errorStatus = 0 ":"dealed".equals(dealOrNot)?" where eqr.errorStatus = 1 ":"";
		errorList = examQuestionErrorService.findPageByCriteria(criteria, page, pagesize, sortname, sortorder);
		return "success";
	}
	public String getDealOrNot() {
		return dealOrNot;
	}
	public void setDealOrNot(String dealOrNot) {
		this.dealOrNot = dealOrNot;
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
	public Map<String, Object> getErrorList() {
		return errorList;
	}
	public void setExamQuestionErrorService(
			ExamQuestionErrorService examQuestionErrorService) {
		this.examQuestionErrorService = examQuestionErrorService;
	}
	
}
