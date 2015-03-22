package com.changh.sccms.action.paper;

import com.changh.sccms.service.ExamPaperService;

public class BatchAddFromEditorAction {
	private int ruleId;
	private int paperId;
	private int questType;
	private int model;
	private String questContent;
	private int startNo;
	private ExamPaperService examPaperService;
	
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	public String execute(){
		try {
			//解析文件，并且生成考题
			if(examPaperService.saveBatchFromEditor(questContent,ruleId,paperId,questType,startNo,model))
			return "success";
			return "fail";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	public int getRuleId() {
		return ruleId;
	}
	public void setRuleId(int ruleId) {
		this.ruleId = ruleId;
	}
	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	public int getQuestType() {
		return questType;
	}
	public void setQuestType(int questType) {
		this.questType = questType;
	}
	public int getModel() {
		return model;
	}
	public void setModel(int model) {
		this.model = model;
	}
	public String getQuestContent() {
		return questContent;
	}
	public void setQuestContent(String questContent) {
		this.questContent = questContent;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
}	
