package com.changh.sccms.entity;

import java.util.Date;



/**
 * Items entity. @author MyEclipse Persistence Tools
 */

public class Items  implements java.io.Serializable {


    // Fields    

     private Integer itemId;
     private Integer orderId; 
     private Integer id;
     private Integer productId;
     private double itemOPrice; //原价
     private double itemRPrice;	//优惠价
     private double itemSPrice; //老学员价
     private String itemName;	//商品条目的名称
     private Integer itemPType; //条目类别，套餐or单科
     private String itemPresent;//条目附赠
     private Date itemOverTime;
     /**
      * 套餐或者班级所属的考试
      */
     private Integer examId;
     /**
      * 同种产品的购买数量，便于统计输出
      */
     private int count;

     //
     private Integer dealId;  //协议id，仅是套餐有可能有此属性
     private Date orderTime;
     
     
    // Constructors

    /** default constructor */
    public Items() {
    }

    
    /** full constructor */
    public Items(Integer itemId, Integer orderId, Integer id, Integer productId, double itemOPrice, double itemRPrice, double itemSPrice,String itemName, Integer itemPType) {
        this.itemId = itemId;
        this.orderId = orderId;
        this.id = id;
        this.productId = productId;
        this.itemOPrice = itemOPrice;
        this.itemRPrice = itemRPrice;
        this.itemSPrice = itemSPrice;
        this.itemName = itemName;
        this.itemPType = itemPType;
    }

   
    // Property accessors

    public Integer getItemId() {
        return this.itemId;
    }
    
    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }


    public Integer getOrderId() {
		return orderId;
	}


	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}


	public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return this.productId;
    }
    
    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public double getItemOPrice() {
        return this.itemOPrice;
    }
    
    public void setItemOPrice(double itemOPrice) {
        this.itemOPrice = itemOPrice;
    }

    public double getItemRPrice() {
        return this.itemRPrice;
    }
    
    public void setItemRPrice(double itemRPrice) {
        this.itemRPrice = itemRPrice;
    }
    
    public double getItemSPrice() {
		return itemSPrice;
	}


	public void setItemSPrice(double itemSPrice) {
		this.itemSPrice = itemSPrice;
	}


	public String getItemName() {
        return this.itemName;
    }
    
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Integer getItemPType() {
        return this.itemPType;
    }
    
    public void setItemPType(Integer itemPType) {
        this.itemPType = itemPType;
    }


	public Date getOrderTime() {
		return orderTime;
	}


	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}


	public Integer getExamId() {
		return examId;
	}


	public void setExamId(Integer examId) {
		this.examId = examId;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getItemPresent() {
		return itemPresent;
	}


	public void setItemPresent(String itemPresent) {
		this.itemPresent = itemPresent;
	}


	public Integer getDealId() {
		return dealId;
	}


	public void setDealId(Integer dealId) {
		this.dealId = dealId;
	}


	public Date getItemOverTime() {
		return itemOverTime;
	}


	public void setItemOverTime(Date itemOverTime) {
		this.itemOverTime = itemOverTime;
	}
   
	// 2014.03.17 增加一个属性来记录补课卡选的课节的东西
		private String itemNote;

		public String getItemNote() {
			return itemNote;
		}

		public void setItemNote(String itemNote) {
			this.itemNote = itemNote;
		}







}