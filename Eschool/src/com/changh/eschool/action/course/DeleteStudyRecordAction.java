package com.changh.eschool.action.course;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudyRecordService;

public class DeleteStudyRecordAction extends BaseAction{
	private boolean ok=false;
	private StudyRecordService studyRecordService;
	
	public String execute(){
		Student stu = (Student) session.get("student");
		studyRecordService.deleteByStuId(stu.getStuId());
		ok = true;
		return "success";
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public void setStudyRecordService(StudyRecordService studyRecordService) {
		this.studyRecordService = studyRecordService;
	}
	
}	
