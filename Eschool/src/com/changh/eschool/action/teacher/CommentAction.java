package com.changh.eschool.action.teacher;

import java.util.List;

import com.changh.eschool.entity.Comment;
import com.changh.eschool.entity.CommentCollect;
import com.changh.eschool.service.CommentService;
import com.changh.eschool.service.StudentService;

public class CommentAction {
	private int tchId;
	private List<Comment> list;
	private int counts;
	private int page=1;
	private int pagesize=10;
	private String sortname=" c.commentAddTime ";
	private String sortorder=" desc ";
	private CommentCollect commentCollect = new CommentCollect();

	private CommentService commentService;
	private StudentService studentService;
	
	
	public String execute() throws Exception{
		
		counts = commentService.findTotal(tchId);
		list = commentService.findByTchId(tchId, page, pagesize, sortname, sortorder);
		for(Comment c:list){
			c.setStudent(studentService.findByStuId(c.getStuId()));
		}
		commentCollect.setComment(list);
		commentCollect.setPage(page);
		commentCollect.setPagesize(pagesize);
		commentCollect.setSortname(sortname);
		commentCollect.setSortorder(sortorder);
		commentCollect.setTotal(counts);
		return "success";
	}
	
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	public int getTchId() {
		return tchId;
	}
	public void setTchId(int tchId) {
		this.tchId = tchId;
	}
	public List<Comment> getList() {
		return list;
	}
	public void setList(List<Comment> list) {
		this.list = list;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public String getSortname() {
		return sortname;
	}
	public void setSortname(String sortname) {
		this.sortname = sortname;
	}
	public String getSortorder() {
		return sortorder;
	}
	public void setSortorder(String sortorder) {
		this.sortorder = sortorder;
	}

	public CommentCollect getCommentCollect() {
		return commentCollect;
	}

	public void setCommentCollect(CommentCollect commentCollect) {
		this.commentCollect = commentCollect;
	}
	
}
