package com.changh.sccms.action.paper;

import java.util.List;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.ExamPaper;
import com.changh.sccms.entity.ExamRule;
import com.changh.sccms.service.ExamPaperService;

public class UpdatePaperAction extends BaseAction{
	private ExamPaper paper;
	private List<ExamRule> rules;
	private ExamPaperService examPaperService;
	private String action="update";
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}

	public ExamPaper getPaper() {
		return paper;
	}
	
	public void setAction(String action) {
		this.action = action;
	}

	public void setPaper(ExamPaper paper) {
		this.paper = paper;
	}

	public List<ExamRule> getRules() {
		return rules;
	}

	public void setRules(List<ExamRule> rules) {
		this.rules = rules;
	}

	public String execute()throws Exception
	{
		Administrator admin = (Administrator) session.get("admin");
		paper.setPaperEditor(admin.getAdmUsername());
		examPaperService.updatePaper(paper,rules);
		return "success";
	}
}
