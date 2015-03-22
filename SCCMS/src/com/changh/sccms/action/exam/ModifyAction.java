package com.changh.sccms.action.exam;

import com.changh.sccms.service.ExamCategoryService;

public class ModifyAction {
	//input
	private String examName;
	private int id;
	private String examUrl;
	private String examDescription;
	public String getExamUrl() {
		return examUrl;
	}

	public void setExamUrl(String examUrl) {
		this.examUrl = examUrl;
	}

	public String getExamDescription() {
		return examDescription;
	}

	public void setExamDescription(String examDescription) {
		this.examDescription = examDescription;
	}

	//output
	private Boolean ok= false;
		
	private ExamCategoryService examCategoryService;

	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}

	public String execute() throws Exception{
		examCategoryService.updateExam(id,examName,examUrl,examDescription);
		ok=true;
		return "success";
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Boolean getOk() {
		return ok;
	}

	public void setOk(Boolean ok) {
		this.ok = ok;
	}
}
