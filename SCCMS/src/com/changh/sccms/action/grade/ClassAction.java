package com.changh.sccms.action.grade;

import java.util.List;

import com.changh.sccms.entity.GradeCategory;
import com.changh.sccms.service.GradeService;

public class ClassAction {
	private List<GradeCategory> listClass;
	
	private GradeService gradeService;
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	
	public String execute(){
		listClass = gradeService.classList();
		return "success";
	}
	public List<GradeCategory> getListClass() {
		return listClass;
	}
	public void setListClass(List<GradeCategory> listClass) {
		this.listClass = listClass;
	}
}
