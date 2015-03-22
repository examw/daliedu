package com.changh.eschool.action.course;

import java.util.ArrayList;
import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Note;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.ClassDetailService;
/**
 * 笔记列表,记录最近前十条
 * @author Administrator
 *
 */
public class ListNodeAction extends BaseAction{
	private List<Note> list = new ArrayList<Note>();
	private int type;
	private int classId;
	private ClassDetailService classDetailService;
	
	public String execute(){
		Student stu = (Student) session.get("student");
		List<Note> listNote=classDetailService.findMyNote(classId, stu.getStuId(), type);
		for(int i=0;i<listNote.size();i++){
			if(i<10){
				list.add( listNote.get(i));
			}else{
				break;
			}
		}
		return "success";
	}
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}

	public List<Note> getList() {
		return list;
	}

	public void setList(List<Note> list) {
		this.list = list;
	}
	
}
