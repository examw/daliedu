package com.changh.sccms.action.card;

import java.io.InputStream;
import java.util.List;

import com.changh.sccms.entity.StudyCard;
import com.changh.sccms.service.StudyCardService;

public class CardExcelAction {
	private int num;
	
	public void setNum(int num) {
		this.num = num;
	}
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}
	private StudyCardService studyCardService;

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public void setStudyCardService(StudyCardService studyCardService) {
		this.studyCardService = studyCardService;
	}
	public String execute() throws Exception
	{
		List<StudyCard> list = studyCardService.findTopN(num);
		inputStream = studyCardService.getExcelInputStream(list);
		return "success";
	}
}
