package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.entity.Question;
import com.changh.eschool.service.QuestionService;

public class AllQuestionAction {
	private List<Question> list;
	private int page = 1;
	private int pagesize = 20;
	private String sortname = " q.questionAddTime ";
	private String sortorder =" desc ";
	private int total;
	private int r = -1;
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

	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
	}

	public List<Question> getList() {
		return list;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	public String execute()throws Exception
	{
		if(r == -1)
		{
			list = questionService.findAll(page, pagesize, sortname, sortorder);
			total = questionService.findTotal("");
		}else
		{
			list = questionService.findByStatus(page, pagesize, sortname, sortorder, r);
			total = questionService.findTotal(" where q.questionStatus = "+r);
		}
		return "success";
	}
}
