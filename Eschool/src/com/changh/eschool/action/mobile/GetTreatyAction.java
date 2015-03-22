package com.changh.eschool.action.mobile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;

import com.changh.eschool.action.BaseAction;

public class GetTreatyAction  extends BaseAction{
	private String content;
	public String execute()
	{
		BufferedReader br = null;
		try
		{
			br = new BufferedReader(new InputStreamReader(GetTreatyAction.class.getResourceAsStream("/registerTreaty.txt")));
			StringBuffer buf = new StringBuffer();
			String line = null;
			while((line=br.readLine())!=null)
			{
				buf.append(line);
			}
			content = URLEncoder.encode(buf.toString(), "gbk");
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			try {
				if(br!=null)
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "success";
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
