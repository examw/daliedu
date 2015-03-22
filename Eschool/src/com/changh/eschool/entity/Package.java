package com.changh.eschool.entity;

import java.util.List;

public class Package {
	private List<ClassPackage>  total;
	private List<ClassPackage>  single;
	private List<ClassPackage>  base;
	public List<ClassPackage> getTotal() {
		return total;
	}
	public void setTotal(List<ClassPackage> total) {
		this.total = total;
	}
	public List<ClassPackage> getSingle() {
		return single;
	}
	public void setSingle(List<ClassPackage> single) {
		this.single = single;
	}
	public List<ClassPackage> getBase() {
		return base;
	}
	public void setBase(List<ClassPackage> base) {
		this.base = base;
	}
}
