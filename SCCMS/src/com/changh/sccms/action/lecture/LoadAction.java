package com.changh.sccms.action.lecture;

import com.changh.sccms.entity.ClassDetail;
import com.changh.sccms.service.ClassDetailService;

public class LoadAction {
	private Integer classId;
	
	private ClassDetail classDetail;
	private ClassDetailService classDetailService;
	
	public String execute(){
		classDetail=classDetailService.findByClassId(classId);
		return "success";
	}
	public ClassDetail getClassDetail() {
		return classDetail;
	}
	public void setClassDetail(ClassDetail classDetail) {
		this.classDetail = classDetail;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
}
