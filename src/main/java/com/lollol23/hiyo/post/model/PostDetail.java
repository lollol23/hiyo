package com.lollol23.hiyo.post.model;

import java.util.List;

import com.lollol23.hiyo.post.comment.model.Comment;

public class PostDetail {
	
	private Post post;
	private List <Comment> commentList;
	private boolean IsLike;
	private int likeCount;
	
	
	public boolean isIsLike() {
		return IsLike;
	}
	public void setIsLike(boolean isLike) {
		IsLike = isLike;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	
	
	
}
