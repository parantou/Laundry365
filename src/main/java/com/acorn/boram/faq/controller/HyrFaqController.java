package com.acorn.boram.faq.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.faq.dto.HyrFaqDto;
import com.acorn.boram.faq.service.HyrFaqService;

@Controller
public class HyrFaqController {
	
	@Autowired
	private HyrFaqService service;
	
	@RequestMapping("/faq/list")
	public ModelAndView getList(HttpServletRequest request,ModelAndView mView) {
		service.getList(request, mView);
		mView.setViewName("faq/list");
		return mView;
	}
	
	@RequestMapping("/faq/insertform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		
		return new ModelAndView("faq/insertform");
	}
	//새글 저장 요청 처리 
	@RequestMapping("/faq/insert")
	public ModelAndView authInsert(HyrFaqDto dto, HttpSession session, HttpServletRequest request) {
		//글 작성자는 세션에서 얻어낸다. 
		String id=(String)session.getAttribute("id");
		//dto객체에 글 작성자도 담기
		dto.setWriter(id);
		service.saveContent(dto);
		
		return new ModelAndView("faq/insert");
	}
	//삭제 요청 처리
	@RequestMapping("/faq/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
		
		service.deleteContent(num, request);
		
		return new ModelAndView("redirect:/faq/list.do");
	}
	
	@RequestMapping("/faq/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request) {
		
		service.getData(request);
		
		return  new ModelAndView("faq/updateform");
	}
	//수정 요청 처리 
	@RequestMapping(value = "/faq/update", method = RequestMethod.POST)
	public ModelAndView authUpdate(HyrFaqDto dto, HttpServletRequest request) {
		service.updateContent(dto);
		return new ModelAndView("faq/update");
	}
	
	@RequestMapping("/faq/ajax_faq_list")
	public ModelAndView ajaxFaqList(HttpServletRequest request,ModelAndView mView,String category) {
		service.getList(request, mView);
		mView.setViewName("faq/ajax_faq_list");
		return mView;
		
	}

}
