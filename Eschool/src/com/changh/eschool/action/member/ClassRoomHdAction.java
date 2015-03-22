package com.changh.eschool.action.member;

import java.util.ArrayList;
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

/**
 * @Title: ClassRoomHdAction.java
 * @Package com.changh.eschool.action.member
 * @Description: TODO(�������Ƶaction)
 * @author Failymiss jiangwei3457@163.com
 * @date 2013-7-6 ����3:10:47
 * @version V1.0
 */
public class ClassRoomHdAction extends BaseAction {
	/**
	 * �ν�Id
	 */
	private String classId;
	/**
	 * �༶
	 */
	private Grade g;
	/**
	 * �ν�
	 */
	private ClassDetail classDetail;
	/**
	 * ��һ��Id
	 */
	private Integer nextId;
	/**
	 * ��һ��Id
	 */
	private Integer prevId;
	/**
	 * �����¼���жϵ�ǰ�û��Ƿ����˸ÿγ�
	 */
	private Integer payflag = 0;
	/**
	 * �������
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
	
	public Integer remainTimes;	//ʣ�����
	
	public Integer getRemainTimes() {
		return remainTimes;
	}

	public void setRemainTimes(Integer remainTimes) {
		this.remainTimes = remainTimes;
	}

	/**
	 * service����
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
	 * action����
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
			itemId = Integer.parseInt(arr[0]); // ��Ŀid
			g = classDetailService.findGbyclassId(cid);
			g.setItemId(itemId);
		} catch (Exception e) {
			itemId = 0;
			cid = Integer.parseInt(classId);
			g = classDetailService.findGbyclassId(cid);
		}
		Integer gid = g.getGradeId();
		// 2014.03.17 �γ�����
		String limitItemIds = (String) session.get("limitItemIds");
		//System.out.println("limitItemIds: "+limitItemIds);
		if (limitItemIds!=null&&limitItemIds.contains("," + itemId + ",")) {
			int count = classDetailService.findTotal(gid); // �ν���
			int limit = (int) Math.ceil(Double.parseDouble(PropertiesUtil
					.getOptValue("classNumLimit")) * count);
			//System.out.println("count: "+count);
			//System.out.println("limit: "+limit);
			String limitString = (String) session.get("lessonLimit"); // 1001-1001,1002###���༶-�ν�
			//System.out.println("limitString: "+limitString);
			String classIds = getLimitClassIds(gid, limitString); // ��ȡ�����Ƶ�id
			//System.out.println("���Ƶ�classIds: "+classIds);
			if (!(","+classIds+",").contains(","+cid + ",")) //������
			{
				if ("".equals(classIds) || (classIds.split(",").length < limit))// û�г�������
				{
					String target = updateLimitClassIds(gid, limitString, cid);
					//System.out.println("����Item");
					orderService.updateItem(itemId, target, gid + "-"); // ����note
				} else // ��������
				{
					// ������ѧ��
					return "success1";
				}
			}
		}
		// 2014.03.17 �γ�����
		examName = (examCategoryService.examLoad(g.getExamCategory()
				.getExamPid())).getExamName();
		classDetail = classDetailService.findByClassId(cid);
		List<ClassDetail> list = new ArrayList<ClassDetail>();
		// �жϵ�ǰ�û��Ƿ��Ѿ������˵�ǰ�γ�
		if (stu != null) {
			payflag = (Integer) session.get(g.getGradeId() + "");
			out: if (null == payflag) {
				MyLesson myLesson = orderService.findMyLesson(stu.getStuId(),
						Constant.FINISH);
				if (myLesson != null) {
					for (int i = 0; i < myLesson.getGrade().size(); i++) {
						if (myLesson.getGrade().get(i).getGradeId().equals(gid)) {
							payflag = 1;
							session.put(g.getGradeId() + "", payflag);
							break out;
						}
					}
					for (int i = 0; i < myLesson.getClassPackages().size(); i++) {
						for (int j = 0; j < myLesson.getClassPackages().get(i)
								.getGrade().size(); j++) {
							if (myLesson.getClassPackages().get(i).getGrade()
									.get(j).getGradeId().equals(gid)) {
								payflag = 1;
								session.put(g.getGradeId() + "", payflag);
								break out;
							}
						}
					}
				}
			}
			// ���ż�¼���
			if (payflag == 1) {
				//��ȡĬ�ϵĴ���================
				Integer limitNum = 6;
				try{
					limitNum = Integer.valueOf(PropertiesUtil.getOptValue("listenNum"));
				}catch(Exception e){limitNum = 6;}
				//��ȡĬ�ϵĴ���================
				list = classDetailService.listClassDetail(g.getGradeId(), 0, 0);
				StudyRecord studyRecord = studyRecordService.findSRecord(
						stu.getStuId(), cid);
				if (studyRecord == null) {	//��һ������
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
					//��������
					if(classDetail.getListenNum() == null || classDetail.getListenNum().equals(0)){	//Ϊ��,Ĭ��3��
						sr.setHaveNum(limitNum);
					}else{
						sr.setHaveNum(classDetail.getListenNum());
					}
					sr.setUseNum(1);	//ʹ����һ��
					remainTimes = sr.getHaveNum() - 1;	//ʣ�����
					studyRecordService.save(sr);
				} else {
					//�жϴ���
					if(studyRecord.getUseNum() == null || studyRecord.getHaveNum()==null){
						studyRecord.setHaveNum(limitNum);
						studyRecord.setUseNum(0);
					}else if(studyRecord.getUseNum() >= studyRecord.getHaveNum()){
						if("on".equalsIgnoreCase(PropertiesUtil.getOptValue("classLimitButton")))
							return "success2";	//���������δ���,��������
					}
					studyRecord.setUseNum(studyRecord.getUseNum()+1);	//������һ
					studyRecord.setRecordStartTime(new Date());
					studyRecord.setCountNum(studyRecord.getCountNum() + 1);
					remainTimes = studyRecord.getHaveNum() - studyRecord.getUseNum();	//ʣ�����
					studyRecordService.save(studyRecord);
				}
			} else {
				list = classDetailService.findClassDetailByGid(gid,
						Constant.FREE);
			}
		}
		// ������½�
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
		// �������Ƶ�ID
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
		//System.out.println("����session:"+buf.toString());
		session.put("lessonLimit", buf.toString());
		return target;
	}
}
