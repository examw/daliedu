package com.changh.sccms.dao;

import com.changh.sccms.entity.WebInfo;

public interface WebInfoDAO {
	/**
	 * 修改网站基本信息
	 * @param info
	 */
	public void saveOrUpdate(WebInfo info);
	/**
	 * 查找基本信息
	 * @return
	 */
	public WebInfo findWebInfo();
}
