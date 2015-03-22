package com.changh.sccms.action.user.student;

import java.util.Map;

import com.changh.sccms.entity.Student;
import com.changh.sccms.service.StudentService;
import com.changh.sccms.until.LGDataUtil;

public class AddStudentAction {
	private Student stu;
	private Map map;
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
		try
		{
			stu.setStuType(1); //加入的是面授学员
			studentService.addStudent(stu);
			map= LGDataUtil.gridMap("", false, null);
		} catch (Exception e) {
			e.printStackTrace();
			map= LGDataUtil.gridMap("添加失败", true, null);
		}
		return "success";
	}

	public Map getMap() {
		return map;
	}
}
