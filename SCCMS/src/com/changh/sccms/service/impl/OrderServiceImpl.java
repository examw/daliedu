package com.changh.sccms.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.dao.ItemsDAO;
import com.changh.sccms.dao.OrderDAO;
import com.changh.sccms.dao.SendDAO;
import com.changh.sccms.dao.StudentDAO;
import com.changh.sccms.dao.TradeDAO;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.CartItem;
import com.changh.sccms.entity.Deal;
import com.changh.sccms.entity.Items;
import com.changh.sccms.entity.Order;
import com.changh.sccms.entity.Send;
import com.changh.sccms.entity.StuDeal;
import com.changh.sccms.entity.Student;
import com.changh.sccms.entity.Trade;
import com.changh.sccms.service.OrderService;
import com.changh.sccms.until.Arith;
import com.changh.sccms.until.Constant;
import com.changh.sccms.until.GridDataUtil;
import com.changh.sccms.until.TimeFormat;
import com.opensymphony.xwork2.ActionContext;

public class OrderServiceImpl implements OrderService {
	private OrderDAO orderDao;
	private StudentDAO studentDao;
	private SendDAO sendDao;
	private TradeDAO tradeDao;
	private ItemsDAO itemDao;
	
	public void setSendDao(SendDAO sendDao) {
		this.sendDao = sendDao;
	}
	public void setOrderDao(OrderDAO orderDao) {
		this.orderDao = orderDao;
	}
	public void setStudentDao(StudentDAO studentDao) {
		this.studentDao = studentDao;
	}
	public void setTradeDao(TradeDAO tradeDao) {
		this.tradeDao = tradeDao;
	}
	public void setItemDao(ItemsDAO itemDao) {
		this.itemDao = itemDao;
	}
	/**
	 * 按条件分页，并封装成ligerGrid所需要的map形式
	 */
	public Map<String,Object> findPageByCriteria(int page,int pagesize,String criteria,String sortname,String sortorder) throws Exception {
		//按条件分页
		List<Order> list = orderDao.findPageByCriteria(page, pagesize,criteria,sortname, sortorder);
		//查找该条件下订单的总数
		long total = orderDao.findTotal(criteria);
		return GridDataUtil.gridMap(list, (int)total);
	}
	
