package com.changh.eschool.action.member;

import com.changh.eschool.service.StudyCardService;

public class RechargeAction {
	private int cardId;
	private String cardNo;
	private String cardPwd;
	private int money;
	private int data;
	
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public int getData() {
		return data;
	}
	private StudyCardService studyCardService;
	public int getCardId() {
		return cardId;
	}
	public void setCardId(int cardId) {
		this.cardId = cardId;
	}
	public String getCardPwd() {
		return cardPwd;
	}
	public void setCardPwd(String cardPwd) {
		this.cardPwd = cardPwd;
	}
	
	public double getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public void setStudyCardService(StudyCardService studyCardService) {
		this.studyCardService = studyCardService;
	}
	public String execute()throws Exception
	{
		if(cardNo.contains("-")){
			cardId = Integer.parseInt(cardNo.substring(cardNo.indexOf("-")+1));
		}else
			cardId = Integer.parseInt(cardNo.substring(cardNo.indexOf("f")+1));
		data=studyCardService.recharge(cardId, cardPwd,money);
		return "success";
	}
}
