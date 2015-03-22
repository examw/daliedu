package com.changh.eschool.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.changh.eschool.dao.ClassDetailDAO;
import com.changh.eschool.dao.ClassPackageDAO;
import com.changh.eschool.dao.GradeDAO;
import com.changh.eschool.dao.ItemDAO;
import com.changh.eschool.dao.OrderDAO;
import com.changh.eschool.dao.SendDAO;
import com.changh.eschool.dao.StudentDAO;
import com.changh.eschool.dao.TradeDAO;
import com.changh.eschool.entity.CartItem;
import com.changh.eschool.entity.ClassPackage;
import com.changh.eschool.entity.Deal;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.MyLesson;
import com.changh.eschool.entity.Order;
import com.changh.eschool.entity.Send;
import com.changh.eschool.entity.StuDeal;
import com.changh.eschool.entity.Student;
import com.changh.eschool.entity.Trade;
import com.changh.eschool.service.OrderService;
import com.changh.eschool.until.Arith;
import com.changh.eschool.until.Constant;
import com.changh.eschool.until.TimeFormat;

public class OrderServiceImpl implements OrderService {
	private OrderDAO orderDao;
	private StudentDAO studentDao;
	private SendDAO sendDao;
	private ClassPackageDAO classPackageDao;
	private GradeDAO gradeDao;
	private ClassDetailDAO classDetailDao;
	private ItemDAO itemDao;
	private TradeDAO tradeDao;


	public ItemDAO getItemDao() {
		return itemDao;
	}

	public void setItemDao(ItemDAO itemDao) {
		this.itemDao = itemDao;
	}

	public ClassDetailDAO getClassDetailDao() {
		return classDetailDao;
	}

	public void setClassDetailDao(ClassDetailDAO classDetailDao) {
		this.classDetailDao = classDetailDao;
	}

	public GradeDAO getGradeDao() {
		return gradeDao;
	}

	public void setGradeDao(GradeDAO gradeDao) {
		this.gradeDao = gradeDao;
	}

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

	/**
	 * 按条件分页，并封装成ligerGrid所需要的map形式
	 */

	// find by id
	public Order findById(int id) throws Exception {
		return orderDao.findById(id);
	}

	/**
	 * 更新订单    
	 */
	public void update(Order order) throws Exception {
		// 订单只更新部分字段
		orderDao.update(order);
	}

	public void addOrder(Order order) throws Exception {
		// TODO Auto-generated method stub
		orderDao.save(order);
	}

	public java.util.List<Order> findByStuId(int page, int pagesize,
			String criteria, String sortname, String sortorder, int stuId)
			throws Exception {

		criteria = criteria + " and o.student.stuId = " + stuId;
		return orderDao.findPageByCriteria(page, pagesize, criteria, sortname,
				sortorder);
	}

	public List<Order> findPageByCriteria(int page, int pagesize,
			String criteria, String sortname, String sortorder)
			throws Exception {
		// TODO Auto-generated method stu
		return orderDao.findPageByCriteria(page, pagesize, criteria, sortname,
				sortorder);
	}

	public List<Items> findItemsByOrderId(int orderId) throws Exception {
		return orderDao.findItemsByOrderId(orderId);
	}

