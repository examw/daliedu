package com.changh.sccms.action.lessonCard;

import java.io.InputStream;
import java.util.List;

import com.changh.sccms.entity.LessonCard;
import com.changh.sccms.service.LessonCardService;

public class CardExcelAction {
	private int num;
	
	public void setNum(int num) {
		this.num = num;
	}
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}
	private LessonCardService lessonCardService;

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public void setLessonCardService(LessonCardService LessonCardService) {
		this.lessonCardService = LessonCardService;
	}
	public String execute() throws Exception
	{
		List<LessonCard> list = lessonCardService.findTopN(num);
		inputStream = lessonCardService.getExcelInputStream(list);
		return "success";
	}
}
