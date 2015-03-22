package com.changh.sccms.action.user.student;

import java.util.Map;

import com.changh.sccms.service.StudentService;
import com.changh.sccms.until.LGDataUtil;

public class DeleteAction {
	private int stuId;
	private Map map;

	private StudentService studentService;
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public String execute(){
			try {
				studentService.deleteStudent(stuId);
				map= LGDataUtil.gridMap("", false, null);
			} catch (Exception e) {
				e.printStackTrace();
				map= LGDataUtil.gridMap("²»ÄÜÉ¾³ý£¡", true, null);
			}			
			return "success";		
	}

	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public Map getMap() {
		return map;
	}

	public void setMap(Map map) {
		this.map = map;
	}
}
