package com.acorn.boram.users.controller;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.users.dto.LsgUsersDto;
import com.acorn.boram.users.service.LsgUsersService;

@Controller
public class LsgUsersController {
	
	@Autowired
	private LsgUsersService service; 
	
	//로그인 화면으로 이동
	@RequestMapping("/users/login_form")
	public String loginForm() {
		return "mypage/login/login_form";
	}
	
	//로그인하기
	@RequestMapping("/users/login")
	public ModelAndView login(HttpSession session, LsgUsersDto dto,
			ModelAndView mView, HttpServletResponse response,
			HttpServletRequest request, String url) {
		
		service.isExistUser(session,dto,mView, response,request);
		
		String encodedUrl=URLEncoder.encode(url);
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		
		mView.setViewName("mypage/login/login");
		return mView;
	}
	
	//로그아웃
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "redirect:/home.do";
	}
	
	//회원가입 화면으로 이동
	@RequestMapping("/users/signup_form")
	public String signupForm() {
		return "mypage/login/signup_form";
	}
	
	//회원가입
	@RequestMapping("/users/signup")
	public String signUp(LsgUsersDto dto) {
		service.addUser(dto);
		return "mypage/login/signup";
	}
	
	//비밀번호 찾기 화면으로 이동
	@RequestMapping("/users/find_pwd_form")
	public String findPwdForm() {
		return "mypage/login/find_pwd_form";
	}
	
	//아이디 찾기 화면으로 이동
	@RequestMapping("/users/find_id_form")
	public String findPwd() {
		return "mypage/login/find_id_form";
	}
	
	//ajax를 이용해서 비밀번호 수정form 가져오기
	@RequestMapping("/users/update_pwd_form")
	public String ajaxUpdatePwdForm(String id){
		return "mypage/login/update_pwd_form";
	}
}
