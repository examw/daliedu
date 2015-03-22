package com.changh.sccms.action.user.student;

import com.changh.sccms.service.StudentService;

public class AddListenNumAction {
	private int recordId;
	private int num;
	private StudentService studentService;
	private boolean ok = false;
	
	public String execute() throws Exception{
		ok = studentService.updateListenNum(recordId,num);
		return "success";
	}

	public int getRecordId() {
		return recordId;
	}

	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}
}
