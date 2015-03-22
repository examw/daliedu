package com.changh.sccms.action.classDetail;

import java.util.Date;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.ClassDetail;
import com.changh.sccms.service.ClassDetailService;
import com.changh.sccms.service.GradeService;

public class AddAction extends BaseAction {
	//intput
	private ClassDetail classDetail;
	private Integer gradeId;
	private Integer tchId;
	
	

	public void setTchId(Integer tchId) {
		this.tchId = tchId;
	}

	//output
	private boolean ok=false;
	//injection
	private ClassDetailService classDetailService;
	private GradeService gradeService;
	
	
	public String execute(){
		Administrator admin = (Administrator) session.get("admin");
		if(admin==null){
			return "error";
		}else{
			classDetail.setAdmId(admin.getAdmId());
			classDetail.setClassId(classDetailService.getClassId());
			classDetail.setTchId(tchId);
			classDetail.setClassAddTime(new Date());
			classDetail.setClassOrderId(2);
			classDetail.setGradeId(gradeId);
			classDetail.setClassTime(classDetail.getClassMin()*1000*60+classDetail.getClassSec()*1000);
			classDetailService.save(classDetail);
			ok=true;
			return "success";
		}
		
	}
	
	public ClassDetail getClassDetail() {
		return classDetail;
	}
	public void setClassDetail(ClassDetail classDetail) {
		this.classDetail = classDetail;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public Integer getGradeId() {
		System.out.println(gradeId);
		return gradeId;
	}

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

	public int getTchId() {
		return tchId;
	}

	public void setTchId(int tchId) {
		this.tchId = tchId;
	}
	


}
