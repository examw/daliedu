package com.changh.eschool.action.member;

import java.io.InputStream;
import java.net.URLEncoder;

import org.apache.struts2.ServletActionContext;

import com.changh.eschool.entity.Grade;
import com.changh.eschool.service.GradeService;
import com.opensymphony.xwork2.ActionSupport;

public class DataDownloadAction extends ActionSupport{
	private Integer gradeId;
	private GradeService gradeService;
	private String contentType;
	private String fileName;
	private InputStream inputStream;
	
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public Integer getGradeId() {
		return gradeId;
	}
	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	public String execute()throws Exception{
		Grade grade = this.gradeService.findById(gradeId);
		if(grade!=null&&grade.getDataDownloadUrl()!=null){
			String url = grade.getDataDownloadUrl();
			contentType = getContentTypeName(url.substring(url.lastIndexOf(".")));
			fileName = url.substring(url.lastIndexOf("/")+1);
			String agent = ServletActionContext.getRequest().getHeader("USER-AGENT");
		    if(agent != null && agent.indexOf("MSIE") != -1) {
		        fileName = URLEncoder.encode(fileName, "UTF8");
		        fileName = fileName.replaceAll("\\+", "%20");
		    } else {
		        fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
		    }
			inputStream = ServletActionContext.getServletContext().getResourceAsStream(grade.getDataDownloadUrl()); 
			return "success";
		}
		else{
			ServletActionContext.getResponse().getWriter().print("<font color='fail'>ÎÄ¼þÏÂÔØÊ§°Ü</font>");
			return null;
		}
		
	}
	private String getContentTypeName(String suffix){
		if(suffix.equalsIgnoreCase(".doc")||suffix.equalsIgnoreCase(".docx")){
			return "application/msword";
		}
		if(suffix.equalsIgnoreCase(".ppt")){
			return "application/vnd.ms-powerpoint";
		}
		if(suffix.equalsIgnoreCase(".rar")){
			return "application/octet-stream";
		}
		if(suffix.equalsIgnoreCase(".zip")){
			return "application/x-zip-compressed";
		}
		return "application/octet-stream";
	}
}
