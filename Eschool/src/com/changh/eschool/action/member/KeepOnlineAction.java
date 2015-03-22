package com.changh.eschool.action.member;

import java.util.HashMap;

import javax.servlet.ServletContext;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;

public class KeepOnlineAction extends BaseAction{
	public String execute(){
		ServletContext application = httpRequest.getSession().getServletContext();
		HashMap<String,Long> courseOnline = (HashMap<String,Long>) application.getAttribute("courseOnline");
		Student stu = (Student) session.get("student");
		if(stu!=null){
			if(courseOnline!=null)
			{
				courseOnline.put(stu.getStuUsername(),System.currentTimeMillis());
				application.setAttribute("courseOnline", courseOnline);
			}
		}
		return null;
	}
}
