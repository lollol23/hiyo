package com.lollol23.hiyo.post.DAO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostDAO {
	public int insertPost(
			@Param("userId") int userId
			, @Param("userName") String userName
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
}
