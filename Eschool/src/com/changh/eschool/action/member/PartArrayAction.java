package com.changh.eschool.action.member;

import java.util.ArrayList;
import java.util.List;

import com.changh.eschool.entity.Lecture;
import com.changh.eschool.entity.PartArray;
import com.changh.eschool.service.ClassDetailService;

/**
 * 输出json对象给课堂页面
 * @author Administrator
 *
 */
public class PartArrayAction {
	private int classId;
	private List<PartArray> partArray =new ArrayList<PartArray>();
	/**
	 * service 方法
	 */
	private ClassDetailService classDetailService;
	/**
	 *action
	 * @return
	 */
	public String execute(){
		List<Lecture> list = classDetailService.findLectureByClassId(classId);
		for(int i=0;i<list.size();i++){
			Lecture lect = list.get(i);
			PartArray pa = new PartArray();
			pa.setId(lect.getLectId());
			pa.setMarkTime(lect.getLectTimePoint()/1000);
			pa.setPartNum(i+1);
			pa.setTitle(lect.getLectTitle());
			partArray.add(pa);
			
		}
		return "success";
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public List<PartArray> getPartArray() {
		return partArray;
	}
	public void setPartArray(List<PartArray> partArray) {
		this.partArray = partArray;
	}
	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	
}
