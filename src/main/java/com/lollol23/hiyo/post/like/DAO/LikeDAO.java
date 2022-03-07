package com.lollol23.hiyo.post.like.DAO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	
	public int insertLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int deleteLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int selectCountLikeByUserId(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	public int selectCountLikeByPostId(@Param("postId") int postId);
	
	public int deleteLikeByPostId(@Param("postId") int postId);
}
