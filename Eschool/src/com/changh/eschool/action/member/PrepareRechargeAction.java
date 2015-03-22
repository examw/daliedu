package com.changh.eschool.action.member;

import java.util.Date;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.until.TimeFormat;

public class PrepareRechargeAction extends BaseAction{
	private String orderNo;// 订单号
	private String subject;// 订单名称
	private String body;// 备注内容
	private String stuEmail;// 学员email;网银支付要这个
	private String tradeMoney;// 交易金额
	private String payment;// 支付方式
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getStuEmail() {
		return stuEmail;
	}
	public void setStuEmail(String stuEmail) {
		this.stuEmail = stuEmail;
	}
	public String getTradeMoney() {
		return tradeMoney;
	}
	public void setTradeMoney(String tradeMoney) {
		this.tradeMoney = tradeMoney;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String execute()
	{
		Student stu = (Student) session.get("student");
		stuEmail = stu.getStuEmail();
		String timestamp = TimeFormat.format(new Date()).substring(8);
		orderNo = payment+timestamp;
		httpRequest.setAttribute("orderNo", orderNo);
		subject = stu.getStuUsername()+"充值现金券";
		StringBuffer buf = new StringBuffer();
		buf.append("订单号：");
		buf.append(orderNo);
		buf.append(";支付宝充值 ");
		buf.append(tradeMoney);
		buf.append("元");
		httpRequest.setAttribute("subject", subject);
		httpRequest.setAttribute("body", buf.toString());
		httpRequest.setAttribute("tradeMoney", tradeMoney);
		httpRequest.setAttribute("email", stuEmail);
		if (payment.equals("ZFB")) // 支付宝支付
		{
			return "zfb_success";
		} else if (payment.equals("WY"))// 网银支付
		{
			return "wy_success";
		} else if (payment.equals("CFT"))// 财付通
		{
			return "cft_success";
		} else {
			return "success";
		}
	}
}
