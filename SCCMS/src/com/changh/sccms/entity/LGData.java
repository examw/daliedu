package com.changh.sccms.entity;

public class LGData {
	private String Message ="²Ù×÷³É¹¦";
	private Boolean IsError = true;
	private Object data = null;
	
	public String getMessage() {
		return Message;
	}
	public void setMessage(String message) {
		Message = message;
	}
	public Boolean getIsError() {
		return IsError;
	}
	public void setIsError(Boolean isError) {
		IsError = isError;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
}
