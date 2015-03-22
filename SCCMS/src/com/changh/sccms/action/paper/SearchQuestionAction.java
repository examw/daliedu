package com.changh.sccms.action.paper;

import java.util.Map;

import com.changh.sccms.service.ExamPaperService;
import com.changh.sccms.until.Escape;

public class SearchQuestionAction {
	private int paperId;
	private String content;
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	private Map<String,Object> questionList;
	private ExamPaperService examPaperService;
	public String execute()throws Exception
	{
		content = "where eq.questPaperId = "+paperId+" and "+content;
		questionList = examPaperService.findQuestionByContent(content, page, pagesize, sortname, sortorder);
		return "success";
	}
	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = "eq.questContent like '%"+Escape.unescape(content)+"%' ";
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
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	public Map<String, Object> getQuestionList() {
		return questionList;
	}
	
}
