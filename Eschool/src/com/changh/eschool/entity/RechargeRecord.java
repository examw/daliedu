package com.changh.eschool.entity;
// default package

import java.util.Date;


/**
 * RechargeRecord entity. @author MyEclipse Persistence Tools
 */

public class RechargeRecord  implements java.io.Serializable {


    // Fields    

     private Integer rcId;
     private Student student;
     private Integer id;
     private double rcMoney;
     private Integer rcType;
     private String rcIp;
     private Integer rcCardId;
     private Date rcAddTime;
     private Integer rcIsPresent;
     private String type;
    // Constructors

    /** default constructor */
    public RechargeRecord() {
    }

    
    /** full constructor */
    public RechargeRecord(Student student, Integer id, double rcMoney, Integer rcType, String rcIp, Integer rcCardId, Date rcAddTime,Integer rcIsPresent) {
        this.student = student;
        this.id = id;
        this.rcMoney = rcMoney;
        this.rcType = rcType;
        this.rcIp = rcIp;
        this.rcCardId = rcCardId;
        this.rcAddTime = rcAddTime;
        this.rcIsPresent=rcIsPresent;
    }

   
    // Property accessors

    public Integer getRcId() {
        return this.rcId;
    }
    
    public void setRcId(Integer rcId) {
        this.rcId = rcId;
    }

    public Student getStudent() {
        return this.student;
    }
    
    public void setStudent(Student student) {
        this.student = student;
    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public double getRcMoney() {
        return this.rcMoney;
    }
    
    public void setRcMoney(double rcMoney) {
        this.rcMoney = rcMoney;
    }

    public Integer getRcType() {
        return this.rcType;
    }
    
    public void setRcType(Integer rcType) {
        this.rcType = rcType;
    }

    public String getRcIp() {
        return this.rcIp;
    }
    
    public void setRcIp(String rcIp) {
        this.rcIp = rcIp;
    }

    public Integer getRcCardId() {
        return this.rcCardId;
    }
    
    public void setRcCardId(Integer rcCardId) {
        this.rcCardId = rcCardId;
    }

    public Date getRcAddTime() {
        return this.rcAddTime;
    }
    
    public void setRcAddTime(Date rcAddTime) {
        this.rcAddTime = rcAddTime;
    }


	public Integer getRcIsPresent() {
		return rcIsPresent;
	}


	public void setRcIsPresent(Integer rcIsPresent) {
		this.rcIsPresent = rcIsPresent;
	}


	public String getType() {
		return this.rcType==0?"学习卡":this.rcType==1?"现金":"其他";
	}

	public void setType(String type) {
		this.type = type;
	}
   
    







}