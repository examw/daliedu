package com.changh.sccms.action.lessonCard;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

import com.changh.sccms.entity.LessonCard;
import com.changh.sccms.service.LessonCardService;

public class ExcelExportAction {
	private int num;

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	private Date date;
	
	public void setDate(Date date) {
		this.date = date;
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
		List<LessonCard> list =null;
		//num!=0表示导出当次生成的
		if(num!=0)
		{
			list = lessonCardService.findTopN(num);
		}else{
			list = lessonCardService.findAll(date);
		}
		if(list.isEmpty())
		{
			return "success1";
		}
		inputStream = lessonCardService.getExcelInputStream(list);
		return "success";
	}
}
