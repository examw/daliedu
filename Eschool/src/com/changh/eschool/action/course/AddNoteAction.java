package com.changh.eschool.action.course;

import java.util.Date;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Note;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.ClassDetailService;

/**
 * addNote
 * @author wei
 *
 */
public class AddNoteAction extends BaseAction {
	//input
	private Note note;
	//output
	private Boolean ok = false;
	//service
	private ClassDetailService classDetailService;
	/**
	 * action
	 * @return
	 */
	public String execute(){
		Student stu = (Student) session.get("student");
		note.setStuId(stu.getStuId());
		note.setNoteAddTime(new Date());
		if(note.getNoteId()==null ||note.getNoteId()==0){
			note.setNoteId(classDetailService.getNotePK());
		}
		classDetailService.addOrUpdateNote(note);
		ok=true;
		return "success";
	}
	
	public Note getNote() {
		return note;
	}

	public void setNote(Note note) {
		this.note = note;
	}

	public Boolean getOk() {
		return ok;
	}

	public void setOk(Boolean ok) {
		this.ok = ok;
	}

	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}

	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}

}
