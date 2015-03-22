package com.changh.sccms.action.paper;

import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.changh.sccms.service.ExamPaperService;
import com.opensymphony.xwork2.ActionSupport;

public class AddQuestionFromFileAction extends ActionSupport{
	private File mf;//客户端上传的临时文件对象
	private String mfFileName;//mf+FileName 原文件名
	private int ruleId;	//大题id
	private int paperId;//试卷id
	private int questType;//题型
	private int model;	//添加模式
	private int startNo;//起始位置
	private ExamPaperService examPaperService;
	
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	public String execute(){
		try {
			//解析文件，并且生成考题
			if(examPaperService.saveBatchFromFile(mf,ruleId,paperId,questType,startNo,model))
			return "success";
			return "fail";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	public String getMfFileName() {
		return mfFileName;
	}

	public void setMfFileName(String mfFileName) {
		this.mfFileName = mfFileName;
	}
	public File getMf() {
		return mf;
	}

	public void setMf(File mf) {
		this.mf = mf;
	}
	
	public int getRuleId() {
		return ruleId;
	}
	public void setRuleId(int ruleId) {
		this.ruleId = ruleId;
	}
	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	public int getQuestType() {
		return questType;
	}
	public void setQuestType(int questType) {
		this.questType = questType;
	}
	
	public int getModel() {
		return model;
	}
	public void setModel(int model) {
		this.model = model;
	}
	
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public void addActionError(String anErrorMessage) {    
		  
		//这里要先判断一下，是我们要替换的错误，才处理    
		  
		   if (anErrorMessage.startsWith("the request was rejected because its size")) {    
		  
		     Matcher m = Pattern.compile("//d+").matcher(anErrorMessage);    
		  
		    String s1 = "";    
		  
		    if (m.find())   s1 = m.group();    
		  
		    String s2 = "";    
		  
		    if (m.find())   s2 = m.group();    
		  
		    //偷梁换柱，将信息替换掉    
		     super.addActionError("你上传的文件大小（" + s1 + "）超过允许的大小（" + s2 + "）");    
		    //也可以改为在Field级别的错误  
		    // super.addFieldError("file","你上传的文件大小（" + s1 + "）超过允许的大小（" + s2 + "）");    
		  
		  } else {//否则按原来的方法处理   
		  
		     super.addActionError(anErrorMessage);    
		}    
		  
		}   
}
