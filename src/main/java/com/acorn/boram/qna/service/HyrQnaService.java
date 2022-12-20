package com.acorn.boram.qna.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.qna.dto.HyrQnaDto;
import com.acorn.boram.qna.dto.HyrQnaReplyDto;

public interface HyrQnaService {
	public void getList(HttpServletRequest request);
	public void saveContent(HyrQnaDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void getDataReply(HttpServletRequest request);
	public void updateContent(HyrQnaDto dto);
	public void getData(HttpServletRequest request);
	public void saveReply(HttpServletRequest request);//답글 저장 
	public void deleteReply(HttpServletRequest request);//답글 삭제
	public void updateReply(HyrQnaReplyDto dto);//답글 수정
	public void updateCheckReply(int num);
}
