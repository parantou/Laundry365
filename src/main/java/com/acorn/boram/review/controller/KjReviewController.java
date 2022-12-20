package com.acorn.boram.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.review.dto.KjReviewDto;
import com.acorn.boram.review.service.KjReviewService;

@Controller
public class KjReviewController {
	@Autowired
	private KjReviewService service;

	//리뷰 리스트 불러오기
	@RequestMapping("/review/list")
	public String reviewPage(HttpServletRequest request) {
		
		service.getList(request);
		
		return "review/list";
	}
	

	@RequestMapping("/review/insertform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		
		return new ModelAndView("review/insertform");
	}
	
	@RequestMapping("/review/insert")
	public ModelAndView authInsert(KjReviewDto dto, HttpSession session, HttpServletRequest request) {
		//글 작성자는 세션에서 얻어낸다. 
		String id=(String)session.getAttribute("id");
		//KjReviewDto 객체에 글 작성자도 담기
		dto.setWriter(id);
		service.saveContent(dto);
		
		return new ModelAndView("review/insert");
	}	
	
	//글 자세히 보기 요청 처리
	@RequestMapping("/review/detail")
	public String detail(HttpServletRequest request) {
		
		service.getDetail(request);
		
		return "review/detail";
	}
	
	//글 삭제요청하기
	@RequestMapping("/review/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
		
		service.deleteContent(num, request);
		
		return new ModelAndView("redirect:/review/list.do");
	}	
	
	@RequestMapping("/review/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request) {
		
		service.getData(request);
		
		return  new ModelAndView("review/updateform");
	}	
	// 리뷰글 수정 요청 처리 
	@RequestMapping(value = "/review/update", method = RequestMethod.POST)
	public ModelAndView authUpdate(KjReviewDto dto, HttpServletRequest request) {
		service.updateContent(dto);
		return new ModelAndView("review/update");
	}
}

