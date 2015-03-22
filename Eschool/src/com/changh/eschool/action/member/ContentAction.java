
package com.changh.eschool.action.member;

import java.util.Iterator;
import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ClassDetail;
import com.changh.eschool.service.ClassDetailService;
import com.changh.eschool.service.GradeService;
import com.changh.eschool.until.Constant;

public class ContentAction extends BaseAction {
	private Integer gradeId;
	private List<ClassDetail> classDetail;
	private ClassDetailService classDetailService;
	private Integer payflag;
	private GradeService gradeService;

	public String execute(){
		if(payflag==0){
			classDetail= classDetailService.findClassDetailByGid(gradeId, Constant.FREE);
		}else{
			classDetail= classDetailService.listClassDetail(gradeId,0,0);
		}
		return "success";
	}
	public Integer getGradeId() {
		return gradeId;
	}
	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}	
	public List<ClassDetail> getClassDetail() {
		return classDetail;
	}
	public void setClassDetail(List<ClassDetail> classDetail) {
		this.classDetail = classDetail;
	}
	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	public GradeService getGradeService() {
		return gradeService;
	}
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	public Integer getPayflag() {
		return payflag;
	}
	public void setPayflag(Integer payflag) {
		this.payflag = payflag;
	}

}
