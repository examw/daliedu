package com.changh.eschool.action.course;

import com.changh.eschool.service.ClassDetailService;

public class DeleteNoteAction {
	private int noteId;
	private Boolean ok=false;
	private ClassDetailService classDetailService;
	
	public String execute(){
		classDetailService.deleteNode(noteId);
		ok=true;
		return "success";
	}
	public int getNoteId() {
		return noteId;
	}
	public void setNoteId(int noteId) {
		this.noteId = noteId;
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
