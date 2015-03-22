package com.changh.sccms.action.lecture;

import java.util.Date;

import com.changh.sccms.entity.Lecture;
import com.changh.sccms.service.LectureService;

public class AddAction {
	//input;
	private Lecture lecture;
	//output
	private boolean ok=false;
	//injection
	private LectureService lectureService;
	
	public String execute(){
		lecture.setLectAddTime(new Date());
		lecture.setLectId(lectureService.getLectId());
		lecture.setLectOrderId(1);	
		lecture.setLectTimePoint(lecture.getLectMin1()*60*1000+lecture.getLectSec1()*1000);
		/*String str =lecture.getLectContent();
		lecture.setLectContent(htmlToCode(str));*/
		lectureService.save(lecture);
		ok=true;
		return "success";
	}
	/*
	public static final String htmlToCode(String s) 
	{ 
	if(s == null) 
	{ 
	return ""; 
	} else {
		s = s.replace("\n", "&nbsp;");
		s = s.replace("\n\r", "<br>&nbsp;&nbsp;");
		s = s.replace("\r\n", "<br>&nbsp;&nbsp;");//这才是正确的！
		s = s.replace("\t", "&nbsp;&nbsp;&nbsp;&nbsp;");
	    s = s.replace(" ", "&nbsp;");
	    s = s.replace("\"", "\\"+"\"");//如果原文含有双引号，这一句最关键！！！！！！
	    
		s.replaceAll("\r\n", "<br/>").replaceAll(" ", "&nbsp;");
	return s; 
	} 
	} */
	
	public Lecture getLecture() {
		return lecture;
	}

	public void setLecture(Lecture lecture) {
		this.lecture = lecture;
	}

	public void setLectureService(LectureService lectureService) {
		this.lectureService = lectureService;
	}

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}
}
