package com.changh.sccms.action.user.student;

import java.util.Map;

import com.changh.sccms.entity.Student;
import com.changh.sccms.service.StudentService;
import com.changh.sccms.until.LGDataUtil;

public class ModifyAction {
	//output
	private int stuId;
	private String stuPhone;
	private String stuMobile;
	private String stuAddr;
	private int stuStatus;
	private String QICQ;
	
	private Map map;

	
	public int getStuStatus() {
		return stuStatus;
	}

	public void setStuStatus(int stuStatus) {
		this.stuStatus = stuStatus;
	}

	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public String getStuPhone() {
		return stuPhone;
	}

	public void setStuPhone(String stuPhone) {
		this.stuPhone = stuPhone;
	}

	public String getStuMobile() {
		return stuMobile;
	}

	public void setStuMobile(String stuMobile) {
		this.stuMobile = stuMobile;
	}

	public String getStuAddr() {
		return stuAddr;
	}

	public void setStuAddr(String stuAddr) {
		this.stuAddr = stuAddr;
	}
	//injection
	private StudentService studentService;
		
	public String execute()
	{	try {
		Student stu = new Student();
			stu.setStuId(stuId);
			stu.setStuPhone(stuPhone);
			stu.setStuAddr(stuAddr);
			stu.setStuStatus(stuStatus);
			stu.setStuMobile(stuMobile);
			stu.setQICQ(QICQ);
			stu.setDeviceNum(deviceNum);
			studentService.modifyStudent(stu);
			map= LGDataUtil.gridMap("", false, null);
			
	} catch (Exception e) {
		map= LGDataUtil.gridMap("系统异常，修改失败", true, null);
		e.printStackTrace();
	}
	return "success";
	}
	
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public Map getMap() {
		return map;
	}

	public void setMap(Map map) {
		this.map = map;
	}

	public String getQICQ() {
		return QICQ;
	}

	public void setQICQ(String qICQ) {
		QICQ = qICQ;
	}
	
	private int deviceNum;


	public int getDeviceNum() {
		return deviceNum;
	}

	public void setDeviceNum(int deviceNum) {
		this.deviceNum = deviceNum;
	}

	public StudentService getStudentService() {
		return studentService;
	}
}
