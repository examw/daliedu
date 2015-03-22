package com.changh.eschool.service.impl;

import com.changh.eschool.dao.AddressDAO;
import com.changh.eschool.dao.SendDAO;
import com.changh.eschool.entity.Address;
import com.changh.eschool.entity.Send;
import com.changh.eschool.service.SendService;

public class SendServiceImpl implements SendService{
	private SendDAO sendDao;
	private AddressDAO addressDao;
	
	public void setSendDao(SendDAO sendDao) {
		this.sendDao = sendDao;
	}
	
	public void setAddressDao(AddressDAO addressDao) {
		this.addressDao = addressDao;
	}


	public boolean updateAddress(Send send,int stuId) throws Exception {
		// TODO Auto-generated method stub
		Send realSend = sendDao.findById(send.getSendId());
		if(realSend!=null)
		{
			realSend.setSendFullAddress(send.getSendFullAddress());
			realSend.setSendReceiveName(send.getSendReceiveName());
			realSend.setSendMobile(send.getSendMobile());
			realSend.setSendPostalCode(send.getSendPostalCode());
			//sendDao.update(realSend);
			//将地址保存到地址表
			Address addr = new Address();
			addr.setStuId(stuId);
			addr.setAddrReceiveName(send.getSendReceiveName());
			addr.setAddrFullAddress(send.getSendFullAddress());
			addr.setAddrMobile(send.getSendMobile());
			addr.setAddrPostalCode(send.getSendPostalCode());
			addr.setAddrEmail("");
			addr.setAddrPhone("");
			addr.setAddrIsDefault(0);
			addressDao.save(addr);
		}
		
		return realSend!=null;
	}
	public Send findById(int sendId)throws Exception
	{
		return sendDao.findById(sendId);
	}
}
