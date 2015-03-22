package com.changh.eschool.action.mobile;

import com.changh.eschool.action.BaseAction;

public class GradeGroup  extends BaseAction{
	private String name;
	private Object obj;
	private int complex;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	
	public int getComplex() {
		return complex;
	}
	public void setComplex(int complex) {
		this.complex = complex;
	}
	public GradeGroup(String name, Object obj,int complex) {
		super();
		this.name = name;
		this.obj = obj;
		this.complex = complex;
	}
	
}
