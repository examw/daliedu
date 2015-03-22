package com.changh.eschool.action.mobile;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ExamQuestion;
import com.changh.eschool.service.ExamPaperService;

public class QuestionListOfPaperAction  extends BaseAction{
	private int paperid;
	private List<ExamQuestion> list;
	private ExamPaperService examPaperService;
	public String execute()
	{
		try
		{
			String criteria = " where eq.questPaperId = "+paperid+" order by eq.questRuleId asc,eq.questOrderId asc";
			list = examPaperService.findByCriteria(criteria);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return "success";
	}
	public int getPaperid() {
		return paperid;
	}
	public void setPaperid(int paperid) {
		this.paperid = paperid;
	}
	public List<ExamQuestion> getList() {
		return list;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	
}
