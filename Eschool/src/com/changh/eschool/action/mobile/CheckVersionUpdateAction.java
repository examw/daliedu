package com.changh.eschool.action.mobile;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.changh.eschool.action.BaseAction;

/**
 * 检查apk的版本信息
 * @author Administrator
 *
 */
public class CheckVersionUpdateAction  extends BaseAction{
	private String apkVersion;
	private String apkSize;
	private String apkPath;
	private String content;   
	private int appType;	//app类型
	private Map<String,Object> result = new HashMap<String,Object>();	//返回的结果
	private String oldVersion;//旧的版本号
	public String execute() throws UnsupportedEncodingException
	{
		Properties ppt = new Properties();
		try {
		    ppt.load(CheckVersionUpdateAction.class .getResourceAsStream("/mobileAppVersion.properties")); 
		    if(appType==1)	//android平台下
		    {
		    	apkVersion = ppt.getProperty("apkVersion");       
		    	apkSize = ppt.getProperty("apkSize");       
		    	apkPath = ppt.getProperty("apkPath"); 
		    	content = ppt.getProperty("content");
		    	System.out.println(apkPath);
		    }
		    else
		    {
		    	result.put("S", 0);
		    	return "success";
		    }
		}catch (Exception e) {       
		    e.printStackTrace();  
		}  
		if(oldVersion==null||oldVersion.equals(""))
		{
			result.put("S", 0);//没有更新
		}
		else if(oldVersion.equals(apkVersion))
		{
			result.put("S", 0);//没有更新
		}else
		{
			result.put("S", 1);
			result.put("version", apkVersion);
			result.put("apkSize", apkSize);
			result.put("url", URLEncoder.encode(apkPath,"UTF-8"));
			result.put("Content", content);
		}
		return "success";
	}
	public int getAppType() {
		return appType;
	}
	public void setAppType(int appType) {
		this.appType = appType;
	}
	public String getOldVersion() {
		return oldVersion;
	}
	public void setOldVersion(String oldVersion) {
		this.oldVersion = oldVersion;
	}
	public Map<String, Object> getResult() {
		return result;
	}
	
}
