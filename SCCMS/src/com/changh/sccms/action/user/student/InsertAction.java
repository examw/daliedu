package com.changh.sccms.action.user.student;

import com.changh.sccms.dao.StudentDAO;
import com.changh.sccms.dao.impl.HibernateStuDAO;
import com.changh.sccms.entity.Student;


public class InsertAction {
	private Student stu;

	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	public String execute() throws Exception{
			StudentDAO stuDao = new HibernateStuDAO();
			stuDao.insert(stu);
			return "success";
	}
}
