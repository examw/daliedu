package com.changh.eschool.action.paper;

import java.util.List;

import com.changh.eschool.entity.ExamPaper;
import com.changh.eschool.entity.ExamRecord;
import com.changh.eschool.service.ExamPaperService;
import com.changh.eschool.until.Escape;

public class ScoreRankAction {
	private int paperId;
	private ExamPaper paper;
	private int page=1;
	private int pagesize=20;
	private String sortname=" er.rcdScore";
	private String sortorder=" desc";
	private int total;
	private List<ExamRecord> recordList;
	private ExamPaperService examPaperService;
	
	public String execute()throws Exception
	{
		paper = examPaperService.findById(paperId);
		String criteria = " where er.paperId = "+paperId;
		recordList = examPaperService.findRecordByCriteria(criteria, page, pagesize, sortname, sortorder);
		total = examPaperService.findRecordTotalByCriteria(criteria);
		return "success";
	}

	public int getPaperId() {
		return paperId;
	}

	public void setPaperId(String paperId) {
		this.paperId = Escape.unescapeId(paperId);
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public ExamPaper getPaper() {
		return paper;
	}

	public List<ExamRecord> getRecordList() {
		return recordList;
	}

	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	
}
