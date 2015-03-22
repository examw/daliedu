package com.changh.sccms.action.lecture;

import java.util.List;
import java.util.Map;

import com.changh.sccms.service.LectureService;
import com.changh.sccms.until.GridDataUtil;

public class ListAction {
	//output
	private Map lectureMap;
	//input
	private int classId;
	//×¢Èëinjection
	private LectureService lectureService;
	
	public String execute(){
		List list=lectureService.findByClassId(classId);
		lectureMap = GridDataUtil.gridMap(list, list.size());
		return "success";
	}
	
	public Map getLectureMap() {
		return lectureMap;
	}
	public void setLectureMap(Map lectureMap) {
		this.lectureMap = lectureMap;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}

	public void setLectureService(LectureService lectureService) {
		this.lectureService = lectureService;
	}
}
