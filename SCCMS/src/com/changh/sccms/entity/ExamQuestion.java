package com.changh.sccms.entity;
// default package

import java.util.Date;

import com.changh.sccms.until.Constant;


/**
 * ExamQuestion entity. @author MyEclipse Persistence Tools
 */

public class ExamQuestion  implements java.io.Serializable {


    // Fields    

     private Integer questId;
     private Integer id;
     private Integer questRuleId;
     private Integer questPaperId;
     private Integer questExamId;
     private String questContent;
     private String questAnswer;
     private String questAnalysis;
     private Integer questType;
     private Integer questOptionNum;
     private Integer questOrderId;
     private Date questAddTime;
     private String questLinkQuestionId;
     private String questEditor;
     private Integer questClickNum;
     private Integer questErrorNum;
     private String userAnswer;
     private String questMd5code;
     private String type;
     private double standarnScore;
    // Constructors

    /** default constructor */
    public ExamQuestion() {
    }

	/** minimal constructor */
    public ExamQuestion(Integer id) {
        this.id = id;
    }
    
    /** full constructor */
    public ExamQuestion(Integer id, Integer questRuleId, Integer questPaperId, Integer questExamId, String questContent, String questAnswer, String questAnalysis, Integer questType, Integer questOptionNum, Integer questOrderId, Date questAddTime, String questLinkQuestionId, String questEditor, Integer questClickNum, Integer questErrorNum, String questMd5code) {
        this.id = id;
        this.questRuleId = questRuleId;
        this.questPaperId = questPaperId;
        this.questExamId = questExamId;
        this.questContent = questContent;
        this.questAnswer = questAnswer;
        this.questAnalysis = questAnalysis;
        this.questType = questType;
        this.questOptionNum = questOptionNum;
        this.questOrderId = questOrderId;
        this.questAddTime = questAddTime;
        this.questLinkQuestionId = questLinkQuestionId;
        this.questEditor = questEditor;
        this.questClickNum = questClickNum;
        this.questErrorNum = questErrorNum;
        this.questMd5code = questMd5code;
    }

   
    // Property accessors

    public Integer getQuestId() {
        return this.questId;
    }
    
