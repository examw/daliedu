package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.RechargeRecord;
import com.changh.eschool.entity.Student;
import com.changh.eschool.entity.Trade;
import com.changh.eschool.service.StudyCardService;

public class TradeListForStuAction extends BaseAction{
	private int page=1;
	private int pagesize=10;
	private String sortorder=" desc";
	private String sortname =" t.tradeTime";
	private int total;
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
	public String getSortorder() {
		return sortorder;
	}
	public void setSortorder(String sortorder) {
		this.sortorder = sortorder;
	}
	public String getSortname() {
		return sortname;
	}
	public void setSortname(String sortname) {
		this.sortname = sortname;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	private List<Trade> recordList;
	private StudyCardService studyCardService;
	public List<Trade> getRecordList() {
		return recordList;
	}
	public void setStudyCardService(StudyCardService studyCardService) {
		this.studyCardService = studyCardService;
	}
	public String execute()throws Exception
	{
		Student student = (Student)session.get("student");
		recordList = studyCardService.findTradeByStuId(student.getStuId(), page, pagesize, sortname, sortorder);
		total = (int)studyCardService.findTradeTotalByStuId(student.getStuId());
		return "success";
	}

}
