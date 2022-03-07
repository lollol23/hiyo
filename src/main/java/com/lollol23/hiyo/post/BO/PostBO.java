package com.lollol23.hiyo.post.BO;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lollol23.hiyo.common.FileManagerService;
import com.lollol23.hiyo.post.DAO.PostDAO;
import com.lollol23.hiyo.post.comment.BO.CommentBO;
import com.lollol23.hiyo.post.comment.model.Comment;
import com.lollol23.hiyo.post.like.BO.LikeBO;
import com.lollol23.hiyo.post.model.Post;
import com.lollol23.hiyo.post.model.PostDetail;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	@Autowired
	private CommentBO commentBO;
	@Autowired
	private LikeBO likeBO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {
		String filePath = FileManagerService.savefile(userId, file);
		if(filePath == null) {
			return -1;
		}
		return postDAO.insertPost(userId, userName, content, filePath);
	}
	
	public List<PostDetail> getPostList(int userId) {
		List<Post> postList = postDAO.selectPostList();
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post : postList)  {
			List<Comment> commentList = commentBO.getCommentListByPostId(post.getId());
			boolean isLike = likeBO.likeByUserId(post.getId(), userId);
			int likeCount = likeBO.likeCount(post.getId());
			
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);
			postDetail.setIsLike(isLike);
			postDetail.setLikeCount(likeCount);
			postDetailList.add(postDetail);
		}
		return postDetailList;
	}
	
}
