package com.changh.eschool.entity;
// default package

import java.util.Date;
import java.util.List;
import java.util.Set;


/**
 * ExamCategory entity. @author MyEclipse Persistence Tools
 */

public class ExamCategory1  implements java.io.Serializable {


    // Fields    

     private Integer examId;
     private Integer id;
     private String examName;
     private Integer examPid;
     private Integer examChildrenNum;
     private Date examAddTime;
     private Integer examOrderId;
//     private Set tbGrades = new HashSet(0);
     private List<ExamCategory1> children;
     
     //为了tree的显示
     private String text;
     //private Integer pid;

    // Constructors

    /** default constructor */
    public ExamCategory1() {
    }

	/** minimal constructor */
    public ExamCategory1(Integer examId, Integer id, String examName, Integer examChildrenNum, Date examAddTime, Integer examOrderId) {
        this.examId = examId;
        this.id = id;
        this.examName = examName;
        this.examChildrenNum = examChildrenNum;
        this.examAddTime = examAddTime;
        this.examOrderId = examOrderId;
    }
    
    /** full constructor */
    public ExamCategory1(Integer examId, Integer id, String examName, Integer examPid, Integer examChildrenNum, Date examAddTime, Integer examOrderId, Set tbGrades) {
        this.examId = examId;
        this.id = id;
        this.examName = examName;
        this.examPid = examPid;
        this.examChildrenNum = examChildrenNum;
        this.examAddTime = examAddTime;
        this.examOrderId = examOrderId;
//        this.tbGrades = tbGrades;
    }

   
    // Property accessors

    public Integer getExamId() {
        return this.examId;
    }
    
    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getExamName() {
        return this.examName;
    }
    
    public void setExamName(String examName) {
        this.examName = examName;
    }

    public Integer getExamPid() {
        return this.examPid;
    }
    
    public void setExamPid(Integer examPid) {
        this.examPid = examPid;
    }

    public Integer getExamChildrenNum() {
        return this.examChildrenNum;
    }
    
    public void setExamChildrenNum(Integer examChildrenNum) {
        this.examChildrenNum = examChildrenNum;
    }

    public Date getExamAddTime() {
        return this.examAddTime;
    }
    
    public void setExamAddTime(Date examAddTime) {
        this.examAddTime = examAddTime;
    }

    public Integer getExamOrderId() {
        return this.examOrderId;
    }
    
    public void setExamOrderId(Integer examOrderId) {
        this.examOrderId = examOrderId;
    }

	public List<ExamCategory1> getChildren() {
		return children;
	}

	public void setChildren(List<ExamCategory1> children) {
		this.children = children;
	}

	public String getText() {
		return examName;
	}
//	public Integer getPid()
//	{
//		return examPid;
//	}
	public void setText(String text) {
		this.text = text;
	}
	

//    public Set getTbGrades() {
//        return this.tbGrades;
//    }
//    
//    public void setTbGrades(Set tbGrades) {
//        this.tbGrades = tbGrades;
//    }
   
    







}