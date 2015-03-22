package com.changh.sccms.action.system;

import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.Log;
import com.changh.sccms.service.AdministratorService;
import com.changh.sccms.until.BrowserUtils;
import com.changh.sccms.until.LogUtil;

public class LoginAction extends BaseAction{
	//input
	private String username;
	private String password;
	private boolean rememberMe;
	private Log log = new Log();
	//output
	private boolean result=false;
	public boolean isResult() {
		return result;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	//injection
	private AdministratorService administratorService;
	
	public void setAdministratorService(AdministratorService administratorService) {
		this.administratorService = administratorService;
	}
	public String execute() throws Exception
	{
		
		Administrator admin = administratorService.getAdministrator(username);
		String Agent = httpRequest.getHeader("User-Agent");
		StringTokenizer st = new StringTokenizer(Agent,";");
		st.nextToken();
		//得到用户的浏览器名
		log.setBroswer(BrowserUtils.checkBrowse(httpRequest));
		log.setIp(getIpAddr(httpRequest));
		log.setOperatetime(new Date());
		//验证登录
		String md5 = "n8nghm1234jwx1w26w";
		if(password!=null && password.contains(md5))
			password = password.substring(md5.length(),password.length());
		//用户名和密码正确并且帐号没有被禁用
		if(admin!=null&&admin.getAdmUsername().equals(username)&&admin.getAdmPassword().equals(password)&&admin.getAdmStatus()==1)
		{
			//登录成功
			result = true;
			log.setAdmUsername(username);
			log.setLogconten(username+"登录成功");
			log.setAdmId(admin.getAdmId());
			log.setOperatetype(1);	
			//更新  登录ip，登录次数，登录时间
			session.put("lastLoginTime", admin.getAdmLastLoginTime());//记录上一次登陆时间
			admin.setAdmLastLoginTime(new Date());
			admin.setAdmLastLoginIp(httpRequest.getRemoteAddr());//更新ip
			//更新次数
			Integer num=admin.getAdmLoginNumbers();
			if(num==null)
				admin.setAdmLoginNumbers(1);
			else
				admin.setAdmLoginNumbers(admin.getAdmLoginNumbers()+1);
			//更新到数据库
			administratorService.update(admin);
			//绑定到session
			LogUtil.logger.warn(admin.getAdmUsername()+"登陆了！");
			session.put("admin", admin);
			//加cookie
			Cookie cookie = new Cookie("sccms_user", username);
			//设置cookie生存时间
			cookie.setMaxAge(60*60*24*30); //单位是秒，时间为一个月
			//设置路径
			cookie.setPath("/");
			ServletActionContext.getResponse().addCookie(cookie);
			//模拟token
			if(rememberMe){
				Cookie token = new Cookie("sccms_token", md5+password);
				//设置cookie生存时间
				token.setMaxAge(60*60*24*30); //单位是秒，时间为一个月
				//设置路径
				token.setPath("/");
				ServletActionContext.getResponse().addCookie(token);
			}else{
				Cookie token = new Cookie("sccms_token", md5+password);
				//设置cookie生存时间
				token.setMaxAge(0); //单位是秒，时间为一个月,删除cookie
				//设置路径
				token.setPath("/");
				ServletActionContext.getResponse().addCookie(token);
			}
		}else{
			log.setAdmUsername("<span style='color:red'>"+username+"</span>");
			log.setOperatetype(0);	
			log.setLogconten(username+"登录失败");
			log.setAdmPassword(password);
		}
		administratorService.saveLog(log);
		return "success";
	}

	public String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	public boolean isRememberMe() {
		return rememberMe;
	}
	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}
}
