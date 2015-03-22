package com.changh.sccms.action.system;


import java.util.ArrayList;
import java.util.List;

import com.changh.sccms.entity.StudentInfo;

public class ChartAction{
	private List<StudentInfo> list = new ArrayList<StudentInfo>();
	public String execute(){
		StudentInfo stuident1 = new StudentInfo();
		stuident1.setName("会计");
		List<Integer> allgrade = new ArrayList<Integer>();
		allgrade.add(90);
		allgrade.add(95);
		allgrade.add(80);
		allgrade.add(85);
		stuident1.setData(allgrade);
		list.add(stuident1);
		StudentInfo stuident2 = new StudentInfo();
		stuident2.setName("建筑");
		List<Integer> allgrade2 = new ArrayList<Integer>();
		allgrade2.add(60);
		allgrade2.add(95);
		allgrade2.add(70);
		allgrade2.add(50);
		stuident2.setData(allgrade2);
		list.add(stuident2);

		StudentInfo stuident3 = new StudentInfo();
		stuident3.setName("医师");
		List<Integer> allgrade3 = new ArrayList<Integer>();
		allgrade3.add(68);
		allgrade3.add(93);
		allgrade3.add(78);
		allgrade3.add(59);
		stuident3.setData(allgrade3);
		list.add(stuident3);
		/*for(int i=0;i<3;i++){
			StudentInfo stu = new StudentInfo();
			stuident1.setName("会计");
			List<Integer> allgrade = new ArrayList<Integer>();
			allgrade.add(90);
			allgrade.add(95);
			allgrade.add(80);
			allgrade.add(85);
			stuident1.setData(allgrade);
			list.add(stuident1);
		}*/
	/*	//JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		//JSONArray gradeData = new JSONArray();
		JSONArray Data;
		JSONObject member = null;

		member = new JSONObject();
		Iterator<StudentInfo> it = students.iterator();
		while (it.hasNext()) {
			StudentInfo info = it.next();
			member.put("name", info.getName());

			Data = new JSONArray();
			List<Integer> grades = info.getGrade();
			Iterator<Integer> iterator = grades.iterator();
			while (iterator.hasNext()) {
				Data.add(iterator.next());	
			}
			member.put("data", Data);
			array.add(member);

		}
		str=array.toString();
        System.out.println(str);
		//json.put("series", array);
		//System.out.println(json.toString());
		*/
		return "success";
	}
	public List<StudentInfo> getList() {
		return list;
	}
	public void setList(List<StudentInfo> list) {
		this.list = list;
	}
	
}