package com.changh.eschool.entity;
// default package

import java.util.Date;


/**
 * Answer entity. @author MyEclipse Persistence Tools
 */

public class Answer  implements java.io.Serializable {


    // Fields    

     private Integer answerId;
//     private Question question;
     private Integer questionId;
     private Integer id;
     private Integer tchId;
     private String answerContent;
     private Date answerTime;
     private Integer answerValuation;//´ð°¸ÆÀ¼Û


    // Constructors

    /** default constructor */
    public Answer() {
    }

	/** minimal constructor */
    public Answer(Integer answerId, /*Question question,*/ Integer id, Integer tchId, String answerContent, Date answerTime) {
        this.answerId = answerId;
        //this.question = question;
        this.id = id;
        this.tchId = tchId;
        this.answerContent = answerContent;
        this.answerTime = answerTime;
    }
    
    /** full constructor */
    public Answer(Integer answerId,/*Question question,*/ Integer id, Integer tchId, String answerContent, Date answerTime, Integer answerValuation) {
        this.answerId = answerId;
        //this.question = question;
        this.id = id;
        this.tchId = tchId;
        this.answerContent = answerContent;
        this.answerTime = answerTime;
        this.answerValuation = answerValuation;
    }

   
    // Property accessors

    public Integer getAnswerId() {
        return this.answerId;
    }
    
    public void setAnswerId(Integer answerId) {
        this.answerId = answerId;
    }

//    public Question getQuestion() {
//        return this.question;
//    }
//    
//    public void setQuestion(Question question) {
//        this.question = question;
//    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTchId() {
        return this.tchId;
    }
    
    public void setTchId(Integer tchId) {
        this.tchId = tchId;
    }

    public String getAnswerContent() {
        return this.answerContent;
    }
    
    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }

    public Date getAnswerTime() {
        return this.answerTime;
    }
    
    public void setAnswerTime(Date answerTime) {
        this.answerTime = answerTime;
    }

    public Integer getAnswerValuation() {
        return this.answerValuation;
    }
    
    public void setAnswerValuation(Integer answerValuation) {
        this.answerValuation = answerValuation;
    }

	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}
   
    







}