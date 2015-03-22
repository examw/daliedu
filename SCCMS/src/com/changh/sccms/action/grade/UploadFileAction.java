package com.changh.sccms.action.grade;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.changh.sccms.service.GradeService;
import com.changh.sccms.until.PropertiesUtil;

public class UploadFileAction {
	private File fileInput;
	private String  fileInputFileName;
	private String savePath;
	private String oldDataUrl;
	private Integer uploadType;//1:修改并删除,2:只修改,3:删除
	private int gradeId;
	private GradeService gradeService;
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}


	public String execute() throws Exception {
		if(oldDataUrl == null||oldDataUrl.trim().equals(""))
		{
			opt(0,"文件上传成功");
		}else{
			opt(uploadType,"文件修改成功");
		}
		return null;
	}
	private void opt(Integer flag,String msg) throws Exception{
		String newFileName = "";// 新文件名
		String nowTime =null;
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		String savePath = this.getSavePath();
		String frontName = PropertiesUtil.getOptValue("frontName");
		savePath = savePath.replace(ServletActionContext.getRequest().getContextPath().substring(1), frontName);
		if(Integer.valueOf(3).equals(flag)){	//仅删除
			oldDataUrl = oldDataUrl.substring(oldDataUrl.lastIndexOf("/")+1);
			new File(savePath + "\\" + oldDataUrl).delete();
			gradeService.update(gradeId,null);
			response.getWriter().print("<font color='green'>文件删除成功</font>");
			return;
		}
		if(Integer.valueOf(1).equals(flag)){
			oldDataUrl = oldDataUrl.substring(oldDataUrl.lastIndexOf("/")+1);
			new File(savePath + "\\" + oldDataUrl).delete();
		}
		nowTime = new SimpleDateFormat("yyyymmddHHmmss").format(new Date());// 当前时间
				newFileName = nowTime+this.getFileInputFileName();
		FileUtils.copyFile(this.getFileInput(), new File(savePath + "\\" + newFileName));
		gradeService.update(gradeId,this.savePath + "/" + newFileName);
		response.getWriter().print("<font color='green'>"+msg+"</font>");
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


	public int getGradeId() {
		return gradeId;
	}


	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}


	public String getOldDataUrl() {
		return oldDataUrl;
	}


	public void setOldDataUrl(String oldDataUrl) {
		this.oldDataUrl = oldDataUrl;
	}


	public Integer getUploadType() {
		return uploadType;
	}


	public void setUploadType(Integer uploadType) {
		this.uploadType = uploadType;
	}
	
}	
