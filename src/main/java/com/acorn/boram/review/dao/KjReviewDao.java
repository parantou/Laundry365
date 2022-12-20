package com.acorn.boram.review.dao;

import java.util.List;

import com.acorn.boram.review.dto.KjReviewDto;


public interface KjReviewDao {
	//글목록
	public List<KjReviewDto> getList(KjReviewDto dto);
	//글의 갯수
	public int getCount(KjReviewDto dto);
	//글 추가
	public void insert(KjReviewDto dto);
	//글정보 얻어오기
	public KjReviewDto getData(int num);
	//키워드를 활용한 글정보 얻어오기
	public KjReviewDto getData(KjReviewDto dto);
	//조회수 증가 시키기
	public void addViewCount(int num);
	//글 삭제
	public void delete(int num);
	//글 수정
	public void update(KjReviewDto dto);
}
