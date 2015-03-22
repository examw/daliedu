package com.changh.eschool.action.member;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.changh.eschool.entity.Student;
import com.changh.eschool.until.FileUtil;
import com.changh.eschool.until.TimeFormat;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;




public class UploadAction extends ActionSupport{
	private File mf;//客户端上传的临时文件对象
	private String mfFileName;//mf+FileName 原文件名
	private String mfContentType;//获取文件MIME 类型
	private int imgWidth;
	private int imgHeight;
	public String execute(){
		//将mf复制到工程的upload目录下
		//System.out.println(mf.getPath());
		//System.out.println(mfFileName);
		//System.out.println(mfContentType);
		Student stu = (Student)ActionContext.getContext().getSession().get("student");
		//文件重命名
		//if(mfFileName.matches("[0-9]*[\\s|\\S]*[\u4E00-\u9FA5]+[\\s|\\S]*"))
		//{
			String[] arr = mfFileName.split("[.]");
			mfFileName = stu.getStuUsername()+TimeFormat.format(new Date())+"."+arr[arr.length-1];
		//}
		//目标位置的物理路径
		ServletContext application = 
			ServletActionContext.getServletContext();
		String realPath = application.getRealPath("upload"+File.separatorChar+"temp");
		new File(realPath).mkdirs();
		String filePath = realPath+File.separatorChar+mfFileName;
		System.out.println(filePath);
		try {//复制文件
			File tempFile = new File(filePath);
			//文件大小超过2M
			FileUtil.copy(mf, tempFile);
			FileInputStream fis = new FileInputStream(tempFile);
			BufferedImage bufferedImg = ImageIO.read(fis);
			imgWidth = bufferedImg.getWidth();
			imgHeight = bufferedImg.getHeight();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	public String getMfContentType() {
		return mfContentType;
	}

	public void setMfContentType(String mfContentType) {
		this.mfContentType = mfContentType;
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

	public int getImgWidth() {
		return imgWidth;
	}

	public int getImgHeight() {
		return imgHeight;
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
