package com.changh.sccms.action.grade;

import java.util.List;
import java.util.Map;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Grade;
import com.changh.sccms.service.GradeService;
import com.changh.sccms.until.GridDataUtil;

public class GradeListAction extends BaseAction{
	private Integer examPid;
	private Map gradeMap;
	private List<Grade> gradeList;
	private GradeService gradeService;
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	
	public String execute() throws Exception{
		gradeList = gradeService.findbyExamPid(examPid);
		gradeMap =GridDataUtil.gridMap(gradeList, gradeList.size());
		return "success";
	}

	public Integer getExamPid() {
		return examPid;
	}

	public void setExamPid(Integer examPid) {
		this.examPid = examPid;
	}

	public Map getGradeMap() {
		return gradeMap;
	}
}
