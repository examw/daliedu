package com.changh.eschool.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.changh.eschool.dao.ItemDAO;
import com.changh.eschool.dao.LessonCardDAO;
import com.changh.eschool.dao.OrderDAO;
import com.changh.eschool.entity.CartItem;
import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.LessonCard;
import com.changh.eschool.entity.Order;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.CartService;
import com.changh.eschool.service.LessonCardService;
import com.changh.eschool.until.Constant;

public class LessonCardServiceImpl implements LessonCardService{
	//injection
	private LessonCardDAO LessonCardDao;
	private OrderDAO orderDao;
	private ItemDAO itemDao;
	private CartService cartService;
	
	public void setLessonCardDao(LessonCardDAO LessonCardDao)throws Exception {
		this.LessonCardDao = LessonCardDao;
	}
	
	public void setOrderDao(OrderDAO orderDao) {
		this.orderDao = orderDao;
	}
	
	public OrderDAO getOrderDao() {
		return orderDao;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public int recharge(int cardId,String password,int money) throws Exception {
		/**
		 * ѧϰ����ֵ
		 * 1���˶�ѧϰ���Ŀ������뼰�Ƿ���ڣ���ֵ���������
		 * 2����ֵ�ɹ�,����ѧϰ��״̬
		 * 3���µ�,ע������һ��Ҫ�ǹ���Ա����
		 */
		LessonCard card = LessonCardDao.findById(cardId);
		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
		String str = format.format(new Date());
		Date today = format.parse(str);
		//���ź����붼��ȷ����û�й��ڲ���û�г�ֵ��
		if(card!=null&&card.getCardPassword().equals(password))
		{
			Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("student");
			if(student==null) return -4;//��¼�Ѿ�ʧЧ
			if(card.getCardOverTime().compareTo(today)<0)
			{
				return -1; //ѧϰ����Ч���ѹ�
			}
			if(card.getCardUseTime()!=null) return -3; //�ѱ�ʹ��
			//����ѧϰ��״̬
			card.setStuId(student.getStuId());
			card.setCardUseTime(new Date());
			LessonCardDao.update(card);
			String includeIds = card.getIncludeClassIds();
			//����ַ���
			String pkgIds = includeIds.split("\\|")[0];
			if(pkgIds.split(":").length>1){
				pkgIds = pkgIds.split(":")[1];
			}else{
				pkgIds = null;
			}
			String gradeIds = includeIds.split("\\|")[1];
			if(gradeIds.split(":").length>1){
				gradeIds = gradeIds.split(":")[1];
			}else{
				gradeIds = null;
			}
			//ģ��һ�����ﳵ
			List<CartItem> cart = cartService.getProFromIds(pkgIds, gradeIds);
			//�µ�
			Order order = new Order();
			order.setStudent(student);
			order.setOrderInvoice(0);
			order.setOrderStatus(Constant.FINISH); //����״̬
			order.setOrderPayment(Constant.ADMIN); //����Ա��̨����
			order.setOrderNote("��ֵ���ο�,ģ�����Ա��̨����");
			order.setOrderMoney(0);
			order.setOrderAddTime(new Date());
			order.setOrderPayType("0:0");
			order.setOrderPrice(0);
			order.setAdmId(0);
			order.setOrderDealTime(new Date());
			int orderid = orderDao.save(order);
			// ////////////////////////////////
			order.setOrderId(orderid);
			// ////////////
			// ѭ�����ﳵ���ɶ�����Ŀ
			for (CartItem cartitem : cart) {
				 Items item = cartitem.getItem();
				 item.setOrderId(orderid);
				 itemDao.save(item);	
			}
			cartService.remove();	//��չ��ﳵ
			return 200;//��ֵ�ɹ������س�ֵ�Ľ��
		}
		return 0; //���Ż����������
	}

	public void setItemDao(ItemDAO itemDao) {
		this.itemDao = itemDao;
	}
}  

