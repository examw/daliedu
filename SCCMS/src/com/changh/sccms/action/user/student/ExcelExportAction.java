package com.changh.sccms.action.user.student;

import java.io.InputStream;
import java.util.List;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.entity.Student;
import com.changh.sccms.service.StudentService;

public class ExcelExportAction extends BaseAction{
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}
	private StudentService studentService;
	
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	private String prov;
	private String city;
	private String date;
	
	public String getProv() {
		return prov;
	}
	public void setProv(String prov) {
		this.prov = prov;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String execute() throws Exception
	{
		String area = "%"+prov+"%"+city+"%";
		if(city==null||city.trim().isEmpty()){
			area = "%"+prov+"%";
		}
		System.out.println("area====="+area);
		List<Student> list = studentService.exportList(area, date);
		if(list==null||list.size()==0)
		{
			return "success1";
		}
		inputStream = studentService.getExcelInputStream(list);
		return "success";
	}
}
