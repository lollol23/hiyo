package com.lollol23.hiyo.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@GetMapping("/timeline_view")
	public String timeLine() {
		return "/post/timeLine";
	}
}
