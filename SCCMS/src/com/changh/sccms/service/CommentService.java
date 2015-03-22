package com.changh.sccms.service;

import java.util.List;

import com.changh.sccms.entity.Comment;



public interface CommentService {
	/**
	 * 分页查找评论
	 * @param tchId
	 * @param page
	 * @param pagesize
	 * @param sortname
	 * @param sortorder
	 * @return
	 */
	public List<Comment> findByTchId(int tchId,int page,int pagesize,String sortname,String sortorder );
	/**
	 *老师评论总的数量
	 * @param tchId
	 * @return
	 */
	public int findTotal(int tchId);
	/**
	 * 统计老师的评分
	 */
	public int findSorce(int tchId);
	/**
	 * 添加评论
	 * @param commet
	 */
	public void save(Comment comment);
	/**
	 * 主键
	 * @return
	 */
	public int getCommentId();
}
