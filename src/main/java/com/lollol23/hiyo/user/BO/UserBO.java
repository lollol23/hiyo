package com.lollol23.hiyo.user.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lollol23.hiyo.common.EncryptUtils;
import com.lollol23.hiyo.common.FileManagerService;
import com.lollol23.hiyo.user.DAO.UserDAO;
import com.lollol23.hiyo.user.model.User;

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
	
	public User signIn(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.selectByIdPassword(loginId, encryptPassword);
	}
	
	public int updateUser(int userId, String name, String nickName, String introduce) {
		return userDAO.updateUserById(userId, name, nickName, introduce);
	}
	
	public int updateProfileImg(int userId, MultipartFile file) {
		String filePath = FileManagerService.savefile(userId, file);
		if(filePath == null) {
			return -1;
		}
		return userDAO.updateUserProfileImgById(userId, filePath);
	}
	
	public User getProfileImgById(int id) {
		return userDAO.selectProfileImgById(id);
	}
}
