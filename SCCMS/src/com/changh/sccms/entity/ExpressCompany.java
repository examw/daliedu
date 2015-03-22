package com.changh.sccms.entity;
// default package



/**
 * ExpressCompany entity. @author MyEclipse Persistence Tools
 * 快递公司
 */

public class ExpressCompany  implements java.io.Serializable {


    // Fields    

     private Integer epcId;
     private Integer id;
     private String epcName;
     private String epcUrl;		//快递公司网址
     private String epcPhone;
     private Integer epcOrderId;//排序id
     private String epcAddr; //地址

    // Constructors

    /** default constructor */
    public ExpressCompany() {
    }

    
    /** full constructor */
    public ExpressCompany(Integer epcId, Integer id, String epcName, String epcUrl, String epcPhone, String epcAddr,Integer epcOrderId) {
        this.epcId = epcId;
        this.id = id;
        this.epcName = epcName;
        this.epcUrl = epcUrl;
        this.epcPhone = epcPhone;
        this.epcAddr=epcAddr;
        this.epcOrderId = epcOrderId;
    }

   
    // Property accessors

    public Integer getEpcId() {
        return this.epcId;
    }
    
    public void setEpcId(Integer epcId) {
        this.epcId = epcId;
    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getEpcName() {
        return this.epcName;
    }
    
    public void setEpcName(String epcName) {
        this.epcName = epcName;
    }

    public String getEpcUrl() {
        return this.epcUrl;
    }
    
    public void setEpcUrl(String epcUrl) {
        this.epcUrl = epcUrl;
    }

    public String getEpcPhone() {
        return this.epcPhone;
    }
    
    public void setEpcPhone(String epcPhone) {
        this.epcPhone = epcPhone;
    }

    public Integer getEpcOrderId() {
        return this.epcOrderId;
    }
    
    public void setEpcOrderId(Integer epcOrderId) {
        this.epcOrderId = epcOrderId;
    }


	public String getEpcAddr() {
		return epcAddr;
	}


	public void setEpcAddr(String epcAddr) {
		this.epcAddr = epcAddr;
	}
   
    







}