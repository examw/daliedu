package com.changh.sccms.action.classPackage;

import java.util.Date;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.ClassPackage;
import com.changh.sccms.entity.Deal;
import com.changh.sccms.service.ClassPackageService;

public class AddPackageAction extends BaseAction {
	private String pkgIncludeCid;
	private ClassPackage classPackage;
	private int ptypeId;
	private boolean ok=false;
	private ClassPackageService classPackageService;
	private String dealName;
	private String dealContent;
	private Date dealLastDate;
	
	public String execute(){

		if(!dealName.equals("")||!dealName.equals("")){
			Deal d = new Deal();
			int pkgId = classPackageService.getClassPackageId();
			int dealId =classPackageService.findDealId();
			d.setDealLastDate(dealLastDate);
			d.setDealContent(dealContent);
			d.setDealId(dealId);
			d.setDealName(dealName);
			d.setDealPkgId(pkgId);
			classPackageService.addDeal(d);
			classPackage.setDealId(dealId);
		}
		Administrator admin = (Administrator) session.get("admin");
		classPackage.setAdmId(admin.getAdmId());
		classPackage.setPkgAddTime(new Date());
		classPackage.setPkgIncludeCid(pkgIncludeCid);
		classPackage = classPackageService.findByPkgIncludeCid(classPackage);
		classPackage.setPtypeId(ptypeId);
		classPackage.setPkgId(classPackageService.getClassPackageId());
		classPackageService.save(classPackage);
		ok=true;
		return "success";
	}
	public String getPkgIncludeCid() {
		return pkgIncludeCid;
	}
	public void setPkgIncludeCid(String pkgIncludeCid) {
		this.pkgIncludeCid = pkgIncludeCid;
	}
	public ClassPackage getClassPackage() {
		return classPackage;
	}
	public void setClassPackage(ClassPackage classPackage) {
		this.classPackage = classPackage;
	}
	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public int getPtypeId() {
		return ptypeId;
	}
	public void setPtypeId(int ptypeId) {
		this.ptypeId = ptypeId;
	}
	public String getDealName() {
		return dealName;
	}
	public void setDealName(String dealName) {
		this.dealName = dealName;
	}
	public String getDealContent() {
		return dealContent;
	}
	public void setDealContent(String dealContent) {
		this.dealContent = dealContent;
	}
	public Date getDealLastDate() {
		return dealLastDate;
	}
	public void setDealLastDate(Date dealLastDate) {
		this.dealLastDate = dealLastDate;
	}
	
}
