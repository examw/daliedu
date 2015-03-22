package com.changh.sccms.entity;
// default package

import java.util.Date;


/**
 * Administrator entity. @author MyEclipse Persistence Tools
 */

public class Administrator  implements java.io.Serializable {


    // Fields    

     private Integer admId;
     private Integer id;
     private String admUsername;
     private String admPassword;
     private String admName;
     private Date admAddTime;
     private Integer admLoginNumbers;
     private Date admLastLoginTime;
     private String admLastLoginIp;
     private Integer admRole;
     private Integer admStatus;
     //用于显示到页面的field
    /* private String status;*/
     private Role role;
     private String name;

    // Constructors

    /** default constructor */
    public Administrator() {
    }

	/** minimal constructor */
    public Administrator(Integer admId, Integer id, String admUsername, String admPassword, String admName) {
        this.admId = admId;
        this.id = id;
        this.admUsername = admUsername;
        this.admPassword = admPassword;
        this.admName = admName;
    }
    
    /** full constructor */
    public Administrator(Integer admId, Integer id, String admUsername, String admPassword, String admName, Date admAddTime, Integer admLoginNumbers, Date admLastLoginTime, String admLastLoginIp, Integer admRole, Integer admStatus) {
        this.admId = admId;
        this.id = id;
        this.admUsername = admUsername;
        this.admPassword = admPassword;
        this.admName = admName;
        this.admAddTime = admAddTime;
        this.admLoginNumbers = admLoginNumbers;
        this.admLastLoginTime = admLastLoginTime;
        this.admLastLoginIp = admLastLoginIp;
        this.admRole = admRole;
        this.admStatus = admStatus;
    }

   
    // Property accessors

    public Integer getAdmId() {
        return this.admId;
    }
    
    public void setAdmId(Integer admId) {
        this.admId = admId;
    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdmUsername() {
        return this.admUsername;
    }
    
    public void setAdmUsername(String admUsername) {
        this.admUsername = admUsername;
    }

    public String getAdmPassword() {
        return this.admPassword;
    }
    
    public void setAdmPassword(String admPassword) {
        this.admPassword = admPassword;
    }

    public String getAdmName() {
        return this.admName;
    }
    
    public void setAdmName(String admName) {
        this.admName = admName;
    }

    public Date getAdmAddTime() {
        return this.admAddTime;
    }
    
    public void setAdmAddTime(Date admAddTime) {
        this.admAddTime = admAddTime;
    }

    public Integer getAdmLoginNumbers() {
        return this.admLoginNumbers;
    }
    
    public void setAdmLoginNumbers(Integer admLoginNumbers) {
        this.admLoginNumbers = admLoginNumbers;
    }

    public Date getAdmLastLoginTime() {
        return this.admLastLoginTime;
    }
    
    public void setAdmLastLoginTime(Date admLastLoginTime) {
        this.admLastLoginTime = admLastLoginTime;
    }

    public String getAdmLastLoginIp() {
        return this.admLastLoginIp;
    }
    
    public void setAdmLastLoginIp(String admLastLoginIp) {
        this.admLastLoginIp = admLastLoginIp;
    }

    public Integer getAdmRole() {
        return this.admRole;
    }
    
    public void setAdmRole(Integer admRole) {
        this.admRole = admRole;
    }

    public Integer getAdmStatus() {
        return this.admStatus;
    }
    
    public void setAdmStatus(Integer admStatus) {
        this.admStatus = admStatus;
    }
    /*//用于显示到页面
	public String getStatus() {
		return admStatus==1?"启用":"禁用";
	}*/

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getName() {
		return role.getRoleName();
	}

	public void setRoleName(String name) {
		this.name = name;
	}


}