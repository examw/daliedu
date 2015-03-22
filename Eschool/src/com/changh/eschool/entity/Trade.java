package com.changh.eschool.entity;
// default package

import java.util.Date;


/**
 * Trade entity. @author MyEclipse Persistence Tools
 */

public class Trade  implements java.io.Serializable {


    // Fields    

     private Integer tradeId;
     private Integer id;
     private Date tradeTime;
     private double tradeMoney;
     private String tradeIp;
     private Integer orderId;
     private String cardId;
     private Integer tradeType;	//0空出来，用来查询所有类型 ，1：充值，2：购买课程，3：
     private String tradeNote;
     private String tradePattern;//交易方式，支付宝，网银，学习卡
     private String tradeOrderNo;
     private double tradeCardBalance;
     private double tradeCashBalance;
     private String type;
     private Integer stuId;
    // Constructors

    /** default constructor */
    public Trade() {
    }

	/** minimal constructor */
    public Trade(Integer id, Date tradeTime, double tradeMoney) {
        this.id = id;
        this.tradeTime = tradeTime;
        this.tradeMoney = tradeMoney;
    }
    
    /** full constructor */
    public Trade(Integer id, Date tradeTime, double tradeMoney, String tradeIp, Integer orderId, String cardId, Integer tradeType, String tradeNote) {
        this.id = id;
        this.tradeTime = tradeTime;
        this.tradeMoney = tradeMoney;
        this.tradeIp = tradeIp;
        this.orderId = orderId;
        this.cardId = cardId;
        this.tradeType = tradeType;
        this.tradeNote = tradeNote;
    }

   
    // Property accessors

    public Integer getTradeId() {
        return this.tradeId;
    }
    
    public void setTradeId(Integer tradeId) {
        this.tradeId = tradeId;
    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Date getTradeTime() {
        return this.tradeTime;
    }
    
    public void setTradeTime(Date tradeTime) {
        this.tradeTime = tradeTime;
    }

    public double getTradeMoney() {
        return this.tradeMoney;
    }
    
    public void setTradeMoney(double tradeMoney) {
        this.tradeMoney = tradeMoney;
    }

    public String getTradeIp() {
        return this.tradeIp;
    }
    
    public void setTradeIp(String tradeIp) {
        this.tradeIp = tradeIp;
    }

    public Integer getOrderId() {
        return this.orderId;
    }
    
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public Integer getTradeType() {
        return this.tradeType;
    }
    
    public void setTradeType(Integer tradeType) {
        this.tradeType = tradeType;
    }

    public String getTradeNote() {
        return this.tradeNote;
    }
    
    public void setTradeNote(String tradeNote) {
        this.tradeNote = tradeNote;
    }

	public String getType() {
		return tradeType==1?"网上支付":tradeType==2?"银行汇款":"学习卡支付";
	}

	public String getTradePattern() {
		return tradePattern;
	}

	public void setTradePattern(String tradePattern) {
		this.tradePattern = tradePattern;
	}

	public String getTradeOrderNo() {
		return tradeOrderNo;
	}

	public void setTradeOrderNo(String tradeOrderNo) {
		this.tradeOrderNo = tradeOrderNo;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public double getTradeCardBalance() {
		return tradeCardBalance;
	}

	public void setTradeCardBalance(double tradeCardBalance) {
		this.tradeCardBalance = tradeCardBalance;
	}

	public double getTradeCashBalance() {
		return tradeCashBalance;
	}

	public void setTradeCashBalance(double tradeCashBalance) {
		this.tradeCashBalance = tradeCashBalance;
	}
	
	
	
   
	







}