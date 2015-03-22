package com.changh.sccms.entity;

import java.util.Date;

import com.changh.sccms.until.TimeFormat;

public class LessonCard {
	private Integer id;
	private String cardNo,cardPassword;
	//添加时间,使用时间,过期时间
	private Date cardAddTime,cardUseTime,cardOverTime;
	//包含的课程id号  [Package-111,2222,333|Grade-1111,2222,333]	//通过这个生成一个订单
	private String includeClassIds;
	private String className;
	private Integer stuId;
	private String createUsername;
	private String prefix;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCardPassword() {
		return cardPassword;
	}
	public void setCardPassword(String cardPassword) {
		this.cardPassword = cardPassword;
	}
	public Date getCardAddTime() {
		return cardAddTime;
	}
	public void setCardAddTime(Date cardAddTime) {
		this.cardAddTime = cardAddTime;
	}
	public Date getCardUseTime() {
		return cardUseTime;
	}
	public void setCardUseTime(Date cardUseTime) {
		this.cardUseTime = cardUseTime;
	}
	public String getIncludeClassIds() {
		return includeClassIds;
	}
	public void setIncludeClassIds(String includeClassIds) {
		this.includeClassIds = includeClassIds;
	}
	public Date getCardOverTime() {
		return cardOverTime;
	}
	public void setCardOverTime(Date cardOverTime) {
		this.cardOverTime = cardOverTime;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getCardNo() {
		if(prefix != null) return prefix+"-"+id;
		String time = TimeFormat.format(cardAddTime).substring(0, 6);
		return "wx"+time+"bk"+id;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}
	public String getCreateUsername() {
		return createUsername;
	}
	public void setCreateUsername(String createUsername) {
		this.createUsername = createUsername;
	}
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
}
