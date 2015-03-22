package com.changh.sccms.until;

/**
 * 常量类
 * 
 * @author Administrator
 * 
 */
public class Constant {
	// 课节是否收费
	public static final int FREE = 1;
	public static final int CHARGE = 0;
	// 定义用户等级常量
	public static final int NORMAL = 0;
	public static final int VIP = 1;
	// 订单状态
	public static final int WAIT_PAY = 0;// 等待付款
	// public static final int WAIT_SEND = 1;//等待发货
	public static final int FINISH = 1;// 交易完成
	public static final int OVERTIME = 2;// 已过期
	public static final int CANCELED = 3;// 已退单
	public static final int USERCANCEL = 4;// 用户取消

	// 寄送状态
	public static final int PRESEND = 0;// 未送
	public static final int SENDING = 1;// 正在送
	public static final int SENT = 2;// 已送
	public static final int SENTBACK = 3;// 已寄回
	// 支付方式
	public static final int CARD=0;//学习卡支付
	public static final int ZFB=1;//支付宝支付
	public static final int WY=2;//网银支付
	public static final int CFT = 3;//财付通
	public static final int REMIT_ABC=4;//农业银行汇款
	public static final int REMIT_CBC=5;//建设银行汇款
	public static final int REMIT_ICBC=6;//工商银行汇款
	public static final int REMIT_BC=7;//中国银行汇款
	public static final int REMIT_PSBC=8;//中国邮政银行
	public static final int CASH_BALANCE=10;//余额支付
	public static final int CARDANDCASH=9;//混合支付
	public static final int ADMIN = 11; //管理员开课
	
	public static final int OTHERWAY = 12; //其他方式开课
	
	// 商品类别
	public static final int CLASS_PACKAGE = 0; // 课程套餐
	public static final int SINGER_GRADE = 1; // 单班级成
	// 交易类型
	public static final int RECHARGE = 1; // 充值
	public static final int BUYCLASS = 2; // 购买课程
	public static final int RETURN_MONEY = 3;// 退费
	public static final int OTHER = 4;
	// 寄送类型
	public static final int SEND_BOOK = 0;
	public static final int SEND_INVOICE = 1;
	public static final int SEND_OTHER = 2;
	// 试卷类型
	public static final int PAPER_TYPE_EXERCISE = 1;// 练习题
	public static final int PAPER_TYPE_SIMULATE = 2;// 模拟题
	public static final int PAPER_TYPE_REAL = 3; // 真题
	public static final int PAPER_TYPE_REPOSITORY = 4;// 题库
	// 题目类型
	public static final int Q_SINGLE_SELECT = 1; // 单选
	public static final int Q_MULTI_SELECT = 2; // 多选
	public static final int Q_JUDGE = 3; // 判断
	public static final int Q_QANDA = 4; // 问答
}
