package com.changh.sccms.entity;

import java.util.List;

public class StudentInfo {
	private String name;
	private List<Integer> data;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Integer> getData() {
		return data;
	}
	public void setData(List<Integer> data) {
		this.data = data;
	}
	
}
