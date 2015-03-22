package com.changh.sccms.action.card;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

import com.changh.sccms.entity.StudyCard;
import com.changh.sccms.service.StudyCardService;

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
	private StudyCardService studyCardService;

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public void setStudyCardService(StudyCardService studyCardService) {
		this.studyCardService = studyCardService;
	}
	public String execute() throws Exception
	{
		List<StudyCard> list =null;
		//num!=0表示导出当次生成的
		if(num!=0)
		{
			list = studyCardService.findTopN(num);
		}else{
			list = studyCardService.findAll(date);
		}
		if(list.isEmpty())
		{
			return "success1";
		}
		inputStream = studyCardService.getExcelInputStream(list);
		return "success";
	}
}
