package com.changh.sccms.action.send;

import com.changh.sccms.entity.ExpressCompany;
import com.changh.sccms.service.ExpressCompanyService;

public class CompanyAddAction {
	private ExpressCompany company;
	private boolean ok;
	
	public ExpressCompany getCompany() {
		return company;
	}
	public void setCompany(ExpressCompany company) {
		this.company = company;
	}
	public boolean isOk() {
		return ok;
	}
	private ExpressCompanyService expressCompanyService;

	public void setExpressCompanyService(ExpressCompanyService expressCompanyService) {
		this.expressCompanyService = expressCompanyService;
	}
	public String execute() throws Exception
	{
		try{
			expressCompanyService.addCompany(company);
			ok=true;
		}catch(Exception e)
		{
			throw e;
		}
		return "success";
	}
}
