package com.changh.sccms.action.release;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.changh.sccms.entity.Grade;
import com.changh.sccms.entity.Lecture;
import com.changh.sccms.service.ClassDetailService;
import com.changh.sccms.service.LectureService;
import com.changh.sccms.until.FreeMarkerUtil;
import com.changh.sccms.until.PropertiesUtil;

/**
 * @Title: ReleaseLectureAction.java
 * @Package com.changh.sccms.action.release
 * @Description: TODO(发布讲义)
 * @author Failymiss jiangwei3457@163.com
 * @date 2013-6-3 下午4:37:46
 * @version V1.0
 */
public class ReleaseLectureAction {
	private Integer classId;
	private List<Lecture> lectureList;
	private Integer gradeId;
	private Integer examId;
	private ClassDetailService classDetailService;
	private LectureService lectureService;
	private boolean ok=false;
	/**
	 * action 方法
	 * @return
	 */
	public String execute(){
		lectureList = lectureService.findByClassId(classId);
		Grade g= classDetailService.findGradeByClassId(classId);
		gradeId= g.getGradeId();
		examId = g.getExamCategory().getExamPid();
		String genFilePath = "/memberCenter/lecture/";
		HttpServletRequest request = ServletActionContext.getRequest();
		String rootPath= PropertiesUtil.getOptValue("rootPath");
		/*File file = new File(rootPath + genFilePath);*/
		String htmlFileName = "lecture"+classId+".html";
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("list", lectureList);
		root.put("examId", examId);
		root.put("gradeId", gradeId);
		root.put("classId", classId);
		boolean flag = FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,
				"/lecture.ftl", root, genFilePath, htmlFileName);	
		ok=flag;
		return "success";
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public List<Lecture> getLectureList() {
		return lectureList;
	}
	public void setLectureList(List<Lecture> lectureList) {
		this.lectureList = lectureList;
	}
	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	public Integer getGradeId() {
		return gradeId;
	}
	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}
	public Integer getExamId() {
		return examId;
	}
	public void setExamId(Integer examId) {
		this.examId = examId;
	}
	public LectureService getLectureService() {
		return lectureService;
	}
	public void setLectureService(LectureService lectureService) {
		this.lectureService = lectureService;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
}
