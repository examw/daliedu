package com.changh.sccms.action.exam;


import com.changh.sccms.entity.Student;
import com.changh.sccms.service.StudentService;

public class UpdateAction {
	private int stuId;
	private Student stu;
	
	private StudentService studentService;
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
	
	
	public String execute() throws Exception{
		stu=studentService.updateStudent(stuId);
		return "success";
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
}
