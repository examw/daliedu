package com.changh.sccms.service.impl;

import com.changh.sccms.dao.WebInfoDAO;
import com.changh.sccms.entity.WebInfo;
import com.changh.sccms.service.WebInfoService;

public class WebInfoServiceImpl implements WebInfoService {
	
	private WebInfoDAO webInfoDao;
	public void saveOrUpdate(WebInfo info) {
		webInfoDao.saveOrUpdate(info);
	}

	public WebInfo findWebInfo() {
		return webInfoDao.findWebInfo();
	}

	public void setWebInfoDao(WebInfoDAO webInfoDao) {
		this.webInfoDao = webInfoDao;
	}

}
