package com.changh.sccms.action.release;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.changh.sccms.entity.ExamCategory1;
import com.changh.sccms.entity.WebInfo;
import com.changh.sccms.service.ExamCategoryService;
import com.changh.sccms.service.WebInfoService;
import com.changh.sccms.until.FreeMarkerUtil;
import com.changh.sccms.until.PropertiesUtil;
import com.opensymphony.xwork2.ActionSupport;



public class ReleaseAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private List<ExamCategory1> list;
	private boolean ok =false;

	public List<ExamCategory1> getList() {
		return list;
	}

	public void setList(List<ExamCategory1> list) {
		this.list = list;
	}
	private ExamCategoryService examCategoryService;
	
	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}
	private String url;

	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	public String doRelease() throws Exception {
		List<ExamCategory1> all=examCategoryService.findAll();
		list = examCategoryService.findByPid(0);
		for(ExamCategory1 ec:list)
		{
			List<ExamCategory1> l=new ArrayList<ExamCategory1>();
			for(ExamCategory1 c:all)
			{
				if(c.getExamPid().equals(ec.getExamId()))
				{
					l.add(c);
				}
			}
			ec.setChildren(l);
		}
		
		String genFilePath = "/main/";
		HttpServletRequest request = ServletActionContext.getRequest();
		String rootPath= PropertiesUtil.getOptValue("rootPath");
		File file = new File(rootPath + genFilePath);
		String htmlFileName = "exam.html";
		Map<String, List> root = new HashMap<String, List>();
		root.put("list", list);
		boolean flag = FreeMarkerUtil.getInstance().genHtmlFile(request,rootPath,
				"/exam.ftl", root, genFilePath, htmlFileName);
		setUrl(request.getContextPath() + genFilePath + htmlFileName);
		ok=flag;
		return SUCCESS;
	}
	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}
	
}
