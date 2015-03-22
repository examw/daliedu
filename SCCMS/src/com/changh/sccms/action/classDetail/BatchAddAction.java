package com.changh.sccms.action.classDetail;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.ClassDetail;
import com.changh.sccms.service.ClassDetailService;
import com.changh.sccms.service.GradeService;
import com.changh.sccms.until.LGDataUtil;
/**
* @Title: BatchAddAction.java
* @Package com.changh.sccms.action.classDetail
* @Description: TODO(批量添加课节)
* @author Failymiss jiangwei3457@163.com  
* @date 2013-6-18 下午1:57:56
* @version V1.0
 */
public class BatchAddAction extends BaseAction {
	private List<ClassDetail> list;
	private ClassDetailService classDetailService;
	private boolean data=false;
	
	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	public String execute(){
		Administrator admin = (Administrator) session.get("admin");
		if(admin==null){
			return "error";
		}
		Date date = new Date();
		for(ClassDetail classDetail :list){
			classDetail.setAdmId(admin.getAdmId());
			classDetail.setClassId(classDetailService.getClassId());
			classDetail.setClassAddTime(date);
			classDetail.setClassOrderId(0);
			classDetail.setClassTime(classDetail.getClassMin()*1000*60+classDetail.getClassSec()*1000);
			classDetailService.save(classDetail);
		}
		setData(true);
		return "success";
	}
	public List<ClassDetail> getList() {
		return list;
	}
	public void setList(List<ClassDetail> list) {
		this.list = list;
	}
	public boolean isData() {
		return data;
	}
	public void setData(boolean data) {
		this.data = data;
	}
	
}
