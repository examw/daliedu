package com.changh.sccms.entity;
// default package

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.changh.sccms.until.Constant;


/**
 * ExamPaper entity. @author MyEclipse Persistence Tools
 */

public class ExamPaper  implements java.io.Serializable {


    // Fields    
     private Integer paperId;
     private Integer id;
     private Integer paperExamId;
     private Integer paperEGradeId;
     private Integer paperEGCheaterId;
     private String paperName;
     private Integer paperTime;
     private Integer paperScore;
     private Date paperAddTime;
     private Integer paperType;
     private Integer paperClickNum;
     private Integer paperIsChecked;
     private String paperEditor;
     private List<ExamRule> examRules = new ArrayList();
     private String type;
     private String paperLinkName;
    // Constructors

    /** default constructor */
    public ExamPaper() {
    }

	/** minimal constructor */
    public ExamPaper(Integer id, String paperName, Integer paperTime, Integer paperScore, Date paperAddTime, Integer paperType) {
        this.id = id;
        this.paperName = paperName;
        this.paperTime = paperTime;
        this.paperScore = paperScore;
        this.paperAddTime = paperAddTime;
        this.paperType = paperType;
    }
    
    /** full constructor */
    public ExamPaper(Integer id, Integer paperExamId, Integer paperEGradeId, Integer paperEGCheaterId, String paperName, Integer paperTime, Integer paperScore, Date paperAddTime, Integer paperType, Integer paperClickNum, Integer paperIsChecked, String paperEditor, List examRules) {
        this.id = id;
        this.paperExamId = paperExamId;
        this.paperEGradeId = paperEGradeId;
        this.paperEGCheaterId = paperEGCheaterId;
        this.paperName = paperName;
        this.paperTime = paperTime;
        this.paperScore = paperScore;
        this.paperAddTime = paperAddTime;
        this.paperType = paperType;
        this.paperClickNum = paperClickNum;
        this.paperIsChecked = paperIsChecked;
        this.paperEditor = paperEditor;
        this.examRules = examRules;
    }

   
    // Property accessors

    public Integer getPaperId() {
        return this.paperId;
    }
    
    public void setPaperId(Integer paperId) {
        this.paperId = paperId;
    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPaperExamId() {
        return this.paperExamId;
    }
    
    public void setPaperExamId(Integer paperExamId) {
        this.paperExamId = paperExamId;
    }

    public Integer getPaperEGradeId() {
        return this.paperEGradeId;
    }
    
    public void setPaperEGradeId(Integer paperEGradeId) {
        this.paperEGradeId = paperEGradeId;
    }

    public Integer getPaperEGCheaterId() {
        return this.paperEGCheaterId;
    }
    
    public void setPaperEGCheaterId(Integer paperEGCheaterId) {
        this.paperEGCheaterId = paperEGCheaterId;
    }

    public String getPaperName() {
        return this.paperName;
    }
    
    public void setPaperName(String paperName) {
        this.paperName = paperName;
    }

    public Integer getPaperTime() {
        return this.paperTime;
    }
    
    public void setPaperTime(Integer paperTime) {
        this.paperTime = paperTime;
    }

    public Integer getPaperScore() {
        return this.paperScore;
    }
    
    public void setPaperScore(Integer paperScore) {
        this.paperScore = paperScore;
    }

    public Date getPaperAddTime() {
        return this.paperAddTime;
    }
    
    public void setPaperAddTime(Date paperAddTime) {
        this.paperAddTime = paperAddTime;
    }

    public Integer getPaperType() {
        return this.paperType;
    }
    
    public void setPaperType(Integer paperType) {
        this.paperType = paperType;
    }

    public Integer getPaperClickNum() {
        return this.paperClickNum;
    }
    
    public void setPaperClickNum(Integer paperClickNum) {
        this.paperClickNum = paperClickNum;
    }

    public Integer getPaperIsChecked() {
        return this.paperIsChecked;
    }
    
    public void setPaperIsChecked(Integer paperIsChecked) {
        this.paperIsChecked = paperIsChecked;
    }

    public String getPaperEditor() {
        return this.paperEditor;
    }
    
    public void setPaperEditor(String paperEditor) {
        this.paperEditor = paperEditor;
    }

	public List<ExamRule> getExamRules() {
		return examRules;
	}

	public void setExamRules(List<ExamRule> examRules) {
		this.examRules = examRules;
	}

	public String getType() {
		return paperType==Constant.PAPER_TYPE_EXERCISE?"Á·Ï°¾í":paperType==Constant.PAPER_TYPE_SIMULATE?"Ä£Äâ¾í":paperType==Constant.PAPER_TYPE_REAL?"ÕæÌâ¾í":"Ìâ¿â";
	}

	public String getPaperLinkName() {
		return paperLinkName;
	}

	public void setPaperLinkName(String paperLinkName) {
		this.paperLinkName = paperLinkName;
	}
   
    







}