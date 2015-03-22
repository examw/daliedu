package com.changh.sccms.action.card;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.StudyCard;
import com.changh.sccms.service.StudyCardService;
import com.changh.sccms.until.GridDataUtil;

public class SearchAction {
	private String str;
	private String searchName;
	private StudyCardService studyCardService;
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
	public void setStudyCardService(StudyCardService studyCardService) {
		this.studyCardService = studyCardService;
	}
	public String execute()throws Exception
	{
		if(str.contains("-")){
			StudyCard card = studyCardService.findById(Integer.parseInt(str.substring(str.indexOf("-")+1)));
			List<StudyCard> list = new ArrayList<StudyCard>();
			list.add(card);
			cardList = GridDataUtil.gridMap(list, list.size());
		}else{
			cardList = studyCardService.findPageByParam(page, pagesize, sortname, sortorder, str);
		}
		return "success";
	}
}
