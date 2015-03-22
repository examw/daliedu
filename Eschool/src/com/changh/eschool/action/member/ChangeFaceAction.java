package com.changh.eschool.action.member;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;

public class ChangeFaceAction extends BaseAction{
	private boolean ok;
	private String imgUrl;
	private StudentService studentService;
	
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public boolean isOk() {
		return ok;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String execute()throws Exception
	{
		Student stu = (Student) session.get("student");
		Student copy = (Student) stu.clone();
		copy.setStuImgUrl(imgUrl);
		studentService.updateStudent(copy);
		stu.setStuImgUrl(imgUrl);
		ok=true;
		return "success";
	}
}
