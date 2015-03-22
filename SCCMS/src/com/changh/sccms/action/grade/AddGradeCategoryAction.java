package com.changh.sccms.action.grade;

import com.changh.sccms.entity.GradeCategory;
import com.changh.sccms.service.GradeService;

public class AddGradeCategoryAction {
	private boolean ok=false;
	private GradeService  gradeService;
	private String gtypeName;
	
	public String execute(){
		GradeCategory gc = new GradeCategory();
		gc.setGtypeName(gtypeName);
		gc.setGtypeId(gradeService.getGCId());
		ok=gradeService.saveGradeCategory(gc);
		return "success";
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public String getGtypeName() {
		return gtypeName;
	}
	public void setGtypeName(String gtypeName) {
		this.gtypeName = gtypeName;
	}
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	
	
}
