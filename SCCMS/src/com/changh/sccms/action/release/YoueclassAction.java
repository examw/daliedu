package com.changh.sccms.action.release;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.ExamCategory;
import com.changh.sccms.entity.News;
import com.changh.sccms.service.ExamCategoryService;
import com.changh.sccms.service.NewsService;
import com.changh.sccms.until.FreeMarkerUtil;
import com.changh.sccms.until.PropertiesUtil;

public class YoueclassAction extends BaseAction{
	private boolean ok =false;
	private String rootPath = "";
	public String getRootPath() {
		return PropertiesUtil.getOptValue("rootPath");
	}

	public void setRootPath(String rootPath) {
		this.rootPath = rootPath;
	}
	private NewsService newsService;
	private ExamCategoryService examCategoryService;

	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}

	public String doRelease() throws Exception {
		Map<String, Object> root = new HashMap<String, Object>();
		//教务公告
		root.put("news", getNewsByCategory(1067,10));
		//报考指南
		root.put("baok", getNewsByCategory(1068,9));
		//建筑工程
		//root.put("jzgc", newsService.findAll(1001,0, 1, 8, "addTime", "desc"));
		//其他建筑工程子类
		List<ExamCategory> children = examCategoryService.findByPro("examPid", 1001);
		for(ExamCategory child:children){
			System.out.println(child.getExamEname());
			//root.put(child.getExamEname(), newsService.findAll(child.getExamId(),0, 1, 8, "addTime", "desc"));
		}
		root.put("examList", examCategoryService.findByPro("examPid", 0));
		boolean flag = FreeMarkerUtil.getInstance().genHtmlFile(httpRequest,this.getRootPath(),"/youeclass/index.ftl", root, "", "index.html");
		ok=flag;
		return "success";
	}
	
	
	public List<News> getNewsByCategory(int categoryId,int pagesize){
		List<News> list = new ArrayList<News>();
		HashMap<String,Object> map =new HashMap<String,Object>(); 
		map.put("newclass.id", categoryId);
		//list = newsService.findListNews(1,pagesize,"addTime","desc",map);
		return list;
	}
	
	
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	public String releaseClass(){
		List<ExamCategory> list = examCategoryService.findByPro("examPid", 0);
		for(ExamCategory ec:list){
			 Map<String, Object> root = new HashMap<String, Object>();
			 List<ExamCategory> children = examCategoryService.findByPro("examPid", ec.getExamId());
			 root.put("examList",children);
			 root.put("exam", ec);
			 FreeMarkerUtil.getInstance().genHtmlFile(httpRequest,this.getRootPath(),"/youeclass/category.ftl", root, ec.getExamEname(), "index.html");
			 for(ExamCategory child:children){
				 Map<String, Object> root1 = new HashMap<String, Object>();
				 root1.put("exam", child);
				 List<ExamCategory> subList = examCategoryService.findByPro("examPid", child.getExamId());
				 root1.put("examList", subList);
				 FreeMarkerUtil.getInstance().genHtmlFile(httpRequest,this.getRootPath(),"/youeclass/category-small.ftl", root1,ec.getExamEname()+"/"+child.getExamEname(), "index.html");
			 }
		}
		
		return "success";
	}
	//发布资讯,按考试类别  暂时前台不分省份
	public String releaseNews(int examId) throws Exception{
		ExamCategory exam = examCategoryService.examLoad(examId);
		//如果该考试类别下面包含子类
		if(exam.getExamChildrenNum()!=0){
			List<ExamCategory> children = exam.getChildren();
			
 		}else{
 			
 		}
		
		return "success";
	}
	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}
	
}
