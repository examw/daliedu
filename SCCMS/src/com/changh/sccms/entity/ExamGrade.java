package com.changh.sccms.entity;

import java.util.List;

public class ExamGrade {
	private Integer examId;
	private List<Grade> children;
	private String text;
	public Integer getExamId() {
		return examId;
	}
	public void setExamId(Integer examId) {
		this.examId = examId;
	}
	public List<Grade> getChildren() {
		return children;
	}
	public void setChildren(List<Grade> children) {
		this.children = children;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
