package com.changh.sccms.action.classDetail;

import com.changh.sccms.service.ClassDetailService;

public class DeleteAction {
	//intput
	private String classId;
	//output
	private boolean ok=false;
	//injection
	private ClassDetailService classDetailService;
	
	public String execute(){
		classDetailService.delete(classId);
		ok=true;
		return "success";
	}

	public String getClassId() {
		return classId;
	}



	public void setClassId(String classId) {
		this.classId = classId;
	}



	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}

	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}
}
