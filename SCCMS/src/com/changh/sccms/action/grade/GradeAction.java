package com.changh.sccms.action.grade;

import com.changh.sccms.action.BaseAction;

public class GradeAction extends BaseAction{
	private Integer  examId;
	private Integer examPid;
	public String execute(){
		if(session.get("gexamId")!=null){
			session.remove("gexamId");
		}
		session.put("gexamId", examId);
		if(session.get("gexamPid")!=null){
			session.remove("gexamPid");
		}
		session.put("gexamPid",examPid);
		return "success";
	}
	public Integer getExamId() {
		return examId;
	}
	public void setExamId(Integer examId) {
		this.examId = examId;
	}
	public Integer getExamPid() {
		return examPid;
	}
	public void setExamPid(Integer examPid) {
		this.examPid = examPid;
	}

}
