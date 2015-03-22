package com.changh.sccms.action.classDetail;

import com.changh.sccms.service.ClassDetailService;

public class FindNumberAction {
	private int id;
	private ClassDetailService classDetailService;
	private int data;
	
	public String execute() throws Exception{
		data = classDetailService.findNumByGid(id);
		return "success";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getData() {
		return data;
	}

	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	
}
