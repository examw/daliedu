package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.StuDeal;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.ClassPackageService;
import com.changh.eschool.service.OrderService;

public class MyAgreementAction extends BaseAction{
	private int page = 1;
	private int pagesize = 10;
	private int total;
	private List<StuDeal> list ;
	private ClassPackageService classPackageService;
	private OrderService orderService;
	
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}

	public String execute() throws Exception{
		Student stu = (Student) session.get("student");
		if(stu==null){
			return "error";
		}
		List<Integer> list1= orderService.findMyPackage(stu.getStuId());
		list =classPackageService.findStuDealByStuId(stu.getStuId(),page,pagesize);
		for(StuDeal sd:list){
			Integer pkgId =sd.getDeal().getDealPkgId();
			if(list1!=null&&list1.contains(pkgId)){
				sd.setPackageStatus(0);	
			}else{
				sd.setPackageStatus(1);
			}
		}
		total = classPackageService.findStuDealTotal(stu.getStuId());
		return "success";
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public List<StuDeal> getList() {
		return list;
	}

	public void setList(List<StuDeal> list) {
		this.list = list;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
}
