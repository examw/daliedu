package com.changh.sccms.action.card;

import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.StudyCard;
import com.changh.sccms.service.StudyCardService;
import com.changh.sccms.until.GridDataUtil;

public class ListAction {
	private int num;//标识，num是生成时产生的数量
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	private Map<String,Object> cardList;
	
	public Map<String, Object> getCardList() {
		return cardList;
	}
	private StudyCardService studyCardService;

	public void setStudyCardService(StudyCardService studyCardService) {
		this.studyCardService = studyCardService;
	}
	public String execute()throws Exception
	{
		List<StudyCard> list =null;
		if(num!=0)
		{
			if(num<50){
			list = studyCardService.findTopN(num);
			cardList = GridDataUtil.gridMap(list, list.size());}
			else{
				list = studyCardService.findTopN(num, page, pagesize, sortname, sortorder);
				cardList=GridDataUtil.gridMap(list, num);
			}
		}else
		{
			cardList = studyCardService.findPage(page, pagesize, sortname, sortorder);
		}
		return "success";
	}
}
