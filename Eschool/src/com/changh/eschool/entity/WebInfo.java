package com.changh.eschool.entity;

/**
 * TbWebInfo entity. @author MyEclipse Persistence Tools
 */

public class WebInfo implements java.io.Serializable {

	// Fields

	private Integer webInfoId;
	private String webInfoComName;
	private String webInfoComAddress;
	private String webInfoComPostCode;
	private String webInfoComEmail;
	private String webInfoServiceTel;
	private String webInfoOfficePhone;
	private String webInfoComfax;
	private String webInfoCopyright;
	private String webInfoIndex;
	private String webInfoWorkday;

	// Constructors

	/** default constructor */
	public WebInfo() {
	}

	/** minimal constructor */
	public WebInfo(Integer webInfoId, String webInfoComName) {
		this.webInfoId = webInfoId;
		this.webInfoComName = webInfoComName;
	}

	/** full constructor */
	public WebInfo(Integer webInfoId, String webInfoComName,
			String webInfoComAddress, String webInfoComPostCode,
			String webInfoComEmail, String webInfoServiceTel,
			String webInfoOfficePhone, String webInfoComfax,
			String webInfoCopyright, String webInfoIndex, String webInfoWorkday) {
		this.webInfoId = webInfoId;
		this.webInfoComName = webInfoComName;
		this.webInfoComAddress = webInfoComAddress;
		this.webInfoComPostCode = webInfoComPostCode;
		this.webInfoComEmail = webInfoComEmail;
		this.webInfoServiceTel = webInfoServiceTel;
		this.webInfoOfficePhone = webInfoOfficePhone;
		this.webInfoComfax = webInfoComfax;
		this.webInfoCopyright = webInfoCopyright;
		this.webInfoIndex = webInfoIndex;
		this.webInfoWorkday = webInfoWorkday;
	}

	// Property accessors

	public Integer getWebInfoId() {
		return this.webInfoId;
	}

	public void setWebInfoId(Integer webInfoId) {
		this.webInfoId = webInfoId;
	}

	public String getWebInfoComName() {
		return this.webInfoComName;
	}

	public void setWebInfoComName(String webInfoComName) {
		this.webInfoComName = webInfoComName;
	}

	public String getWebInfoComAddress() {
		return this.webInfoComAddress;
	}

	public void setWebInfoComAddress(String webInfoComAddress) {
		this.webInfoComAddress = webInfoComAddress;
	}

	public String getWebInfoComPostCode() {
		return this.webInfoComPostCode;
	}

	public void setWebInfoComPostCode(String webInfoComPostCode) {
		this.webInfoComPostCode = webInfoComPostCode;
	}

	public String getWebInfoComEmail() {
		return this.webInfoComEmail;
	}

	public void setWebInfoComEmail(String webInfoComEmail) {
		this.webInfoComEmail = webInfoComEmail;
	}

	public String getWebInfoServiceTel() {
		return this.webInfoServiceTel;
	}

	public void setWebInfoServiceTel(String webInfoServiceTel) {
		this.webInfoServiceTel = webInfoServiceTel;
	}

	public String getWebInfoOfficePhone() {
		return this.webInfoOfficePhone;
	}

	public void setWebInfoOfficePhone(String webInfoOfficePhone) {
		this.webInfoOfficePhone = webInfoOfficePhone;
	}

	public String getWebInfoComfax() {
		return this.webInfoComfax;
	}

	public void setWebInfoComfax(String webInfoComfax) {
		this.webInfoComfax = webInfoComfax;
	}

	public String getWebInfoCopyright() {
		return this.webInfoCopyright;
	}

	public void setWebInfoCopyright(String webInfoCopyright) {
		this.webInfoCopyright = webInfoCopyright;
	}

	public String getWebInfoIndex() {
		return this.webInfoIndex;
	}

	public void setWebInfoIndex(String webInfoIndex) {
		this.webInfoIndex = webInfoIndex;
	}

	public String getWebInfoWorkday() {
		return this.webInfoWorkday;
	}

	public void setWebInfoWorkday(String webInfoWorkday) {
		this.webInfoWorkday = webInfoWorkday;
	}

}