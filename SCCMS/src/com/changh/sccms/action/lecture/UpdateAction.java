package com.changh.sccms.action.lecture;

import com.changh.sccms.entity.Lecture;
import com.changh.sccms.service.LectureService;

public class UpdateAction {
	//input
	private Lecture lecture;
	//output
	private boolean ok;
	//injection
	private LectureService lectureService;
	
	public String execute(){
		lecture.setLectTimePoint(lecture.getLectMin1()*60*1000+lecture.getLectSec1()*1000);
		lectureService.update(lecture);
		ok=true;
		return "success";
	}
	public Lecture getLecture() {
		return lecture;
	}
	public void setLecture(Lecture lecture) {
		this.lecture = lecture;
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
