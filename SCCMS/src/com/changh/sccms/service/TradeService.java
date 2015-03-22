package com.changh.sccms.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.Trade;

public interface TradeService {
	//条件查找 带分页
		public List<Trade> findPageByCriteria(int page,int pagesize,String sortname,String sortorder,String criteria)throws Exception;
		public long getTotal(String criteria)throws Exception;
		public Map<String,Object> findAll(int page,int pagesize,String sortname,String sortorder,String criteria)throws Exception;
		public Map<String,Object> search(int page,int pagesize,String sortname,String sortorder,Date before,Date after,String orderId,String type)throws Exception;
		public List<Trade> findByOrderId(int orderId)throws Exception;
}
