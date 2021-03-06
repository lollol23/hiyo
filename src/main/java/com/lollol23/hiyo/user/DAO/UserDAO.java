package com.lollol23.hiyo.user.DAO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.lollol23.hiyo.user.model.User;

@Repository
public interface UserDAO {
	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("nickName") String nickName
			);
	
	public int selectCountById(@Param("loginId") String loginId);
	public User selectByIdPassword(
			@Param("loginId") String loginId
			,@Param("password") String password
			);
	public int updateUserById(
			@Param("id") int id
			, @Param("name") String name
			, @Param("nickName") String nickName
			, @Param("introduce") String introduce
			);
	public int updateUserProfileImgById(
			@Param("id") int id
			, @Param("profileImg") String profileImg
			);
	public User selectProfileImgById(@Param("id") int id);
}
