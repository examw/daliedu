package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.Address;

public interface AddressDAO {
	//Ìí¼Ó
	public void save(Address address)throws Exception;
	//findbyStuid
	public List<Address> findByStuId(int stuId)throws Exception;
	//update
	public void update(Address address)throws Exception;
	//find by id
	public Address findById(int aid)throws Exception;
	public Address findDefault(int stuId)throws Exception;
}
