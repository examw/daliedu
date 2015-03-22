package com.changh.sccms.action.release;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.changh.sccms.entity.Grade;
import com.changh.sccms.entity.Grade1;
import com.changh.sccms.entity.Teacher;
import com.changh.sccms.service.CommentService;
import com.changh.sccms.service.GradeService;
import com.changh.sccms.service.TeacherService;
import com.changh.sccms.until.FreeMarkerUtil;
import com.changh.sccms.until.LGDataUtil;
import com.changh.sccms.until.PropertiesUtil;

/**
* @Title: ReleaseTeacherAction.java
* @Package com.changh.sccms.action.release
* @Description: TODO(发布老师页面)
* @author Failymiss jiangwei3457@163.com  
* @date 2013-6-8 下午3:26:05
* @version V1.0
 */
public class ReleaseTeacherAction {
	private Integer tchId;
	private Teacher teacher;
	private int counts=0;
	private int score =0;
	private List<Grade1> gradeList;
	private Map<String, Object> data;
	
	private  GradeService gradeService;
	private TeacherService teacherService;
	private CommentService commentService;
	/**
	* @Title: execute
	* @Description: TODO(antion)
	* @return    设定文件
	 */
	public String execute(){
			setGradeList(gradeService.findByTchId(tchId));
			teacher = teacherService.findTeacherByTchId(tchId);
			counts = commentService.findTotal(tchId);
			score = commentService.findSorce(tchId);
			String genFilePath = "/main/teacher/";
			HttpServletRequest request = ServletActionContext.getRequest();
			String rootPath= PropertiesUtil.getOptValue("rootPath");
			/*File file = new File(rootPath + genFilePath);*/
			String htmlFileName = "teacher"+tchId+".html";
			Map<String, Object> root = new HashMap<String, Object>();
			root.put("gradeList", gradeList);
			root.put("teacher", teacher);
			root.put("counts", counts);
			root.put("score", score);
			root.put("tchId", tchId);
			boolean flag = FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,
					"/teacher.ftl", root, genFilePath, htmlFileName);
			data = LGDataUtil.gridMap("", false, null);
			return "success";
	}
	
	public Integer getTchId() {
		return tchId;
	}

	public void setTchId(Integer tchId) {
		this.tchId = tchId;
	}

	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}

	public List<Grade1> getGradeList() {
		return gradeList;
	}
	public void setGradeList(List<Grade1> gradeList) {
		this.gradeList = gradeList;
	}
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
}
