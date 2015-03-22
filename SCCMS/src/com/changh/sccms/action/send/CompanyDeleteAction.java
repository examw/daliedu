package com.changh.sccms.action.send;

import com.changh.sccms.entity.ExpressCompany;
import com.changh.sccms.service.ExpressCompanyService;

public class CompanyDeleteAction {
	private int id;
	private boolean ok;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
			expressCompanyService.deleteCompany(id);
			ok=true;
		}catch(Exception e)
		{
			throw e;
		}
		return "success";
	}
}
