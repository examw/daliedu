package com.changh.sccms.action.news;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.LGData;
import com.changh.sccms.entity.NewClass;
import com.changh.sccms.entity.News;
import com.changh.sccms.service.NewsService;
import com.changh.sccms.until.Constant;
import com.changh.sccms.until.GridDataUtil;
import com.changh.sccms.until.MyBeanUtils;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @author failymiss
 *
 */
public class NewsAction extends BaseAction  implements ModelDriven<News> {
	//private List<News> list = new ArrayList<News>();
	private Integer id;
	private Integer examId=0 ;
	private Integer provinceId=0;
	private Integer newClassId=0;
	private News news = new News();
	private LGData j = new LGData();
	
	
	//分页
	private Map<String,Object> gridMap;
	private Integer page=1;
	private Integer pagesize=10;
	private String sortname="addTime";
	private String sortorder="desc";
	
	//注入service
	private NewsService newsService;
	
	public Integer getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public String execute() throws Exception{
//		List<News> list =	newsService.findAll(examId, provinceId, page, pagesize, sortname, sortorder);
//		gridMap = GridDataUtil.gridMap(list, newsService.getTotal(newClassId, provinceId, examId));
		return "success";
	}
	public String saveNews() throws Exception{
//		if(news.getNewId()!=null){
//			News news1 = newsService.findById(news.getNewId());
//			MyBeanUtils.copyBeanNotNull2Bean(news, news1);
//			newsService.saveOrupdate(news1);
//			j.setIsError(false);
//			j.setMessage("修改成功");
//		}else{
//			if(null==news.getProvince().getProvinceId()){
//				j.setIsError(true);
//				j.setMessage("请先选择地区");
//				return "success";
//			}
//			if(null==news.getExam().getExamId()){
//				j.setIsError(true);
//				j.setMessage("请先选择考试类别");
//				return "success";
//			}
//			System.out.println(news.getNewContent());
//			news.setAddTime(new Date());
//			news.setAditor(((Administrator)httpRequest.getSession().getAttribute("admin")).getAdmUsername());
//			newsService.saveOrupdate(news);
//			j.setIsError(false);
//			j.setMessage("添加成功");
//		}
	
		return "success";
	}
	
	public String deleteNews() throws Exception{
		newsService.delete(id);
		j.setIsError(false);
		j.setMessage("添加成功");
		return "success";
	}
	public String getNew() throws Exception{
		news = newsService.findById(id);
		return "success";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public Map<String,Object> getGridMap() {
		return gridMap;
	}
	public void setGridMap(Map<String,Object> gridMap) {
		this.gridMap = gridMap;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPagesize() {
		return pagesize;
	}
	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}
	public String getSortname() {
		return sortname;
	}
	public void setSortname(String sortname) {
		this.sortname = sortname;
	}
	public String getSortorder() {
		return sortorder;
	}
	public void setSortorder(String sortorder) {
		this.sortorder = sortorder;
	}
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	public Integer getExamId() {
		return examId;
	}

	public void setExamId(Integer examId) {
		this.examId = examId;
	}

	@Override
	public News getModel() {
		// TODO Auto-generated method stub
		return news;
	}

	public LGData getJ() {
		return j;
	}

	public void setJ(LGData j) {
		this.j = j;
	}

	public Integer getNewClassId() {
		return newClassId;
	}

	public void setNewClassId(Integer newClassId) {
		this.newClassId = newClassId;
	}
	
}
