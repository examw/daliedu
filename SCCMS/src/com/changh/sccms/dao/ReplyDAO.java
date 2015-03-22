package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.Reply;

public interface ReplyDAO {
	public void save(Reply reply)throws Exception;
	public List<Reply> findByAcId(int acId)throws Exception;
}
