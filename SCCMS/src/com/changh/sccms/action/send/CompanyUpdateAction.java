package com.changh.sccms.action.send;

import com.changh.sccms.entity.ExpressCompany;
import com.changh.sccms.service.ExpressCompanyService;

public class CompanyUpdateAction {
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
			expressCompanyService.updateCompany(company);
			ok=true;
		}catch(NullPointerException e)
		{
			ok=false;
		}catch(Exception e)
		{
			throw e;
		}
		return "success";
	}
}
