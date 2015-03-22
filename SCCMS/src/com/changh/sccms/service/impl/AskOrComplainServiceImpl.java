package com.changh.sccms.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.dao.AskOrComplainDAO;
import com.changh.sccms.dao.ReplyDAO;
import com.changh.sccms.entity.AskOrComplain;
import com.changh.sccms.entity.Reply;
import com.changh.sccms.service.AskOrComplainService;
import com.changh.sccms.until.GridDataUtil;

public class AskOrComplainServiceImpl implements AskOrComplainService{
	private AskOrComplainDAO askOrComplainDao;
	private ReplyDAO replyDao;
	
	public void setReplyDao(ReplyDAO replyDao) {
		this.replyDao = replyDao;
	}
	public void setAskOrComplainDao(AskOrComplainDAO askOrComplainDao) {
		this.askOrComplainDao = askOrComplainDao;
	}
	public AskOrComplain findById(int acId) throws Exception {
		// TODO Auto-generated method stub
		return askOrComplainDao.findById(acId);
	}
	public Map<String,Object> findPageByCriteria(int page, int pagesize,
			String sortname, String sortorder, String criteria)
			throws Exception {
		// TODO Auto-generated method stub
		List<AskOrComplain> list = askOrComplainDao.findPageByCriteria(page, pagesize, sortname, sortorder, criteria);
		int total = (int) askOrComplainDao.findTotal(criteria);
		return GridDataUtil.gridMap(list, total);
	}
	public long findTotal(String criteria) throws Exception {
		// TODO Auto-generated method stub
		return askOrComplainDao.findTotal(criteria);
	}
	public void save(AskOrComplain ac) throws Exception {
		// TODO Auto-generated method stub
		ac.setAcAddTime(new Date());
		askOrComplainDao.save(ac);
	}
	public void update(AskOrComplain ac) throws Exception {
		// TODO Auto-generated method stub
		askOrComplainDao.update(ac);
	}
	
	public void addReply(Reply reply)throws Exception
	{
		reply.setReplyAddTime(new Date());
		replyDao.save(reply);
		AskOrComplain ac = askOrComplainDao.findById(reply.getAcId());
		ac.setAcStatus(1);
		askOrComplainDao.update(ac);//更新，理论上不需要写这个，怎么不更新了？
	}
	public List<Reply> findReplyByAcId(int acId) throws Exception {
		// TODO Auto-generated method stub
		return replyDao.findByAcId(acId);
	}
}
