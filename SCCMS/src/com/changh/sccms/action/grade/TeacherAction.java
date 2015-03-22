package com.changh.sccms.action.grade;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.SimpleTeacher;
import com.changh.sccms.entity.Teacher;
import com.changh.sccms.service.GradeService;
import com.changh.sccms.until.GridDataUtil;

public class TeacherAction {
	private int examId;
	private int examPid;
	private List<SimpleTeacher> listTeacher = new ArrayList<SimpleTeacher>();
	private GradeService gradeService;
	
	
	
	public String execute(){
		List<Object[]> list=gradeService.TeacherList(examId,examPid);	
		for(Object[] ob:list){
			SimpleTeacher st = new SimpleTeacher();
			st.setTchId((Integer) ob[1]);
			st.setTchName((String) ob[0]);
			listTeacher.add(st);
		}
		
		return "success";
	}
	
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public List getListTeacher() {
		return listTeacher;
	}
	public void setListTeacher(List listTeacher) {
		this.listTeacher = listTeacher;
	}

	public int getExamPid() {
		return examPid;
	}

	public void setExamPid(int examPid) {
		this.examPid = examPid;
	}
}
