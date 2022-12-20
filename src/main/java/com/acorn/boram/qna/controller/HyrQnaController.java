package com.acorn.boram.qna.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.qna.dto.HyrQnaDto;
import com.acorn.boram.qna.dto.HyrQnaReplyDto;
import com.acorn.boram.qna.service.HyrQnaService;

@Controller
public class HyrQnaController {
	
	@Autowired
	private HyrQnaService service;
	
	@RequestMapping("/qna/list")
	public String getList(HttpServletRequest request) {
		
		service.getList(request);
		
		return "qna/list";
	}
	@RequestMapping("/qna/insertform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		
		return new ModelAndView("qna/insertform");
	}
	//새글 저장 요청 처리 
	@RequestMapping("/qna/insert")
	public ModelAndView authInsert(HyrQnaDto dto, ModelAndView mView, HttpSession session, HttpServletRequest request) {
		//글 작성자는 세션에서 얻어낸다. 
		String id=(String)session.getAttribute("id");
		//dto객체에 글 작성자도 담기
		dto.setWriter(id);
		service.saveContent(dto);
		mView.setViewName("qna/insert");
		return mView;
	}	
	//파일 삭제 요청 처리
	@RequestMapping("/qna/delete")
	public ModelAndView authDelete(@RequestParam int num,
			ModelAndView mView, HttpServletRequest request) {
		service.deleteContent(num, request);
		mView.setViewName("redirect:/qna/list.do");
		return mView;
	}
	@RequestMapping("/qna/detail")
	public String detail(@RequestParam int num,HttpServletRequest request){
		service.getData(request);
		service.getDataReply(request);
		service.updateCheckReply(num);
		return "qna/detail";
	}
	@RequestMapping("/qna/reply_insert")
	public ModelAndView authReplyInsert(HttpServletRequest request, 
			@RequestParam int ref_num) {
		
		service.saveReply(request);
	
		return new ModelAndView("redirect:/qna/detail.do?num="+ref_num);
	}
	//답글 삭제 요청 처리
	@RequestMapping("/qna/reply_delete")
	@ResponseBody
	public Map<String, Object> authReplyDelete(HttpServletRequest request) {
		service.deleteReply(request);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		// {"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다. 
		return map;
	}
	//답글 수정 요청처리 (JSON 을 응답하도록 한다)
	@RequestMapping("/qna/reply_update")
	@ResponseBody
	public Map<String, Object> authReplyUpdate(HyrQnaReplyDto dto){
		service.updateReply(dto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		// {"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다. 
		return map;
	}
	
}
