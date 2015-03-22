package com.changh.sccms.action.lecture;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

    public class UploadAction extends ActionSupport {
    	private File fileInput;
    	private String  fileInputFileName;
    	private String savePath;

    	public String execute() throws Exception {

    		String newFileName = "";// 新文件名
    		String nowTime =null;
    		HttpServletResponse response = ServletActionContext.getResponse();
    		response.setCharacterEncoding("utf-8");
    		nowTime = new SimpleDateFormat("yyyymmddHHmmss").format(new Date());// 当前时间
    		String savePath = this.getSavePath();
    		newFileName = nowTime+this.getFileInputFileName();
    		this.getFileInput().renameTo(new File(savePath + "\\" + newFileName));
    		response.getWriter().print("<font color='green'>文件上传成功</font>");
    		return null; // 这里不需要页面转向，所以返回空就可以了
    	}

    	
    	public File getFileInput() {
    		return fileInput;
    	}

    	public void setFileInput(File fileInput) {
    		this.fileInput = fileInput;
    	}

    	public String getFileInputFileName() {
    		return fileInputFileName;
    	}

    	public void setFileInputFileName(String fileInputFileName) {
    		this.fileInputFileName = fileInputFileName;
    	}

    	public String getSavePath() {
    		return ServletActionContext.getRequest().getRealPath(this.savePath);
    	}

    	public void setSavePath(String savePath) {
    		this.savePath = savePath;
    	}

    }
	