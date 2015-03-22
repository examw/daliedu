package com.changh.eschool.action.classPackage;

import java.util.ArrayList;
import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ClassDetail;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.service.ClassDetailService;
import com.changh.eschool.service.ClassPackageService;
import com.changh.eschool.service.ExamCategoryService;
import com.changh.eschool.service.OrderService;
import com.changh.eschool.until.Constant;

/**
 * @Title: AuditionAction.java
 * @Package com.changh.eschool.action.classPackage
 * @Description: TODO(试听套餐课程)
 * @author Failymiss jiangwei3457@163.com
 * @date 2013-6-24 下午2:57:53
 * @version V1.0
 */
public class AuditionAction extends BaseAction {
	
	private int pkgId;
	/**
	 * 课节名字
	 */
	private Integer classId;
	/**
	 * 课节
	 */
	private ClassDetail classDetail;
	/**
	 * 班级名字
	 */
	private Grade g;
	/**
	 * 下一讲
	 */
	private Integer nextId;
	/**
	 * 上一讲
	 */
	private Integer prevId;
	/**
	 * 是否购买  试听课程 没有判断，默认是没有购买
	 */
	private Integer payflag = 0;
	/**
	 * 套餐名字
	 */
	private String pkgName;
	/**
	 * 考试类别
	 */
	private String examName;
	/**
	 * service方法
	 */
	private ExamCategoryService examCategoryService;
	private ClassPackageService classPackageService;
	private ClassDetailService classDetailService;
	private OrderService orderService;
	public ExamCategoryService getExamCategoryService() {
		return examCategoryService;
	}
	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}
	public String execute() {
		List<Grade> grade = classPackageService.findByPkgId(pkgId);
		List<ClassDetail> list = new ArrayList<ClassDetail>();
		pkgName = classPackageService.findById(pkgId).getPkgName() + ":";
		for (Grade gr : grade) {
			list=classDetailService.findClassDetailByGid(gr.getGradeId(), Constant.FREE);
			if (list != null && list.size() != 0) {
				g = gr;
				break;
			}
		}
		try {
			examName = (examCategoryService.examLoad(g.getExamCategory().getExamPid())).getExamName();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (list != null && list.size() != 0) {
			classDetail = list.get(0);
			classId = classDetail.getClassId();
			for (int i = 0; i < list.size(); i++) {
				if (list.size() == 1) {
					nextId = 0;
					prevId = 0;
				} else if (list.get(i).getClassId() == (int) classId && i > 0
						&& i < list.size() - 1) {
					nextId = list.get(i + 1).getClassId();
					prevId = list.get(i - 1).getClassId();
				} else if (list.get(i).getClassId() == (int) classId && i == 0
						&& list.size() != 1) {

					nextId = list.get(i + 1).getClassId();
					prevId = 0;
				} else if (list.get(i).getClassId() == (int) classId
						&& i == list.size() - 1) {
					nextId = 0;
					prevId = list.get(i - 1).getClassId();
				}
			}
			return "success";
		} else {
			return "error";
		}

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

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public int getPkgId() {
		return pkgId;
	}

	public void setPkgId(int pkgId) {
		this.pkgId = pkgId;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}

	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
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

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public String getPkgName() {
		return pkgName;
	}

	public void setPkgName(String pkgName) {
		this.pkgName = pkgName;
	}

}
