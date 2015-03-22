package com.changh.eschool.entity;


public class SimpleTeacher implements java.io.Serializable {
	private Integer tchId;
	private int id=1;
	private String tchName;
	
	public SimpleTeacher(){}
	public SimpleTeacher(Integer tchId,String tchName){
		this.tchId= tchId;
		this.tchName= tchName;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((tchId == null) ? 0 : tchId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SimpleTeacher other = (SimpleTeacher) obj;
		if (tchId == null) {
			if (other.tchId != null)
				return false;
		} else if (!tchId.equals(other.tchId))
			return false;
		return true;
	}
	public Integer getTchId() {
		return tchId;
	}
	public void setTchId(Integer tchId) {
		this.tchId = tchId;
	}
	public String getTchName() {
		return tchName;
	}
	public void setTchName(String tchName) {
		this.tchName = tchName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
