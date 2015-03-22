package com.changh.sccms.until;

import java.util.HashMap;
import java.util.Map;

public class LGDataUtil {
	public static Map<String,Object> gridMap(String message,Boolean isError,Object data)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Message", message);
		map.put("IsError", isError);
		map.put("Data", data);
		return map;
	}
}
