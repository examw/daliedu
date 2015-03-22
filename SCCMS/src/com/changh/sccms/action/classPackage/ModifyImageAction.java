package com.changh.sccms.action.classPackage;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.changh.sccms.service.ClassPackageService;
import com.changh.sccms.until.PropertiesUtil;
import com.opensymphony.xwork2.ActionSupport;
/**
* @Title: UploadAction.java
* @Package com.changh.sccms.action.classPackage
* @Description: TODO(修改套餐图片)
* @author Failymiss jiangwei3457@163.com  
* @date 2013-6-20 下午1:40:09
* @version V1.0
 */
public class ModifyImageAction extends ActionSupport  implements SessionAware  {
	private File fileInput;
	private String fileInputFileName;
	private String savePath;
	private Map<String,Object> session;
	private ClassPackageService classPackageService;

	public String execute() throws Exception {
		String rootPath = PropertiesUtil.getOptValue("rootPath");
		String newFileName = "";// 新文件名
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		Integer id = (Integer) session.get("ptypeId");
		String ptypeId="";
		if(id==null){
			return "error";
		}else{
			ptypeId = id.toString();
			session.remove("ptypeId");
		}
		String savePath = rootPath + this.getSavePath();
		newFileName = "package_"+ptypeId+".gif";
		String sPath =savePath + "\\" + newFileName;
		deleteFile(sPath);
		this.getFileInput().renameTo(new File(sPath));
		String s1 = "<font color='green'>文件上传成功</font>";
		response.getWriter().print(s1);
		return null; // 这里不需要页面转向，所以返回空就可以了
	}
	
    /** 
     * 删除单个文件 
     * @param   sPath    被删除文件的文件名 
     * @return 单个文件删除成功返回true，否则返回false 
     */  
    public boolean deleteFile(String sPath) {  
        boolean flag = false;  
       File file = new File(sPath);  
        // 路径为文件且不为空则进行删除  
        if (file.isFile() && file.exists()) {  
            file.delete();  
            flag = true;  
        }  
        return flag;  
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
		return this.savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}

	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
