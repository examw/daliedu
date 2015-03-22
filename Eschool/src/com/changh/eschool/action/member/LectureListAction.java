package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.Lecture;
import com.changh.eschool.service.ClassDetailService;

/**
 * 课堂讲义列表
 * @author wei
 *
 */
public class LectureListAction {
	private Integer classId;
	private List<Lecture> lectureList;
	private Integer gradeId;
	private Integer examId;
	private ClassDetailService classDetailService;
	/**
	 * action 方法
	 * @return
	 */
	
	public String execute(){
		lectureList = classDetailService.findLectureByClassId(classId);
		Grade g =classDetailService.findGradeByClassId(classId);
		gradeId = g.getGradeId();
		examId= g.getExamCategory().getExamPid();
		return "success";
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public List<Lecture> getLectureList() {
		return lectureList;
	}
	public void setLectureList(List<Lecture> lectureList) {
		this.lectureList = lectureList;
	}
	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	public Integer getGradeId() {
		return gradeId;
	}
	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}
	public Integer getExamId() {
		return examId;
	}
	public void setExamId(Integer examId) {
		this.examId = examId;
	}
	
}
