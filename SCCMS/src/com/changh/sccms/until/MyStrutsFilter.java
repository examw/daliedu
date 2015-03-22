package com.changh.sccms.until;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

public class MyStrutsFilter extends StrutsPrepareAndExecuteFilter {
	public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) throws IOException, ServletException {  
        HttpServletRequest request = (HttpServletRequest) req;  
        //不过滤的url  
        String url = request.getRequestURI();  
        //System.out.println(url);  
    if ("/SCCMS/cms/ueditor/jsp/imageUp.jsp".equals(url)  //这里的路径应该能看懂吧，就是让你需要的这些文件不再被过滤掉
        	||"/SCCMS/cms/ueditor/jsp/fileUp.jsp".equals(url)
        ) {  
            //System.out.println("使用自定义的过滤器");  
            chain.doFilter(req, res);  
        }
        else{  
            super.doFilter(req, res, chain);  
        }  
    }  
}