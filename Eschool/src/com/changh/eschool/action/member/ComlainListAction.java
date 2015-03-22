package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.AskOrComplain;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.AskOrComplainService;

public class ComlainListAction extends BaseAction{
	private int page=1;
	private int pagesize=10;
	private String sortname=" ac.acAddTime";
	private String sortorder=" desc ";
	private AskOrComplainService askOrComplainService;
	private int total;
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	private List<AskOrComplain> list;
	
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
	public List<AskOrComplain> getList() {
		return list;
	}
	public void setAskOrComplainService(AskOrComplainService askOrComplainService) {
		this.askOrComplainService = askOrComplainService;
	}
	public String execute()throws Exception
	{
		 Student student =(Student)session.get("student");
		 String criteria = " where ac.acType = 1 and ac.stuId = "+student.getStuId();
		 list = askOrComplainService.findPageByCriteria(page, pagesize, sortname, sortorder, criteria);
		 total = (int) askOrComplainService.findTotal(criteria);
 		 return "success";
	}
}
