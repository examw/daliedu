package com.changh.eschool.action.question;

import java.util.HashMap;
import java.util.Map;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.service.TeacherService;

public class TeacherLoginAction extends BaseAction{	
	private String tchUsername;
	private String password;
	private TeacherService teacherService;
	private Map<String,Object> data=new HashMap<String,Object>();
	public String getTchUsername() {
		return tchUsername;
	}

	public void setTchUsername(String tchUsername) {
		this.tchUsername = tchUsername;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public String execute()throws Exception
	{
		boolean ok = teacherService.login(tchUsername,password);
		String url = (String) session.get("lastUrlForTch");
		data.put("ok", ok);
		data.put("lastUrlForTch",url);
		return "success";
	}
}
