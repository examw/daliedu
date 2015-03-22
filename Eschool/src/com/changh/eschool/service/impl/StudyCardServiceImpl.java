package com.changh.eschool.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.changh.eschool.dao.RechargeRecordDAO;
import com.changh.eschool.dao.StudentDAO;
import com.changh.eschool.dao.StudyCardDAO;
import com.changh.eschool.dao.TradeDAO;
import com.changh.eschool.entity.RechargeRecord;
import com.changh.eschool.entity.Student;
import com.changh.eschool.entity.StudyCard;
import com.changh.eschool.entity.Trade;
import com.changh.eschool.service.StudyCardService;
import com.changh.eschool.until.Constant;
import com.changh.eschool.until.TimeFormat;

public class StudyCardServiceImpl implements StudyCardService{
	//injection
	private StudyCardDAO studyCardDao;
	private StudentDAO studentDao;
	private RechargeRecordDAO rechargeRecordDao;
	private TradeDAO tradeDao;
	
	public void setTradeDao(TradeDAO tradeDao) {
		this.tradeDao = tradeDao;
	}

	public void setStudyCardDao(StudyCardDAO studyCardDao)throws Exception {
		this.studyCardDao = studyCardDao;
	}
	
	public void setStudentDao(StudentDAO studentDao) {
		this.studentDao = studentDao;
	}

	public void setRechargeRecordDao(RechargeRecordDAO rechargeRecordDao) {
		this.rechargeRecordDao = rechargeRecordDao;
	}

	public int recharge(int cardId,String password,int money) throws Exception {
		/**
		 * 学习卡充值
		 * 1，核对学习卡的卡号密码及是否过期，充值金额大于余额
		 * ，根据学习卡类型，免费送的一人只能冲一次，不能重复充值
		 * 2，充值成功,更新学习卡状态
		 * 3，更新学员账户信息
		 * 4，添加充值记录
		 */
		StudyCard card = studyCardDao.findById(cardId);
		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
		String str = format.format(new Date());
		Date today = format.parse(str);
		//卡号和密码都正确而且没有过期并且没有充值过
		if(card!=null&&card.getCardPassword().equals(password))
		{
			Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("student");
			if(student==null) return -4;//登录已经失效
			if(card.getCardOverTime().compareTo(today)<0)
			{
				return -1; //学习卡有效期已过
			}
			//充值卡是赠送卡，并且充值过赠送卡（赠送卡一人一次）
			RechargeRecord rr = rechargeRecordDao.findFreeCard(student.getStuId());
			if(card.getCardIsPresent()==1)
			{
				if(rr!=null&&rr.getRcCardId()!=cardId)
				{
					return -3; //学习卡属于赠送卡并且已经使用过一次
				}
				money = card.getCardValue();//赠送类型的一次性充值完毕
			}
			if(card.getCardBalance()<money)
			{
				return (int) (-100-card.getCardBalance()); //充值金额大于余额
			}
			//更新学习卡状态
			card.setStuId(student.getStuId());
			card.setCardUseTime(new Date());
			card.setCardBalance(card.getCardBalance()-money);//更新余额
			studyCardDao.update(card);
			//更新学员账户信息,一旦下面的失败会影响session中的这个值,所以copy一个副本进行操作
			Student copyStu = (Student) student.clone();
			copyStu.setStuCard(student.getStuCard()+money);
			studentDao.update(copyStu);
			//添加充值记录
			RechargeRecord record = new RechargeRecord();
			record.setRcAddTime(new Date());//充值时间
			record.setRcCardId(card.getCardId());//充值卡号
			record.setRcMoney(money);//充值金额
			record.setRcIp(ServletActionContext.getRequest().getRemoteAddr());//充值ip
			record.setRcIsPresent(card.getCardIsPresent());//是否为赠送
			record.setRcType(0);//学习卡充值
			record.setStudent(student);
			rechargeRecordDao.save(record);//添加到数据库
			Trade trade = new Trade();
			trade.setCardId(card.getCardNo());
			trade.setTradeOrderNo("XXK"+TimeFormat.format(new Date()).substring(8));
			trade.setStuId(student.getStuId());
			trade.setTradePattern("学习卡充值");
			trade.setTradeType(Constant.RECHARGE);
			trade.setTradeMoney(money);
			trade.setTradeCardBalance(copyStu.getStuCard());
			trade.setTradeCashBalance(student.getStuCash());
			trade.setTradeIp(ServletActionContext.getRequest().getRemoteAddr());
			trade.setTradeTime(new Date());
			trade.setTradeNote("学习卡充值，卡号："+card.getCardNo());
			tradeDao.save(trade);
			//更新session中stu的值
			student.setStuCard(student.getStuCard()+money);
			ServletActionContext.getRequest().getSession().setAttribute("student", student);
			return money;//充值成功，返回充值的金额
		}
		return 0; //卡号或者密码错误
	}
	public List<RechargeRecord> findRecordByStuId(int stuId,int page,int pagesize,String sortname,String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return rechargeRecordDao.findPageByStuId(stuId, page, pagesize, sortname, sortorder);
	}
	public StudyCard findCard(int cardId, String password) throws Exception {
		// TODO Auto-generated method stub
		return studyCardDao.findCard(cardId, password);
	}
	public long findTotalByStuId(int stuId)throws Exception
	{
		return rechargeRecordDao.findTotalByStuId(stuId);
	}
	@Override
	public List<Trade> findTradeByStuId(int stuId, int page, int pagesize,
			String sortname, String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return tradeDao.findPageByStuId(stuId, Constant.RECHARGE, page, pagesize, sortname, sortorder);
	}
	@Override
	public long findTradeTotalByStuId(int stuId) throws Exception {
		// TODO Auto-generated method stub
		return tradeDao.findTotalByStuId(stuId, Constant.RECHARGE);
	}
	
}  

