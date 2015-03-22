package com.changh.sccms.entity;
// default package

import java.util.Date;

import com.changh.sccms.until.Arith;
import com.changh.sccms.until.Constant;


/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Order  implements java.io.Serializable {


    // Fields    

     private Integer orderId;
     private Student student;
     private Integer id;
     private String orderNo;
     private double orderPrice; //订单初始价格
     private Integer orderInvoice;		//是否要发票？
     private Integer orderStatus;		//订单状态【0：未支付，1：已支付，2：已过期】
     private Integer orderPayment;		//支付方式【0：现金，1：学习卡，2：混合支付, 3:管理员开课】
     private Date orderAddTime;
     private Date orderPayTime;
     private String orderPayType;		//支付类型【100:200】 现金付款金额 :学习卡付款金额
     private Integer admId;
     private Date orderDealTime;
     private double orderMoney;	//优惠价
     private String orderNote; //备注
     private Integer orderIsNeedSend;
     private String orderSendDetail;
     private double cashMoney;
     private String admUsername;
    // private Set tbSends = new HashSet(0);
    // private Set tbItemses = new HashSet(0);

     //方便显示 ,由于ligerui的grid插件不支持student.id的格式，有几个属性要提取出来显示
     private String status;
     private String payment;
     private String stuUsername;
     private String stuName;
     private String stuMobile;
    // Constructors

    /** default constructor */
    public Order() {
    }

	/** minimal constructor */
    public Order(Integer orderId, Student student, Integer id, String orderNo, double orderMoney, Integer orderStatus, Date orderAddTime) {
        this.orderId = orderId;
        this.student = student;
        this.id = id;
        this.orderNo = orderNo;
        this.orderMoney = orderMoney;
        this.orderStatus = orderStatus;
        this.orderAddTime = orderAddTime;
    }
    
    /** full constructor */
    public Order(Integer orderId, Student student, Integer id, String orderNo, double orderMoney, Integer orderInvoice, Integer orderStatus, Integer orderPayment, Date orderAddTime, Date orderPayTime, String orderPayType, Integer admId, Date orderDealTime){//, Set tbSends, Set tbItemses) {
        this.orderId = orderId;
        this.student = student;
        this.id = id;
        this.orderNo = orderNo;
        this.orderMoney = orderMoney;
        this.orderInvoice = orderInvoice;
        this.orderStatus = orderStatus;
        this.orderPayment = orderPayment;
        this.orderAddTime = orderAddTime;
        this.orderPayTime = orderPayTime;
        this.orderPayType = orderPayType;
        this.admId = admId;
        this.orderDealTime = orderDealTime;
        
        //暂时不用关联
        //this.tbSends = tbSends;
        //this.tbItemses = tbItemses;
    }

   
    // Property accessors

    public Integer getOrderId() {
        return this.orderId;
    }
    
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Student getStudent() {
        return this.student;
    }
    
    public void setStudent(Student student) {
        this.student = student;
    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNo() {
        return this.orderNo;
    }
    
    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public double getOrderMoney() {
        return this.orderMoney;
    }
    
    public void setOrderMoney(double orderMoney) {
        this.orderMoney = orderMoney;
    }

    public Integer getOrderInvoice() {
        return this.orderInvoice;
    }
    
    public void setOrderInvoice(Integer orderInvoice) {
        this.orderInvoice = orderInvoice;
    }

    public Integer getOrderStatus() {
        return this.orderStatus;
    }
    
    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getOrderPayment() {
        return this.orderPayment;
    }
    
    public void setOrderPayment(Integer orderPayment) {
        this.orderPayment = orderPayment;
    }

    public Date getOrderAddTime() {
        return this.orderAddTime;
    }
    
    public void setOrderAddTime(Date orderAddTime) {
        this.orderAddTime = orderAddTime;
    }

    public Date getOrderPayTime() {
        return this.orderPayTime;
    }
    
    public void setOrderPayTime(Date orderPayTime) {
        this.orderPayTime = orderPayTime;
    }

    public String getOrderPayType() {
        return this.orderPayType;
    }
    
    public void setOrderPayType(String orderPayType) {
        this.orderPayType = orderPayType;
    }

    public Integer getAdmId() {
        return this.admId;
    }
    
    public void setAdmId(Integer admId) {
        this.admId = admId;
    }

    public Date getOrderDealTime() {
        return this.orderDealTime;
    }
    
    public void setOrderDealTime(Date orderDealTime) {
        this.orderDealTime = orderDealTime;
    }

//    public Set getTbSends() {
//        return this.tbSends;
//    }
//    
//    public void setTbSends(Set tbSends) {
//        this.tbSends = tbSends;
//    }
//
//    public Set getTbItemses() {
//        return this.tbItemses;
//    }
//    
//    public void setTbItemses(Set tbItemses) {
//        this.tbItemses = tbItemses;
//    }
   
    //显示的getter方法
    public String getStatus()
    {
    	switch(orderStatus)
    	{
    	case Constant.WAIT_PAY:return "未支付";
    	case Constant.FINISH:return "已支付";
    	case Constant.OVERTIME:return "已过期";
    	case Constant.CANCELED:return "已退单";
    	default : return "用户取消";
    		
    	}
    }
    public String getPayment()
    {
    	if(orderPayment==null) return null;
    	switch(orderPayment)
    	{
    	case Constant.CARD:return "学习卡支付";
    	case Constant.ZFB:return "支付宝支付";
    	case Constant.CASH_BALANCE:return "余额支付";
    	case Constant.REMIT_ABC:return "农业银行汇款";
    	case Constant.REMIT_BC:return "中国银行汇款";
    	case Constant.REMIT_ICBC:return "工商银行汇款";
    	case Constant.REMIT_CBC:return "建设银行汇款";
    	case Constant.REMIT_PSBC:return "邮政银行汇款";
    	case Constant.WY:return "网银支付";
    	case Constant.CARDANDCASH:return "混合支付";
    	case Constant.ADMIN:return "管理员后台开课";
    	case Constant.OTHERWAY:return "其他方式支付";
    	default : return "其他方式支付";
    	}
    }
    public String getStuUsername()
    {
    	return student.getStuUsername();
    }

	public String getStuName() {
		return student.getStuName();
	}

	public String getStuMobile() {
		return student.getStuMobile();
	}
    

	public double getCashMoney()
	{
		/**除去学习卡支付的部分
		 * 解析字符串 orderPayType
		 * 订单金额减去 学习卡支付的部分
		 */
		try{
			return Arith.sub(orderMoney , Double.parseDouble(orderPayType.split("[:]")[0]));
		}catch(Exception e)
		{
			return orderMoney;
		}
	
		
	}

	public double getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(double orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderNote() {
		return orderNote;
	}

	public void setOrderNote(String orderNote) {
		this.orderNote = orderNote;
	}

	public Integer getOrderIsNeedSend() {
		return orderIsNeedSend;
	}

	public void setOrderIsNeedSend(Integer orderIsNeedSend) {
		this.orderIsNeedSend = orderIsNeedSend;
	}

	public String getOrderSendDetail() {
		return orderSendDetail;
	}

	public void setOrderSendDetail(String orderSendDetail) {
		this.orderSendDetail = orderSendDetail;
	}

	public String getAdmUsername() {
		return admUsername;
	}

	public void setAdmUsername(String admUsername) {
		this.admUsername = admUsername;
	}
}