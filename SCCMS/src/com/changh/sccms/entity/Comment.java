package com.changh.sccms.entity;

import java.util.Date;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */

public class Comment implements java.io.Serializable {

	// Fields

	private Integer commentId;
	private Integer id;
	private String commentContent;
	private Integer commentScore;
	private Integer stuId;
	private Integer tchId;
	private Date commentAddTime;
	private Student student;

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** minimal constructor */
	public Comment(Integer commentId, Integer id) {
		this.commentId = commentId;
		this.id = id;
	}

	/** full constructor */
	public Comment(Integer commentId, Integer id, String commentContent,
			Integer commentScore, Integer stuId, Integer tchId) {
		this.commentId = commentId;
		this.id = id;
		this.commentContent = commentContent;
		this.commentScore = commentScore;
		this.stuId = stuId;
		this.tchId = tchId;
	}

	// Property accessors

	public Integer getCommentId() {
		return this.commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCommentContent() {
		return this.commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Integer getCommentScore() {
		return this.commentScore;
	}

	public void setCommentScore(Integer commentScore) {
		this.commentScore = commentScore;
	}

	public Integer getStuId() {
		return this.stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Integer getTchId() {
		return this.tchId;
	}

	public void setTchId(Integer tchId) {
		this.tchId = tchId;
	}

	public Date getCommentAddTime() {
		return commentAddTime;
	}

	public void setCommentAddTime(Date commentAddTime) {
		this.commentAddTime = commentAddTime;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

}