package com.changh.sccms.service.impl;

import java.util.List;

import com.changh.sccms.dao.NewsClassDAO;
import com.changh.sccms.entity.NewClass;
import com.changh.sccms.service.NewClassService;

public class NewClassServiceImpl implements NewClassService{

	//injection
	private NewsClassDAO newClassDao  ;
		
	public void setNewClassDao(NewsClassDAO newClassDao)throws Exception {
		this.newClassDao = newClassDao;
	}
	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return newClassDao.delete(id);
	}

	@Override
	public boolean saveOrupdate(NewClass newclass) {
		// TODO Auto-generated method stub
		return newClassDao.saveOrupdate(newclass);
	}

	@Override
	public NewClass findById(int id) {
		// TODO Auto-generated method stub
		return newClassDao.findById(id);
	}

	@Override
	public Integer getTotal() {
		// TODO Auto-generated method stub
		return newClassDao.getTotal();
	}
	@Override
	public List<NewClass> findByPro(String pro, Object obj) {
		// TODO Auto-generated method stub
		return newClassDao.findByPro(pro, obj);
	}

}
