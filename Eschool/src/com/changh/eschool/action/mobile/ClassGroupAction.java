package com.changh.eschool.action.mobile;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.service.ClassPackageService;
import com.changh.eschool.service.GradeService;

public class ClassGroupAction  extends BaseAction{
	private int examId;
	private List<GradeGroup> map;
	private ClassPackageService classPackageService;
	private GradeService gradeService;
	public String execute()
	{
		map = classPackageService.findPackageGroupByExamId(examId);
		if(map!=null)
		{
			map.addAll(gradeService.findGroupGradeByExamId(examId));
		}else
			map = gradeService.findGroupGradeByExamId(examId);
		return "success";
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	public List<GradeGroup> getMap() {
		return map;
	}
		
}
