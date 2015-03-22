package com.changh.eschool.action.question;

import java.util.List;

import com.changh.eschool.entity.Question;
import com.changh.eschool.service.QuestionService;

public class QuestionListAction {
	private List<Question> list;
	private QuestionService questionService;
	private int page=1;
	private int pagesize=20;
	private int total;
	private String sortname=" q.questionAddTime ";
	private String sortorder=" desc ";
	private int examId;
	private int gradeId;
	public List<Question> getList() {
		return list;
	}
	public void setList(List<Question> list) {
		this.list = list;
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
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}
	public String execute()throws Exception
	{
		StringBuffer buf = new StringBuffer();
		buf.append(" where q.questionStatus = 0 ");
		if(examId!=0&&gradeId==0)
		{
			buf.append(" and q.examId = ");
			buf.append(examId);
		}else if(examId==0&&gradeId!=0)
		{
			buf.append(" and q.gradeId = ");
			buf.append(gradeId);
		}else if(examId!=0&&gradeId!=0)
		{
			buf.append(" and q.examId = ");
			buf.append(examId);
			buf.append(" and q.gradeId = ");
			buf.append(gradeId);
		}
		list = questionService.findByCriteria(page, pagesize, sortname, sortorder, buf.toString());
		total = questionService.findTotal(buf.toString());
		return "success";
	}
}
