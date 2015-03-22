package com.changh.sccms.action.user.student;

import com.changh.sccms.service.StudentService;

public class ResetPwdAction {
	private int stuId;

	private StudentService studentService;
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public String execute(){
			try {
				studentService.updatePwdReset(stuId);
			} catch (Exception e) {
				e.printStackTrace();
			}			
			return "success";		
	}

	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
}
