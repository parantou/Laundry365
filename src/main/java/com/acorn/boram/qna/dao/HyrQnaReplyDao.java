package com.acorn.boram.qna.dao;

import java.util.List;

import com.acorn.boram.qna.dto.HyrQnaReplyDto;

public interface HyrQnaReplyDao {
	//답글 목록 얻어오기 
	public List<HyrQnaReplyDto> getList(HyrQnaReplyDto dto);
	//답글 삭제 
	public void delete(int num);
	//답글 추가 
	public void insert(HyrQnaReplyDto dto);
	//추가할 답글의 글번호를 리턴하는 메소드 
	public int getSequence();
	//답글 수정
	public void update(HyrQnaReplyDto dto);
	//답글 하나의 정보를 리턴하는 메소드
	public HyrQnaReplyDto getData(int num);
	//답글 하나의 정보를 리턴하는 메소드
	public HyrQnaReplyDto getDataReply(int num);

}
