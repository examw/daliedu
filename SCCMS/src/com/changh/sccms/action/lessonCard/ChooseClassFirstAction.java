package com.changh.sccms.action.lessonCard;

public class ChooseClassFirstAction {
	private Integer stuId;
	public String execute(){
		return "success";
	}
	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}
}
