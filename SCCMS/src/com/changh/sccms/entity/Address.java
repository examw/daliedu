package com.changh.sccms.entity;
// default package



/**
 * Address entity. @author MyEclipse Persistence Tools
 */

public class Address  implements java.io.Serializable {


    // Fields    

     private Integer addrId;
     private Integer id;
     private String addrReceiveName;
     private String addrFullAddress;
     private String addrMobile;
     private String addrEmail;
     private String addrPhone;
     private String addrPostalCode;
     private Integer stuId;
     private Integer addrIsDefault;


    // Constructors

    /** default constructor */
    public Address() {
    }

	/** minimal constructor */
    public Address(Integer id, String addrReceiveName, String addrFullAddress, String addrMobile, Integer stuId) {
        this.id = id;
        this.addrReceiveName = addrReceiveName;
        this.addrFullAddress = addrFullAddress;
        this.addrMobile = addrMobile;
        this.stuId = stuId;
    }
    
    /** full constructor */
    public Address(Integer id, String addrReceiveName, String addrFullAddress, String addrMobile, String addrEmail, String addrPhone, String addrPostalCode, Integer stuId, Integer addrIsDefault) {
        this.id = id;
        this.addrReceiveName = addrReceiveName;
        this.addrFullAddress = addrFullAddress;
        this.addrMobile = addrMobile;
        this.addrEmail = addrEmail;
        this.addrPhone = addrPhone;
        this.addrPostalCode = addrPostalCode;
        this.stuId = stuId;
        this.addrIsDefault = addrIsDefault;
    }

   
    // Property accessors

    public Integer getAddrId() {
        return this.addrId;
    }
    
    public void setAddrId(Integer addrId) {
        this.addrId = addrId;
    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getAddrReceiveName() {
        return this.addrReceiveName;
    }
    
    public void setAddrReceiveName(String addrReceiveName) {
        this.addrReceiveName = addrReceiveName;
    }

    public String getAddrFullAddress() {
        return this.addrFullAddress;
    }
    
    public void setAddrFullAddress(String addrFullAddress) {
        this.addrFullAddress = addrFullAddress;
    }

    public String getAddrMobile() {
        return this.addrMobile;
    }
    
    public void setAddrMobile(String addrMobile) {
        this.addrMobile = addrMobile;
    }

    public String getAddrEmail() {
        return this.addrEmail;
    }
    
    public void setAddrEmail(String addrEmail) {
        this.addrEmail = addrEmail;
    }

    public String getAddrPhone() {
        return this.addrPhone;
    }
    
    public void setAddrPhone(String addrPhone) {
        this.addrPhone = addrPhone;
    }

    public String getAddrPostalCode() {
        return this.addrPostalCode;
    }
    
    public void setAddrPostalCode(String addrPostalCode) {
        this.addrPostalCode = addrPostalCode;
    }

    public Integer getStuId() {
        return this.stuId;
    }
    
    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public Integer getAddrIsDefault() {
        return this.addrIsDefault;
    }
    
    public void setAddrIsDefault(Integer addrIsDefault) {
        this.addrIsDefault = addrIsDefault;
    }
   








}