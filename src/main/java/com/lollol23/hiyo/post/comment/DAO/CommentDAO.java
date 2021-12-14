package com.lollol23.hiyo.post.comment.DAO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentDAO {
	public int insertComment(
			@Param("postId") int postId
			, @Param("userId") int userId
			, @Param("userName") String userName
			, @Param("content") String content
			);
}
