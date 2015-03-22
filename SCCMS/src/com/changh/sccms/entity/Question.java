package com.changh.sccms.entity;
// default package

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * Question entity. @author MyEclipse Persistence Tools
 */

public class Question  implements java.io.Serializable {


    // Fields    

     private Integer questionId;
     private Student student;
     private Integer id;
     private Integer examId;
     private Integer gradeId;
     private Integer classId;
     private Integer questionSource; //固定的问题出处 0：课程咨询，1：录音讲座，2：在线作业，3：历年真题，4：教务安排
     private String questionTitle;
     private String questionContent;
     private Integer questionStatus;
     private Date questionAddTime;
     private Set tbAnswers = new HashSet(0);


    // Constructors

    /** default constructor */
    public Question() {
    }

	/** minimal constructor */
    public Question(Integer questionId, Student student, Integer id, Integer examId, Integer gradeId, Integer classId, Integer questionSource, String questionTitle, String questionContent, Integer questionStatus, Date questionAddTime) {
        this.questionId = questionId;
        this.student = student;
        this.id = id;
        this.examId = examId;
        this.gradeId = gradeId;
        this.classId = classId;
        this.questionSource = questionSource;
        this.questionTitle = questionTitle;
        this.questionContent = questionContent;
        this.questionStatus = questionStatus;
        this.questionAddTime = questionAddTime;
    }
    
    /** full constructor */
    public Question(Integer questionId, Student student, Integer id, Integer examId, Integer gradeId, Integer classId, Integer questionSource, String questionTitle, String questionContent, Integer questionStatus, Date questionAddTime, Set tbAnswers) {
        this.questionId = questionId;
        this.student = student;
        this.id = id;
        this.examId = examId;
        this.gradeId = gradeId;
        this.classId = classId;
        this.questionSource = questionSource;
        this.questionTitle = questionTitle;
        this.questionContent = questionContent;
        this.questionStatus = questionStatus;
        this.questionAddTime = questionAddTime;
        this.tbAnswers = tbAnswers;
    }

   
    // Property accessors

    public Integer getQuestionId() {
        return this.questionId;
    }
    
    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
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

    public Integer getExamId() {
        return this.examId;
    }
    
    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    public Integer getGradeId() {
        return this.gradeId;
    }
    
    public void setGradeId(Integer gradeId) {
        this.gradeId = gradeId;
    }

    public Integer getClassId() {
        return this.classId;
    }
    
    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getQuestionSource() {
        return this.questionSource;
    }
    
    public void setQuestionSource(Integer questionSource) {
        this.questionSource = questionSource;
    }

    public String getQuestionTitle() {
        return this.questionTitle;
    }
    
    public void setQuestionTitle(String questionTitle) {
        this.questionTitle = questionTitle;
    }

    public String getQuestionContent() {
        return this.questionContent;
    }
    
    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public Integer getQuestionStatus() {
        return this.questionStatus;
    }
    
    public void setQuestionStatus(Integer questionStatus) {
        this.questionStatus = questionStatus;
    }

    public Date getQuestionAddTime() {
        return this.questionAddTime;
    }
    
    public void setQuestionAddTime(Date questionAddTime) {
        this.questionAddTime = questionAddTime;
    }

    public Set getTbAnswers() {
        return this.tbAnswers;
    }
    
    public void setTbAnswers(Set tbAnswers) {
        this.tbAnswers = tbAnswers;
    }
   








}