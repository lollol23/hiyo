package com.lollol23.hiyo.post.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.lollol23.hiyo.post.model.Post;

@Repository
public interface PostDAO {
	public int insertPost(
			@Param("userId") int userId
			, @Param("userName") String userName
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public int selectPost(@Param("id") int id);
	
	public List<Post> selectPostList();
	
	public int deletePost(
			@Param("id") int id
			, @Param("userId") int userId
			);
}
