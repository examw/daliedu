package com.changh.sccms.action.classDetail;

import java.util.Map;

import com.changh.sccms.entity.ClassDetail;
import com.changh.sccms.service.ClassDetailService;
import com.changh.sccms.until.GridDataUtil;

public class CheckAction {
	private Integer classId;
	private Map classDetailMap;
	private ClassDetailService classDetailService;
	
	public String execute(){
		ClassDetail classDetail=classDetailService.findByClassId(classId);
		classDetailMap=GridDataUtil.gridMap(classDetail, 1);
		return "success";
	}
	
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Map getClassDetailMap() {
		return classDetailMap;
	}

	public void setClassDetailMap(Map classDetailMap) {
		this.classDetailMap = classDetailMap;
	}
}
