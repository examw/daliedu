package com.changh.sccms.entity;


public class SimpleTeacher {
	private Integer tchId;
	private String tchName;
	public String getTchName() {
		return tchName;
	}
	public void setTchName(String tchName) {
		this.tchName = tchName;
	}
	public Integer getTchId() {
		return tchId;
	}
	public void setTchId(Integer tchId) {
		this.tchId = tchId;
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
}
