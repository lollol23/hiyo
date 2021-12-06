package com.lollol23.hiyo.post.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lollol23.hiyo.common.FileManagerService;
import com.lollol23.hiyo.post.DAO.PostDAO;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {
		String filePath = FileManagerService.savefile(userId, file);
		if(filePath == null) {
			return -1;
		}
		return postDAO.insertPost(userId, userName, content, filePath);
	}
}
