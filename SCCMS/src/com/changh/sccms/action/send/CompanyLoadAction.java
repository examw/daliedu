package com.changh.sccms.action.send;

import com.changh.sccms.entity.ExpressCompany;
import com.changh.sccms.service.ExpressCompanyService;

public class CompanyLoadAction {
	private int id;
	private ExpressCompany company;
	
	
	public ExpressCompany getCompany() {
		return company;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private ExpressCompanyService expressCompanyService;

	public void setExpressCompanyService(ExpressCompanyService expressCompanyService) {
		this.expressCompanyService = expressCompanyService;
	}
	public String execute() throws Exception
	{
		try{
			company=expressCompanyService.getCompany(id);

		}catch(Exception e)
		{
			throw e;
		}
		return "success";
	}
}
