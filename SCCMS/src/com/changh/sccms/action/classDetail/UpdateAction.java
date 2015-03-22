package com.changh.sccms.action.classDetail;

import com.changh.sccms.entity.ClassDetail;
import com.changh.sccms.service.ClassDetailService;

public class UpdateAction {
	private boolean ok =false;
	private ClassDetail classDetail;
	private ClassDetailService classDetailService;
	
	public String execute(){
		classDetail.setClassTime(classDetail.getClassMin()*1000*60+classDetail.getClassSec()*1000);
		classDetailService.update(classDetail);
		ok=true;
		return "success";
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public ClassDetail getClassDetail() {
		return classDetail;
	}
	public void setClassDetail(ClassDetail classDetail) {
		this.classDetail = classDetail;
	}
	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	
}
