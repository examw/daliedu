package com.changh.eschool.action.member;

import com.changh.eschool.entity.StudyCard;
import com.changh.eschool.service.StudyCardService;

public class FindCardBalanceAction {
	private String password;
	private int cardId;
	private String cardNo;
	private StudyCard card;
	private StudyCardService studyCardService;
	
	public StudyCard getCard() {
		return card;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}

	
	public String getCardNo() {
		return cardNo;
	}


	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}


	public int getCardId() {
		return cardId;
	}


	public void setCardId(int cardId) {
		this.cardId = cardId;
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
		card = studyCardService.findCard(cardId, password);
		return "success";
	}
}
