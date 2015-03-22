package com.changh.eschool.action.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.service.StudentService;

public class FindPwdAction  extends BaseAction{
	//private String username;
	private String email;
	private Map<String,Object> data= new HashMap<String,Object>();
	public Map<String, Object> getData() {
		return data;
	}
	private StudentService studentService;
	private JavaMailSender mailSender;
	private SimpleMailMessage mailMessage;
	
	public void setMailMessage(SimpleMailMessage mailMessage) {
		this.mailMessage = mailMessage;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

//	public String getUsername() {
//		return username;
//	}
//
//	public void setUsername(String username) {
//		this.username = username;
//	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public String execute()throws Exception
	{
		boolean ok = studentService.findPwd(null,email,mailSender,mailMessage);
		String addr = "http://mail."+email.split("@")[1];
		data.put("ok", ok);
		data.put("addr",addr );
		return "success";
		
	}

}
