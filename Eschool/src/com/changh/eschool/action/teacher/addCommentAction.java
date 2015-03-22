package com.changh.eschool.action.teacher;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Comment;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.CommentService;

public class addCommentAction extends BaseAction {
	private int tchId;
	private String content;
	private int score;
	private boolean ok= false;
	
	private CommentService commentService;
	
	public String execute(){
		if(session.get("student")==null){
			 ok = false;
			 return "success";
		}
		
		Comment c = new Comment();
		c.setCommentAddTime(new Date());
		c.setCommentContent(getStrUtf8(content));
		c.setCommentScore(score);
		int stuId =((Student) session.get("student")).getStuId();
		c.setStuId(stuId);
		c.setTchId(tchId);
		c.setCommentId(commentService.getCommentId());
		commentService.save(c);
		ok=true;
		return "success";
	}

	public  String getStrUtf8(String s) {
		String ret = null;
		try {
		ret = java.net.URLDecoder.decode(s, "UTF-8");
		} catch (UnsupportedEncodingException ex) {
		}
		return ret;
		}
	public int getTchId() {
		return tchId;
	}

	public void setTchId(int tchId) {
		this.tchId = tchId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}

	public CommentService getCommentService() {
		return commentService;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	
}
