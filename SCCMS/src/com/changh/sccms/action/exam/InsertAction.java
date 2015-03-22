package com.changh.sccms.action.exam;

import com.changh.sccms.service.ExamCategoryService;
import com.changh.sccms.until.PropertiesUtil;
/**
* @Title: InsertAction.java
* @Package com.changh.sccms.action.exam
* @Description: TODO(添加考试类比)
* @author Failymiss jiangwei3457@163.com  
* @date 2013-6-13 上午11:50:54
* @version V1.0
 */
public class InsertAction {
	//input
	private String examName;
	private int id;
	private String examUrl;
	private String examDescription;
	public String getExamUrl() {
		return examUrl;
	}

	public void setExamUrl(String examUrl) {
		this.examUrl = examUrl;
	}

	public String getExamDescription() {
		return examDescription;
	}

	public void setExamDescription(String examDescription) {
		this.examDescription = examDescription;
	}

	//output
	private Boolean ok= false;
	
	private ExamCategoryService examCategoryService;

	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}

	public String execute() throws Exception{
		if(examUrl==null||examUrl.equals("")){
			examUrl=PropertiesUtil.getOptValue("defaultUrl");
		}
		if(examDescription==null||examDescription.equals("")){
			examDescription="暂无描述";
		}
		examCategoryService.saveExam(id,examName,examUrl,examDescription);
		ok=true;
		return "success";
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}


	public Boolean getOk() {
		return ok;
	}

	public void setOk(Boolean ok) {
		this.ok = ok;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
