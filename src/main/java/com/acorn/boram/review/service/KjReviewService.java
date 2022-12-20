package com.acorn.boram.review.service;

import javax.servlet.http.HttpServletRequest;

import com.acorn.boram.review.dto.KjReviewDto;


public interface KjReviewService {
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void saveContent(KjReviewDto dto);
	public void updateContent(KjReviewDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void getData(HttpServletRequest request); //글 수정하기 위해 정보 불러오는 기능
}
