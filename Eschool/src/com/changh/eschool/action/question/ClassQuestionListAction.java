package com.changh.eschool.action.question;

import java.util.ArrayList;
import java.util.List;

import com.changh.eschool.entity.Question;
import com.changh.eschool.service.QuestionService;

public class ClassQuestionListAction {
	private List<Question> list = new ArrayList<Question>();
	private Integer classId;
	private Integer type ;
	private Integer count;
	private QuestionService questionService;
	
	public String execute(){
		 List<Question> list1 = questionService.findByClassId(classId,type);
		 System.out.println(list1.toString());
		 for(Question q:list1){
			 if(list.size()<count.intValue()){
				 list.add(q);
			 }else{
				 break;
			 }
		 }
		return "success";
	}
	public List<Question> getList() {
		return list;
	}
	public void setList(List<Question> list) {
		this.list = list;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public QuestionService getQuestionService() {
		return questionService;
	}
	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
	
}
