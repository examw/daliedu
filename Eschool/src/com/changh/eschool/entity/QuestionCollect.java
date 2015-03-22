package com.changh.eschool.entity;
// default package

import java.util.Date;


/**
 * QuestionCollect entity. @author MyEclipse Persistence Tools
 */

public class QuestionCollect  implements java.io.Serializable {


    // Fields    

     private Integer collectId;
     private Student student;
     private Integer id;
//     private Integer questionId;
     private Question question;
     private Date collectAddTime;

    // Constructors

    /** default constructor */
    public QuestionCollect() {
    }

    
    /** full constructor */
//    public QuestionCollect(Integer collectId, Student student, Integer id, Integer questionId, Date collectAddTime) {
//        this.collectId = collectId;
//        this.student = student;
//        this.id = id;
//        this.questionId = questionId;
//        this.collectAddTime = collectAddTime;
//    }

   
    // Property accessors

    public Integer getCollectId() {
        return this.collectId;
    }
    
    public void setCollectId(Integer collectId) {
        this.collectId = collectId;
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

//    public Integer getQuestionId() {
//        return this.questionId;
//    }
//    
//    public void setQuestionId(Integer questionId) {
//        this.questionId = questionId;
//    }

    public Date getCollectAddTime() {
        return this.collectAddTime;
    }
    
    public void setCollectAddTime(Date collectAddTime) {
        this.collectAddTime = collectAddTime;
    }


	public Question getQuestion() {
		return question;
	}


	public void setQuestion(Question question) {
		this.question = question;
	}

    

    







}