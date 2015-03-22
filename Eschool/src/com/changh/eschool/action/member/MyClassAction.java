package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ClassDetail;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.Student;
import com.changh.eschool.entity.StudyRecord;
import com.changh.eschool.service.ClassDetailService;
import com.changh.eschool.service.GradeService;
import com.changh.eschool.service.StudyRecordService;

public class MyClassAction extends BaseAction {
	private Integer gradeId;
	private String gradeName;
	private List<ClassDetail> classDetail;
	private ClassDetailService classDetailService;
	private GradeService gradeService;
	private int page = 1;
	private int pagesize = 10;
	private int total;
	private  StudyRecord studyRecord;
	private StudyRecordService studyRecordService;
	private Integer gradeTime;
	
	public StudyRecord getStudyRecord() {
		return studyRecord;
	}
	public void setStudyRecord(StudyRecord studyRecord) {
		this.studyRecord = studyRecord;
	}
	public StudyRecordService getStudyRecordService() {
		return studyRecordService;
	}
	public void setStudyRecordService(StudyRecordService studyRecordService) {
		this.studyRecordService = studyRecordService;
	}
	public String execute(){
		Student stu = (Student) session.get("student");
		if(stu==null){
			return "error";
		}
		studyRecord = studyRecordService.findByGreadId(gradeId,stu.getStuId());
		classDetail= classDetailService.listClassDetail(gradeId,page,pagesize);
		total = classDetailService.findTotal(gradeId);
		Grade grade = gradeService.findById(gradeId);
		dataUrl = grade.getDataDownloadUrl();
		gradeName =grade.getExamCategory().getExamName()+"-"+grade.getGradeCategory().getGtypeName();
		setGradeTime(grade.getGradeTime());
		return "success";
	}
	public Integer getGradeId() {
		return gradeId;
	}
	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}
	
	public List<ClassDetail> getClassDetail() {
		return classDetail;
	}
	public void setClassDetail(List<ClassDetail> classDetail) {
		this.classDetail = classDetail;
	}
	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public GradeService getGradeService() {
		return gradeService;
	}
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Integer getGradeTime() {
		return gradeTime;
	}
	public void setGradeTime(Integer gradeTime) {
		this.gradeTime = gradeTime;
	}
	//2014.03.18增加一个参数
	private Integer i;
	public Integer getI() {
		return i;
	}
	public void setI(Integer i) {
		this.i = i;
	}
	private String dataUrl;

	public String getDataUrl() {
		return dataUrl;
	}
	public void setDataUrl(String dataUrl) {
		this.dataUrl = dataUrl;
	}
}