    public void setQuestId(Integer questId) {
        this.questId = questId;
    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuestRuleId() {
        return this.questRuleId;
    }
    
    public void setQuestRuleId(Integer questRuleId) {
        this.questRuleId = questRuleId;
    }

    public Integer getQuestPaperId() {
        return this.questPaperId;
    }
    
    public void setQuestPaperId(Integer questPaperId) {
        this.questPaperId = questPaperId;
    }

    public Integer getQuestExamId() {
        return this.questExamId;
    }
    
    public void setQuestExamId(Integer questExamId) {
        this.questExamId = questExamId;
    }

    public String getQuestContent() {
        return this.questContent;
    }
    
    public void setQuestContent(String questContent) {
        this.questContent = questContent;
    }

    public String getQuestAnswer() {
        return this.questAnswer;
    }
    
    public void setQuestAnswer(String questAnswer) {
        this.questAnswer = questAnswer;
    }

    public String getQuestAnalysis() {
        return this.questAnalysis;
    }
    
    public void setQuestAnalysis(String questAnalysis) {
        this.questAnalysis = questAnalysis;
    }

    public Integer getQuestType() {
        return this.questType;
    }
    
    public void setQuestType(Integer questType) {
        this.questType = questType;
    }

    public Integer getQuestOptionNum() {
        return this.questOptionNum;
    }
    
    public void setQuestOptionNum(Integer questOptionNum) {
        this.questOptionNum = questOptionNum;
    }

    public Integer getQuestOrderId() {
        return this.questOrderId;
    }
    
    public void setQuestOrderId(Integer questOrderId) {
        this.questOrderId = questOrderId;
    }

    public Date getQuestAddTime() {
        return this.questAddTime;
    }
    
    public void setQuestAddTime(Date questAddTime) {
        this.questAddTime = questAddTime;
    }

    public String getQuestLinkQuestionId() {
        return this.questLinkQuestionId;
    }
    
    public void setQuestLinkQuestionId(String questLinkQuestionId) {
        this.questLinkQuestionId = questLinkQuestionId;
    }

    public String getQuestEditor() {
        return this.questEditor;
    }
    
    public void setQuestEditor(String questEditor) {
        this.questEditor = questEditor;
    }

    public Integer getQuestClickNum() {
        return this.questClickNum;
    }
    
    public void setQuestClickNum(Integer questClickNum) {
        this.questClickNum = questClickNum;
    }

    public Integer getQuestErrorNum() {
        return this.questErrorNum;
    }
    
    public void setQuestErrorNum(Integer questErrorNum) {
        this.questErrorNum = questErrorNum;
    }

    public String getQuestMd5code() {
        return this.questMd5code;
    }
    
    public void setQuestMd5code(String questMd5code) {
        this.questMd5code = questMd5code;
    }
   
	public String getType() {
		return questType==Constant.Q_SINGLE_SELECT?"单选题":questType==Constant.Q_MULTI_SELECT?"多选题":questType==Constant.Q_JUDGE?"判断题":questType==Constant.Q_QANDA?"问答题":"其他";
	}
   //显示带格式题目
	public String getFormatString(){
		if(1==questType||2==questType)
		{
			String[] arr = questContent.replaceAll("[A-Z][.．、)]", "@@@").split("@@@");
			StringBuffer buf = new StringBuffer();
			buf.append(arr[0]);
			buf.append("<br />");
			buf.append("<div class='hrline'></div>");
			for(int i=1;i<arr.length;i++)
			{
				buf.append(((char)(64+i))+"．");
				buf.append(arr[i]);
				buf.append("<br />");
			}
			return buf.toString();
		}
		return questContent;
	}
	//带答案和解析的题目
	public String getFormatStringWithAnswer()
	{
		StringBuffer buf = new StringBuffer();
		buf.append(getFormatString());
		buf.append("<br />");
		if(questAnswer!=null&&!questAnswer.equals(""))
		{
			buf.append("[答案]:");
			buf.append(questAnswer);
			buf.append("<br />");
		}
		if(questAnalysis!=null&&!questAnalysis.equals(""))
		{
			buf.append("[解析]:");
			buf.append(questAnalysis);
			buf.append("<br />");
		}
		return buf.toString();
	}

	public String getUserAnswer() {
		return userAnswer;
	}

	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}

	public double getStandarnScore() {
		return standarnScore;
	}

	public void setStandarnScore(double standarnScore) {
		this.standarnScore = standarnScore;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((questAnalysis == null) ? 0 : questAnalysis.hashCode());
		result = prime * result
				+ ((questAnswer == null) ? 0 : questAnswer.hashCode());
		result = prime * result
				+ ((questContent == null) ? 0 : questContent.hashCode());
		result = prime * result + ((questId == null) ? 0 : questId.hashCode());
		result = prime
				* result
				+ ((questLinkQuestionId == null) ? 0 : questLinkQuestionId
						.hashCode());
		result = prime * result
				+ ((questMd5code == null) ? 0 : questMd5code.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ExamQuestion other = (ExamQuestion) obj;
		if (questAnalysis == null) {
			if (other.questAnalysis != null)
				return false;
		} else if (!questAnalysis.equals(other.questAnalysis))
			return false;
		if (questAnswer == null) {
			if (other.questAnswer != null)
				return false;
		} else if (!questAnswer.equals(other.questAnswer))
			return false;
		if (questContent == null) {
			if (other.questContent != null)
				return false;
		} else if (!questContent.equals(other.questContent))
			return false;
		if (questId == null) {
			if (other.questId != null)
				return false;
		} else if (!questId.equals(other.questId))
			return false;
		if (questLinkQuestionId == null) {
			if (other.questLinkQuestionId != null)
				return false;
		} else if (!questLinkQuestionId.equals(other.questLinkQuestionId))
			return false;
		if (questMd5code == null) {
			if (other.questMd5code != null)
				return false;
		} else if (!questMd5code.equals(other.questMd5code))
			return false;
		return true;
	}

	




}