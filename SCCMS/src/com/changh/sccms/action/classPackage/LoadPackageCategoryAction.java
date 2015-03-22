package com.changh.sccms.action.classPackage;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.PackageCategory;
import com.changh.sccms.service.ClassPackageService;
/**
* @Title: LoadPackageCategoryAction.java
* @Package com.changh.sccms.action.classPackage
* @Description: TODO(修改套餐类别)
* @author Failymiss jiangwei3457@163.com  
* @date 2013-6-20 下午2:27:24
* @version V1.0
 */
public class LoadPackageCategoryAction extends BaseAction{
	private Integer ptypeId;
	private PackageCategory packageCategory;
	private ClassPackageService classPackageService;
	
	
	public String execute(){
		packageCategory = classPackageService.loadCategory(ptypeId);
		session.put("ptypeId", ptypeId);
		return "success";
	}
	public Integer getPtypeId() {
		return ptypeId;
	}
	public void setPtypeId(Integer ptypeId) {
		this.ptypeId = ptypeId;
	}
	public PackageCategory getPackageCategory() {
		return packageCategory;
	}
	public void setPackageCategory(PackageCategory packageCategory) {
		this.packageCategory = packageCategory;
	}
	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	
	
}
