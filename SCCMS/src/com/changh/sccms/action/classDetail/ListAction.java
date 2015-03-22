package com.changh.sccms.action.classDetail;

import java.util.List;
import java.util.Map;

import com.changh.sccms.service.ClassDetailService;
import com.changh.sccms.until.GridDataUtil;

public class ListAction {
	//injection
	private ClassDetailService classDetailService;
	//output
	private Map classDetailMap;
	//input
	private int gid;

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	
	public String execute(){
		List list =classDetailService.listClassDetail(gid);
		classDetailMap=GridDataUtil.gridMap(list, list.size());
		return "success";
	}

	public Map getClassDetailMap() {
		return classDetailMap;
	}

	public void setClassDetailMap(Map classDetailMap) {
		this.classDetailMap = classDetailMap;
	}
}
