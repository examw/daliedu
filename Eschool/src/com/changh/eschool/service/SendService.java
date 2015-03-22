package com.changh.eschool.service;

import com.changh.eschool.entity.Send;

public interface SendService {
	public boolean updateAddress(Send send,int stuId)throws Exception;
	public Send findById(int sendId)throws Exception;
}
