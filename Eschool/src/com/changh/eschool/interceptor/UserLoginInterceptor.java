package com.changh.eschool.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.changh.eschool.entity.Student;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class UserLoginInterceptor extends AbstractInterceptor{
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> session = ActionContext.getContext().getSession(); 
		Student student = (Student)session.get("student");
		//user不为空,表示已经登录,不做拦截
		if(student!=null)
		{
			invocation.invoke();
			return "success";
		}else
		{
			////拦截请求,转到登录界面,绑请求地址,用于登录成功后返回相应的地址/////
			HttpServletRequest httpRequest = ServletActionContext.getRequest();
			 HttpServletResponse response = ServletActionContext.getResponse();
			 String query = httpRequest.getQueryString();
			 if (httpRequest.getHeader("x-requested-with") != null  
                     && httpRequest.getHeader("x-requested-with")  
                             .equalsIgnoreCase("XMLHttpRequest"))//如果是ajax请求响应头会有，x-requested-with；  
             {  
                 response.setHeader("sessionstatus", "timeout");//在响应头设置session状态  
                 session.put("lastUrlForUser",httpRequest.getParameter("url"));
                 return "false";  
             }  
			//获取请求的地址 不带
			StringBuffer url = httpRequest.getRequestURL();
			if(query!=null||"".equals(query))
			{
				url.append("?").append(query);
			}
			//System.out.println(url);
			session.put("lastUrlForUser", url.toString());
			//////////////////////////////////////////
			return "userLoginFail";
		}
	}
}
