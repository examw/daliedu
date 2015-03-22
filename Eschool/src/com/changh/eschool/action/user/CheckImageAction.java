package com.changh.eschool.action.user;

import com.changh.eschool.action.BaseAction;

public class CheckImageAction extends BaseAction{
	//验证码字符
	private String code;
	//是否正确
	private boolean flag;
	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	public boolean isFlag()
	{
		return flag;
	}
	public void setFlag(boolean flag)
	{
		this.flag = flag;
	}
	public String execute()
	{
		//获取session上绑定的验证码字符
		String realCode =(String)session.get("code");
		if(realCode.equalsIgnoreCase(code))
		{
			//验证码正确
			flag = true;
		}else
		{
			//验证码错误
			flag=false;
		}
		return "success";
	}
}
