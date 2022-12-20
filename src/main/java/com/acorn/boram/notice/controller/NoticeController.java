package com.acorn.boram.notice.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.notice.dto.NoticeCommentDto;
import com.acorn.boram.notice.dto.NoticeDto;
import com.acorn.boram.notice.service.NoticeService;


@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/notice/list")
	public String getList(HttpServletRequest request) {
		
		service.getList(request);
		
		return "notice/list";
	}
	
	@RequestMapping("/notice/insertform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		
		return new ModelAndView("notice/insertform");
	}
	//새글 저장 요청 처리 
	@RequestMapping("/notice/insert")
	public ModelAndView authInsert(HttpServletRequest request,NoticeDto dto, HttpSession session) {
		//글 작성자는 세션에서 얻어낸다. 
		String id=(String)session.getAttribute("id");
		//NoticeDto 객체에 글 작성자도 담기
		dto.setWriter(id);
		service.saveContent(dto);
		
		return new ModelAndView("notice/insert");
	}
	//글 자세히 보기 요청 처리
	@RequestMapping("/notice/detail")
	public String detail(HttpServletRequest request) {
		service.getDetail(request);
		return "notice/detail";
	}
	//새로운 댓글 저장 요청 처리
	@RequestMapping("/notice/comment_insert")
	public ModelAndView authCommentInsert(HttpServletRequest request, 
			@RequestParam int ref_group) {
		
		service.saveComment(request);
	
		return new ModelAndView("redirect:/notice/detail.do?num="+ref_group);
	}
	//댓글 더보기 요청 처리
	@RequestMapping("/notice/ajax_comment_list")
	public String ajaxCommentList(HttpServletRequest request) {
		
		service.moreCommentList(request);
		
		return "notice/ajax_comment_list";
	}
	//댓글 삭제 요청 처리
	@RequestMapping("/notice/comment_delete")
	@ResponseBody
	public Map<String, Object> authCommentDelete(HttpServletRequest request) {
		service.deleteComment(request);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		// {"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다. 
		return map;
	}
	//댓글 수정 요청처리 (JSON 을 응답하도록 한다)
	@RequestMapping("/notice/comment_update")
	@ResponseBody
	public Map<String, Object> authCommentUpdate(NoticeCommentDto dto, HttpServletRequest request){
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		// {"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다. 
		return map;
	}
	//카페글 삭제 요청 처리 
	@RequestMapping("/notice/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
		
		service.deleteContent(num, request);
		
		return new ModelAndView("redirect:/notice/list.do");
	}
	
	@RequestMapping("/notice/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request) {
		
		service.getData(request);
		
		return  new ModelAndView("notice/updateform");
	}
	//카페글 수정 요청 처리 
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public ModelAndView authUpdate(NoticeDto dto, HttpServletRequest request) {
		service.updateContent(dto);
		return new ModelAndView("notice/update");
	}
}











