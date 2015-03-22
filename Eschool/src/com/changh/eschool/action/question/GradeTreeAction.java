package com.changh.eschool.action.question;

import java.util.List;

import com.changh.eschool.entity.Grade;
import com.changh.eschool.service.GradeService;

public class GradeTreeAction {
	private int examId;
	private GradeService gradeService;
	private List<Grade> list;
	
	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public List<Grade> getList() {
		return list;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public String execute()throws Exception
	{
		list = gradeService.findByExamId2(examId);
		return "success";
	}}
