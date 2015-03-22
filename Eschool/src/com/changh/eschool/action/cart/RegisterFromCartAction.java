package com.changh.eschool.action.cart;

import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;
import com.changh.eschool.until.Escape;

public class RegisterFromCartAction {
	private String username;
	private String password;
	private String truename;
	private String mobile;
	private String email;
	private String phone;
	private boolean ok;
	private StudentService studentService;
	private String qq;
	private String area;
	private String exam;
	
	public void setArea(String area) {
		this.area = area;
	}
	public void setExam(String exam) {
		this.exam = exam;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setTruename(String truename) {
		this.truename = Escape.unescape(truename);
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isOk() {
		return ok;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public String execute()throws Exception
	{
		Student stu = new Student();
		stu.setStuUsername(username);
		stu.setStuPassword(password);
		stu.setStuName(truename);
		stu.setStuEmail(email);
		stu.setStuPhone(phone);
		stu.setStuMobile(mobile);
		stu.setQICQ(qq);
		stu.setStuArea(area);
		stu.setStuExam(exam);
		ok = studentService.registerFromCart(stu);
		return "success";
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
