package com.lollol23.hiyo.user.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lollol23.hiyo.common.EncryptUtils;
import com.lollol23.hiyo.user.DAO.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String name, String nickName) {
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.insertUser(loginId, encryptPassword, name, nickName);
	}
	
	public boolean isDuplicateId(String loginId) {
		if(userDAO.selectCountById(loginId) == 0) {
			return false;
		} else {
			return true;
		}
	}
}
