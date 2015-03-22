package com.changh.eschool.action.user;

import java.util.HashMap;
import java.util.Map;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.until.LogUtil;

/**
 * 天翼短信验证码接收
 * @author Administrator
 *
 */
public class GetMsgCodeAction extends BaseAction{
	private Map<String,Integer> data;
	private String rand_code;	//验证码
	private String identifier;	
	public String execute() throws Exception
	{
		data = new HashMap<String,Integer>(); 
		//验证码获取成功
		if(rand_code!=null)
		{
			//加入session等待验证
			session.put("rand_code", rand_code);//验证码
			session.put("code_addtime", System.currentTimeMillis());//验证码生成时间
			data.put("res_code", 0); //响应
		}else
		{
			data.put("res_code", 1);
		}
		return "success";
	}
	public String getRand_code() {
		return rand_code;
	}
	public void setRand_code(String rand_code) {
		this.rand_code = rand_code;
	}
	public String getIdentifier() {
		return identifier;
	}
	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}
	public Map<String, Integer> getData() {
		return data;
	}
	
}
