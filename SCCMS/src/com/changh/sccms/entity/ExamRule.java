package com.changh.sccms.entity;

import com.changh.sccms.until.Constant;

// default package



/**
 * ExamRule entity. @author MyEclipse Persistence Tools
 */

public class ExamRule  implements java.io.Serializable {


    // Fields    

     private Integer ruleId;
     private ExamPaper examPaper;
     private Integer id;
     private String ruleTitle;
     private Integer ruleIdInPaper;
     private Integer ruleType;
     private Integer ruleQuestionNum;
     private double ruleScoreForEach;
     private Integer ruleActualAddNum;
     private String ruleScoreSet;
     private String type;
     private Integer paperId;
     private String title;
     private String fullTitle;
     
     private String userScore;//学员大题得分情况
    // Constructors
     
    /** default constructor */
    public ExamRule() {
    }

	/** minimal constructor */
    public ExamRule(ExamPaper examPaper, Integer id) {
        this.examPaper = examPaper;
        this.id = id;
    }
    
    /** full constructor */
    public ExamRule(ExamPaper examPaper, Integer id, String ruleTitle, Integer ruleIdInPaper, Integer ruleType, Integer ruleQuestionNum, double ruleScoreForEach, Integer ruleActualAddNum, String ruleScoreSet) {
        this.examPaper = examPaper;
        this.id = id;
        this.ruleTitle = ruleTitle;
        this.ruleIdInPaper = ruleIdInPaper;
        this.ruleType = ruleType;
        this.ruleQuestionNum = ruleQuestionNum;
        this.ruleScoreForEach = ruleScoreForEach;
        this.ruleActualAddNum = ruleActualAddNum;
        this.ruleScoreSet = ruleScoreSet;
    }

   
    // Property accessors

    public Integer getRuleId() {
        return this.ruleId;
    }
    
    public void setRuleId(Integer ruleId) {
        this.ruleId = ruleId;
    }

    public ExamPaper getExamPaper() {
        return this.examPaper;
    }
    
    public void setExamPaper(ExamPaper examPaper) {
        this.examPaper = examPaper;
    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getRuleTitle() {
        return this.ruleTitle;
    }
    
    public void setRuleTitle(String ruleTitle) {
        this.ruleTitle = ruleTitle;
    }

    public Integer getRuleIdInPaper() {
        return this.ruleIdInPaper;
    }
    
    public void setRuleIdInPaper(Integer ruleIdInPaper) {
        this.ruleIdInPaper = ruleIdInPaper;
    }

    public Integer getRuleType() {
        return this.ruleType;
    }
    
    public void setRuleType(Integer ruleType) {
        this.ruleType = ruleType;
    }

    public Integer getRuleQuestionNum() {
        return this.ruleQuestionNum;
    }
    
    public void setRuleQuestionNum(Integer ruleQuestionNum) {
        this.ruleQuestionNum = ruleQuestionNum;
    }

    public double getRuleScoreForEach() {
        return this.ruleScoreForEach;
    }
    
    public void setRuleScoreForEach(double ruleScoreForEach) {
        this.ruleScoreForEach = ruleScoreForEach;
    }

    public Integer getRuleActualAddNum() {
        return this.ruleActualAddNum;
    }
    
    public void setRuleActualAddNum(Integer ruleActualAddNum) {
        this.ruleActualAddNum = ruleActualAddNum;
    }

    public String getRuleScoreSet() {
        return this.ruleScoreSet;
    }
    
    public void setRuleScoreSet(String ruleScoreSet) {
        this.ruleScoreSet = ruleScoreSet;
    }

	public String getType() {
		return ruleType==Constant.Q_SINGLE_SELECT?"单选题":ruleType==Constant.Q_MULTI_SELECT?"多选题":ruleType==Constant.Q_JUDGE?"判断题":ruleType==Constant.Q_QANDA?"问答题":"其他";
	}

	public Integer getPaperId() {
		return paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}
   
	public String getTitle() {
		return this.ruleTitle.split("@@@")[0];
	}

	public String getUserScore() {
		return userScore;
	}

	public void setUserScore(String userScore) {
		this.userScore = userScore;
	}

	public String getFullTitle() {
		String[] arr = this.ruleTitle.split("@@@");
		return arr[0]+"(每题"+this.ruleScoreForEach+"分,共"+(this.ruleScoreForEach*this.ruleQuestionNum)+"分)"+arr[1];
	}

	public void setFullTitle(String fullTitle) {
		this.fullTitle = fullTitle;
	}
    







}