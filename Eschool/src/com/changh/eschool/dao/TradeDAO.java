package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.Trade;

public interface TradeDAO {
	//保存
	public void save(Trade trade)throws Exception;
	
	//条件查找 带分页
	public List<Trade> findPageByStuId(int stuId,int tradeType,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long findTotalByStuId(int stuId,int tradeType)throws Exception;
}
