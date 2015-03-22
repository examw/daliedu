package com.changh.eschool.action.teacher;

import com.changh.eschool.entity.Teacher;
import com.changh.eschool.service.CommentService;
import com.changh.eschool.service.TeacherService;

public class TeacherAction {
	private int tchId;
	private Teacher teacher;
	private int counts=0;
	private int score =0;

	
	private TeacherService teacherService;
	private CommentService commentService;
	
	public String execute() throws Exception{
		teacher = teacherService.findBytchId(tchId);
		counts = commentService.findTotal(tchId);
		score = commentService.findSorce(tchId);
		return "success";
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	public int getTchId() {
		return tchId;
	}
	public void setTchId(int tchId) {
		this.tchId = tchId;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public TeacherService getTeacherService() {
		return teacherService;
	}
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

}
