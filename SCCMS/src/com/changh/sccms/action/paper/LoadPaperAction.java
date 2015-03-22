package com.changh.sccms.action.paper;

import java.util.List;

import com.changh.sccms.entity.ExamPaper;
import com.changh.sccms.entity.ExamRule;
import com.changh.sccms.service.ExamPaperService;

public class LoadPaperAction {
	private int paperId;
	private ExamPaper paper;
	private List<ExamRule> ruleList;
	private ExamPaperService examPaperService;
	private String actionFlag="";
	private int rcdId;
	private int ruleSize;
	public String execute()throws Exception
	{
		paper = examPaperService.findById(paperId);
		ruleSize = paper.getExamRules().size();
		ruleList = paper.getExamRules();
		return "success";
	}
	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	public ExamPaper getPaper() {
		return paper;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	public int getRuleSize() {
		return ruleSize;
	}
	public List<ExamRule> getRuleList() {
		return ruleList;
	}
	public String getActionFlag() {
		return actionFlag;
	}
	public void setActionFlag(String actionFlag) {
		this.actionFlag = actionFlag;
	}
	public int getRcdId() {
		return rcdId;
	}
	public void setRcdId(int rcdId) {
		this.rcdId = rcdId;
	}
	
}
