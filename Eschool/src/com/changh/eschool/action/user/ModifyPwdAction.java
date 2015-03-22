package com.changh.eschool.action.user;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;
import com.changh.eschool.until.DegistUtil;

public class ModifyPwdAction extends BaseAction{
	private String oldPwd;
	private String newPwd;
	private boolean ok;
	private StudentService studentService;
	public boolean isOk() {
		return ok;
	}
	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	
	public String getOldPwd() {
		return oldPwd;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public String execute()throws Exception
	{
		Student student = (Student)session.get("student");
		if(student==null)
		{
			ok=false;
			return "notLogin";
		}
		if(!student.getStuPassword().equals(DegistUtil.md5Digest(oldPwd)))
		{
			ok = false;
		}else
		{
			Student stu = (Student) student.clone();
			stu.setStuPassword(DegistUtil.md5Digest(newPwd));
			studentService.updateStudent(stu);
			ok=true;
		}
		return "success";
	}
	
}
