package com.acorn.boram.users.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.users.dto.LsgUsersDto;

public interface LsgUsersService {
	public Map<String,Boolean> checkId(String inputId);
	public void addUser(LsgUsersDto dto);
	public boolean updatePwd(LsgUsersDto dto);
	public void isExistUser(HttpSession session, LsgUsersDto dto,
			ModelAndView mView, HttpServletResponse response,
			HttpServletRequest request);
	public LsgUsersDto checkUser(LsgUsersDto dto);
	public void getUserList(HttpServletRequest request,ModelAndView mView);
	public int userDelete(String[] users);
	public int userUpdate(LsgUsersDto dto);
}
