package com.changh.eschool.action.user;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Address;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;

public class AddressListAction extends BaseAction{
	private int aid;
	private Address addr;
	private List<Address> addrList;
	private boolean ok;
	
	public boolean isOk() {
		return ok;
	}
	private StudentService studentService;
	
	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public Address getAddr() {
		return addr;
	}

	public void setAddr(Address addr) {
		this.addr = addr;
	}

	public List<Address> getAddrList() {
		return addrList;
	}

	public void setAddrList(List<Address> addrList) {
		this.addrList = addrList;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String execute()throws Exception
	{
		Student stu = (Student)session.get("student");
		addrList = studentService.findAddrListByStuId(stu.getStuId());
		if(aid==0&&(addr!=null&&addr.getAddrReceiveName()!=null))
		{
			//添加新地址
			studentService.addAddr(addr, stu.getStuId());
			addr = null;
			ok=true;
			return "success2";
		}else if(aid!=0&&(addr==null||(addr!=null&&addr.getAddrReceiveName()==null)))
		{
			//获取地址
			addr = findFromList(addrList,aid);
		}else if(aid!=0&&(addr!=null&&addr.getAddrReceiveName()!=null))
		{
			//修改地址
			addr.setStuId(stu.getStuId());
			Address addr1 = findFromList(addrList,aid);//与数据库的会话中有了该数据的缓存，要修改需要用该缓存数据
			if(!addr1.equals(addr))	//如果属性有修改
			{	
				changeProperties(addr,addr1);	//改变属性
				studentService.updateAddr(addr1);
				ok=true;
			}
			return "success2";
		}
		return "success";
	}
	private Address findFromList(List<Address> addrList,int aid)
	{
		Address addr1 = null;
		for(Address addr : addrList)
		{
			if(addr.getAddrId()==aid)
			{
				addr1 = addr;
			}
		}
		return addr1;
	}
	private void changeProperties(Address addr,Address addr1)
	{
		addr1.setAddrEmail(addr.getAddrEmail());
		addr1.setAddrFullAddress(addr.getAddrFullAddress());
		addr1.setAddrMobile(addr.getAddrMobile());
		addr1.setAddrPhone(addr.getAddrPhone());
		addr1.setAddrIsDefault(addr.getAddrIsDefault());
		addr1.setAddrReceiveName(addr.getAddrReceiveName());
		addr1.setAddrPostalCode(addr.getAddrPostalCode());
	}
}
