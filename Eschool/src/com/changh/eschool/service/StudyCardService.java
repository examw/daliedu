package com.changh.eschool.service;

import java.util.List;

import com.changh.eschool.entity.RechargeRecord;
import com.changh.eschool.entity.StudyCard;
import com.changh.eschool.entity.Trade;


public interface StudyCardService {
	//—ßœ∞ø®≥‰÷µ
	public int recharge(int cardId,String password,int money)throws Exception;
	//≥‰÷µº«¬º
	public List<RechargeRecord> findRecordByStuId(int stuId,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long findTotalByStuId(int stuId)throws Exception;
	public List<Trade> findTradeByStuId(int stuId,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long findTradeTotalByStuId(int stuId)throws Exception;
	//—ßœ∞ø®”‡∂Ó≤È—Ø
	public StudyCard findCard(int cardId,String password)throws Exception;
}
