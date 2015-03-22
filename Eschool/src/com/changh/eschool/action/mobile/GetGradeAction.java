package com.changh.eschool.action.mobile;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.GradeService;

public class GetGradeAction  extends BaseAction{
	private List<Grade> gradeList;
	private GradeService gradeService;
	private int stuid;
	public List<Grade> getGradeList() {
		return gradeList;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	
	

	public int getStuid() {
		return stuid;
	}

	public void setStuid(int stuid) {
		this.stuid = stuid;
	}

	public String execute()throws Exception
	{
		gradeList = gradeService.findByStuId(stuid);
		return "success"; 
	}		
}
