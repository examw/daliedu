package com.changh.sccms.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.dao.TradeDAO;
import com.changh.sccms.entity.Trade;
import com.changh.sccms.service.TradeService;
import com.changh.sccms.until.GridDataUtil;

public class TradeServiceImpl implements TradeService{
	private TradeDAO tradeDao;
	
	public void setTradeDao(TradeDAO tradeDao) {
		this.tradeDao = tradeDao;
	}
	public List<Trade> findPageByCriteria(final int page, final int pagesize,
			final String sortname,final String sortorder,final String criteria)
			throws Exception {
		
		return tradeDao.findPageByCriteria(page, pagesize, sortname, sortorder, criteria);
		
	}
	public long getTotal(String criteria) throws Exception {
		
		return tradeDao.getTotal(criteria);
	}
	public Map<String, Object> findAll(int page, int pagesize, String sortname,
			String sortorder, String criteria) throws Exception {
		// TODO Auto-generated method stub
		List<Trade> list = tradeDao.findPageByCriteria(page, pagesize, sortname, sortorder, criteria);
		int total = (int) tradeDao.getTotal(criteria);
		return GridDataUtil.gridMap(list, total); 
	}
	public Map<String, Object> search(int page, int pagesize, String sortname,
			String sortorder, Date before,Date after, String orderId, String type)
			throws Exception {
		// TODO Auto-generated method stub
		StringBuffer criteria = new StringBuffer();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(type!=null&&!type.equals(""))
		{
			type = type.equals("all")?TradeDAO.ALL:type.equals("recharge")?TradeDAO.RECHARGE:type.equals("buyclass")?TradeDAO.BUYCLASS:TradeDAO.OTHER;
			criteria.append(type);
		}else
		{
			criteria.append(TradeDAO.ALL);
		}
		if(before!=null&&after==null)
		{
			criteria.append(" and tradeTime < '");
			criteria.append(format.format(before));
			criteria.append("' ");
		}
		else if(before==null&&after!=null)
		{
			criteria.append(" and tradeTime > '");
			criteria.append(format.format(after));
			criteria.append("' ");
		}
		else if(before!=null&&after!=null)
		{
			criteria.append(" and (tradeTime between '");
			criteria.append(format.format(after));
			criteria.append("' and '");
			criteria.append(format.format(before));
			criteria.append("') ");
		}
		criteria.append(" and tradeOrderNo like '%");
		criteria.append(orderId);
		criteria.append("%' ");
		List<Trade> list = tradeDao.findPageByCriteria(page, pagesize, sortname, sortorder, criteria.toString());
		int total = (int) tradeDao.getTotal(criteria.toString());
		return GridDataUtil.gridMap(list, total); 
	}
	public List<Trade> findByOrderId(int orderId) throws Exception {
		// TODO Auto-generated method stub
		return tradeDao.findByOrderId(orderId);
	}
}
