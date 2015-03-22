package com.changh.sccms.action.complain;

import com.changh.sccms.entity.AskOrComplain;
import com.changh.sccms.service.AskOrComplainService;

public class LoadAction {
	private int acId;
	private AskOrComplain ac;
	private AskOrComplainService askOrComplainService;
	public int getAcId() {
		return acId;
	}
	public void setAcId(int acId) {
		this.acId = acId;
	}
	public AskOrComplain getAc() {
		return ac;
	}
	public void setAc(AskOrComplain ac) {
		this.ac = ac;
	}
	public void setAskOrComplainService(AskOrComplainService askOrComplainService) {
		this.askOrComplainService = askOrComplainService;
	}
	public  String execute()throws Exception
	{
		ac = askOrComplainService.findById(acId);
		return "success";
	}
}
