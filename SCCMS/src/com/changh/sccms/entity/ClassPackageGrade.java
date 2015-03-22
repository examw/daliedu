package com.changh.sccms.entity;

/**
 * ClassPackageGrade entity. @author MyEclipse Persistence Tools
 */

public class ClassPackageGrade implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer pkgId;
	private Integer gradeId;

	// Constructors

	/** default constructor */
	public ClassPackageGrade() {
	}

	/** minimal constructor */
	public ClassPackageGrade(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public ClassPackageGrade(Integer id, Integer pkgId, Integer gradeId) {
		this.id = id;
		this.pkgId = pkgId;
		this.gradeId = gradeId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPkgId() {
		return this.pkgId;
	}

	public void setPkgId(Integer pkgId) {
		this.pkgId = pkgId;
	}

	public Integer getGradeId() {
		return this.gradeId;
	}

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

}