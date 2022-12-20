package com.acorn.boram.faq.dao;

import java.util.List;
import java.util.Map;

import com.acorn.boram.faq.dto.HyrFaqDto;

public interface HyrFaqDao {
	//글목록
	public List<HyrFaqDto> getList(HyrFaqDto dto);
	//글 추가
	public void insert(HyrFaqDto dto);
	//글정보 얻어오기
	public HyrFaqDto getData(int num);
	public HyrFaqDto getData(HyrFaqDto dto);
	//글 삭제
	public void delete(int num);
	//글 수정
	public void update(HyrFaqDto dto);
	//글의 갯수
	public int getCount(HyrFaqDto dto);
}
