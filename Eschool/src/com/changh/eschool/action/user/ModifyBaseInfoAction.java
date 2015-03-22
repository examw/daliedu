package com.changh.eschool.action.user;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;

public class ModifyBaseInfoAction extends BaseAction {
	private Student student;
	private StudentService studentService;
	private boolean ok;

	public boolean isOk() {
		return ok;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String execute() throws Exception {
		Student realStudent = (Student) session.get("student");
		if (realStudent == null) {
			ok = false;
			return "success";
		}
		Student copy = change(student, (Student)realStudent.clone());
		// 完善信息的4个必填项 姓名，性别，手机，email
		// 4个非必填项 所在地，座机，通讯地址，邮编
		if (student.getStuName().equals(realStudent.getStuName())
				&& student.getStuSex().equals(realStudent.getStuSex())
				&& student.getStuMobile().equals(realStudent.getStuMobile())
				&& student.getStuEmail().equals(realStudent.getStuEmail())) {
			if ((student.getStuAddr() == null && realStudent.getStuAddr() != null)
					|| (student.getStuAddr() != null && student.getStuAddr()
							.equals(realStudent.getStuAddr()))) {
				if ((student.getStuMobile() == null && realStudent
						.getStuMobile() != null)
						|| (student.getStuMobile() != null && student
								.getStuMobile().equals(
										realStudent.getStuMobile()))) {
					if ((student.getStuPAddr() == null && realStudent
							.getStuPAddr() != null)
							|| (student.getStuPAddr() != null && student
									.getStuPAddr().equals(
											realStudent.getStuPAddr()))) {
						if ((student.getStuPostcal() == null && realStudent
								.getStuPostcal() != null)
								|| (student.getStuPostcal() != null && student
										.getStuPostcal().equals(
												realStudent.getStuPostcal()))) {
							// 不更新
							ok = true;
						} else {
							studentService.updateStudent(copy);
							session.put("student", copy);
							ok = true;
						}
					} else {
						studentService.updateStudent(copy);
						session.put("student", copy);
						ok = true;
					}
				} else {
					studentService.updateStudent(copy);
					session.put("student", copy);
					ok = true;
				}
			} else {
				studentService.updateStudent(copy);
				session.put("student", copy);
				ok = true;
			}
		} else {
			studentService.updateStudent(change(student, realStudent));
			session.put("student", copy);
			ok = true;
		}
		return "success";
	}

	private Student change(Student stu, Student realStu) {
		realStu.setStuAddr(stu.getStuAddr());
		realStu.setStuPAddr(stu.getStuPAddr());
		realStu.setStuPhone(stu.getStuPhone());
		realStu.setStuPostcal(stu.getStuPostcal());
		realStu.setStuName(stu.getStuName());
		realStu.setStuMobile(stu.getStuMobile());
		realStu.setStuEmail(stu.getStuEmail());
		realStu.setStuSex(stu.getStuSex());
		return realStu;
	}
}
