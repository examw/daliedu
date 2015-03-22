package com.changh.sccms.action.lecture;

import com.changh.sccms.action.BaseAction;

public class LectureAction extends BaseAction{
	private Integer classId;
	public String execute (){
		if(session.get("classId")!=null){
			session.remove("classId");
		}
		session.put("classId", classId);
		return "success";
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
}
