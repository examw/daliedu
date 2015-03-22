package com.changh.sccms.action.lecture;

import com.changh.sccms.service.LectureService;

public class DeleteAction {
	//input
	private Integer lectId;
	//output
	private boolean ok=false;
	//injection
	private LectureService lectureService;
	
	public String execute(){
		lectureService.delete(lectId);
		ok=true;
		return "success";
	}
	public Integer getLectId() {
		return lectId;
	}
	public void setLectId(Integer lectId) {
		this.lectId = lectId;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public LectureService getLectureService() {
		return lectureService;
	}
	public void setLectureService(LectureService lectureService) {
		this.lectureService = lectureService;
	}
}
