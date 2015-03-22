package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Address;
import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.Order;
import com.changh.eschool.entity.Send;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.OrderService;
import com.changh.eschool.service.SendService;
import com.changh.eschool.service.StudentService;

public class LoadAddressForSendAction extends BaseAction{
	private OrderService orderService;
	private int sid;
	private Send send;
	private Order order;
	private List<Items> itemList;
	private List<Address> addrList;
	private StudentService studentService;
	private SendService sendService;
	
	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public void setSendService(SendService sendService) {
		this.sendService = sendService;
	}

	public List<Address> getAddrList() {
		return addrList;
	}

	public void setAddrList(List<Address> addrList) {
		this.addrList = addrList;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	public Send getSend() {
		return send;
	}

	public Order getOrder() {
		return order;
	}

	public List<Items> getItemList() {
		return itemList;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public String execute()throws Exception
	{
		Student stu = (Student)session.get("student");
		addrList = studentService.findAddrListByStuId(stu.getStuId());
		send = sendService.findById(sid);
		order = orderService.findById(send.getOrderId());
		itemList = orderService.findItemsByOrderId(order.getOrderId());
		return "success";
		
	}
}
