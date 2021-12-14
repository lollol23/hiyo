package com.lollol23.hiyo.post.comment.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lollol23.hiyo.post.comment.DAO.CommentDAO;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int postId,  int userId, String userName, String content) {
		return commentDAO.insertComment(postId, userId, userName, content);
	}
}
