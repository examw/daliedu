package com.changh.eschool.action.course;

import javax.servlet.http.Cookie;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.until.Escape;

public class ApplyAction  extends BaseAction{
	private Integer id;
	private Integer type;
	
	public String execute(){
			Cookie[] cookies = httpRequest.getCookies();
			if(cookies!=null)
			{
				for(Cookie c : cookies)
				{
					if("grade".equals(c.getName())&&type.equals(1))
					{
						String grade= Escape.unescape(c.getValue());
						String g = grade+","+id;
						c.setValue("1002");
						httpResponse.addCookie(c);
						System.out.println("1111111111");
					
					}
					if("package".equals(c.getName())&&type.equals(0))
					{
						String pkg = Escape.unescape(c.getValue());
						String p = pkg+","+id;
						c.setValue("1002");
						httpResponse.addCookie(c);
						System.out.println("22222222222222");
					}
				}
			}
		return "success";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
}
