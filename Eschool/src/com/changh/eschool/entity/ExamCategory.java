package com.changh.eschool.entity;
// default package

import java.util.Date;
import java.util.List;


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
    
    public String getExamUrl() {
		return examUrl;
	}

	public void setExamUrl(String examUrl) {
		this.examUrl = examUrl;
	}

	public String getExamDescription() {
		return examDescription;
	}

	public void setExamDescription(String examDescription) {
		this.examDescription = examDescription;
	}

	// private Set<Grade> grades = new HashSet<Grade>(0);
     private List<ExamCategory>  children;
     
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
    		Integer examChildrenNum, Date examAddTime, Integer examOrderId) {
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
		return examName;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((examId == null) ? 0 : examId.hashCode());
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
		ExamCategory other = (ExamCategory) obj;
		if (examId == null) {
			if (other.examId != null)
				return false;
		} else if (!examId.equals(other.examId))
			return false;
		return true;
	}

	

	/*public Set<ExamCategory> getChildren() {
		return children;
	}

	public void setChildren(Set<ExamCategory> children) {
		this.children = children;
	}*/

	/*public Set<Grade> getGrades() {
		return grades;
	}

	public void setGrades(Set<Grade> grades) {
		this.grades = grades;
	}
*/
}