package com.changh.sccms.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.dao.SendDAO;
import com.changh.sccms.entity.Order;
import com.changh.sccms.entity.Send;
import com.changh.sccms.service.SendService;
import com.changh.sccms.until.GridDataUtil;

public class SendServiceImpl implements SendService{
	private SendDAO sendDao;

	public void setSendDao(SendDAO sendDao) {
		this.sendDao = sendDao;
	}
	public Map<String, Object> findPageByCriteria(int page, int pagesize,
			String criteria, String sortname, String sortorder)
			throws Exception {
		List<Send> list = sendDao.findPageByCriteria(page, pagesize, criteria, sortname, sortorder);
		int total =(int)sendDao.findTotal(criteria);
		return GridDataUtil.gridMap(list, total);
	}
	public Send findById(int sendId) throws Exception {
		return sendDao.findById(sendId);
	}
	public boolean update(Send send) throws Exception {
		boolean flag = false;
		try{
			//更新寄送表
			Send realSend = sendDao.findById(send.getSendId());
			realSend.setSendStatus(send.getSendStatus());
			realSend.setSendPerson(send.getSendPerson());
			realSend.setSendTime(send.getSendTime());
			realSend.setEpcId(send.getEpcId());
			realSend.setSendCost(send.getSendCost());
			realSend.setEpcName(send.getEpcName());
			realSend.setSendConfirmTime(send.getSendConfirmTime());
			//更新order订单表，更新订单表的状态
			//need code
			//sendDao.update(realSend);
			flag = true;
		}catch(NullPointerException e)
		{
			flag=false;
		}catch(Exception e)
		{
			throw e;
		}
		return flag;
	}
	public List<Send> findByOrderId(int orderId) throws Exception {
		return sendDao.findByOrderId(orderId);
	}
	public Map<String, Object> searchPage(int page, int pagesize,
			String criteria, Date addDate, Date confirmDate, String sortname,
			String sortorder) throws Exception {
		List<Send> list=null;
		//包含and不分页
		if(criteria.contains("and"))
		{
			list = sendDao.searchPage(criteria, addDate, confirmDate);
			return GridDataUtil.gridMap(list, list.size());
		}else
		{
			list = sendDao.searchPage(page, pagesize, criteria, addDate, confirmDate, sortname, sortorder);
			int total =(int)sendDao.findTotal(criteria);
			return GridDataUtil.gridMap(list, total);
		}
	}
	public void updateForAddAddress(Send send) throws Exception {
		// TODO Auto-generated method stub
		Send realSend = sendDao.findById(send.getSendId());
		if(realSend!=null)
		{
			realSend.setSendFullAddress(send.getSendFullAddress());
			realSend.setSendMobile(send.getSendMobile());
			realSend.setSendReceiveName(send.getSendReceiveName());
			realSend.setSendPostalCode(send.getSendPostalCode());
			//sendDao.update(realSend); 	//加事务后不写
		}
	}
}
