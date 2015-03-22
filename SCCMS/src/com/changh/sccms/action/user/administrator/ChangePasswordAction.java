package com.changh.sccms.action.user.administrator;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.service.AdministratorService;

public class ChangePasswordAction extends BaseAction{
	private String oldPwd;
	private String newPwd;
	private boolean ok;
	private AdministratorService administratorService;
	
	public void setAdministratorService(AdministratorService administratorService) {
		this.administratorService = administratorService;
	}

	public boolean isOk() {
		return ok;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String  execute()throws Exception
	{
		//获取session中的admin对象
		Administrator admin = (Administrator) session.get("admin");
		if(admin==null)
		{
			return "fail";
		}
		//原密码不对不能改
		if(!admin.getAdmPassword().equals(oldPwd))
		{
			ok=false;
		}else
		{
			admin.setAdmPassword(newPwd);
			administratorService.updateAdministrator(admin);
			ok=true;
		}
		return "success";
	}
}
