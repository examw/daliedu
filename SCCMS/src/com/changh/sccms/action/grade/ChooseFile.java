package com.changh.sccms.action.grade;

import com.changh.sccms.entity.Grade;
import com.changh.sccms.service.GradeService;
import com.changh.sccms.until.PropertiesUtil;

public class ChooseFile {
	private int gradeId;
	private GradeService gradeService;
	private String dataFileUrl;
	
	public String getDataFileUrl() {
		return dataFileUrl;
	}

	public void setDataFileUrl(String dataFileUrl) {
		this.dataFileUrl = dataFileUrl;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	
	public String execute(){
		Grade grade = gradeService.findById(gradeId);
		if(grade !=null&&grade.getDataDownloadUrl()!=null&&!grade.getDataDownloadUrl().trim().isEmpty() )
			dataFileUrl = PropertiesUtil.getOptValue("frontName")+grade.getDataDownloadUrl();
		return "success";
	}
}
