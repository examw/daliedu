package com.changh.sccms.entity;

import java.util.Date;

/**
 * TbExamRecord entity. @author MyEclipse Persistence Tools
 */

public class ExamRecord implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer paperId;
	private String paperName;
	private Integer stuId;
	private Integer rcdStauts;
	private double rcdScore;
	private Date rcdStartTime;
	private Date rcdEndTime;
	private String rcdAnswers;
	private String rcdScoreForEachRule;
	private Integer useTime; //使用时间，单位：分
	private double paperScore;
	private String stuUserName;
	private String rcdScoreForEachQuestion;
	private String rcdTempAnswer;
	private Integer rcdTestNum;
	// Constructors

	/** default constructor */
	public ExamRecord() {
	}

	/** minimal constructor */
	public ExamRecord(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public ExamRecord(Integer id, Integer paperId, String paperName,
			Integer stuId, Integer rcdStauts, double rcdScore,
			Date rcdStartTime, Date rcdEndTime, String rcdAnswers) {
		this.id = id;
		this.paperId = paperId;
		this.paperName = paperName;
		this.stuId = stuId;
		this.rcdStauts = rcdStauts;
		this.rcdScore = rcdScore;
		this.rcdStartTime = rcdStartTime;
		this.rcdEndTime = rcdEndTime;
		this.rcdAnswers = rcdAnswers;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPaperId() {
		return this.paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	public String getPaperName() {
		return this.paperName;
	}

	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}

	public Integer getStuId() {
		return this.stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Integer getRcdStauts() {
		return this.rcdStauts;
	}

	public void setRcdStauts(Integer rcdStauts) {
		this.rcdStauts = rcdStauts;
	}

	public double getRcdScore() {
		return this.rcdScore;
	}

	public void setRcdScore(double rcdScore) {
		this.rcdScore = rcdScore;
	}

	public Date getRcdStartTime() {
		return this.rcdStartTime;
	}

	public void setRcdStartTime(Date rcdStartTime) {
		this.rcdStartTime = rcdStartTime;
	}

	public Date getRcdEndTime() {
		return this.rcdEndTime;
	}

	public void setRcdEndTime(Date rcdEndTime) {
		this.rcdEndTime = rcdEndTime;
	}

	public String getRcdAnswers() {
		return this.rcdAnswers;
	}

	public void setRcdAnswers(String rcdAnswers) {
		this.rcdAnswers = rcdAnswers;
	}

	public String getRcdScoreForEachRule() {
		return rcdScoreForEachRule;
	}

	public void setRcdScoreForEachRule(String rcdScoreForEachRule) {
		this.rcdScoreForEachRule = rcdScoreForEachRule;
	}

	public Integer getUseTime() {
		long l = (this.rcdEndTime.getTime()-this.rcdStartTime.getTime())/1000;
		return (int) (l%60!=0?l/60+1:l/60);
	}

	public void setUseTime(Integer useTime) {
		this.useTime = useTime;
	}

	public double getPaperScore() {
		return paperScore;
	}

	public void setPaperScore(double paperScore) {
		this.paperScore = paperScore;
	}

	public String getStuUserName() {
		return stuUserName;
	}

	public void setStuUserName(String stuUserName) {
		this.stuUserName = stuUserName;
	}

	public String getRcdScoreForEachQuestion() {
		return rcdScoreForEachQuestion;
	}

	public void setRcdScoreForEachQuestion(String rcdScoreForEachQuestion) {
		this.rcdScoreForEachQuestion = rcdScoreForEachQuestion;
	}

	public String getRcdTempAnswer() {
		return rcdTempAnswer;
	}

	public void setRcdTempAnswer(String rcdTempAnswer) {
		this.rcdTempAnswer = rcdTempAnswer;
	}

	public Integer getRcdTestNum() {
		return rcdTestNum;
	}

	public void setRcdTestNum(Integer rcdTestNum) {
		this.rcdTestNum = rcdTestNum;
	}
	
	
}