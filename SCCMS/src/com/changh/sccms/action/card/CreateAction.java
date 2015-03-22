package com.changh.sccms.action.card;

import java.util.Date;

import com.changh.sccms.service.StudyCardService;

public class CreateAction {
	//input
	private int num;		//创建数量
	private int pwdNum;		//密码长度
	private int value;		//面值
	private int isPresent;	//是否赠送
	private Date overTime;		//有效期限
	private String prefix; //自定义前缀
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
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public int getIsPresent() {
		return isPresent;
	}
	public void setIsPresent(int isPresent) {
		this.isPresent = isPresent;
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
	private StudyCardService studyCardService;
	
	public void setStudyCardService(StudyCardService studyCardService) {
		this.studyCardService = studyCardService;
	}
	public String execute()throws Exception
	{
		studyCardService.createCards(num, value, overTime, pwdNum, isPresent,prefix);
		return "success";
	}
}
