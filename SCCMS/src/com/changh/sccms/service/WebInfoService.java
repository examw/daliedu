package com.changh.sccms.service;

import com.changh.sccms.entity.WebInfo;

public interface WebInfoService {
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
