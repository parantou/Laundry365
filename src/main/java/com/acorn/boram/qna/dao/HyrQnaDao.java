package com.acorn.boram.qna.dao;

import java.util.List;

import com.acorn.boram.qna.dto.HyrQnaDto;

public interface HyrQnaDao {
	//글목록
	public List<HyrQnaDto> getList(HyrQnaDto dto);
	//글의 갯수
	public int getCount(HyrQnaDto dto);
	//글 추가
	public void insert(HyrQnaDto dto);
	//글정보 얻어오기
	public HyrQnaDto getData(int num);
	//글 삭제
	public void delete(int num);
	//글 수정
	public void update(HyrQnaDto dto);
	//답변 갯수
	public void updateCheckReply(int num);
	
}
