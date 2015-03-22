package com.changh.eschool.entity;

import java.util.Date;

/**
 * Note entity. @author MyEclipse Persistence Tools
 */

public class Note implements java.io.Serializable {

	// Fields

	private Integer noteId;
	private Integer stuId;
	private Integer id;
	private Integer classId;
	private Date noteAddTime;
	private String noteContent;
	private float noteVideotime;
	private Integer noteCouresType;

	// Constructors

	/** default constructor */
	public Note() {
	}

	/** minimal constructor */
	public Note(Integer noteId,  Integer id, Integer classId,
			Date noteAddTime, String noteContent) {
		this.noteId = noteId;
		
		this.id = id;
		this.classId = classId;
		this.noteAddTime = noteAddTime;
		this.noteContent = noteContent;
	}

	/** full constructor */
	public Note(Integer noteId,  Integer id, Integer classId,
			Date noteAddTime, String noteContent, float noteVideotime,
			Integer noteCouresType) {
		this.noteId = noteId;
		this.id = id;
		this.classId = classId;
		this.noteAddTime = noteAddTime;
		this.noteContent = noteContent;
		this.setNoteVideotime(noteVideotime);
		this.noteCouresType = noteCouresType;
	}

	// Property accessors

	public Integer getNoteId() {
		return this.noteId;
	}

	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
	}


	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getClassId() {
		return this.classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Date getNoteAddTime() {
		return this.noteAddTime;
	}

	public void setNoteAddTime(Date noteAddTime) {
		this.noteAddTime = noteAddTime;
	}

	public String getNoteContent() {
		return this.noteContent;
	}

	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}

	public Integer getNoteCouresType() {
		return this.noteCouresType;
	}

	public void setNoteCouresType(Integer noteCouresType) {
		this.noteCouresType = noteCouresType;
	}

	public float getNoteVideotime() {
		return noteVideotime;
	}

	public void setNoteVideotime(float noteVideotime) {
		this.noteVideotime = noteVideotime;
	}

}