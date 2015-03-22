package com.changh.eschool.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.changh.eschool.entity.Teacher;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class TeacherLoginInterceptor extends AbstractInterceptor{
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> session = ActionContext.getContext().getSession(); 
		Teacher teacher = (Teacher)session.get("teacher");
		//user不为空,表示已经登录,不做拦截
		if(teacher!=null)
		{
			invocation.invoke();
			return "success";
		}else
		{
			////拦截请求,转到登录界面,绑请求地址,用于登录成功后返回相应的地址/////
			HttpServletRequest httpRequest = ServletActionContext.getRequest();
			//获取请求的地址 不带
			StringBuffer url = httpRequest.getRequestURL().append("?").append(httpRequest.getQueryString());
			//System.out.println(url);
			session.put("lastUrlForTch", url.toString());
			//////////////////////////////////////////
			return "fail";
		}
	}
}
