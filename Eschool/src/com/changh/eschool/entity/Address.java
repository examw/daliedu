package com.changh.eschool.entity;
// default package



/**
 * Address entity. @author MyEclipse Persistence Tools
 */

public class Address  implements java.io.Serializable {


    // Fields    

     private Integer addrId;
     private Integer id;
     private String addrReceiveName;
     private String addrFullAddress;
     private String addrMobile;
     private String addrEmail;
     private String addrPhone;
     private String addrPostalCode;
     private Integer stuId;			//学员id
     private Integer addrIsDefault; //是否默认地址


    // Constructors

    /** default constructor */
    public Address() {
    }

	/** minimal constructor */
    public Address(Integer id, String addrReceiveName, String addrFullAddress, String addrMobile, Integer stuId) {
        this.id = id;
        this.addrReceiveName = addrReceiveName;
        this.addrFullAddress = addrFullAddress;
        this.addrMobile = addrMobile;
        this.stuId = stuId;
    }
    
    /** full constructor */
    public Address(Integer id, String addrReceiveName, String addrFullAddress, String addrMobile, String addrEmail, String addrPhone, String addrPostalCode, Integer stuId, Integer addrIsDefault) {
        this.id = id;
        this.addrReceiveName = addrReceiveName;
        this.addrFullAddress = addrFullAddress;
        this.addrMobile = addrMobile;
        this.addrEmail = addrEmail;
        this.addrPhone = addrPhone;
        this.addrPostalCode = addrPostalCode;
        this.stuId = stuId;
        this.addrIsDefault = addrIsDefault;
    }

   
    // Property accessors

    public Integer getAddrId() {
        return this.addrId;
    }
    
    public void setAddrId(Integer addrId) {
        this.addrId = addrId;
    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getAddrReceiveName() {
        return this.addrReceiveName;
    }
    
    public void setAddrReceiveName(String addrReceiveName) {
        this.addrReceiveName = addrReceiveName;
    }

    public String getAddrFullAddress() {
        return this.addrFullAddress;
    }
    
    public void setAddrFullAddress(String addrFullAddress) {
        this.addrFullAddress = addrFullAddress;
    }

    public String getAddrMobile() {
        return this.addrMobile;
    }
    
    public void setAddrMobile(String addrMobile) {
        this.addrMobile = addrMobile;
    }

    public String getAddrEmail() {
        return this.addrEmail;
    }
    
    public void setAddrEmail(String addrEmail) {
        this.addrEmail = addrEmail;
    }

    public String getAddrPhone() {
        return this.addrPhone;
    }
    
    public void setAddrPhone(String addrPhone) {
        this.addrPhone = addrPhone;
    }

    public String getAddrPostalCode() {
        return this.addrPostalCode;
    }
    
    public void setAddrPostalCode(String addrPostalCode) {
        this.addrPostalCode = addrPostalCode;
    }

    public Integer getStuId() {
        return this.stuId;
    }
    
    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public Integer getAddrIsDefault() {
        return this.addrIsDefault;
    }
    
    public void setAddrIsDefault(Integer addrIsDefault) {
        this.addrIsDefault = addrIsDefault;
    }

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((addrEmail == null) ? 0 : addrEmail.hashCode());
		result = prime * result
				+ ((addrFullAddress == null) ? 0 : addrFullAddress.hashCode());
		result = prime * result + ((addrId == null) ? 0 : addrId.hashCode());
		result = prime * result
				+ ((addrIsDefault == null) ? 0 : addrIsDefault.hashCode());
		result = prime * result
				+ ((addrMobile == null) ? 0 : addrMobile.hashCode());
		result = prime * result
				+ ((addrPhone == null) ? 0 : addrPhone.hashCode());
		result = prime * result
				+ ((addrPostalCode == null) ? 0 : addrPostalCode.hashCode());
		result = prime * result
				+ ((addrReceiveName == null) ? 0 : addrReceiveName.hashCode());
		result = prime * result + ((stuId == null) ? 0 : stuId.hashCode());
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
		Address other = (Address) obj;
		if (addrEmail == null) {
			if (other.addrEmail != null)
				return false;
		} else if (!addrEmail.equals(other.addrEmail))
			return false;
		if (addrFullAddress == null) {
			if (other.addrFullAddress != null)
				return false;
		} else if (!addrFullAddress.equals(other.addrFullAddress))
			return false;
		if (addrId == null) {
			if (other.addrId != null)
				return false;
		} else if (!addrId.equals(other.addrId))
			return false;
		if (addrIsDefault == null) {
			if (other.addrIsDefault != null)
				return false;
		} else if (!addrIsDefault.equals(other.addrIsDefault))
			return false;
		if (addrMobile == null) {
			if (other.addrMobile != null)
				return false;
		} else if (!addrMobile.equals(other.addrMobile))
			return false;
		if (addrPhone == null) {
			if (other.addrPhone != null)
				return false;
		} else if (!addrPhone.equals(other.addrPhone))
			return false;
		if (addrPostalCode == null) {
			if (other.addrPostalCode != null)
				return false;
		} else if (!addrPostalCode.equals(other.addrPostalCode))
			return false;
		if (addrReceiveName == null) {
			if (other.addrReceiveName != null)
				return false;
		} else if (!addrReceiveName.equals(other.addrReceiveName))
			return false;
		if (stuId == null) {
			if (other.stuId != null)
				return false;
		} else if (!stuId.equals(other.stuId))
			return false;
		return true;
	}
   
    







}