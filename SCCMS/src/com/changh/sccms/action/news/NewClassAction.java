package com.changh.sccms.action.news;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.LGData;
import com.changh.sccms.entity.NewClass;
import com.changh.sccms.service.NewClassService;
import com.changh.sccms.until.MyBeanUtils;
import com.opensymphony.xwork2.ModelDriven;

public class NewClassAction implements ModelDriven<NewClass>{
	private NewClassService newClassService;
	private Map<String,Object> map = new HashMap<String,Object>();
	private List<NewClass> list;
	private LGData j = new LGData();
	private NewClass  newClass = new NewClass();
	private int newClassId;
	
	public String newClassList(){
		List<NewClass> list= newClassService.findByPro("parentId", 0);
		this.list = list;
		map.put("Rows", list);
		return "success";
	}
	
	public String tree(){
		List<NewClass> list= newClassService.findByPro("parentId", 0);
		this.list = list;
		return "success";
	}
	public String save() throws Exception{
		if(null!=newClass.getId()){
			NewClass newClass1 = newClassService.findById(newClass.getId());
			MyBeanUtils.copyBeanNotNull2Bean(newClass, newClass1);
			newClassService.saveOrupdate(newClass1);
			j.setIsError(false);
			j.setMessage("修改成功");
			return "success";
		}else{
			newClass.setAddTime(new Date());	
			newClass.setDelFlag(0);
			if(null==newClass.getParentId()){
				newClass.setParentId(0);
			}
			if(newClass.getParentId()!=0){
				NewClass parent = newClassService.findById(newClass.getParentId());
				newClass.setPids(parent.getId()+","+parent.getPids());
			}else{
				newClass.setPids("0");
			}
			newClassService.saveOrupdate(newClass);
			j.setMessage("添加成功");
			j.setIsError(false);
			return "success";
		}
		
	}
	
	public String loadNewClass(){
		System.out.println(newClassId);
		newClass= newClassService.findById(newClassId);
		return "success";
	}
	public String delete(){
		j.setIsError(newClassService.delete(newClass.getId()));
		return "success";
	}

	public List<NewClass> getList() {
		return list;
	}

	public void setList(List<NewClass> list) {
		this.list = list;
	}

	public Map<String,Object> getMap() {
		return map;
	}

	public void setMap(Map<String,Object> map) {
		this.map = map;
	}


	public LGData getJ() {
		return j;
	}

	public void setJ(LGData j) {
		this.j = j;
	}

	public NewClass getNewClass() {
		return newClass;
	}

	public void setNewClass(NewClass newClass) {
		this.newClass = newClass;
	}

	@Override
	public NewClass getModel() {
		// TODO Auto-generated method stub
		return newClass;
	}
	

	public void setNewClassService(NewClassService newClassService) {
		this.newClassService = newClassService;
	}

	public int getNewClassId() {
		return newClassId;
	}

	public void setNewClassId(int newClassId) {
		this.newClassId = newClassId;
	}

	
}
