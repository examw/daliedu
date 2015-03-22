package com.changh.sccms.action.card;

public class GetRecordList {
	private int cardId;

	public int getCardId() {
		return cardId;
	}

	public void setCardId(int cardId) {
		this.cardId = cardId;
	}
	public String execute(){
		return "success";
	}
}
