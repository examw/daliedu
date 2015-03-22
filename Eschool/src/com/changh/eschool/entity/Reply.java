package com.changh.eschool.entity;
// default package

import java.util.Date;


/**
 * Reply entity. @author MyEclipse Persistence Tools
 */

public class Reply  implements java.io.Serializable {


    // Fields    

     private Integer replyId;
     //private AskOrComlain askOrComlain;
     private Integer acId;
     private Integer id;
     private String replyContent;
     private Date replyAddTime;
     private String replyPeople;


    // Constructors

    /** default constructor */
    public Reply() {
    }

	/** minimal constructor */
    public Reply(Integer id, String replyContent, Date replyAddTime) {
        this.id = id;
        this.replyContent = replyContent;
        this.replyAddTime = replyAddTime;
    }
    
    /** full constructor 
    public Reply(AskOrComlain askOrComlain, Integer id, String replyContent, Date replyAddTime, String replyPeople) {
        this.askOrComlain = askOrComlain;
        this.id = id;
        this.replyContent = replyContent;
        this.replyAddTime = replyAddTime;
        this.replyPeople = replyPeople;
    }
	*/
   
    // Property accessors

    public Integer getReplyId() {
        return this.replyId;
    }
    
    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

//    public AskOrComlain getAskOrComlain() {
//        return this.askOrComlain;
//    }
//    
//    public void setAskOrComlain(AskOrComlain askOrComlain) {
//        this.askOrComlain = askOrComlain;
//    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getReplyContent() {
        return this.replyContent;
    }
    
    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public Date getReplyAddTime() {
        return this.replyAddTime;
    }
    
    public void setReplyAddTime(Date replyAddTime) {
        this.replyAddTime = replyAddTime;
    }

    public String getReplyPeople() {
        return this.replyPeople;
    }
    
    public void setReplyPeople(String replyPeople) {
        this.replyPeople = replyPeople;
    }

	public Integer getAcId() {
		return acId;
	}

	public void setAcId(Integer acId) {
		this.acId = acId;
	}
   
    







}