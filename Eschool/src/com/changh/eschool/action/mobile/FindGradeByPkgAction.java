package com.changh.eschool.action.mobile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.service.GradeService;

public class FindGradeByPkgAction  extends BaseAction{
	private int pkgId;
	private Map<String,Object> map;
	private GradeService gradeService;
	public String execute()
	{
		map = new HashMap<String,Object>();
		try
		{
			List<Grade> list = gradeService.findByPackageId(pkgId);
			map.put("ok", 1);
			map.put("data", list);
		}catch(Exception e)
		{
			map.put("ok", -1);
		}
		return "success";
	}
	public int getPkgId() {
		return pkgId;
	}
	public void setPkgId(int pkgId) {
		this.pkgId = pkgId;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	
}
