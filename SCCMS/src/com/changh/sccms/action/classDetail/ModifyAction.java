package com.changh.sccms.action.classDetail;

import com.changh.sccms.entity.ClassDetail;
import com.changh.sccms.service.ClassDetailService;

public class ModifyAction {
	private int  classId;
	private ClassDetail classDetail;
	private ClassDetailService classDetailService;
	
	public String execute(){
		classDetail= classDetailService.findByClassId(classId);
		classDetail.setClassMin(classDetail.getClassTime()/1000/60);
		classDetail.setClassSec(classDetail.getClassTime()/1000%60);
		return "success";
	}
	public ClassDetail getClassDetail() {
		return classDetail;
	}
	public void setClassDetail(ClassDetail classDetail) {
		this.classDetail = classDetail;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
}
