package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.GradeService;

public class GetGradeAction extends BaseAction{
	private List<Grade> gradeList;
	private GradeService gradeService;
	private Integer examId;
	
	public List<Grade> getGradeList() {
		return gradeList;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}


	public String execute()throws Exception
	{
		Student stu = (Student) session.get("student");
		if(stu!=null){
			gradeList = gradeService.findGradeList(stu.getStuId(), examId);
		}else{
			gradeList =null;
		}
		return "success"; 
	}

	public Integer getExamId() {
		return examId;
	}

	public void setExamId(Integer examId) {
		this.examId = examId;
	}		
}
