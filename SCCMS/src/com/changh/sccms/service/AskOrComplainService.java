package com.changh.sccms.service;

import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.AskOrComplain;
import com.changh.sccms.entity.Reply;

public interface AskOrComplainService {
	public void save(AskOrComplain ac)throws Exception;
	public void update(AskOrComplain ac)throws Exception;
	public AskOrComplain findById(int acId)throws Exception;
	public Map<String,Object> findPageByCriteria(int page,int pagesize,String sortname,String sortorder,String criteria)throws Exception;
	public void addReply(Reply reply)throws Exception;
	public List<Reply> findReplyByAcId(int acId)throws Exception;
}
