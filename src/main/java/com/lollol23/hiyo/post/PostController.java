package com.lollol23.hiyo.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@GetMapping("/timeline_view")
	public String timeLine(Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		
		return "/post/timeLine";
	}
}
