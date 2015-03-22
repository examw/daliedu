package com.changh.sccms.action.order;

import com.changh.sccms.service.StudentService;
import com.changh.sccms.until.Constant;

public class ModifyCashAction {
	private double money;
	private int stuId;
	private int orderId;
	private int payType;
	private String content;
	private StudentService studentService;
	
	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String execute()throws Exception
	{
		String tradePattern = null;
		switch(payType)
		{
		case Constant.CARD:tradePattern = "学习卡支付";
    	case Constant.ZFB:tradePattern = "支付宝支付";
    	case Constant.CASH_BALANCE:tradePattern = "已支付已送货";
    	case Constant.REMIT_BC:tradePattern = "中国银行汇款";
    	case Constant.REMIT_ICBC:tradePattern = "工商银行汇款";
    	case Constant.REMIT_CBC:tradePattern = "建设银行汇款";
    	case Constant.REMIT_PSBC:tradePattern = "邮政银行汇款";
    	case Constant.WY:tradePattern = "网银支付";
    	case Constant.CARDANDCASH:tradePattern = "混合支付";
    	default : tradePattern = "其他方式支付";
		}
		if(money<0) tradePattern="手动扣费";
		if(studentService.updateAccount(stuId, money, tradePattern, content))
		{
			if(orderId!=0)
			{
				return "success";
			}else
				return "success1";
		}else
		{
			return "error";
		}
		
	}
}
