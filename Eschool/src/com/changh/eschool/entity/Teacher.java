package com.changh.eschool.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;


/**
 * Teacher entity provides the base persistence definition of the Teacher entity. @author MyEclipse Persistence Tools
 */
@MappedSuperclass

public class Teacher  implements java.io.Serializable {


    // Fields 字段

     private Integer tchId;
     private Integer id;
     private String tchUsername;
     private String tchPassword;
     private String tchName;
     private String tchPhone;
     private Date tchAddTime;
     private String tchDescription;
     private String tchLessons;
     private String tchValuation;
     private Integer tchScore;
     private String tchImgUrl;
     private Integer tchStatus;
     private String tchSex;
     private String status;
    // Constructors构造方法


	/** default constructor */
    public Teacher() {
    }

	/** minimal constructor */
    public Teacher(Integer tchId, String tchUsername, String tchPassword, String tchName, Date tchAddTime, Integer tchStatus) {
        this.tchId = tchId;
        this.tchUsername = tchUsername;
        this.tchPassword = tchPassword;
        this.tchName = tchName;
        this.tchAddTime = tchAddTime;
        this.tchStatus = tchStatus;
    }
    public Teacher(String tchUsername, String tchPassword, String tchName, String tchPhone, Date tchAddTime, String tchDescription, String tchLessons, String tchValuation, Integer tchScore, String tchImgUrl, Integer tchStatus) {
        this.tchUsername = tchUsername;
        this.tchPassword = tchPassword;
        this.tchName = tchName;
        this.tchPhone = tchPhone;
        this.tchAddTime = tchAddTime;
        this.tchDescription = tchDescription;
        this.tchLessons = tchLessons;
        this.tchValuation = tchValuation;
        this.tchScore = tchScore;
        this.tchImgUrl = tchImgUrl;
        this.tchStatus = tchStatus;
    }
    /** full constructor */
    public Teacher(Integer tchId, String tchUsername, String tchPassword, String tchName, String tchPhone, String tchSex,Date tchAddTime, String tchDescription, String tchLessons, String tchValuation, Integer tchScore, String tchImgUrl, Integer tchStatus) {
        this.tchId = tchId;
        this.tchUsername = tchUsername;
        this.tchPassword = tchPassword;
        this.tchName = tchName;
        this.tchSex = tchSex;
        this.tchPhone = tchPhone;
        this.tchAddTime = tchAddTime;
        this.tchDescription = tchDescription;
        this.tchLessons = tchLessons;
        this.tchValuation = tchValuation;
        this.tchScore = tchScore;
        this.tchImgUrl = tchImgUrl;
        this.tchStatus = tchStatus;
    }
  
    // Property accessors
//    @Id @GeneratedValue(strategy=ASSIGNED)
    
    @Column(name="tch_id", unique=true, nullable=false)

    public Integer getTchId() {
        return this.tchId;
    }
    
    public void setTchId(Integer tchId) {
        this.tchId = tchId;
    }
    
    @Column(name="id", nullable=false)

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    @Column(name="tch_username", unique=true, nullable=false, length=20)

    public String getTchUsername() {
        return this.tchUsername;
    }
    
    public void setTchUsername(String tchUsername) {
        this.tchUsername = tchUsername;
    }
    
    @Column(name="tch_password", nullable=false, length=50)

    public String getTchPassword() {
        return this.tchPassword;
    }
    
    public void setTchPassword(String tchPassword) {
        this.tchPassword = tchPassword;
    }
    
    @Column(name="tch_name", nullable=false, length=20)

    public String getTchName() {
        return this.tchName;
    }
    
    public void setTchName(String tchName) {
        this.tchName = tchName;
    }
    
    @Column(name="tch_phone", length=20)

    public String getTchPhone() {
        return this.tchPhone;
    }
    
    public void setTchPhone(String tchPhone) {
        this.tchPhone = tchPhone;
    }
    
    @Column(name="tch_addTime", nullable=false, length=23)

    public Date getTchAddTime() {
        return this.tchAddTime;
    }
    
    public void setTchAddTime(Date tchAddTime) {
        this.tchAddTime = tchAddTime;
    }
    
    @Column(name="tch_description", length=1000)

    public String getTchDescription() {
        return this.tchDescription;
    }
    
    public void setTchDescription(String tchDescription) {
        this.tchDescription = tchDescription;
    }
    
    @Column(name="tch_lessons", length=100)

    public String getTchLessons() {
        return this.tchLessons;
    }
    
    public void setTchLessons(String tchLessons) {
        this.tchLessons = tchLessons;
    }
    
    @Column(name="tch_valuation", length=200)

    public String getTchValuation() {
        return this.tchValuation;
    }
    
    public void setTchValuation(String tchValuation) {
        this.tchValuation = tchValuation;
    }
    
    @Column(name="tch_score")

    public Integer getTchScore() {
        return this.tchScore;
    }
    
    public void setTchScore(Integer tchScore) {
        this.tchScore = tchScore;
    }
    
    @Column(name="tch_imgURL", length=100)

    public String getTchImgUrl() {
        return this.tchImgUrl;
    }
    
    public void setTchImgUrl(String tchImgUrl) {
        this.tchImgUrl = tchImgUrl;
    }
    
    @Column(name="tch_status", nullable=false)

    public Integer getTchStatus() {
        return this.tchStatus;
    }
    
    public void setTchStatus(Integer tchStatus) {
        this.tchStatus = tchStatus;
    }
    public String getTchSex() {
		return tchSex;
	}

	public void setTchSex(String tchSex) {
		this.tchSex = tchSex;
	}

	public String getStatus() {
		return tchStatus==1?"正常":"冻结";
	}

	public void setStatus(String status) {
		this.status = status;
	}









}