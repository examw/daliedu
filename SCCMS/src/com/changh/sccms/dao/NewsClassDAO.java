package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.NewClass;

public interface NewsClassDAO {
	//删除
	public boolean delete(int id);
	//修改or
	public boolean saveOrupdate(NewClass newclass);
	//查询
	public NewClass findById(int id);
	//getTotal
	public Integer getTotal();
	//按属性查询
	public List<NewClass> findByPro(String pro,Object obj);
	
}
