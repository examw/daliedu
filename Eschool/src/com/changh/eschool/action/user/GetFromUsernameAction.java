package com.changh.eschool.action.user;

import java.util.HashMap;
import java.util.Map;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;

public class GetFromUsernameAction  extends BaseAction{
	private String username;
	private String password;
	private Map<String,Object> data=new HashMap<String,Object>();
	
	public Map<String, Object> getData() {
		return data;
	}
	private StudentService studentService;
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public String execute()throws Exception
	{
		Student student = studentService.findByNameAndPwd(username,password);
		if(student!=null)
		{
				data.put("ok",true);
				data.put("name", student.getStuName());
				data.put("mobile", student.getStuMobile());
		}else
		{
			data.put("ok", false);//用户名或密码错误
		}
		return "success";
	}
}
