package com.changh.eschool.action.user;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.service.StudentService;

/**
 * 检查用户名是不是被占用
 * @author Administrator
 *
 */
public class CheckUsernameAction  extends BaseAction{
	private String username;
	private StudentService studentService;
	private boolean ok=false;
	
	public boolean isOk() {
		return ok;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	public String execute()throws Exception
	{
		if(studentService.findByUsername(username)!=null)
		{
			ok=true; //表示被占用
		} 
		return "success";
	}
}
