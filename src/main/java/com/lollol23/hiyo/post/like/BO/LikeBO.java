package com.lollol23.hiyo.post.like.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lollol23.hiyo.post.like.DAO.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public boolean like(int userId, int postId) {
		// 좋아요 상태면 좋아요 취소
				if(this.likeByUserId(postId, userId)) {
					int count = likeDAO.deleteLike(userId, postId);
					if(count == 0) {
						return false;
					} else {
						return true;
					}
				} else { // 좋아요 취소 상태면 좋아요
					int count = likeDAO.insertLike(userId, postId);
					if(count == 1) {
						return true;
					} else {
						return false;
					}
				}
	}
	
	public boolean likeByUserId(int postId, int userId) {
		int count = likeDAO.selectCountLikeByUserId(postId, userId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
			
		}
	}
	
	public int unlike(int userId, int postId) {
		return likeDAO.deleteLike(userId, postId);
	}
	
	public int likeCount(int postId) {
		return likeDAO.selectCountLikeByPostId(postId);
	}
	
	public int deleteLikeByPostId(int postId) {
		return likeDAO.deleteLikeByPostId(postId);
	}
}
