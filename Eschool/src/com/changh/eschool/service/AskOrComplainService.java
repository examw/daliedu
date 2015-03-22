package com.changh.eschool.service;

import java.util.List;

import com.changh.eschool.entity.AskOrComplain;
import com.changh.eschool.entity.Reply;

public interface AskOrComplainService {
	public void save(AskOrComplain ac)throws Exception;
	public void update(AskOrComplain ac)throws Exception;
	public AskOrComplain findById(int acId)throws Exception;
	public List<AskOrComplain> findPageByCriteria(int page,int pagesize,String sortname,String sortorder,String criteria)throws Exception;
	public void addReply(Reply reply)throws Exception;
	public long findTotal(String criteria) throws Exception ;
	public Reply findReplyByAcId(int acId)throws Exception;
}
