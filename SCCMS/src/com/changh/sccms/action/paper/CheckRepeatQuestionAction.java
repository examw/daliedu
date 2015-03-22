package com.changh.sccms.action.paper;

import com.changh.sccms.service.ExamPaperService;

public class CheckRepeatQuestionAction {
	private String content;
	private int ruleId;
	private int model;
	private boolean ok;
	private ExamPaperService examPaperService;
	public String execute()throws Exception
	{
		ok = examPaperService.checkRepeat(content,ruleId,model);
		return "success";
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isOk() {
		return ok;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	public int getRuleId() {
		return ruleId;
	}
	public void setRuleId(int ruleId) {
		this.ruleId = ruleId;
	}
	public int getModel() {
		return model;
	}
	public void setModel(int model) {
		this.model = model;
	}
	
}
