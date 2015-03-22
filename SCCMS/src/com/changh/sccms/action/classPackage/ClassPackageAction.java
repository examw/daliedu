package com.changh.sccms.action.classPackage;

import com.changh.sccms.action.BaseAction;

public class ClassPackageAction extends BaseAction{
	private Integer ptypeId;
	public String execute(){
		if(session.get("ptypeId")!=null){
			session.remove("ptypeId");
		}
		session.put("ptypeId",ptypeId);
		return "success";
	}
	public Integer getPtypeId() {
		return ptypeId;
	}
	public void setPtypeId(Integer ptypeId) {
		this.ptypeId = ptypeId;
	}
}
