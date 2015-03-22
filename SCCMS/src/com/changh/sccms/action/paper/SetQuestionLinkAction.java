package com.changh.sccms.action.paper;

import com.changh.sccms.service.ExamPaperService;

public class SetQuestionLinkAction {
	private String questionIds;
	private boolean ok;
	private ExamPaperService examPaperService;
	
	public String getQuestionIds() {
		return questionIds;
	}

	public void setQuestionIds(String questionIds) {
		this.questionIds = questionIds;
	}

	public boolean isOk() {
		return ok;
	}

	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}

	public String setLink()throws Exception
	{
		ok = examPaperService.updateQuestionsForSetLink(questionIds);
		return "success";
	}
	public String cancelLink()throws Exception
	{
		ok = examPaperService.updateQuestionForCancelLink(questionIds);
		return "success";
	}
}
