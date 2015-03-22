package com.changh.eschool.action.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;

public class CheckUserAction extends BaseAction{
	private Map<String,Object> map = new HashMap<String,Object>();
	private StudentService studentService;
	
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}


	public Map<String, Object> getMap() {
		return map;
	}


	public void setMap(Map<String, Object> map) {
		this.map = map;
	}


	public String execute(){
		Student stu = (Student) session.get("student");
		if(stu!=null){
			map.put("name", stu.getStuUsername());
		}else{
			Cookie[] cookies = httpRequest.getCookies();
			Cookie tokenCookie = null;
			if(cookies!=null)
			{
				for(Cookie c : cookies)
				{
					if("daliwx_token".equals(c.getName()))
					{
						tokenCookie = c;
						break;
					}
				}
			}
			if(tokenCookie != null){
				stu = studentService.findByToken(tokenCookie.getValue());
				if(stu!=null){
					session.put("student", stu);
					map.put("name", stu.getStuUsername());
				}
			}
		}
		map.put("ok", stu!=null);
		return "success";
	}
}
