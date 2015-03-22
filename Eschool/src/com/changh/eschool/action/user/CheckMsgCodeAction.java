package com.changh.eschool.action.user;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.until.LogUtil;

public class CheckMsgCodeAction extends BaseAction{
	private String msgCode;
	private boolean ok;
	public String getMsgCode() {
		return msgCode;
	}

	public void setMsgCode(String msgCode) {
		this.msgCode = msgCode;
	}
	public String execute()
	{
		String code = (String) session.get("rand_code");
		Long addtime = (Long) session.get("code_addtime");
		addtime = addtime==null?0:addtime;
		long checkTime = System.currentTimeMillis();
		if(checkTime - addtime > 3*60*1000) //2分钟有效期
		{
			ok = false;
		}else if(msgCode.equals(code))
		{
			ok = true;
		}else
		{
			ok = false;
		}
		return "success";
	}

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}
	
}
