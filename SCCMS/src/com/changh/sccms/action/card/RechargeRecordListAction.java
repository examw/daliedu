package com.changh.sccms.action.card;

import java.util.Map;

import com.changh.sccms.service.StudyCardService;

public class RechargeRecordListAction {
	private int cardId;
	private Map<String,Object> map;
	public int getCardId() {
		return cardId;
	}
	public void setCardId(int cardId) {
		this.cardId = cardId;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	private StudyCardService studyCardService;
	public void setStudyCardService(StudyCardService studyCardService) {
		this.studyCardService = studyCardService;
	}
	public String execute()throws Exception
	{
		map = this.studyCardService.findRecord(cardId);
		return "success";
	}
}
