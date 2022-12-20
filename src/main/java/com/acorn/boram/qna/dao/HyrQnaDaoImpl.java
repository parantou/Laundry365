package com.acorn.boram.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.qna.dto.HyrQnaDto;

@Repository
public class HyrQnaDaoImpl implements HyrQnaDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<HyrQnaDto> getList(HyrQnaDto dto) {
		
		return session.selectList("qna.getList", dto);
	}

	@Override
	public int getCount(HyrQnaDto dto) {
		return session.selectOne("qna.getCount",dto);
	}

	@Override
	public void insert(HyrQnaDto dto) {
		session.insert("qna.insert", dto);
		
	}

	@Override
	public HyrQnaDto getData(int num) {
		// TODO Auto-generated method stub
		return session.selectOne("qna.getData", num);
	}

	@Override
	public void delete(int num) {
		session.delete("qna.delete", num);
		
	}

	@Override
	public void update(HyrQnaDto dto) {
		session.update("qna.update", dto);
		
	}

	@Override
	public void updateCheckReply(int num) {
		session.update("qna.updateCheckReply", num);
		
	}

}