	 //find by id
	public Order findById(int id) throws Exception {
		return orderDao.findById(id);
	}
	public void update(Order order) throws Exception {
		// TODO Auto-generated method stub
		orderDao.update(order);
	}
	/**
	 * 更新订单
	 */
	public void update(Order order,Send send,Trade trade) throws Exception {
	//订单字段：orderId,orderNo,stuId,orderMoney,orderInvoice,orderStatus,orderPayment,orderAddTime,orderPayTime,orderPayType,AdmId,orderDealTime
	//寄送表：sendId,orderId,epcId,sendOrderId,sendStatus,sendPerson,sendDetail,sendConfirmTime,sendDetail,epcName,sendContent,sendCost,sendReceiveName,sendFullAddress,sendMobile,sendPostalCode
	//交易表：tradeId,tradeTime,tradeMoney,tradeIp,tradeType,tradeNote,orderId,cardId,stuId
		//订单只更新部分字段
		Order realOrder = orderDao.findById(order.getOrderId());
		realOrder.setOrderMoney(order.getOrderMoney());
		realOrder.setOrderInvoice(order.getOrderInvoice());
		//如果要发票，添加寄送单
		if(order.getOrderInvoice()==1&&realOrder.getOrderInvoice()==0){//原来不要，现在要发票
			send.setSendAddTime(new Date());
			send.setSendDetail("发票"+send.getSendContent());
			send.setSendStatus(0);
			sendDao.save(send);
		}
		Student stu = realOrder.getStudent();
		List<Send> sendList = sendDao.findByOrderId(realOrder.getOrderId());
		//是银行汇款
		if(trade.getTradeType()!=null&&trade.getTradeType()==2)
		{
			//先添加充值记录
			stu.setStuCash(stu.getStuCash()+trade.getTradeMoney());
			studentDao.update(stu);//更新学员账户 
			//加充值记录
			trade.setTradePattern("银行汇款");
			trade.setStuId(stu.getStuId());
			trade.setOrderId(realOrder.getOrderId());//反正是与这个订单相关的交易
			trade.setTradeOrderNo("HK"+TimeFormat.format(new Date()));//自己写个订单号
			trade.setTradeType(Constant.RECHARGE);//充值
			trade.setTradeCardBalance(stu.getStuCard());
			trade.setTradeCashBalance(stu.getStuCash());
			tradeDao.save(trade);
			//比对账户余额
			Student realStu = studentDao.findById(stu.getStuId());//realStu是持久对象了
			double money = realOrder.getCashMoney();
			//System.out.println("1,"+realStu.getStuCash());
			if(realStu.getStuCash()>=money)
			{
				//能够支付  支付
				/**
				 * 修改学员账户 
				 * 添加交易记录
				 */
				//修改学员账户
				realStu.setStuCash(Math.round((realStu.getStuCash()-money)*100)/100.0);//四舍五入保留2位小数
				studentDao.update(realStu);// 加了事务后这句可以不写
				//System.out.println("2,"+realStu.getStuCash());
				//添加交易记录
				Trade tradeOut = new Trade();
				tradeOut.setStuId(realStu.getStuId());
				tradeOut.setTradeMoney(0-money);
				tradeOut.setOrderId(realOrder.getOrderId());//支付的确实存在的订单
				tradeOut.setTradeOrderNo(realOrder.getOrderNo());
				tradeOut.setTradeTime(new Date());
				tradeOut.setTradePattern(order.getPayment());
				tradeOut.setTradeType(Constant.BUYCLASS);
				tradeOut.setTradeCardBalance(realStu.getStuCard());
				tradeOut.setTradeCashBalance(realStu.getStuCash());
				tradeOut.setTradeNote("用户："+realStu.getStuUsername()+"订单号："+realOrder.getOrderNo());
				tradeDao.save(tradeOut);
				//更新订单，开通课程
				if(sendList.size()!=0)
				{
					realOrder.setOrderStatus(Constant.FINISH);//表示等待送货
				}else
				{
					realOrder.setOrderStatus(Constant.FINISH);
				}
				realOrder.setOrderPayment(order.getOrderPayment());//银行汇款
				realOrder.setOrderPayTime(new Date());
				realOrder.setOrderPayType(realOrder.getOrderPayType()+realOrder.getCashMoney());
			}
			
		}else if(trade.getTradeType()!=null&&trade.getTradeType()==4)
		{
			Student realStu = studentDao.findById(stu.getStuId());
			double money = realOrder.getCashMoney();
			//余额支付
			//从余额中扣除
			//修改学员账户
			realStu.setStuCash(Math.round((realStu.getStuCash()-money)*100)/100.0);//四舍五入保留2位小数
			studentDao.update(realStu);// 加了事务后这句可以不写
			//添加交易记录
			Trade tradeOut = new Trade();
			tradeOut.setStuId(realStu.getStuId());
			tradeOut.setTradeMoney(0-money);
			tradeOut.setOrderId(realOrder.getOrderId());//支付的确实存在的订单
			tradeOut.setTradeOrderNo(realOrder.getOrderNo());
			tradeOut.setTradeTime(new Date());
			tradeOut.setTradePattern("帐号扣除");
			tradeOut.setTradeType(Constant.BUYCLASS);
			tradeOut.setTradeCardBalance(realStu.getStuCard());
			tradeOut.setTradeCashBalance(realStu.getStuCash());
			tradeOut.setTradeNote("用户："+realStu.getStuUsername()+"订单号："+realOrder.getOrderId());
			tradeDao.save(tradeOut);
			//更新订单，开通课程
			if(sendList.size()==0)
			{
				realOrder.setOrderStatus(Constant.FINISH);//表示等待送货
			}else
			{
				realOrder.setOrderStatus(Constant.FINISH);
			}
			realOrder.setOrderPayment(Constant.CASH_BALANCE);//余额支付
			realOrder.setOrderPayTime(new Date());
			realOrder.setOrderPayType(realOrder.getOrderPayType()+realOrder.getCashMoney());
		}
		//realOrder.setOrderStatus(order.getOrderStatus());
		//更新管理员操作信息
		/*
		 * 1,获得session中的Administrator对象
		 * 2，设置Order中的admID,操作时间
		 */
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		realOrder.setAdmId(admin.getAdmId());
		realOrder.setOrderDealTime(new Date());
		realOrder.setOrderNote(order.getOrderNote());	//备注
		//orderDao.update(realOrder);//更新订单，加了事务后这句可以不写
	}
	/**
	 *  多条件混合搜索，不分页
	 */
	public List<Order> search(String criteria,Date addDate,Date dealDate) throws Exception {
		return orderDao.search(criteria,addDate,dealDate);
	}
	/**
	 * 多条件混合搜索，带分页
	 */
	public Map<String, Object> search(int page, int pagesize, String criteria,
			Date addDate, Date dealDate, String sortname, String sortorder)
			throws Exception {
		List<Order> list=null;
		//包含and不分页
//		if(criteria.contains("and"))
//		{
//			list = orderDao.search(criteria, addDate, dealDate);
//			return GridDataUtil.gridMap(list, list.size());
//		}else
//		{
			list = orderDao.searchPage(page, pagesize, criteria, addDate, dealDate, sortname, sortorder);
			int total =(int)orderDao.findTotal(criteria);
			return GridDataUtil.gridMap(list, total);
//		}
	}
	/**
	 * 退单操作 
	 */
	public void cancelOrder(int orderId,int mode,double card,double cash,String content) throws Exception {
		Order realOrder = orderDao.findById(orderId);
		//退单操作
		/*
		 * 要根据权限的不同，最终的退款至账户操作是系统管理员（这句不要）
		 * 根据是否要发票，要发票查看发票是否寄送了，没有寄送可退，寄送了，发票要回寄才可以退单
		 * 1, 将order的状态置为已退单
		 * 2，获得session中的Administrator对象
		 * 3，设置Order中的admID,操作时间
		 * 4，根据选择的模式及支付方式将money退到个人账户中
		 */
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		realOrder.setAdmId(admin.getAdmId());
		realOrder.setAdmUsername(admin.getAdmUsername());//2013.05.17修改
		realOrder.setOrderDealTime(new Date());
		realOrder.setOrderStatus(Constant.CANCELED);
		realOrder.setOrderNote(content);
//		//更新学员账户
		Student stu = realOrder.getStudent();
		//添加交易记录
		double paycash = realOrder.getCashMoney();
		double paycard = Arith.sub(realOrder.getOrderMoney(),realOrder.getCashMoney());
		if(cash!=0&&mode==0)
		{
			stu.setStuCash(Arith.add(stu.getStuCash(),cash));
			studentDao.update(stu);
			Trade tradeOut = new Trade();
			tradeOut.setStuId(stu.getStuId());
			tradeOut.setTradeMoney(cash);
			tradeOut.setOrderId(realOrder.getOrderId());//确实存在的订单
			tradeOut.setTradeOrderNo(realOrder.getOrderNo());
			tradeOut.setTradeTime(new Date());
			tradeOut.setTradePattern("退换课退费");
			tradeOut.setTradeType(Constant.RETURN_MONEY);
			tradeOut.setTradeCardBalance(stu.getStuCard());
			tradeOut.setTradeCashBalance(stu.getStuCash());
			if(cash<paycash)
			{
				tradeOut.setTradeNote("管理员："+admin.getAdmUsername()+"操作，退换课退费;扣费："+Arith.sub(paycash,cash)+"用户："+stu.getStuUsername()+"订单号："+realOrder.getOrderId());
			}else{
				tradeOut.setTradeNote("管理员："+admin.getAdmUsername()+"操作，退换课退费;"+"用户："+stu.getStuUsername()+"订单号："+realOrder.getOrderNo());
			}
			tradeDao.save(tradeOut);
		}
		if(cash!=realOrder.getOrderMoney())
		{
			if(card!=0&&paycard!=0)
			{
			Trade tradeOut1 = new Trade();
			if(mode==1)
			{
				stu.setStuCard(Arith.add(stu.getStuCard(),paycard));
				studentDao.update(stu);
				tradeOut1.setTradeMoney(paycard);
			}else
			{
				stu.setStuCard(Arith.add(stu.getStuCard(),paycard));
				studentDao.update(stu);
				tradeOut1.setTradeMoney(card);
			}
			tradeOut1.setStuId(stu.getStuId());
			tradeOut1.setOrderId(realOrder.getOrderId());//确实存在的订单
			tradeOut1.setTradeOrderNo(realOrder.getOrderNo());
			tradeOut1.setTradeTime(new Date());
			tradeOut1.setTradePattern("退换课退学习卡");
			tradeOut1.setTradeType(Constant.RETURN_MONEY);
			tradeOut1.setTradeCardBalance(stu.getStuCard());
			tradeOut1.setTradeCashBalance(stu.getStuCash());
			tradeOut1.setTradeNote("管理员："+admin.getAdmUsername()+"操作，退换课退费退至学习卡;"+"用户："+stu.getStuUsername()+"订单号："+realOrder.getOrderId());
			tradeDao.save(tradeOut1);
			}
		}
		//将与该订单相关要寄送还未寄送的寄送单删除
		sendDao.deleteWhenCancelOrder(realOrder.getOrderId());
		orderDao.update(realOrder);
	}
	public void addOrder(Order order) throws Exception {
		// TODO Auto-generated method stub
		orderDao.save(order);
	}
	public Order updatePrice(String orderNo, double money) throws Exception {
		// TODO Auto-generated method stub
		Order order = orderDao.findByNo(orderNo);
		if(order!=null)
		{
			order.setOrderMoney(money);
			orderDao.update(order);
		}
		return order;
	}
	//发票申请
	public Order updateForApplyInvoice(String orderNo, Send send)
			throws Exception {
		// TODO Auto-generated method stub
		Order order = orderDao.findByNo(orderNo);
		if(order!=null)
		{
			order.setOrderInvoice(1);
			orderDao.update(order);
			send.setOrder(order);
			send.setSendType(Constant.SEND_INVOICE);
			send.setSendStatus(Constant.PRESEND);
			sendDao.save(send);
		}
		return order;
	}
	public boolean findIsExistBookSend(int orderId) throws Exception {
		// TODO Auto-generated method stub
		return sendDao.findIsExist(orderId,Constant.SEND_BOOK);
	}
	/**
	 * 开通订单
	 */
	public boolean updateForManualPay(Order order, Send send, Trade trade)
			throws Exception {
		// TODO Auto-generated method stub
		/**
		 * 根据所选支付方式，添加交易记录
		 * 根据寄送项添加寄送单
		 * 更新订单。
		 */
		Order realOrder = orderDao.findById(order.getOrderId());
		realOrder.setOrderNote(trade.getTradeNote());
		Student stu = realOrder.getStudent();
		if(Arith.add(trade.getTradeMoney(),stu.getStuCash())<realOrder.getCashMoney())
		{
			return false; //交易的钱比要付的钱少，直接返回
		}
		//2013.05.17修改	 添加管理员的操作信息
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
				/////////////
		//根据所选择的支付方式，添加交易记录
		if(trade.getTradeType()==2)//选择的是其他交易
		{
			//先添加充值记录
			stu.setStuCash(Arith.add(stu.getStuCash(),trade.getTradeMoney()));
			studentDao.update(stu);//更新学员账户 
			//加充值记录
			trade.setTradePattern(order.getPayment());//充值的方式
			trade.setStuId(stu.getStuId());
			trade.setOrderId(realOrder.getOrderId());//反正是与这个订单相关的交易
			trade.setTradeOrderNo(realOrder.getOrderNo());//自己写个订单号
			trade.setTradeType(Constant.RECHARGE);//充值
			trade.setTradeCardBalance(stu.getStuCard());
			trade.setTradeCashBalance(stu.getStuCash());
			trade.setTradeNote("管理员："+admin.getAdmUsername()+"手动开通课程操作(1)");	//交易信息
			tradeDao.save(trade);
			//比对账户余额
			Student realStu = studentDao.findById(stu.getStuId());//realStu是持久对象了
			double money = realOrder.getCashMoney();
			//System.out.println("1,"+realStu.getStuCash());
			if(realStu.getStuCash()>=money)
			{
				//能够支付  支付
				/**
				 * 修改学员账户 
				 * 添加交易记录
				 */
				//修改学员账户
				realStu.setStuCash(Arith.sub(realStu.getStuCash(),money));//四舍五入保留2位小数
				studentDao.update(realStu);// 加了事务后这句可以不写
				//System.out.println("2,"+realStu.getStuCash());
				//添加交易记录
				Trade tradeOut = new Trade();
				tradeOut.setStuId(realStu.getStuId());
				tradeOut.setTradeMoney(0-money);
				tradeOut.setOrderId(realOrder.getOrderId());//支付的确实存在的订单
				tradeOut.setTradeOrderNo(realOrder.getOrderNo());
				tradeOut.setTradeTime(new Date());
				tradeOut.setTradePattern(order.getPayment());
				tradeOut.setTradeType(Constant.BUYCLASS);
				tradeOut.setTradeCardBalance(realStu.getStuCard());
				tradeOut.setTradeCashBalance(realStu.getStuCash());
				tradeOut.setTradeNote("管理员："+admin.getAdmUsername()+"手动开通课程操作(2)，用户："+realStu.getStuUsername()+"订单号："+realOrder.getOrderNo());
				tradeDao.save(tradeOut);
				//更新订单，开通课程
				if(send!=null)
				{
					realOrder.setOrderStatus(Constant.FINISH);//表示等待送货
					send.setSendAddTime(new Date());
					send.setOrder(realOrder);
					send.setSendContent(getSendContent(realOrder.getOrderSendDetail()));
					send.setSendStatus(Constant.PRESEND);
					send.setSendType(Constant.SEND_BOOK);
					sendDao.save(send);
				}else
				{
					realOrder.setOrderStatus(Constant.FINISH);
				}
				realOrder.setOrderPayment(order.getOrderPayment());//银行汇款
				realOrder.setOrderPayTime(new Date());
				realOrder.setOrderPayType(realOrder.getOrderPayType()+realOrder.getCashMoney());
			}
			
		}else if(trade.getTradeType()==4)
		{
			Student realStu = studentDao.findById(stu.getStuId());
			double money = realOrder.getCashMoney();
			if(money>realStu.getStuCash()) return false;
			//余额支付
			//从余额中扣除
			//修改学员账户
			realStu.setStuCash(Arith.sub(realStu.getStuCash(),money));//四舍五入保留2位小数
			studentDao.update(realStu);// 加了事务后这句可以不写
			//添加交易记录
			Trade tradeOut = new Trade();
			tradeOut.setStuId(realStu.getStuId());
			tradeOut.setTradeMoney(0-money);
			tradeOut.setOrderId(realOrder.getOrderId());//支付的确实存在的订单
			tradeOut.setTradeOrderNo(realOrder.getOrderNo());
			tradeOut.setTradeTime(new Date());
			tradeOut.setTradePattern("帐号扣除");
			tradeOut.setTradeType(Constant.BUYCLASS);
			tradeOut.setTradeCardBalance(realStu.getStuCard());
			tradeOut.setTradeCashBalance(realStu.getStuCash());
			tradeOut.setTradeNote("管理员："+admin.getAdmUsername()+"操作，用户："+realStu.getStuUsername()+"订单号："+realOrder.getOrderId());
			tradeDao.save(tradeOut);
			//更新订单，开通课程
			if(send!=null)
			{
				realOrder.setOrderStatus(Constant.FINISH);//表示等待送货
				send.setSendAddTime(new Date());
				send.setOrder(realOrder);
				send.setSendContent(getSendContent(realOrder.getOrderSendDetail()));
				send.setSendStatus(Constant.PRESEND);
				send.setSendType(Constant.SEND_BOOK);
				sendDao.save(send);
			}else
			{
				realOrder.setOrderStatus(Constant.FINISH);
			}
			realOrder.setOrderPayment(Constant.CASH_BALANCE);//余额支付
			realOrder.setOrderPayTime(new Date());
			realOrder.setOrderPayType(realOrder.getOrderPayType().split("[:]")[0]+":"+realOrder.getCashMoney());
		}
		//realOrder.setOrderStatus(order.getOrderStatus());
		//更新管理员操作信息
		/*
		 * 1,获得session中的Administrator对象
		 * 2，设置Order中的admID,操作时间
		 */
		realOrder.setAdmId(admin.getAdmId());
		realOrder.setAdmUsername(admin.getAdmUsername());
		realOrder.setOrderDealTime(new Date());
		orderDao.update(realOrder);//更新订单，加了事务后这句可以不写
		return true;
	}
	private String getSendContent(String content)
	{
		if(content==null)return null;
		String[] list = content.split(";");
		StringBuffer buf = new StringBuffer();
		for(String s:list)
		{
			if(s.indexOf("教材")!=-1||s.indexOf("书")!=-1)
			{
				buf.append(s);
				buf.append(";");
			}
		}
		return buf.length()==0?null:buf.substring(0, buf.length()-1);
	}
	public Student LoadStu(int stuId) throws Exception {
		// TODO Auto-generated method stub
		return studentDao.findById(stuId);
	}
	
	public List<Order> findByStuId(int stuId) throws Exception {
		return orderDao.findByStuId(stuId);
	}
	
	/**
	 * 2014.03.15
	 */
	@Override
	public Order saveOrder(int stuId, List<CartItem> cart) throws Exception {
		// TODO Auto-generated method stub
		Student stu = studentDao.findById(stuId);
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		Order order = new Order();
		order.setStudent(stu);
		order.setOrderInvoice(0);
		order.setOrderStatus(Constant.FINISH); //订单状态
		order.setOrderPayment(Constant.ADMIN); //管理员后台开课
		order.setOrderNote("管理员后台开课");
		order.setOrderMoney(0);
		order.setOrderAddTime(new Date());
		order.setOrderPayType("0:0");
		order.setOrderPrice(0);
		order.setAdmId(admin.getAdmId());
		order.setOrderDealTime(new Date());
		int orderid = orderDao.save(order);
		// ////////////////////////////////
		order.setOrderId(orderid);
		// ////////////
		// 循环购物车生成订单条目
		for (CartItem cartitem : cart) {
			 Items item = cartitem.getItem();
			 item.setOrderId(orderid);
			 itemDao.save(item);	
		}
		stu.setStuType(2);
		studentDao.update(stu);
		return order;
	}
}
