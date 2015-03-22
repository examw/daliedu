package com.changh.sccms.action.classDetail;

import java.util.Date;

import com.changh.sccms.service.ClassDetailService;

public class UpdateOpenTimeAction {
	private String ids;
	private Date time;
	private boolean ok;
	private ClassDetailService classDetailService;
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	public boolean isOk() {
		return ok;
	}
	public String execute()
	{
		ok = this.classDetailService.updateOpenTime(ids,time);
		return "success";
	}
}
