package com.acorn.boram.users.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.users.dto.LsgUsersDto;
import com.acorn.boram.users.service.LshUsersService;

@Controller
public class LshUsersController {
	
	@Autowired
	private LshUsersService service;
	
	@RequestMapping("/mypage/users/pwd_update")
	public ModelAndView authPwdUpdate(LsgUsersDto dto, 
			ModelAndView mView, HttpSession session, HttpServletRequest request) {
		//서비스에 필요한 객체의 참조값을 전달해서 비밀번호 수정 로직을 처리한다.
		service.updateUserPwd(session, dto, mView);
		//view page 로 forward 이동해서 작업 결과를 응답한다.
		mView.setViewName("mypage/users/pwd_update");
		return mView;
	}
	
	@RequestMapping("/mypage/users/pwd_updateform")
	public ModelAndView authPwdUpdateForm(ModelAndView mView, HttpServletRequest request) {
		mView.setViewName("mypage/users/pwd_updateform");
		return mView;
	}
	
	//회원 탈퇴 요청 처리
	@RequestMapping("/mypage/users/delete")
	public ModelAndView authDelete(HttpSession session, ModelAndView mView,
			 HttpServletRequest request) {
		
		service.deleteUser(session, mView);
		
		mView.setViewName("mypage/users/delete");
		return mView;
	}
	
	//개인정보 수정 반영 요청 처리
	@RequestMapping(value = "/mypage/users/update", method=RequestMethod.POST)
	public ModelAndView authUpdate(LsgUsersDto dto, HttpSession session, ModelAndView mView,
			 HttpServletRequest request) {
		//서비스를 이용해서 개인정보를 수정하고 
		service.updateUser(dto, session);
		mView.setViewName("redirect:/mypage/users/info.do");
		//개인정보 보기로 리다일렉트 이동 시틴다
		return mView;
	}
		
	//ajax 프로필 사진 업로드 요청처리
	@RequestMapping(value = "/mypage/users/ajax_profile_upload",
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> authAjaxProfileUpload(HttpServletRequest request,
			@RequestParam MultipartFile image){
		
		//서비스를 이용해서 이미지를 upload 폴더에 저장하고 리턴되는 Map 을 리턴해서 json 문자열 응답하기
		return service.saveProfileImage(request, image);
	}
	
	@RequestMapping("/mypage/users/info")
	public ModelAndView authInfo(HttpSession session, ModelAndView mView, 
			HttpServletRequest request) {
		
		service.getInfo(session, mView);
		
		mView.setViewName("mypage/users/info");
		return mView;
	}
	
	//회원정보 수정폼 요청처리
	@RequestMapping("/mypage/users/updateform")
	public ModelAndView authUpdateForm(ModelAndView mView, HttpSession session,
			HttpServletRequest request) {
		service.getInfo(session, mView);
		mView.setViewName("mypage/users/updateform");
		return mView;
	}
	
//	@RequestMapping("/mypage/users/update")
//	public ModelAndView updateForm(String id) {
//		System.out.println("id: "+id);
//		ModelAndView mView=new ModelAndView();
//		service.UsersData(id,mView);
//		mView.setViewName("mypage/users/info");
//		return mView;
//	}
}
