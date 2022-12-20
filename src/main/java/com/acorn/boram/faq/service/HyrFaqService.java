package com.acorn.boram.faq.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.faq.dto.HyrFaqDto;

public interface HyrFaqService {
	public void getList(HttpServletRequest request, ModelAndView mView);
	public void saveContent(HyrFaqDto dto);
	public void updateContent(HyrFaqDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void getData(HttpServletRequest request); //글 수정하기 위해 정보 불러오는 기능
}
