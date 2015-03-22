package com.changh.sccms.action.lessonCard;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.LessonCard;
import com.changh.sccms.entity.StudyCard;
import com.changh.sccms.service.LessonCardService;
import com.changh.sccms.until.GridDataUtil;

public class SearchAction {
	private String str;
	private String searchName;
	private LessonCardService lessonCardService;
	private Map<String,Object> cardList;
	private int page;
	private int pagesize;
	private String sortname;
	private String sortorder;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
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
	
	public Map<String, Object> getCardList() {
		return cardList;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public void setLessonCardService(LessonCardService LessonCardService) {
		this.lessonCardService = LessonCardService;
	}
	public String execute()throws Exception
	{
		if(str.contains("-")){
			LessonCard card = lessonCardService.findById(Integer.parseInt(str.substring(str.indexOf("f")+1)));
			List<LessonCard> list = new ArrayList<LessonCard>();
			list.add(card);
			cardList = GridDataUtil.gridMap(list, list.size());
		}else{
			cardList = lessonCardService.findPageByParam(page, pagesize, sortname, sortorder, str);
		}
		return "success";
	}
}
