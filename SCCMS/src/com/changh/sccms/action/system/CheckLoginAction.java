package com.changh.sccms.action.system;

import com.changh.sccms.action.BaseAction;

public class CheckLoginAction extends BaseAction{
	public String execute()
	{
		//如果session里有管理员对象，表示已经登录，直接跳转到main页面
		if(session.get("admin")!=null)
		{
			return "success2";
		}
		return "success";
	}
}
