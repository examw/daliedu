package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.entity.ClassDetail;
import com.changh.eschool.service.ClassDetailService;

public class GetClassDetail {
	private Integer gradeId;
	private ClassDetailService classDetailService;
	private List<ClassDetail> list;
	public String execute(){
		setList(classDetailService.listClassDetail(gradeId, 0, 0));
		return "success";
	}
	public Integer getGradeId() {
		return gradeId;
	}
	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}
	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	public List<ClassDetail> getList() {
		return list;
	}
	public void setList(List<ClassDetail> list) {
		this.list = list;
	}
}
