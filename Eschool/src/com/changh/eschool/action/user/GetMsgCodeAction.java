package com.changh.eschool.action.user;

import java.util.HashMap;
import java.util.Map;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.until.LogUtil;

/**
 * ���������֤�����
 * @author Administrator
 *
 */
public class GetMsgCodeAction extends BaseAction{
	private Map<String,Integer> data;
	private String rand_code;	//��֤��
	private String identifier;	
	public String execute() throws Exception
	{
		data = new HashMap<String,Integer>(); 
		//��֤���ȡ�ɹ�
		if(rand_code!=null)
		{
			//����session�ȴ���֤
			session.put("rand_code", rand_code);//��֤��
			session.put("code_addtime", System.currentTimeMillis());//��֤������ʱ��
			data.put("res_code", 0); //��Ӧ
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
