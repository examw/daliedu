package com.changh.eschool.action.order;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.OrderService;

public class TencentPayAction extends BaseAction{
	//商户订单号
	private String out_trade_no ;
	//财付通订单号
	private String transaction_id ;
	//金额,以分为单位
	private String total_fee ;
	//支付方式
	private String trade_type;
	//备注
	private String attach;
	private OrderService orderService;
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}
	public String getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}
	public String getTotal_fee() {
		return total_fee;
	}
	public void setTotal_fee(String total_fee) {
		this.total_fee = total_fee;
	}
	public String getTrade_type() {
		return trade_type;
	}
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}
	public String getAttach() {
		return attach;
	}
	public void setAttach(String attach) {
		this.attach = attach;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public String execute()throws Exception
	{
		trade_type = (String) httpRequest.getAttribute("trade_type");
		Student stu= (Student) session.get("student");
		if(orderService.updateAfterPay(out_trade_no,transaction_id,total_fee,trade_type,attach,stu))
			return "success";
		else
			return "fail";
	}
}