	public List<Integer> findMyPackage(int stuId) throws Exception {
		List<Integer> list1= new ArrayList<Integer>();
		List<Order> list = orderDao.findItemsByStuId(stuId, Constant.FINISH);
		if (list != null) {
			for (Order order : list) {
				List<Items> it = orderDao.findItemsByOrderId(order
						.getOrderId());	
				for (Items item : it) {
					if(item.getItemPType()==0){
						list1.add(item.getProductId());
					}	
				}
			}
			return list1;
		}
		return null;
	}
	public MyLesson findMyLesson(int stuId, int status) {
		MyLesson lesson = new MyLesson();
		List<ClassPackage> cp = new ArrayList<ClassPackage>();
		List<Grade> grade = new ArrayList<Grade>();
		List<Items> items = new ArrayList<Items>();
		StringBuffer buf = new StringBuffer();
		String itemIds = ",";
		try {
			List<Order> list = orderDao.findItemsByStuId(stuId, status);
			if (list != null) {
				for (Order order : list) {
					List<Items> it = orderDao.findItemsByOrderId(order
							.getOrderId());
					for (Items item : it) {
						item.setOrderTime(order.getOrderAddTime());
						//2014.03.17 判断是否有限制 如果是管理员开课
						if(order.getOrderPayment() == Constant.ADMIN) //
						{
							item.setLimit(true);
							buf.append(item.getItemNote()).append("###");
							itemIds += item.getItemId()+",";
						}
						//2014.03.17 判断是否有限制 如果是管理员开课
						items.add(item);
					}
				}
			}
			for (Items i : items) {
				if (i.getItemPType() == 0) {
					ClassPackage c = null;
					c = classPackageDao.findById(i.getProductId());
					//2014.03.17 判断是否有限制 如果是管理员开课
					c.setLimit(i.isLimit());
					//2014.03.17 判断是否有限制 如果是管理员开课
					if(c.getPkgLMatureDate().getTime()>new Date().getTime()){
						c.setOrderTime(i.getOrderTime());
						c.setItemId(i.getItemId());
						List<Grade> gradeList = classPackageDao.findByPkgId(i
								.getProductId());
						List<Grade> myGradeList = new ArrayList<Grade>();
						for (Grade myGrade : gradeList) {
							if (myGrade.getGradeDueTime().getTime() >= new Date()
									.getTime()) {
								myGrade.setClassDetails(classDetailDao.findByGid(
										myGrade.getGradeId(), 0, 0));
								myGradeList.add(myGrade);
							}
							c.setGrade(myGradeList);
						}
						cp.add(c);
					}
					
				} else if (i.getItemPType() == 1) {
					Grade g = null;
					g = gradeDao.findById(i.getProductId());
					if(g!=null)
					{
						g.setItemId(i.getItemId());
						//2014.03.17 判断是否有限制 如果是管理员开课
						g.setLimit(i.isLimit());
						//2014.03.17 判断是否有限制 如果是管理员开课
						g.setOrderTime(i.getOrderTime());
						if (g.getGradeDueTime().getTime() >= new Date().getTime()) {
							g.setClassDetails(classDetailDao.findByGid(
									g.getGradeId(), 0, 0));
							grade.add(g);
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		lesson.setClassPackages(cp);
		lesson.setGrade(grade);
		lesson.setLimitString(buf.toString());
		lesson.setLimitItemIds(itemIds);
		return lesson;
	}

	public List<Grade> findOverLesson(int stuId, int status) {
		List<Grade> grade = new ArrayList<Grade>();
		List<Items> items = new ArrayList<Items>();

		try {
			List<Order> list = orderDao.findItemsByStuId(stuId, status);
			if (list != null) {
				for (Order order : list) {
					List<Items> it = orderDao.findItemsByOrderId(order
							.getOrderId());
					for (Items item : it) {
						item.setOrderTime(order.getOrderAddTime());
						items.add(item);
					}
				}
			}

			for (Items i : items) {
				if (i.getItemPType() == 0) {
					List<Grade> gradeList = classPackageDao.findByPkgId(i
							.getProductId());
					for (Grade myGrade : gradeList) {
						if (myGrade.getGradeDueTime().getTime() < new Date()
								.getTime()) {
							grade.add(myGrade);
						}

					}
				} else if (i.getItemPType() == 1) {
					Grade g = null;
					g = gradeDao.findById(i.getProductId());
					g.setOrderTime(i.getOrderTime());
					if (g.getGradeDueTime().getTime() < new Date().getTime()) {
						grade.add(g);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return grade;
	}

	public void setClassPackageDao(ClassPackageDAO classPackageDao) {
		this.classPackageDao = classPackageDao;
	}

	public Order addOrder(Student stu, String truename, String mobile,
			double money, List<CartItem> cart) throws Exception {
		// TODO Auto-generated method stub
		if(!((truename!=null&&truename.equals(stu.getStuName()))&&(mobile!=null&&mobile.equals(stu.getStuMobile()))))
		{	// 更新学生信息
			stu.setStuName(truename);
			stu.setStuMobile(mobile);
			studentDao.update(stu);
		}
		// 添加订单到数据库
		Order order = new Order();
		order.setStudent(stu);
		order.setOrderInvoice(0);
		order.setOrderStatus(Constant.WAIT_PAY);
		order.setOrderMoney(money);
		order.setOrderAddTime(new Date());
		order.setOrderPayType("0:0");
		order.setOrderPrice(money);
		String present = getSendDetail(cart);
		order.setOrderSendDetail(present);
		order.setOrderIsNeedSend(isNeedSend(present)==null?0:1);
		int orderid = orderDao.save(order);
		// ////////////////////////////////
		order.setOrderId(orderid);
		// ////////////
		// 循环购物车生成订单条目
		for (CartItem cartitem : cart) {
			 Items item = cartitem.getItem();
			 item.setOrderId(orderid);
			 itemDao.save(item);	
			 //学生协议   
			 Deal deal =classPackageDao.findDealByPkgId(item.getProductId());
			 if(item.getItemPType()==0&&deal!=null){
				StuDeal sd = new StuDeal();
				sd.setDeal(classPackageDao.findDealByPkgId(item.getProductId()));
				sd.setStuDealId(classPackageDao.findStuDealId());
				sd.setStuId(stu.getStuId());
				sd.setPkgName(item.getItemName());
				sd.setStuDealStatus(Constant.NOSTUDEAL);
				classPackageDao.saveStuDeal(sd);
			 }
		}
		return order;
	}
	
	
	public Order saveOrder(Student stu,double money, Items item) throws Exception {
		// TODO Auto-generated method stub
		// 添加订单到数据库
		Order order = new Order();
		order.setStudent(stu);
		order.setOrderInvoice(0);
		order.setOrderStatus(Constant.WAIT_PAY);
		order.setOrderMoney(money);
		order.setOrderAddTime(new Date());
		order.setOrderPayType("0:0");
		order.setOrderPrice(money);
		order.setOrderStatus(Constant.FINISH);// 订单状态
		order.setOrderPayTime(new Date());
		String present = item.getItemPresent();
		order.setOrderSendDetail(present);
		order.setOrderIsNeedSend(isNeedSend(present)==null?0:1);
		int orderid = orderDao.save(order);
		// ////////////////////////////////
		order.setOrderId(orderid);
		// ////////////
		// 循环购物车生成订单条目
		
		item.setOrderId(orderid);
		itemDao.save(item);	
		//学生协议   
		Deal deal =classPackageDao.findDealByPkgId(item.getProductId());
		if(item.getItemPType()==0&&deal!=null){
			StuDeal sd = new StuDeal();
			sd.setDeal(classPackageDao.findDealByPkgId(item.getProductId()));
			sd.setStuDealId(classPackageDao.findStuDealId());
			sd.setStuId(stu.getStuId());
			sd.setPkgName(item.getItemName());
			sd.setStuDealStatus(Constant.NOSTUDEAL);
			classPackageDao.saveStuDeal(sd);
		}
		return order;
	}
	
	private String getSendDetail(List<CartItem> cart)
	{
		StringBuffer buf = new StringBuffer();
		for (CartItem cartitem : cart) {
			String str = cartitem.getItem().getItemPresent();
			if(str!=null&&!str.trim().equals(""))
			{
				buf.append(str);
				buf.append(";");
			}
		}
		if(buf.length()<1) return "";	//2013.05.17修改
		return buf.substring(0, buf.length()-1);
	}
	
	public int findTotal(String criteria, int stuId) throws Exception {
		// TODO Auto-generated method stub
		criteria = criteria + " and o.student.stuId = " + stuId;
		return (int) orderDao.findTotal(criteria);
	}

	public boolean deleteOrder(int orderId) throws Exception {
		// TODO Auto-generated method stub
		return orderDao.delete(orderId);
	}
	/**
	 * 根据关键字查找，有可能是订单号或者课程名称
	 */
	public List<Order> findByKeywords(int page, int pagesize, String criteria,
			String sortname, String sortorder, int stuId, String keywords)
			throws Exception {
		// TODO Auto-generated method stub
		if (keywords == null) {
			return null;
		}
		keywords = keywords.replace("%", "\\%");
		StringBuffer buf = new StringBuffer();
		//如果是课程名称
		if(keywords.matches("[\\s|\\S]*[\u4E00-\u9FA5]+[\\s|\\S]*"))//匹配中文
		{
			return orderDao.findPageByItemKeywords(page, pagesize, stuId,keywords,
					"order_addTime", sortorder);
		}
			buf.append(criteria);
			buf.append(" and o.student.stuId =");
			buf.append(stuId);
			buf.append(" and o.orderNo ='");
			buf.append(keywords.trim());
			buf.append("'");
			return orderDao.findPageByCriteria(page, pagesize, buf.toString(),
				sortname, sortorder);
	}

	public int findTotal(String criteria, String keywords) throws Exception {
		// TODO Auto-generated method stub
		if (keywords == null) {
			return 0;
		}
		keywords = keywords.replace("%", "\\%");
		StringBuffer buf = new StringBuffer();
		//如果是课程名称
		if(keywords.matches("[\\s|\\S]*[\u4E00-\u9FA5]+[\\s|\\S]*"))//匹配中文
		{
			buf.append(", Items i ");
			buf.append(criteria);
			buf.append(" and i.itemName like '%");
			buf.append(keywords);
			buf.append("%' and o.orderId = i.orderId ");
		}else
		{
			buf.append(criteria);
			buf.append(" and o.orderNo ='");
			buf.append(keywords.trim());
			buf.append("'");
		}
		return (int) orderDao.findTotal(buf.toString());
	}

	public Student cancelOrder(Student stu ,int orderId) throws Exception {
		// TODO Auto-generated method stub
		Order order = orderDao.findById(orderId);
		if (order == null)
			return stu;
		stu = studentDao.findByUsername(stu.getStuUsername());
		order.setOrderStatus(Constant.USERCANCEL);
		String detail = order.getOrderPayType();
		//解析支付详情
		String[] arr = detail.split("[:]");
		//避免解析异常
		double card1 = 0,cash1=0;
		try{
			card1 = Double.valueOf(arr[0]);
		}catch(Exception e)
		{
			card1 = 0;
		}
		try{
			cash1 = Double.valueOf(arr[1]);
		}catch(Exception e)
		{
			cash1 = 0;
		}
		//退钱
		stu.setStuCard(stu.getStuCard()+card1);
		stu.setStuCash(stu.getStuCash()+cash1);
		studentDao.update(stu);
		// orderDao.update(order);
		return stu;
	}

	public boolean updateAfterPay(String orderNo, String tradeNo, String money,
			String tradeType, String body, Student stu) throws Exception {
		// TODO Auto-generated method stub
		/**
		 * 1，添加交易记录，现金账户充值 2，小额直接开通 更新订单的状态， 2，看是否添加寄送记录， 3，添加交易记录
		 */
		Order order = null;
		int payment = 0;
		Student copy = null;
		order = orderDao.findByNo(orderNo);
		if(order!=null)
		{
			copy = (Student) order.getStudent();
		}else
		{
			copy = (Student)stu.clone();
		}
		copy.setStuCash(Arith.add(copy.getStuCash() , Double.parseDouble(money)));
		studentDao.update(copy);// 更新账户
		stu.setStuCash(copy.getStuCash());//更新session
		Trade tradeIn = new Trade();
		if (tradeType.equals("ZFB")) {
			tradeIn.setTradeOrderNo("ZFB" + TimeFormat.format(new Date()).substring(8));
			tradeIn.setTradePattern("支付宝支付");
			tradeIn.setTradeNote("支付宝充值");
			payment = Constant.ZFB;

		} else if (tradeType.equals("WY"))  {
			tradeIn.setTradeOrderNo("WY" + TimeFormat.format(new Date()).substring(8));
			tradeIn.setTradePattern("网银支付");
			tradeIn.setTradeNote("网银充值");
			payment = Constant.WY;
		} else if(tradeType.equals("CFT"))
		{
			tradeIn.setTradeOrderNo("CFT" + TimeFormat.format(new Date()).substring(8));
			tradeIn.setTradePattern("财付通支付");
			tradeIn.setTradeNote("财付通充值");
			payment = Constant.CFT;
		}
		tradeIn.setCardId(tradeNo); // 支付宝或网银或财付通的交易单号
		tradeIn.setTradeMoney(Double.parseDouble(money));
		if(order!=null){tradeIn.setOrderId(order.getOrderId());}
		tradeIn.setStuId(stu.getStuId());
		tradeIn.setTradeCardBalance(copy.getStuCard());
		tradeIn.setTradeCashBalance(copy.getStuCash());
		tradeIn.setTradeType(Constant.RECHARGE);// 充值
		tradeIn.setTradeTime(new Date());
		tradeIn.setTradeIp(ServletActionContext.getRequest().getRemoteAddr());
		tradeDao.save(tradeIn);
		if (order != null) {
			if(order.getOrderStatus()!=Constant.WAIT_PAY)
				return false;
			if(order.getCashMoney()!=order.getOrderMoney()) payment = Constant.CARDANDCASH;
			if (order.getRemainMoney() <= copy.getStuCash()) {
				// 付款
				copy.setStuCash(Arith.sub(copy.getStuCash() , order.getRemainMoney()));
				studentDao.update(copy);
				stu.setStuCash(copy.getStuCash());
				Trade tradeOut = new Trade();
				tradeOut.setOrderId(order.getOrderId());
				tradeOut.setTradeOrderNo(order.getOrderNo());
				tradeOut.setStuId(copy.getStuId());
				tradeOut.setTradeMoney(0 - order.getRemainMoney());
				tradeOut.setOrderId(order.getOrderId());// 支付的确实存在的订单
				tradeOut.setTradeOrderNo(order.getOrderNo());
				tradeOut.setTradeTime(new Date());
				tradeOut.setTradePattern("账号扣除");
				tradeOut.setTradeType(Constant.BUYCLASS);
				tradeOut.setTradeCardBalance(copy.getStuCard());
				tradeOut.setTradeCashBalance(copy.getStuCash());
				tradeOut.setTradeNote("用户：" + copy.getStuUsername() + "订单号："
						+ order.getOrderNo());
				tradeDao.save(tradeOut);
				// 修改订单
				if (order.getCashMoney() <= 500) {
					order.setOrderPayment(payment);
				} else {
					
					order.setOrderPayment(Constant.CASH_BALANCE);
				}
				if (order.getOrderIsNeedSend() != 0) {
					order.setOrderStatus(Constant.FINISH);// 订单状态
					// 添加送货单
					Send send = new Send();
					send.setOrderId(order.getOrderId());// 设置关联订单
					send.setSendStatus(Constant.PRESEND);// 设置寄送状态
					send.setSendType(Constant.SEND_BOOK);//设置寄送类型
					send.setSendAddTime(new Date());// 设置添加时间
					send.setSendContent(isNeedSend(order.getOrderSendDetail()));
					sendDao.save(send);// 加入数据库
				} else {
					order.setOrderStatus(Constant.FINISH);
				}
				order.setOrderPayTime(new Date());
				order.setOrderPayType(getPayDetail(0, order, Double.parseDouble(money)));
				return true;
			}else
			{
				//余额不足以支付订单
				return false;
			}
		}else
		{
			//本身就是充值
			return false;
		}
	}
	private String isNeedSend(String content) {
		// 有赠送的情况，肯定还没有送
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
	// 从支付宝post过来的信息处理，不能有session或cookie,额外写个方法
	public boolean updateFromAliPost(String orderNo, String tradeNo,
			String money, String tradeType, String body) throws Exception {
		// TODO Auto-generated method stub
		Order order = null;
		int payment = 0;
		Student copy = null;
		order = orderDao.findByNo(orderNo);
		if(order!=null)
		{
			copy = (Student) order.getStudent();
		}else
		{
			copy = studentDao.findByUsername(body);
		}
		copy.setStuCash(Arith.add(copy.getStuCash() , Double.parseDouble(money)));
		studentDao.update(copy);// 更新账户
		Trade tradeIn = new Trade();
		if (tradeType.equals("ZFB")) {
			tradeIn.setTradeOrderNo("ZFB" + TimeFormat.format(new Date()).substring(8));
			tradeIn.setTradePattern("支付宝支付");
			tradeIn.setTradeNote("支付宝充值");
			payment = Constant.ZFB;

		} else if (tradeType.equals("WY"))  {
			tradeIn.setTradeOrderNo("WY" + TimeFormat.format(new Date()).substring(8));
			tradeIn.setTradePattern("网银支付");
			tradeIn.setTradeNote("网银充值");
			payment = Constant.WY;
		} else if(tradeType.equals("CFT"))
		{
			tradeIn.setTradeOrderNo("CFT" + TimeFormat.format(new Date()).substring(8));
			tradeIn.setTradePattern("财付通支付");
			tradeIn.setTradeNote("财付通充值");
			payment = Constant.CFT;
		}
		tradeIn.setCardId(tradeNo); // 支付宝或网银或财付通的交易单号
		tradeIn.setTradeMoney(Double.parseDouble(money));
		if(order!=null){tradeIn.setOrderId(order.getOrderId());}
		tradeIn.setStuId(copy.getStuId());
		tradeIn.setTradeCardBalance(copy.getStuCard());
		tradeIn.setTradeCashBalance(copy.getStuCash());
		tradeIn.setTradeType(Constant.RECHARGE);// 充值
		tradeIn.setTradeTime(new Date());
		tradeIn.setTradeIp(ServletActionContext.getRequest().getRemoteAddr());
		tradeDao.save(tradeIn);
		if (order != null) {
			if(order.getOrderStatus()!=Constant.WAIT_PAY)
				return false;
			if(order.getCashMoney()!=order.getOrderMoney()) payment = Constant.CARDANDCASH;
			if (order.getRemainMoney() <= copy.getStuCash()) {
				// 付款
				copy.setStuCash(Arith.sub(copy.getStuCash() , order.getRemainMoney()));
				studentDao.update(copy);
				Trade tradeOut = new Trade();
				tradeOut.setOrderId(order.getOrderId());
				tradeOut.setTradeOrderNo(order.getOrderNo());
				tradeOut.setStuId(copy.getStuId());
				tradeOut.setTradeMoney(0 - order.getRemainMoney());
				tradeOut.setOrderId(order.getOrderId());// 支付的确实存在的订单
				tradeOut.setTradeOrderNo(order.getOrderNo());
				tradeOut.setTradeTime(new Date());
				tradeOut.setTradePattern("账号扣除");
				tradeOut.setTradeType(Constant.BUYCLASS);
				tradeOut.setTradeCardBalance(copy.getStuCard());
				tradeOut.setTradeCashBalance(copy.getStuCash());
				tradeOut.setTradeNote("用户：" + copy.getStuUsername() + "订单号："
						+ order.getOrderNo());
				tradeDao.save(tradeOut);
				// 修改订单
				if (order.getCashMoney() <= 500) {
					order.setOrderPayment(payment);
				} else {
					
					order.setOrderPayment(Constant.CASH_BALANCE);
				}
				if (order.getOrderIsNeedSend() != 0) {
					order.setOrderStatus(Constant.FINISH);// 订单状态
					// 添加送货单
					Send send = new Send();
					send.setOrderId(order.getOrderId());// 设置关联订单
					send.setSendStatus(Constant.PRESEND);// 设置寄送状态
					send.setSendType(Constant.SEND_BOOK);//设置寄送类型
					send.setSendAddTime(new Date());// 设置添加时间
					send.setSendContent(isNeedSend(order.getOrderSendDetail()));
					sendDao.save(send);// 加入数据库
				} 
				order.setOrderPayTime(new Date());
				order.setOrderPayType(getPayDetail(0, order, Double.parseDouble(money)));
				return true;
			}else
			{
				//余额不足以支付订单
				return false;
			}
		}else
		{
			//本身就是充值
			return false;
		}
	}
	
	public boolean updatePayByCard(int orderId, Student stu) throws Exception {
		// TODO Auto-generated method stub
		Order order = null;
		Student copy = null;
		order = orderDao.findBy2Id(orderId,stu.getStuId());//订单
		if(order!=null&&order.getOrderStatus()==Constant.WAIT_PAY)
		{
			String present = isNeedSend(order.getOrderSendDetail());//订单寄送详情
			copy = order.getStudent();//数据库中实际的学员对象
			double cardValue = copy.getStuCard();
			double cashValue = copy.getStuCash();
			if(cardValue>0)	//学员学习卡余额不为0，
			{
				double remainMoney = order.getRemainMoney();
				if(cardValue<remainMoney) //但是学习卡余额不足以支付订单剩余支付金额
				{
					//把学习卡的余额都扣除
					copy.setStuCard(0.0);
					studentDao.update(copy);
					//添加交易记录
					Trade tradeOut = new Trade();
					tradeOut.setOrderId(order.getOrderId());
					tradeOut.setTradeOrderNo(order.getOrderNo());
					tradeOut.setStuId(copy.getStuId());
					tradeOut.setTradeMoney(0 - cardValue); //交易金额，就是学习卡的余额
					tradeOut.setOrderId(order.getOrderId());// 支付的确实存在的订单
					tradeOut.setTradeOrderNo(order.getOrderNo());
					tradeOut.setTradeTime(new Date());
					tradeOut.setTradePattern("学习卡账户支付");
					tradeOut.setTradeType(Constant.BUYCLASS);
					tradeOut.setTradeCardBalance(copy.getStuCard());
					tradeOut.setTradeCashBalance(copy.getStuCash());
					tradeOut.setTradeNote("学习卡余额支付"+cardValue+"元");
					tradeDao.save(tradeOut);
					//更新订单的支付情况
					order.setOrderPayType(getPayDetail(cardValue, order, 0));
					//此时订单并没有支付完成
					//更新session中的学习卡余额
					stu.setStuCard(0);
				}
				else	//学习卡余额足够支付剩余金额
				{
					//扣除学习卡支付的金额
					copy.setStuCard(Arith.sub(cardValue, remainMoney));
					studentDao.update(copy);
					//添加交易记录
					Trade tradeOut = new Trade();
					tradeOut.setOrderId(order.getOrderId());
					tradeOut.setTradeOrderNo(order.getOrderNo());
					tradeOut.setStuId(copy.getStuId());
					tradeOut.setTradeMoney(0 - remainMoney); //交易金额，就是学习卡的余额
					tradeOut.setOrderId(order.getOrderId());// 支付的确实存在的订单
					tradeOut.setTradeOrderNo(order.getOrderNo());
					tradeOut.setTradeTime(new Date());
					tradeOut.setTradePattern("学习卡账户支付");
					tradeOut.setTradeType(Constant.BUYCLASS);
					tradeOut.setTradeCardBalance(copy.getStuCard());
					tradeOut.setTradeCashBalance(copy.getStuCash());
					tradeOut.setTradeNote("学习卡余额支付"+remainMoney+"元");
					tradeDao.save(tradeOut);
					//更新订单的支付情况
					order.setOrderPayType(getPayDetail(remainMoney, order, 0));
					//此时订单已经支付完成
					if(order.getCashMoney()==0) //全部由学习卡支付完成
					{
						order.setOrderPayment(Constant.CARD);
					}else
					{
						order.setOrderPayment(Constant.CARDANDCASH);//混合支付
					}
					if ((present!=null&&!present.equals(""))) {
						// 添加送货单
						Send send = new Send();
						send.setOrderId(order.getOrderId());// 设置关联订单
						send.setSendStatus(Constant.PRESEND);// 设置寄送状态
						send.setSendAddTime(new Date());// 设置添加时间
						send.setSendContent(present);
						send.setSendType(Constant.SEND_BOOK);
						sendDao.save(send);// 加入数据库
					}
					order.setOrderStatus(Constant.FINISH);// 订单状态
					order.setOrderPayTime(new Date());
					//更新session中学习卡余额
					stu.setStuCard(copy.getStuCard());
					return true; //已经支付完成，不再往下执行
				}
			}
			//当学习卡不足以支付剩余金额时，执行到这里
			if(cashValue>0)	//	现金余额可以支付
			{
				double remainMoney2= order.getRemainMoney();//此时的remainMoney可能已经变化了
				if(cashValue<remainMoney2)	//不足以支付剩余金额
				{
					//把现金账户的余额都扣除
					copy.setStuCash(0);
					studentDao.update(copy);
					//添加交易记录
					Trade tradeOut = new Trade();
					tradeOut.setOrderId(order.getOrderId());
					tradeOut.setTradeOrderNo(order.getOrderNo());
					tradeOut.setStuId(copy.getStuId());
					tradeOut.setTradeMoney(0 - cashValue); //交易金额，就是现金的余额
					tradeOut.setOrderId(order.getOrderId());// 支付的确实存在的订单
					tradeOut.setTradeOrderNo(order.getOrderNo());
					tradeOut.setTradeTime(new Date());
					tradeOut.setTradePattern("现金账户支付");
					tradeOut.setTradeType(Constant.BUYCLASS);
					tradeOut.setTradeCardBalance(copy.getStuCard());
					tradeOut.setTradeCashBalance(copy.getStuCash());
					tradeOut.setTradeNote("现金余额支付"+cashValue+"元");
					tradeDao.save(tradeOut);
					//更新订单的支付情况
					order.setOrderPayType(getPayDetail(0, order, cashValue));
					//此时订单并没有支付完成
					//更新session中的现金余额
					stu.setStuCash(0);
				}
				else	//现金余额足够支付剩余金额
				{
					//扣除现金支付的金额
					copy.setStuCash(Arith.sub(cashValue, remainMoney2));
					studentDao.update(copy);
					//添加交易记录
					Trade tradeOut = new Trade();
					tradeOut.setOrderId(order.getOrderId());
					tradeOut.setTradeOrderNo(order.getOrderNo());
					tradeOut.setStuId(copy.getStuId());
					tradeOut.setTradeMoney(0 - remainMoney2); //交易金额，就是学习卡的余额
					tradeOut.setOrderId(order.getOrderId());// 支付的确实存在的订单
					tradeOut.setTradeOrderNo(order.getOrderNo());
					tradeOut.setTradeTime(new Date());
					tradeOut.setTradePattern("现金账户支付");
					tradeOut.setTradeType(Constant.BUYCLASS);
					tradeOut.setTradeCardBalance(copy.getStuCard());
					tradeOut.setTradeCashBalance(copy.getStuCash());
					tradeOut.setTradeNote("现金余额支付"+remainMoney2+"元");
					tradeDao.save(tradeOut);
					//更新订单的支付情况
					order.setOrderPayType(getPayDetail(0, order, remainMoney2));
					//此时订单已经支付完成
					if(order.getCashMoney()==order.getOrderMoney()) //全部由学习卡支付完成
					{
						order.setOrderPayment(Constant.CASH_BALANCE);
					}else
					{
						order.setOrderPayment(Constant.CARDANDCASH);//混合支付
					}
					if ((present!=null&&!present.equals(""))) {
						// 添加送货单
						Send send = new Send();
						send.setOrderId(order.getOrderId());// 设置关联订单
						send.setSendStatus(Constant.PRESEND);// 设置寄送状态
						send.setSendAddTime(new Date());// 设置添加时间
						send.setSendContent(present);
						send.setSendType(Constant.SEND_BOOK);
						sendDao.save(send);// 加入数据库
					}
					order.setOrderStatus(Constant.FINISH);// 订单状态
					order.setOrderPayTime(new Date());
					//更新session中现金余额
					stu.setStuCash(copy.getStuCash());
					return true; //已经支付完成，不再往下执行
				}
			}
			return false; //仍然没有支付完
		}
		return false;//订单不存在
}
	private String getPayDetail(double card,Order order,double cash)
	{
		String paytype = order.getOrderPayType(); //获取支付详情，具体形式为   100:0;
		//解析支付详情
		String[] arr = paytype.split("[:]");
		//避免解析异常
		double card1 = 0,cash1=0;
		try{
			card1 = Double.valueOf(arr[0]);
		}catch(Exception e)
		{
			card1 = 0;
		}
		try{
			cash1 = Double.valueOf(arr[1]);
		}catch(Exception e)
		{
			cash1 = 0;
		}
		return (card1+card)+":"+(cash+cash1);
	}
	public Send findSendNoAddress(int stuId) throws Exception {
		// TODO Auto-generated method stub
		return sendDao.findNoAddress(stuId);
	}
	public Order findBy2Id(int orderId, int stuId) throws Exception {

		// TODO Auto-generated method stub
		return orderDao.findBy2Id(orderId, stuId);
	}
	/**
	 * 大额分次支付
	 */
	public boolean updateMultipay(String orderNo, String tradeNo, String money,
			String tradeType, String body, Student stu) throws Exception {
		// TODO Auto-generated method stub
		Order order = null;
		int payment = 0;
		Student copy = null;
		order = orderDao.findByNo(orderNo.substring(orderNo.indexOf("-")+1));
		if(order!=null)
		{
			copy = (Student) order.getStudent();
		}else
		{
			copy = (Student)stu.clone();
		}
		copy.setStuCash(Arith.add(copy.getStuCash() , Double.parseDouble(money)));
		studentDao.update(copy);// 更新账户
		stu.setStuCash(copy.getStuCash());//更新session
		Trade tradeIn = new Trade();
		if (tradeType.equals("ZFB")) {
			tradeIn.setTradeOrderNo("ZFB" + TimeFormat.format(new Date()).substring(8));
			tradeIn.setTradePattern("支付宝支付");
			tradeIn.setTradeNote("支付宝充值");
			payment = Constant.ZFB;

		} else if (tradeType.equals("WY"))  {
			tradeIn.setTradeOrderNo("WY" + TimeFormat.format(new Date()).substring(8));
			tradeIn.setTradePattern("网银支付");
			tradeIn.setTradeNote("网银分次支付充值");
			payment = Constant.WY;
		} else if(tradeType.equals("CFT"))
		{
			tradeIn.setTradeOrderNo("CFT" + TimeFormat.format(new Date()).substring(8));
			tradeIn.setTradePattern("财付通支付");
			tradeIn.setTradeNote("财付通充值");
			payment = Constant.CFT;
		}
		tradeIn.setCardId(tradeNo); // 支付宝或网银或财付通的交易单号
		tradeIn.setTradeMoney(Double.parseDouble(money));
		if(order!=null){tradeIn.setOrderId(order.getOrderId());}
		tradeIn.setStuId(stu.getStuId());
		tradeIn.setTradeCardBalance(copy.getStuCard());
		tradeIn.setTradeCashBalance(copy.getStuCash());
		tradeIn.setTradeType(Constant.RECHARGE);// 充值
		tradeIn.setTradeTime(new Date());
		tradeIn.setTradeIp(ServletActionContext.getRequest().getRemoteAddr());
		tradeDao.save(tradeIn);
		if (order != null) {
			if(order.getOrderStatus()!=Constant.WAIT_PAY)
				return false;
			if(order.getCashMoney()!=order.getOrderMoney()) payment = Constant.CARDANDCASH;
			if (order.getRemainMoney() <= copy.getStuCash()) {
				// 付款
				copy.setStuCash(Arith.sub(copy.getStuCash() , order.getRemainMoney()));
				studentDao.update(copy);
				stu.setStuCash(copy.getStuCash());
				Trade tradeOut = new Trade();
				tradeOut.setOrderId(order.getOrderId());
				tradeOut.setTradeOrderNo(order.getOrderNo());
				tradeOut.setStuId(copy.getStuId());
				tradeOut.setTradeMoney(0 - order.getRemainMoney());
				tradeOut.setOrderId(order.getOrderId());// 支付的确实存在的订单
				tradeOut.setTradeOrderNo(order.getOrderNo());
				tradeOut.setTradeTime(new Date());
				tradeOut.setTradePattern("账号扣除");
				tradeOut.setTradeType(Constant.BUYCLASS);
				tradeOut.setTradeCardBalance(copy.getStuCard());
				tradeOut.setTradeCashBalance(copy.getStuCash());
				tradeOut.setTradeNote("大额分次支付，用户：" + copy.getStuUsername() + "订单号："
						+ order.getOrderNo());
				tradeDao.save(tradeOut);
				// 修改订单
					order.setOrderPayment(payment);
				if (order.getOrderIsNeedSend() != 0) {
					order.setOrderStatus(Constant.FINISH);// 订单状态
					// 添加送货单
					Send send = new Send();
					send.setOrderId(order.getOrderId());// 设置关联订单
					send.setSendStatus(Constant.PRESEND);// 设置寄送状态
					send.setSendType(Constant.SEND_BOOK);//设置寄送类型
					send.setSendAddTime(new Date());// 设置添加时间
					send.setSendContent(isNeedSend(order.getOrderSendDetail()));
					sendDao.save(send);// 加入数据库
				} else {
					order.setOrderStatus(Constant.FINISH);
				}
				order.setOrderPayTime(new Date());
				order.setOrderPayType(getPayDetail(0, order, Double.parseDouble(money)));
				return true;
			}else
			{
				//余额不足以支付订单，扣除现金账户余额
				double cashValue = copy.getStuCash();
				copy.setStuCash(0.0);
				studentDao.update(copy);
				stu.setStuCash(copy.getStuCash());
				Trade tradeOut = new Trade();
				tradeOut.setOrderId(order.getOrderId());
				tradeOut.setTradeOrderNo(order.getOrderNo());
				tradeOut.setStuId(copy.getStuId());
				tradeOut.setTradeMoney(0-cashValue);
				tradeOut.setOrderId(order.getOrderId());// 支付的确实存在的订单
				tradeOut.setTradeOrderNo(order.getOrderNo());
				tradeOut.setTradeTime(new Date());
				tradeOut.setTradePattern("账号扣除");
				tradeOut.setTradeType(Constant.BUYCLASS);
				tradeOut.setTradeCardBalance(copy.getStuCard());
				tradeOut.setTradeCashBalance(copy.getStuCash());
				tradeOut.setTradeNote("大额分次支付，用户：" + copy.getStuUsername() + "订单号："
						+ order.getOrderNo());
				tradeDao.save(tradeOut);
				// 修改订单支付情况
				order.setOrderPayType(getPayDetail(0, order, Double.parseDouble(money)));
				return true;
			}
		}else
		{
			//本身就是充值
			return false;
		}
	}
	
	//2014.03.17更新有限制的item
	@Override
	public void updateItem(Integer itemId, String s,String gid) {
		// TODO Auto-generated method stub
		Items item = itemDao.findById(itemId);
		String note = item.getItemNote();
		if(note.contains("###"))
		{
			item.setItemNote(replaceItemNote(note, s, gid));
		}else
		{
			item.setItemNote(s);
		}
		itemDao.update(item);
	}
	private String replaceItemNote(String note,String s,String gid)
	{
		String pre = note.substring(0,note.indexOf(gid));
		String temp = note.substring(note.indexOf(gid),note.length());
		if(temp.indexOf("###")!=-1)
		{
			String aft = temp.substring(temp.indexOf("###"), temp.length());
			return pre+s+aft;
		}else
		{
			return pre+s;
		}
	}
}
