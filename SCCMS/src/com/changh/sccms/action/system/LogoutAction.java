package com.changh.sccms.action.system;

import com.changh.sccms.action.BaseAction;

/**
 * µÇ³ö²Ù×÷£¬Çå¿Õsession
 * @author Administrator
 *
 */
public class LogoutAction extends BaseAction{
	public String execute()
	{
		session.clear();
		return "success";
	}
}
