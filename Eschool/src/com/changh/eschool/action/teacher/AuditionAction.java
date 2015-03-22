package com.changh.eschool.action.teacher;

import java.util.List;

import com.changh.eschool.entity.Grade;
import com.changh.eschool.service.GradeService;

public class AuditionAction {
	private int tchId;
	private List<Grade> gradeList;
	private  GradeService gradeService;
	
	public String execute(){
		setGradeList(gradeService.findByTchId(tchId));
		return "success";
	}
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	
	public int getTchId() {
		return tchId;
	}
	public void setTchId(int tchId) {
		this.tchId = tchId;
	}
	public List<Grade> getGradeList() {
		return gradeList;
	}
	public void setGradeList(List<Grade> gradeList) {
		this.gradeList = gradeList;
	}
	
	
}
