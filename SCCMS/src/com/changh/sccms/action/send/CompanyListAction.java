package com.changh.sccms.action.send;

import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.ExpressCompany;
import com.changh.sccms.service.ExpressCompanyService;
import com.changh.sccms.until.GridDataUtil;

public class CompanyListAction {
	//input
	private int isSelectData;
	
	public int getIsSelectData() {
		return isSelectData;
	}
	public void setIsSelectData(int isSelectData) {
		this.isSelectData = isSelectData;
	}
	public List<ExpressCompany> getList() {
		return list;
	}

	//output
	private Map<String,Object> companyList;
	private List<ExpressCompany> list;
	public Map<String, Object> getCompanyList() {
		return companyList;
	}
	
	//injection
	private ExpressCompanyService expressCompanyService;

	public void setExpressCompanyService(ExpressCompanyService expressCompanyService) {
		this.expressCompanyService = expressCompanyService;
	}
	public String execute() throws Exception
	{
		list=expressCompanyService.companyList();
		companyList = GridDataUtil.gridMap(list,list.size());
		if(isSelectData==1)
		{	
			return "success1";
		}
		return "success";
	}
}
