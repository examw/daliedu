package com.changh.sccms.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.Send;

public interface SendService {
	public Map<String,Object> findPageByCriteria(int page,int pagesize,String criteria,String sortname,String sortorder)throws Exception;
	public Send findById(int sendId)throws Exception;
	public List<Send> findByOrderId(int orderId) throws Exception;
	public boolean update(Send send)throws Exception;
	public Map<String,Object> searchPage(int page,int pagesize,String criteria,Date addDate, Date confirmDate ,String sortname,String sortorder)throws Exception;
	public void updateForAddAddress(Send send)throws Exception;
}
