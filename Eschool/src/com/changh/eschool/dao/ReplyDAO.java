package com.changh.eschool.dao;

import com.changh.eschool.entity.Reply;

public interface ReplyDAO {
	public void save(Reply reply)throws Exception;
	public Reply findByAcId(int acId)throws Exception;
}
