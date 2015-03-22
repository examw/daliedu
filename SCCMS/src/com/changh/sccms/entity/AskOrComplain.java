package com.changh.sccms.entity;
// default package

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * AskOrComlain entity. @author MyEclipse Persistence Tools
 */

public class AskOrComplain  implements java.io.Serializable {


    // Fields    

     private Integer acId;
     private Integer id;
     private Integer gradeId;
     private String acName;
     private Integer acType;
     private Integer acStatus;
     private Date acAddTime;
     private String acContent;
     private Integer stuId;
//     private Set tbReplies = new HashSet(0);
     private String type;
     private String status;
    // Constructors

    /** default constructor */
    public AskOrComplain() {
    }

	/** minimal constructor */
    public AskOrComplain(Integer id, String acName, Integer acType, Integer acStatus, Date acAddTime, String acContent) {
        this.id = id;
        this.acName = acName;
        this.acType = acType;
        this.acStatus = acStatus;
        this.acAddTime = acAddTime;
        this.acContent = acContent;
    }
    
    /** full constructor */
    public AskOrComplain(Integer id, Integer gradeId, String acName, Integer acType, Integer acStatus, Date acAddTime, String acContent//, Set tbReplies
    		) {
        this.id = id;
        this.gradeId = gradeId;
        this.acName = acName;
        this.acType = acType;
        this.acStatus = acStatus;
        this.acAddTime = acAddTime;
        this.acContent = acContent;
        //this.tbReplies = tbReplies;
    }

   
    // Property accessors

    public Integer getAcId() {
        return this.acId;
    }
    
    public void setAcId(Integer acId) {
        this.acId = acId;
    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGradeId() {
        return this.gradeId;
    }
    
    public void setGradeId(Integer gradeId) {
        this.gradeId = gradeId;
    }

    public String getAcName() {
        return this.acName;
    }
    
    public void setAcName(String acName) {
        this.acName = acName;
    }

    public Integer getAcType() {
        return this.acType;
    }
    
    public void setAcType(Integer acType) {
        this.acType = acType;
    }

    public Integer getAcStatus() {
        return this.acStatus;
    }
    
    public void setAcStatus(Integer acStatus) {
        this.acStatus = acStatus;
    }

    public Date getAcAddTime() {
        return this.acAddTime;
    }
    
    public void setAcAddTime(Date acAddTime) {
        this.acAddTime = acAddTime;
    }

    public String getAcContent() {
        return this.acContent;
    }
    
    public void setAcContent(String acContent) {
        this.acContent = acContent;
    }

//    public Set getTbReplies() {
//        return this.tbReplies;
//    }
//    
//    public void setTbReplies(Set tbReplies) {
//        this.tbReplies = tbReplies;
//    }

	public String getType() {
		return this.acType==0?"咨询":"投诉";
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return this.acStatus==0?"未解决":"已回复";
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	
}