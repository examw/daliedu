package com.changh.eschool.action.mobile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ClassDetail;
import com.changh.eschool.service.ClassDetailService;

public class FindFreeClassAction  extends BaseAction{
	private int gid;
	private ClassDetailService classDetailService;
	private Map<String,Object> map;
	public String execute()
	{
		map = new HashMap<String,Object>();
		try
		{
			List<ClassDetail> list = classDetailService.findFreeClassByGid(gid);
			map.put("ok", 1);
			map.put("data", list);
		}catch(Exception e)
		{
			map.put("ok", -1);
		}
		return "success";
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	
}
