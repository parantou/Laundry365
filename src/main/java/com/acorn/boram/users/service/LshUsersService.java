package com.acorn.boram.users.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.users.dto.LsgUsersDto;

public interface LshUsersService {
	public void updateUserPwd(HttpSession session, LsgUsersDto dto, ModelAndView mView);
	public Map<String, Object> saveProfileImage(HttpServletRequest request, 
			MultipartFile mFile);
	public void updateUser(LsgUsersDto dto, HttpSession session);
	public void deleteUser(HttpSession session, ModelAndView mView);
	public void UsersData(String id, ModelAndView mView);
	public void getInfo(HttpSession session, ModelAndView mView);
}
