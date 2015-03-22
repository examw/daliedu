package com.changh.eschool.action.paper;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ExamRecord;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.ExamPaperService;

public class ExamRecordListAction extends BaseAction{
	private ExamPaperService examPaperService;
	private int page=1;
	private int pagesize=10;
	private String sortname=" er.id";
	private String sortorder=" asc";
	private int total;
	private List<ExamRecord> recordList;
	public String execute()throws Exception
	{
		Student stu = (Student)session.get("student");
		String criteria = "where er.stuId = "+stu.getStuId();
		recordList = examPaperService.findRecordByCriteria(criteria, page, pagesize, sortname, sortorder);
		total = (int) examPaperService.findRecordTotalByCriteria(criteria);
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<ExamRecord> getRecordList() {
		return recordList;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	
}	
