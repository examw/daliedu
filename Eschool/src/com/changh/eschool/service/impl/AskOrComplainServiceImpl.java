package com.changh.eschool.service.impl;

import java.util.Date;
import java.util.List;

import com.changh.eschool.dao.AskOrComplainDAO;
import com.changh.eschool.dao.ReplyDAO;
import com.changh.eschool.entity.AskOrComplain;
import com.changh.eschool.entity.Reply;
import com.changh.eschool.service.AskOrComplainService;

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
	public List<AskOrComplain> findPageByCriteria(int page, int pagesize,
			String sortname, String sortorder, String criteria)
			throws Exception {
		// TODO Auto-generated method stub
		return askOrComplainDao.findPageByCriteria(page, pagesize, sortname, sortorder, criteria);
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
	}
	public Reply findReplyByAcId(int acId) throws Exception {
		// TODO Auto-generated method stub
		return replyDao.findByAcId(acId);
	}
}
