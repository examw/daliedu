package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.dao.OrderDAO;
import com.changh.eschool.entity.Order;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.OrderService;

public class OrderListAction extends BaseAction{
	private List<Order> orderList;
	private int page=1;
	private int pagesize=10;
	private String sortname=" o.orderAddTime ";
	private String sortorder=" desc ";
	private OrderService orderService;
	private String criteria =OrderDAO.ALLEXCEPTCANCEL;
	private int selectValue=0;//下拉框的值默认为0；
	public int getSelectValue() {
		return selectValue;
	}
	public void setSelectValue(int selectValue) {
		this.selectValue = selectValue;
	}
	private int total;
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getCriteria() {
		return criteria;
	}
	public void setCriteria(String criteria) {
		this.criteria = criteria;
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
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public String execute()throws Exception
	{
		//用过滤器或拦截器，拦截没有登录或session失效的
		Student student = (Student) session.get("student");
		if(selectValue==1)
		{
			criteria = OrderDAO.ALLNOTPAID;
		}else if(selectValue==2)
		{
			criteria = OrderDAO.ALLPAID;
		}else if(selectValue==3)
		{
			criteria = OrderDAO.USERCANCEL;
		}
		orderList = orderService.findByStuId(page, pagesize, criteria, sortname, sortorder, student.getStuId());
		total = orderService.findTotal(criteria,student.getStuId());
		return "success";
	}
}
