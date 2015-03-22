package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Question;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.QuestionService;

public class MyQuestionAction extends BaseAction{
	private List<Question> list;
	private int page = 1;
	private int pagesize = 10;
	private String sortname = " q.questionAddTime ";
	private String sortorder =" desc ";
	private int total;
	private QuestionService questionService;
	
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

	public List<Question> getList() {
		return list;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	public String execute()throws Exception
	{
		Student stu = (Student)session.get("student");
		list = questionService.findByStuId(page, pagesize, sortname, sortorder, stu.getStuId());
		total = questionService.findTotal(" where q.student = "+stu.getStuId());
		return "success";
	}
}
