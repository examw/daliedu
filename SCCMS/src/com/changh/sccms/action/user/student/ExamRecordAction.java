package com.changh.sccms.action.user.student;

import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.ExamRecord;
import com.changh.sccms.service.StudentService;
import com.changh.sccms.until.GridDataUtil;

public class ExamRecordAction {
	private Integer stuId;
	private Map examRecord;
	private Integer page;
	private Integer pagesize;
	private String sortname;
	private String sortorder;
	private StudentService studentService;
	
	public String execute(){
		List<ExamRecord> list = studentService.findExamRecord(stuId, page, pagesize, sortname, sortorder);
		setExamRecord(GridDataUtil.gridMap(list, studentService.getExamRecordTotal(stuId)));
		return "success";
	}
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPagesize() {
		return pagesize;
	}

	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}

	public String getSortname() {
		return sortname;
	}

	public void setSortname(String sortname) {
		this.sortname = sortname;
	}

	public String getSortorder() {
		return sortorder;
	}

	public void setSortorder(String sortorder) {
		this.sortorder = sortorder;
	}
		
	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public Map getExamRecord() {
		return examRecord;
	}
	public void setExamRecord(Map examRecord) {
		this.examRecord = examRecord;
	}
	
}
