package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.QuestionCollect;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.QuestionCollectService;

public class QuestionCollectListAction extends BaseAction{
	private List<QuestionCollect> list;
	private QuestionCollectService questionCollectService;
	private int page=1;
	private int pagesize=10;
	private String sortname=" qc.collectAddTime";
	private String sortorder=" desc ";
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
	public List<QuestionCollect> getList() {
		return list;
	}
	public void setQuestionCollectService(
			QuestionCollectService questionCollectService) {
		this.questionCollectService = questionCollectService;
	}
	public String execute()throws Exception
	{
		Student stu = (Student) session.get("student");
		list = questionCollectService.findByStuId(page, pagesize, sortname, sortorder, stu.getStuId());
		total = (int) questionCollectService.findTotalByStuId(stu.getStuId());
		return "success";
	}
}
