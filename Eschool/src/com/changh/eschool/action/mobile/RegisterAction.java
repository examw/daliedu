package com.changh.eschool.action.mobile;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;

public class RegisterAction  extends BaseAction{
	private String username;
	private String pwd;
	private String email;
	private String phone;
	private String qq;
	private String area;
	private String exam;
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private Map<String,Object> result = new HashMap<String,Object>();
	private StudentService studentService;
	public String execute()throws Exception
	{
		Student stu = studentService.findByUsername(username);
		if(stu!=null)
		{
			result.put("OK", 0);
			result.put("msg", "用户名被占用");
			return "success";
		}
		stu = studentService.findByEmail(email);
		if(stu!=null)
		{
			result.put("OK", 0);
			result.put("msg", "邮箱被占用");
			return "success";
		}
		stu=studentService.findByMobilePhone(phone);
		if(stu!=null)
		{
			result.put("OK", 0);
			result.put("msg", "手机号码已被注册");
			return "success";
		}
		stu = new Student();
		stu.setStuUsername(username);
		stu.setStuEmail(email);
		stu.setStuPassword(pwd);
		stu.setStuPhone(phone);
		stu.setQICQ(qq);
		try{
			System.out.println(area);
			area = new String(area.getBytes("iso8859-1"), "UTF-8");
			System.out.println(area);
			System.out.println(name);
			name = new String(name.getBytes("iso8859-1"), "UTF-8");
			System.out.println(name);
			exam = new String(exam.getBytes("iso8859-1"), "UTF-8");
			stu.setStuArea(area);
			stu.setStuExam(exam);
			stu.setStuName(name);
		}catch(Exception e)
		{
		}
		studentService.addStudent(stu);
		result.put("OK", 1);
		result.put("username", username);
		return "success";
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public Map<String, Object> getResult() {
		return result;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getExam() {
		return exam;
	}
	public void setExam(String exam) {
		this.exam = exam;
	}
	
}
