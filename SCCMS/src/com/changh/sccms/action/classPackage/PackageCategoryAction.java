package com.changh.sccms.action.classPackage;

import com.changh.sccms.action.BaseAction;

public class PackageCategoryAction extends BaseAction{
	private Integer  examId;
	public String execute(){
		if(session.get("pexamId")!=null){
			session.remove("pexamId");
		}
		session.put("pexamId", examId);
		return "success";
	}
	public Integer getExamId() {
		return examId;
	}
	public void setExamId(Integer examId) {
		this.examId = examId;
	}

}
