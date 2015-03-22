	package com.changh.eschool.action.mobile;

import java.util.Date;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Question;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.QuestionService;
import com.changh.eschool.service.StudentService;

public class AddQuestionAction  extends BaseAction{
	private String username;
	private int classId;
	private int examId;
	private int gradeId;
	private int questionSource;
	private String questionTitle;
	private String questionContent;
	private QuestionService questionService;
	private StudentService studentService;
	private String questionPath;
	
	public String getQuestionPath() {
		return questionPath;
	}

	public void setQuestionPath(String questionPath) {
		this.questionPath = questionPath;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	private boolean ok;
	
	public boolean isOk() {
		return ok;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	public String execute()
	{
		try{
		Question question = new Question();
		Student stu = studentService.findByUsername(username);
		question.setClassId(classId);
		question.setExamId(examId);
		question.setGradeId(gradeId);
		question.setQuestionContent(questionContent);
		question.setQuestionSource(questionSource);
		question.setQuestionTitle(questionTitle);
		question.setQuestionPath(questionPath);
		question.setStudent(stu);
		question.setQuestionAddTime(new Date());
		question.setQuestionStatus(0);
		questionService.save(question);
		ok= true;
		}catch(Exception e)
		{
			e.printStackTrace();
			ok = false;
		}
		return "success";
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}

	public int getQuestionSource() {
		return questionSource;
	}

	public void setQuestionSource(int questionSource) {
		this.questionSource = questionSource;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	
}

