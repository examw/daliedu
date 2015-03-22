package com.changh.eschool.action.member;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ClassDetail;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.MyLesson;
import com.changh.eschool.entity.Student;
import com.changh.eschool.entity.StudyRecord;
import com.changh.eschool.service.ClassDetailService;
import com.changh.eschool.service.ExamCategoryService;
import com.changh.eschool.service.OrderService;
import com.changh.eschool.service.StudyRecordService;
import com.changh.eschool.until.Constant;
import com.changh.eschool.until.PropertiesUtil;
import com.sun.org.apache.commons.beanutils.PropertyUtils;

/**
 * 进入3分频课堂
 * 
 * @author wei
 * 
 */
public class ClassroomAction extends BaseAction {
	/**
	 * 课节Id
	 */
	private String classId; // 修改成string
	/**
	 * 班级
	 */
	private Grade g;
	/**
	 * 课节
	 */
	private ClassDetail classDetail;
	/**
	 * 下一节Id
	 */
	private Integer nextId;
	/**
	 * 上一节Id
	 */
	private Integer prevId;
	/**
	 * 如果登录，判断当前用户是否购买了该课程
	 */
	private Integer payflag = 0;
	/**
	 * 考试类别
	 */
	private String examName;

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

	public Integer remainTimes;	//剩余次数
	
	public Integer getRemainTimes() {
		return remainTimes;
	}

