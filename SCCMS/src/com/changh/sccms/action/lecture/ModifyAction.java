package com.changh.sccms.action.lecture;

import com.changh.sccms.entity.Lecture;
import com.changh.sccms.service.LectureService;

public class ModifyAction {
	//input
	private int lectId;
	//output
	private Lecture lecture;
	//×¢Èëinjection
	private LectureService lectureService;
	
	public String execute(){
		lecture = lectureService.findByLectId(lectId);

		return "success";
	}
	public int getLectId() {
		return lectId;
	}
	public void setLectId(int lectId) {
		this.lectId = lectId;
	}
	public Lecture getLecture() {
		return lecture;
	}
	public void setLecture(Lecture lecture) {
		this.lecture = lecture;
	}
	public LectureService getLectureService() {
		return lectureService;
	}
	public void setLectureService(LectureService lectureService) {
		this.lectureService = lectureService;
	}
}
