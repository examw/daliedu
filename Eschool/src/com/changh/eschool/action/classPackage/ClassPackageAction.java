package com.changh.eschool.action.classPackage;

import java.util.List;
import java.util.Map;

import com.changh.eschool.entity.ClassPackage;
import com.changh.eschool.service.ClassPackageService;
import com.changh.eschool.until.DataUtil;

public class ClassPackageAction {
	private Integer ptypeId;
	private Map<String,Object>  data;
	private ClassPackageService classPackageService;
	
	public String execute(){
		List<ClassPackage> list = classPackageService.findClassPackageNoTeacher(ptypeId);
		if(list!=null&&list.size()!=0){
			data = DataUtil.gridMap("", false, list);
		}else{
			data= DataUtil.gridMap("ÔÝÎÞÌ×²Í,¾´ÇëÆÚ´ý",true,null);
		}
		return "success";
	}
	
	public Integer getPtypeId() {
		return ptypeId;
	}
	public void setPtypeId(Integer ptypeId) {
		this.ptypeId = ptypeId;
	}
	
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
}
