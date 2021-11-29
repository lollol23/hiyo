package com.lollol23.hiyo.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lollol23.hiyo.user.BO.UserBO;
import com.lollol23.hiyo.user.model.User;

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
			, @RequestParam("nickName") String nickName) {
		Map<String, String> result = new HashMap<>();
		int count = userBO.addUser(loginId, password, name, nickName);
		
		if(count == 1) {
			result.put("result", "success");	
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	@GetMapping("/is_duplicate_id")
	public Map<String, Boolean> isDuplicateId(@RequestParam("loginId") String loginId) {
		Map<String, Boolean> result = new HashMap<>();
		if(userBO.isDuplicateId(loginId)) {
			//중복o
			result.put("result", true);
		} else {
			//중복x
			result.put("result", false);
		}
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request) {
		Map<String, String> result = new HashMap<>();
		User user = userBO.signIn(loginId, password);
		if(user != null) {
			result.put("result", "success");
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("loginId", user.getLoginId());
			session.setAttribute("password", user.getPassword());
		} else {
			result.put("result", "fail");
		}
		return result;
	}
}
