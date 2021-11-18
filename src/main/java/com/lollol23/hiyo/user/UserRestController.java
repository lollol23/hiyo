package com.lollol23.hiyo.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lollol23.hiyo.user.BO.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("nickName") String nickName
			, HttpServletRequest request) {
		Map<String, String> result = new HashMap<>();
		int count = userBO.addUser(loginId, password, name, nickName);
		
		if(count == 1) {
			result.put("result", "success");	
		} else {
			result.put("result", "fail");
		}
		return result;
	}
}
