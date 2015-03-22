package com.changh.sccms.action.grade;

import com.changh.sccms.service.GradeService;

public class DeleteAction {
	private GradeService gradeService;
	private boolean ok;
	private int gradeId;
	
	public String execute(){
		gradeService.delete(gradeId);
		ok=true;
		return "success";
	}
	public GradeService getGradeService() {
		return gradeService;
	}
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
}
