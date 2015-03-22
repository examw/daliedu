package com.changh.sccms.action.classPackage;

import java.util.Date;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.ClassPackage;
import com.changh.sccms.entity.Deal;
import com.changh.sccms.service.ClassPackageService;

public class ModifyClassPackageAction extends BaseAction{
	private String pkgIncludeCid;
	private ClassPackage classPackage;
	private String dealId;
	private Date dealLastDate;

	private int ptypeId;
	private boolean ok=false;
	private String dealName;
	
	private String dealContent;
	private String id;
	private ClassPackageService classPackageService;
	
	public String execute(){
		Administrator a = (Administrator) session.get("admin");
		if(a==null){
			return "error";
		}
		if(dealName.equals("")&&dealContent.equals("")&&!id.equals("")){
			if(!dealId.equals("")){
				try {
					classPackageService.delet(classPackageService.findByDealId(Integer.parseInt(dealId)));
				} catch (Exception e) {
					ok = false;
					return "success";
				}	
			}	
			classPackage.setDealId(null);
		}else if(dealName.equals("")&&dealContent.equals("")&&id.equals("")&&!dealId.equals("")){
			classPackage.setDealId(Integer.parseInt(dealId));
		}else{
			if(dealId.equals("")){
				Deal d = new Deal();
				d.setDealLastDate(dealLastDate);
				d.setDealContent(dealContent);
				d.setDealId(classPackageService.findDealId());
				classPackage.setDealId(d.getDealId());
				d.setDealPkgId(classPackage.getPkgId());
				d.setDealName(dealName);
				classPackageService.addDeal(d);
			}else{
				Deal d = new Deal();
				d.setDealLastDate(dealLastDate);
				d.setDealContent(dealContent);
				d.setDealId(Integer.parseInt(dealId));
				classPackage.setDealId(Integer.parseInt(dealId));
				d.setDealPkgId(classPackage.getPkgId());
				d.setDealName(dealName);
				d.setId(Integer.parseInt(id));
				classPackageService.update(d);
			}	
			
		}
		classPackage.setAdmId(a.getAdmId());
		classPackage.setPkgIncludeCid(pkgIncludeCid);
		classPackage = classPackageService.findByPkgIncludeCid(classPackage);
		classPackage.setPtypeId(ptypeId);
		classPackageService.modifyClassPackage(classPackage);
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
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDealId() {
		return dealId;
	}
	public void setDealId(String dealId) {
		this.dealId = dealId;
	}
	public Date getDealLastDate() {
		return dealLastDate;
	}
	public void setDealLastDate(Date dealLastDate) {
		this.dealLastDate = dealLastDate;
	}
}
