package com.changh.sccms.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 过滤外部直接访问jsp页面
 * @author Administrator
 *
 */
public class MyJspFilter implements Filter{
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		String url = httpRequest.getRequestURI();
		//过滤， 此处欠妥当！！！！！！！！！！！！！！！！！！！！！！！！！！！
		//拦截了所有请求，登录了都可以访问
		if(url.indexOf("/upload/")==-1&&url.indexOf("/images/")==-1&&url.indexOf("/js/")==-1&&url.indexOf("/css/")==-1&&httpRequest.getSession().getAttribute("admin")==null){//管理员没有登录或者被挤出去了
				if(url.indexOf("main1.jsp")!=-1)	//登录页面还是在登录页面其他页面跳转到提示页面
				{
					httpResponse.sendRedirect("/SCCMS/system/index");
				}else if(url.indexOf("index")!=-1||url.indexOf("main")!=-1||url.indexOf("error.jsp")!=-1||url.indexOf("login")!=-1)
				{
					chain.doFilter(request, response);
				}else
				{
					//System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
					httpResponse.sendRedirect("/SCCMS/cms/error.jsp");	
				}
//				httpRequest.getRequestDispatcher("/system/index").forward(httpRequest, response);
			
		}else{
			//调用后续的过滤器。
			chain.doFilter(request, response);
		}
	}
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
}
