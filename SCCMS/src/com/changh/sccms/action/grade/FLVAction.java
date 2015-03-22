package com.changh.sccms.action.grade;

import com.changh.sccms.service.ClassDetailService;

public class FLVAction {
	private Integer classId;
	private String url;
	private ClassDetailService classDetailService;
	public  String execute(){
		url = classDetailService.findByClassId(classId).getClassHdUrl();
		return "success";
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

}
