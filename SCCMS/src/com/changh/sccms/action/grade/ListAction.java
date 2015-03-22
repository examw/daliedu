package com.changh.sccms.action.grade;

import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.Grade;
import com.changh.sccms.service.GradeService;
import com.changh.sccms.until.GridDataUtil;

public class ListAction {
	private Map gradeMap;
	private List<Grade> gradeList;
	private int id;
	private int type;//2013.04.20 fw利用这个类
	private GradeService gradeService;
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	
	public String execute() throws Exception{
		gradeList = gradeService.gradeList(id);
		gradeMap =GridDataUtil.gridMap(gradeList, gradeList.size());
		if(type==1)
		{
			return "success1";
		}
		return "success";
	}

	

	public Map getGradeMap() {
		return gradeMap;
	}

	public void setGradeMap(Map gradeMap) {
		this.gradeMap = gradeMap;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public List<Grade> getGradeList() {
		return gradeList;
	}
	
}
