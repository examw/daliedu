package com.changh.eschool.action.question;

import com.changh.eschool.action.BaseAction;

public class TeacherLogoutAciton extends BaseAction{
	public String execute()throws Exception
	{
		session.remove("teacher");;
		return "success";
	}
}
