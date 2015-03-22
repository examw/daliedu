package com.changh.eschool.action.mobile;

import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.AppAdvice;
import com.changh.eschool.service.AppAdviceService;

public class AddAdviceAction extends BaseAction{
	private int stuId;
	private String username;
	private String content;
	private int appType;
	private AppAdviceService appAdviceService;
	private Map<String,Object> result;
	public String execute()
	{
		result = new HashMap<String,Object>();
		try{
			AppAdvice advice = new AppAdvice();
			advice.setAdviceAddTime(new Date());
			advice.setAdviceContent(content);
			advice.setAppType(appType);
			advice.setUsername(username);
			advice.setStuId(stuId);
			appAdviceService.save(advice);
			result.put("ok", 1);
			result.put("msg","提交成功,感谢您的宝贵意见");
		}catch(Exception e)
		{
			e.printStackTrace();
			result.put("ok", -1);
			result.put("msg", "系统错误");
		}
		return "success";
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = Integer.valueOf(stuId);
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = URLDecoder.decode(content);
	}
	public int getAppType() {
		return appType;
	}
	public void setAppType(String appType) {
		this.appType = Integer.valueOf(appType);
	}
	public void setAppAdviceService(AppAdviceService appAdviceService) {
		this.appAdviceService = appAdviceService;
	}
	public Map<String,Object>  getResult() {
		return result;
	}
	
}
