package com.changh.eschool.action.paper;

import java.util.List;
import java.util.Map;

import com.changh.eschool.entity.ExamPaper;
import com.changh.eschool.service.ExamPaperService;
import com.changh.eschool.until.Escape;

public class PaperListAction {
	private ExamPaperService examPaperService;
	private int gradeId;
	private String gradeName;
	private int page=1;
	private int pagesize=10;
	private String sortname=" ep.paperEGCheaterId";
	private String sortorder=" asc";
	private int total;
	private List<ExamPaper> paperList;
	public String execute()throws Exception
	{
		paperList = examPaperService.findPageByGradeId(gradeId, page, pagesize, sortname, sortorder);
		total = (int) examPaperService.findTotalByGradeId(gradeId);
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
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public List<ExamPaper> getPaperList() {
		return paperList;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = Escape.unescape(gradeName);
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
}
