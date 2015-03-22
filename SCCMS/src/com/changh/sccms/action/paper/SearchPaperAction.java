package com.changh.sccms.action.paper;

import java.util.Map;

import com.changh.sccms.service.ExamPaperService;
import com.changh.sccms.until.Escape;

public class SearchPaperAction {
	private int examId;
	private String content;
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	private Map<String,Object> paperList;
	private ExamPaperService examPaperService;
	public String execute()throws Exception
	{
		content = "where ep.paperExamId = "+examId+" and "+content;
		paperList = examPaperService.findPageByContent(content, page, pagesize, sortname, sortorder);
		return "success";
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		String str = Escape.unescape(content);
		StringBuffer buf = new StringBuffer();
		buf.append(" ep.paperName like '%");
		buf.append(str);
		buf.append("%' ");
		try{
			int id = Integer.parseInt(str);
			buf.append("or ep.paperId = ");
			buf.append(id);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		this.content=buf.toString();
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
	public void setPaperList(Map<String, Object> paperList) {
		this.paperList = paperList;
	}
	public ExamPaperService getExamPaperService() {
		return examPaperService;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	
}
