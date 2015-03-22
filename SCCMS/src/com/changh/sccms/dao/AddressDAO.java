package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.Address;

public interface AddressDAO {
	public Address findById(int addrId)throws Exception;
}
