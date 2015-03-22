package com.changh.sccms.action.paper;

import java.util.Map;

import com.changh.sccms.service.ExamPaperService;

public class PaperListAction {
	private ExamPaperService examPaperService;
	private int examId;
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	private Map<String,Object> paperList;
	public String execute()throws Exception
	{
		paperList = examPaperService.findPageByExamId(examId, page, pagesize, sortname, sortorder);
		return "success";
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
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
	public Map<String, Object> getPaperList() {
		return paperList;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	
}
