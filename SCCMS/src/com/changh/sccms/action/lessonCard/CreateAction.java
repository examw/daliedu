package com.changh.sccms.action.lessonCard;

import java.util.Date;

import com.changh.sccms.service.LessonCardService;

public class CreateAction {
	//input
	private int num;		//��������
	private int pwdNum;		//���볤��
	private String includeClassIds;		//�����γ�ID
	private String className;	//�γ�����
	private Date overTime;		//��Ч����
	private String prefix;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPwdNum() {
		return pwdNum;
	}
	public void setPwdNum(int pwdNum) {
		this.pwdNum = pwdNum;
	}
	public String getIncludeClassIds() {
		return includeClassIds;
	}
	public void setIncludeClassIds(String includeClassIds) {
		this.includeClassIds = includeClassIds;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public Date getOverTime() {
		return overTime;
	}
	public void setOverTime(Date overTime) {
		this.overTime = overTime;
	}
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	//injection
	private LessonCardService lessonCardService;
	
	public void setLessonCardService(LessonCardService LessonCardService) {
		this.lessonCardService = LessonCardService;
	}
	public String execute()throws Exception
	{
		lessonCardService.createCards(num, overTime, pwdNum, includeClassIds, className,prefix);
		return "success";
	}
}
