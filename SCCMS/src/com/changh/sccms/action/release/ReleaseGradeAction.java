package com.changh.sccms.action.release;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.changh.sccms.entity.ClassPackage;
import com.changh.sccms.entity.ExamCategory;
import com.changh.sccms.entity.Grade1;
import com.changh.sccms.entity.PackageCategory;
import com.changh.sccms.service.ClassPackageService;
import com.changh.sccms.service.ExamCategoryService;
import com.changh.sccms.service.GradeService;
import com.changh.sccms.service.WebInfoService;
import com.changh.sccms.until.FreeMarkerUtil;
import com.changh.sccms.until.PropertiesUtil;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @Title: ReleaseGradeAction.java
 * @Package com.changh.sccms.action.release
 * @Description: TODO(发布栏目页)
 * @author Failymiss jiangwei3457@163.com
 * @date 2013-6-24 下午4:28:32
 * @version V1.0
 */
public class ReleaseGradeAction extends ActionSupport {
	private Integer examId;
	private ExamCategory exam;
	private List<PackageCategory> listPc;
	private List<List<Grade1>> e;
	private GradeService gradeService;
	private List<List<ClassPackage>> p;
	private ClassPackageService classPackageService;
	private ExamCategoryService examCategoryService;
	private WebInfoService webInfoService;
	private boolean ok = false;

	public String execute() {
		setE(gradeService.findByExamId(examId));
		p = (classPackageService.findClassPackageByExamId(examId));
		try {
			listPc = classPackageService.findPCbyExamId(examId);
			exam = examCategoryService.examLoad(examId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//获取相对路径
		String genFilePath = "/main/";
		HttpServletRequest request = ServletActionContext.getRequest();
		//从配置文件中获取前台在计算机中实际路径
		String rootPath = PropertiesUtil.getOptValue("rootPath");
		//生成文件的名字
		String htmlFileName = "exam" + examId + ".html";
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("list", e);
		root.put("package",p);
		root.put("exam", exam);
		root.put("listPc", listPc);
		root.put("examId", examId);	
		root.put("webInfo", webInfoService.findWebInfo());
		boolean flag = FreeMarkerUtil.getInstance().genHtmlFile(request,
				rootPath, "/cloumn.ftl", root, genFilePath, htmlFileName);
		ok=flag;
		return "success";

	}

	public Integer getExamId() {
		return examId;
	}

	public void setExamId(Integer examId) {
		this.examId = examId;
	}

	public List<List<ClassPackage>> getP() {
		return p;
	}

	public void setP(List<List<ClassPackage>> p) {
		this.p = p;
	}

	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}

	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}

	public GradeService getGradeService() {
		return gradeService;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public List<List<Grade1>> getE() {
		return e;
	}

	public void setE(List<List<Grade1>> e) {
		this.e = e;
	}

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}

	public ExamCategory getExam() {
		return exam;
	}

	public void setExam(ExamCategory exam) {
		this.exam = exam;
	}

	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}

	public List<PackageCategory> getListPc() {
		return listPc;
	}

	public void setListPc(List<PackageCategory> listPc) {
		this.listPc = listPc;
	}

	public void setWebInfoService(WebInfoService webInfoService) {
		this.webInfoService = webInfoService;
	}
	
}
