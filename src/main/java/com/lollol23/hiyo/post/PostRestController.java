package com.lollol23.hiyo.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.lollol23.hiyo.post.BO.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam("content") String content
			, @RequestParam(value = "file") MultipartFile file
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		
		Map<String, String> result = new HashMap<>();
		int count = postBO.addPost(userId, userName, content, file);
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
}
