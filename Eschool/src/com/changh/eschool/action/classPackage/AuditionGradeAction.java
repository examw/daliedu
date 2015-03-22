package com.changh.eschool.action.classPackage;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ClassDetail;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.MyLesson;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.ClassDetailService;
import com.changh.eschool.service.ExamCategoryService;
import com.changh.eschool.service.GradeService;
import com.changh.eschool.service.OrderService;
import com.changh.eschool.until.Constant;

public class AuditionGradeAction extends BaseAction{
	private Integer gradeId;
	private Integer classId;
	private Grade  g;
	private ClassDetail classDetail;
	private Integer nextId;
	private Integer prevId;
	private Integer payflag =0;
	private String examName;
	
	private ClassDetailService classDetailService;
	private OrderService orderService;
	private GradeService  gradeService;
	private ExamCategoryService examCategoryService;
	
	
	public String execute() throws Exception{
		g = gradeService.findById(gradeId);
		setExamName((examCategoryService.examLoad(g.getExamCategory().getExamPid())).getExamName());
		List<ClassDetail> list = classDetailService.findClassDetailByGid(gradeId, Constant.FREE);
		if(list!=null&&list.size()!=0){
			if(classId==null||classId.equals(""))
			{
				classDetail = list.get(0);
				classId = classDetail.getClassId();
			}
			for (int i = 0; i < list.size(); i++) {
				if (list.size() == 1) {
					nextId = 0;
					prevId = 0;
					classDetail = list.get(0);
				} else if (list.get(i).getClassId() == (int) classId && i > 0
						&& i < list.size() - 1) {
					nextId = list.get(i + 1).getClassId();
					prevId = list.get(i - 1).getClassId();
					classDetail = list.get(i);
				} else if (list.get(i).getClassId() == (int) classId && i == 0
						&& list.size() != 1) {
					nextId = list.get(i + 1).getClassId();
					prevId = 0;
					classDetail = list.get(i);
				} else if (list.get(i).getClassId() == (int) classId
						&& i == list.size() - 1) {
					nextId = 0;
					prevId = list.get(i - 1).getClassId();
					classDetail = list.get(i);
				}
			}
			return "success";
		}else{
			return "error";
		}
	}
	public GradeService getGradeService() {
		return gradeService;
	}
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	public Integer getGradeId() {
		return gradeId;
	}
	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public Grade getG() {
		return g;
	}
	public void setG(Grade g) {
		this.g = g;
	}
	public ClassDetail getClassDetail() {
		return classDetail;
	}
	public void setClassDetail(ClassDetail classDetail) {
		this.classDetail = classDetail;
	}
	public Integer getNextId() {
		return nextId;
	}
	public void setNextId(Integer nextId) {
		this.nextId = nextId;
	}
	public Integer getPrevId() {
		return prevId;
	}
	public void setPrevId(Integer prevId) {
		this.prevId = prevId;
	}
	public Integer getPayflag() {
		return payflag;
	}
	public void setPayflag(Integer payflag) {
		this.payflag = payflag;
	}
	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public ExamCategoryService getExamCategoryService() {
		return examCategoryService;
	}

	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

}
