package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.Trade;
import com.changh.sccms.until.Constant;

public interface TradeDAO {
	public static final String ALL=" where 1=1 ";
	public static final String RECHARGE=" where tradeType = 1 ";
	public static final String BUYCLASS=" where tradeType = 2 ";
	public static final String OTHER=" where tradeType not in (1,2) ";
	//保存
	public void save(Trade trade)throws Exception;
	//查找
	
	//条件查找 带分页
	public List<Trade> findPageByCriteria(int page,int pagesize,String sortname,String sortorder,String criteria)throws Exception;
	public long getTotal(String criteria)throws Exception;
	public List<Trade> findByOrderId(int orderId)throws Exception;
}
