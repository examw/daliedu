package com.changh.sccms.until;

import java.util.HashMap;
import java.util.Map;
/*
 * 把数据进行封装成能用LigerUI grid呈现的形式
 */
public class GridDataUtil {
	public static Map<String,Object> gridMap(Object obj,int total)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Rows", obj);
		map.put("Total", total);
		return map;
	}
}
