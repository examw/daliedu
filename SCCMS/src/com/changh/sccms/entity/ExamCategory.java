package com.changh.sccms.entity;
// default package

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;
import org.junit.Ignore;


/**
 * ExamCategory entity. @author MyEclipse Persistence Tools
 */

public class ExamCategory  implements java.io.Serializable {

    // Fields    
     private Integer examId;
     private Integer id;
     private String examName;
     private Integer examPid;
     private Integer examChildrenNum;
     private Date examAddTime;
     private Integer examOrderId;
     private String examUrl;
     private String examDescription;
     private String examEname;
     private Integer status = 0;
     private String title;
     private String keywords;
     private String description;
     private String parentsId;
     private List<ExamCategory>  children;

    public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	// private Set<Grade> grades = new HashSet<Grade>(0);
     //为了tree的显示
     private String text;
     private Integer pid;
     private  String isexpand;
     

    // Constructors


	public void setPid(Integer pid) {
		this.pid = pid;
	}

	/** default constructor */
    public ExamCategory() {
    }

	/** minimal constructor */
    public ExamCategory(Integer examId, Integer id, String examName, Integer examChildrenNum, Date examAddTime, Integer examOrderId) {
        this.examId = examId;
        this.id = id;
        this.examName = examName;
        this.examChildrenNum = examChildrenNum;
        this.examAddTime = examAddTime;
        this.examOrderId = examOrderId;
    }
    
    /** full constructor */
    public ExamCategory(Integer examId, Integer id, String examName, Integer examPid,
    		Integer examChildrenNum, Date examAddTime, Integer examOrderId,Grade grades) {
        this.examId = examId;
        this.id = id;
        this.examName = examName;
        this.examPid = examPid;
        this.examChildrenNum = examChildrenNum;
        this.examAddTime = examAddTime;
        this.examOrderId = examOrderId;
   
   
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
	public List<ExamCategory> getChildren() {
		return children;
	}

	public void setChildren(List<ExamCategory> children) {
		this.children = children;
	}
	public String getText() {
		if(examChildrenNum==0){
			return examName;
		}else{
			return examName+"("+examChildrenNum+")";
		}
	}
	public Integer getPid()
	{
		return examPid;
	}
	public void setText(String text) {
		this.text = text;
	}

	

	public String getIsexpand() {
		return isexpand;
	}

	public void setIsexpand(String isexpand) {
		this.isexpand = isexpand;
	}

	public String getExamUrl() {
		return examUrl;
	}

	public void setExamUrl(String examUrl) {
		this.examUrl = examUrl;
	}
	
	@JSON(serialize=false)
	public String getExamDescription() {
		return examDescription;
	}
	
	public void setExamDescription(String examDescription) {
		this.examDescription = examDescription;
	}

	public String getExamEname() {
		return examEname;
	}

	public void setExamEname(String examEname) {
		this.examEname = examEname;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getParentsId() {
		return parentsId;
	}

	public void setParentsId(String parentsId) {
		this.parentsId = parentsId;
	}
}