	public void setRemainTimes(Integer remainTimes) {
		this.remainTimes = remainTimes;
	}
	/**
	 * service方法
	 */
	private ClassDetailService classDetailService;
	private OrderService orderService;
	private StudyRecordService studyRecordService;
	private ExamCategoryService examCategoryService;

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	/**
	 * action方法 2014.03.17进行了大改 classId 参数变为 条目id_课节id
	 * 
	 * @return
	 * @throws Exception
	 */
	public String execute() throws Exception {
		Student stu = (Student) session.get("student");
		if (stu == null) {
			return "error";
		}
		Integer cid,itemId;
		try {
			String arr[] = classId.split("_");
			cid = Integer.parseInt(arr[1]);
			itemId = Integer.parseInt(arr[0]); // 条目id
			g = classDetailService.findGbyclassId(cid);
			g.setItemId(itemId);
		} catch (Exception e) {
			itemId = 0;
			cid = Integer.parseInt(classId);
			g = classDetailService.findGbyclassId(cid);
		}
		Integer gid = g.getGradeId();
		// 2014.03.17 课程限制
		String limitItemIds = (String) session.get("limitItemIds");
		if (limitItemIds!=null&&limitItemIds.contains("," + itemId + ",")) {
		int count = classDetailService.findTotal(gid); // 课节数
		int limit = (int) Math.ceil(Double.parseDouble(PropertiesUtil
				.getOptValue("classNumLimit")) * count);
		String limitString = (String) session.get("lessonLimit"); // 1001-1001,1002###，班级-课节
		String classIds = getLimitClassIds(gid, limitString); // 获取被限制的id
		if (!(","+classIds+",").contains(","+cid + ",")) //不包含
		{
			if("".equals(classIds)||(classIds.split(",").length < limit))// 没有超过限制
			{
				String target = updateLimitClassIds(gid, limitString, cid);
				orderService.updateItem(itemId,target,gid+"-"); //更新note
			}else	//超过限制
			{
				//不能再学了
				return "success1";
			}
		}
		}
		// 2014.03.17 课程限制

		examName = (examCategoryService.examLoad(g.getExamCategory()
				.getExamPid())).getExamName();
		classDetail = classDetailService.findByClassId(cid);
		classDetail.setLect(classDetailService.findLectureByClassId(cid));
		// 判断当前用户是否已经购买了当前课程
		List<ClassDetail> list = g.getClassDetails();
		if (stu != null) {
			payflag = (Integer) session.get(gid + "");
			out: if (null == payflag) {
				MyLesson myLesson = orderService.findMyLesson(stu.getStuId(),
						Constant.FINISH);
				if (myLesson != null) {
					for (int i = 0; i < myLesson.getGrade().size(); i++) {
						if (myLesson.getGrade().get(i).getGradeId().equals(gid)) {
							payflag = 1;
							session.put(gid + "", payflag);
							break out;
						}
					}
					for (int i = 0; i < myLesson.getClassPackages().size(); i++) {
						for (int j = 0; j < myLesson.getClassPackages().get(i)
								.getGrade().size(); j++) {
							if (myLesson.getClassPackages().get(i).getGrade()
									.get(j).getGradeId().equals(gid)) {
								payflag = 1;
								session.put(gid + "", payflag);
								break out;
							}
						}
					}
				}
			}
			// 播放记录添加
			if (payflag == 1) {
				//获取默认的次数================
				Integer limitNum = 6;
				try{
					limitNum = Integer.valueOf(PropertiesUtil.getOptValue("listenNum"));
				}catch(Exception e){limitNum = 6;}
				//获取默认的次数================
				StudyRecord studyRecord = studyRecordService.findSRecord(
						stu.getStuId(), cid);
				if (studyRecord == null) {
					StudyRecord sr = new StudyRecord();
					Integer recordId = studyRecordService.findRecordId(
							stu.getStuId(), cid);
					sr.setRecordIp(ServletActionContext.getRequest()
							.getRemoteAddr());
					sr.setClassId(cid);
					sr.setGradeId(gid);
					sr.setRecordId(recordId);
					sr.setRecordStartTime(new Date());
					sr.setStuId(stu.getStuId());
					sr.setRecordName(g.getName() + classDetail.getClassTitle());
					sr.setCountNum(1);
					//次数控制
					if(classDetail.getListenNum() == null || classDetail.getListenNum().equals(0)){	//为空,默认3次
						sr.setHaveNum(limitNum);
					}else{
						sr.setHaveNum(classDetail.getListenNum());
					}
					sr.setUseNum(1);	//使用了一次
					remainTimes = sr.getHaveNum() - 1;	//剩余次数
					studyRecordService.save(sr);
				} else {
					//判断次数
					if(studyRecord.getUseNum() == null || studyRecord.getHaveNum()==null){
						studyRecord.setHaveNum(limitNum);
						studyRecord.setUseNum(0);
					}else if(studyRecord.getUseNum() >= studyRecord.getHaveNum()){
						return "success2";	//超过了听课次数,不能再听
					}
					studyRecord.setUseNum(studyRecord.getUseNum()+1);	//次数加一
					studyRecord.setRecordStartTime(new Date());
					studyRecord.setCountNum(studyRecord.getCountNum() + 1);
					remainTimes = studyRecord.getHaveNum() - studyRecord.getUseNum();	//剩余次数
					studyRecordService.save(studyRecord);
				}
			} else {
				Iterator<ClassDetail> lt = list.iterator();
				while (lt.hasNext()) {
					if (lt.next().getClassIfFree() == 0) {
						lt.remove();
					}
				}
			}
		}
		g.setClassDetails(list);
		g.setItemId(itemId); // 设置条目id
		if (list != null && list.size() > 1) {
			for (int i = 0; i < list.size(); i++) {

				if (list.get(i).getClassId() == (int) cid && i > 0
						&& i < list.size() - 1) {

					nextId = list.get(i + 1).getClassId();
					prevId = list.get(i - 1).getClassId();
				} else if (list.get(i).getClassId() == (int) cid && i == 0) {

					nextId = list.get(i + 1).getClassId();
					prevId = 0;
				} else if (list.get(i).getClassId() == (int) cid
						&& i == list.size() - 1) {

					nextId = 0;
					prevId = list.get(i - 1).getClassId();
				}
			}
		}
		return "success";
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public Grade getG() {
		return g;
	}

	public void setG(Grade g) {
		this.g = g;
	}

	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}

	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}

	public ClassDetail getClassDetail() {
		return classDetail;
	}

	public void setClassDetail(ClassDetail classDetail) {
		this.classDetail = classDetail;
	}

	public Integer getPayflag() {
		return payflag;
	}

	public void setPayflag(Integer payflag) {
		this.payflag = payflag;
	}

	public StudyRecordService getStudyRecordService() {
		return studyRecordService;
	}

	public void setStudyRecordService(StudyRecordService studyRecordService) {
		this.studyRecordService = studyRecordService;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public ExamCategoryService getExamCategoryService() {
		return examCategoryService;
	}

	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}

	private String getLimitClassIds(Integer gid, String limitString) {
		String[] arr = limitString.split("###");
		for (String s : arr) {
			if (s.substring(0, s.indexOf("-")).equals(gid.toString())) {
				return s.substring(s.indexOf("-") + 1);
			}
		}
		return "";
	}

	private String updateLimitClassIds(Integer gid, String limitString,
			Integer cid) {
		// 更新限制的ID
		StringBuffer buf = new StringBuffer();
		String target = "";
		String[] arr = limitString.split("###");
		for (String s : arr) {
			if (s.substring(0, s.indexOf("-")).equals(gid.toString())) {
				if (s.substring(s.indexOf("-") + 1).equals("")) {
					buf.append(s).append(cid).append("###");
					target = s + cid;
				} else {
					buf.append(s).append(",").append(cid).append("###");
					target = s + "," + cid;
				}
			} else {
				buf.append(s).append("###");
			}
		}
		session.put("lessonLimit", buf.toString());
		return target;
	}
}
