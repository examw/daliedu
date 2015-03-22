package com.changh.eschool.action.course;

import java.util.ArrayList;
import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.entity.StudyRecord;
import com.changh.eschool.service.StudyRecordService;

public class RecordListAllAction extends BaseAction{
	private List<StudyRecord> list = new ArrayList<StudyRecord>();
	private StudyRecordService studyRecordService;
	
	public String execute(){
		Student stu = (Student) session.get("student");
		list = studyRecordService.findByStuId(stu.getStuId());
		return "success";
	}
	public List<StudyRecord> getList() {
		return list;
	}
	public void setList(List<StudyRecord> list) {
		this.list = list;
	}
	public void setStudyRecordService(StudyRecordService studyRecordService) {
		this.studyRecordService = studyRecordService;
	}
}
