package com.changh.eschool.service.impl;

import com.changh.eschool.dao.WebInfoDAO;
import com.changh.eschool.entity.WebInfo;
import com.changh.eschool.service.WebInfoService;

public class WebInfoServiceImpl implements WebInfoService {
	
	private WebInfoDAO webInfoDao;

	public WebInfo findWebInfo() {
		return webInfoDao.findWebInfo();
	}

	public void setWebInfoDao(WebInfoDAO webInfoDao) {
		this.webInfoDao = webInfoDao;
	}

}
