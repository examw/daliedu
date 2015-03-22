package com.changh.eschool.action.member;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.dao.OrderDAO;
import com.changh.eschool.entity.Order;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.OrderService;
import com.changh.eschool.until.Escape;

public class SearchOrderAction extends BaseAction {
	private List<Order> orderList;
	private int page=1;
	private int pagesize=10;
	private String sortname=" o.orderId ";
	private String sortorder=" desc ";
	private OrderService orderService;
	private String criteria =OrderDAO.ALLORDER ;
	private int total;
	private String keywords;
	
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		if(keywords.matches("[\\s|\\S]*[\u4E00-\u9FA5]+[\\s|\\S]*"))
		{
			this.keywords = keywords;
		}else
		{
			this.keywords = (Escape.unescape(keywords));
		}
		
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
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
	public String getCriteria() {
		return criteria;
	}
	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public String execute()throws Exception
	{
		//用过滤器或拦截器，拦截没有登录或session失效的
		Student student = (Student)session.get("student");
		orderList = orderService.findByKeywords(page, pagesize, criteria, sortname, sortorder,student.getStuId(), keywords);
		total = orderService.findTotal(criteria+" and o.student.stuId = "+student.getStuId(),keywords);
		return "success";
	}
}	
