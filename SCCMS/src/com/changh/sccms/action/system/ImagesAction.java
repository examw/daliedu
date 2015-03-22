package com.changh.sccms.action.system;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.changh.sccms.until.PropertiesUtil;

public class ImagesAction {
	private Map<String, Object>  map = new HashMap<String, Object>();
	private String root = "";
	private Boolean isBlAll = false;
	private List<String> data = new ArrayList<String>();
	private String message="";
	
	
	public String execute(){
		String rootPath = PropertiesUtil.getOptValue("rootSCCMS");
		root = rootPath+"/cms/images/32X32";
		System.out.println(root);
		data = recursion(root, isBlAll);
		map.put("Data", data);
		map.put("Message", message);
		if(message==""){
			map.put("IsError", false);
		}else{
			map.put("IsError", true);
		}
		return "success";
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	public String getRoot() {
		return root;
	}
	public void setRoot(String root) {
		this.root = root;
	}
	public Boolean getIsBlAll() {
		return isBlAll;
	}
	public void setIsBlAll(Boolean isBlAll) {
		this.isBlAll = isBlAll;
	}
	public List<String> getData() {
		return data;
	}
	public void setData(List<String> data) {
		this.data = data;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List<String> recursion(String root,boolean isBlAll){
		//Java中读取某个目录下的所有文件和文件夹
		  File file=new File(root);
		  if(!file.exists()){
			  message ="系统错误,目录不存在";
			  return null;
		  }
		  File[] tempList = file.listFiles();
		  if(tempList.length==0){
			  message="系统错误，该目录下没有文件";
			  return null;
		  }
		  System.out.println("该目录下对象个数："+tempList.length);
		  for (int i = 0; i < tempList.length; i++) {
			   if (tempList[i].isFile()) {
			    String fileName=tempList[i].getName();//文件名称
			    String hzm=fileName.substring(fileName.indexOf(".")+1,fileName.length()); //文件后缀名
			    hzm=hzm.toLowerCase();
			    if(hzm.equals("jpg")||hzm.equals("bmp")||hzm.equals("gif")||hzm.equals("png")){
			    	//data.add(tempList[i]);//这里要注意， 	
			    	data.add(fileName);
			    }
			   }
			   if (tempList[i].isDirectory()) {	
				 if(isBlAll){
					 recursion(tempList[i].getAbsolutePath(),isBlAll);
				 }
			   }
		  	}
		  return data;
		}
}
