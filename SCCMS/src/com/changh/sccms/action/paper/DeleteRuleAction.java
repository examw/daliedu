package com.changh.sccms.action.paper;

import com.changh.sccms.service.ExamPaperService;

public class DeleteRuleAction {
	private int ruleId;
	private boolean ok;
	private ExamPaperService examPaperService;
	
	public int getRuleId() {
		return ruleId;
	}

	public void setRuleId(int ruleId) {
		this.ruleId = ruleId;
	}

	public boolean isOk() {
		return ok;
	}

	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}

	public String execute()throws Exception
	{
		ok = examPaperService.deleteRule(ruleId);
		return "success";
	}
	
}
