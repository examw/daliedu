package com.changh.eschool.action.order;

import com.changh.eschool.service.OrderService;

public class AlipayAction {
	private String trade_no ;				//支付宝交易号
	private String out_trade_no;	        //获取订单号
	private String total_fee ;	        //获取总金额
	private String subject ;//商品名称、订单名称
	private String body ;//商品描述、订单备注、描述
	private String buyer_email;		//买家支付宝账号
	private String trade_status;		//交易状态
	private String trade_type;		//交易类型
	private String extra_common_param;//自定义参数
	private OrderService orderService;
	public String getTrade_no() {
		return trade_no;
	}
	public void setTrade_no(String trade_no) {
		this.trade_no = trade_no;
	}
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}
	public String getTotal_fee() {
		return total_fee;
	}
	public void setTotal_fee(String total_fee) {
		this.total_fee = total_fee;
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
	public String getBuyer_email() {
		return buyer_email;
	}
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	public String getTrade_status() {
		return trade_status;
	}
	public void setTrade_status(String trade_status) {
		this.trade_status = trade_status;
	}
	public String getTrade_type() {
		return trade_type;
	}
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	public String getExtra_common_param() {
		return extra_common_param;
	}
	public void setExtra_common_param(String extra_common_param) {
		this.extra_common_param = extra_common_param;
	}
	public String execute()throws Exception
	{	
		if(orderService.updateFromAliPost(out_trade_no,trade_no,total_fee,"ZFB",extra_common_param))
		return "success";
		return "fail";
	}
}
