package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.RechargeRecord;

public interface RechargeRecordDAO {
	public List<RechargeRecord> findByStuId(int stuId)throws Exception;
	public void save(RechargeRecord record)throws Exception;
	/*
	 * 是否是免费的充值卡
	 */
	public RechargeRecord findFreeCard(int stuId)throws Exception;
	public List<RechargeRecord> findByCardId(int cardId)throws Exception;
	//分页充值记录
	public List<RechargeRecord> findPageByStuId(int stuId,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long findTotalByStuId(int stuId)throws Exception;
}
