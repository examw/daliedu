package com.changh.sccms.action.classPackage;

import java.util.List;
import java.util.Map;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.service.ClassPackageService;
import com.changh.sccms.until.GridDataUtil;

/**
 * 2014.03.15 添加方法 查找examid下所有的套餐
 * @author Administrator
 *
 */
public class ClassPackageListAction extends BaseAction{
	private int examId;
	private Map packageMap;
	private ClassPackageService classPackageService;
	
	public String execute(){
		List list =classPackageService.findPackagesByExamId(examId);
		packageMap = GridDataUtil.gridMap(list, list.size());
		return "success";
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	
	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	public Map getPackageMap() {
		return packageMap;
	}
	
}
