package com.acorn.boram.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.qna.dto.HyrQnaReplyDto;
@Repository
public class HyrQnaReplyDaoImpl implements HyrQnaReplyDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<HyrQnaReplyDto> getList(HyrQnaReplyDto dto) {
		// TODO Auto-generated method stub
		return session.selectList("qnaReply.getList", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("qnaReply.delete", num);

		
	}

	@Override
	public void insert(HyrQnaReplyDto dto) {
		session.insert("qnaReply.insert", dto);
		
	}

	@Override
	public int getSequence() {
		return session.selectOne("qnaReply.getSequence");
	}

	@Override
	public void update(HyrQnaReplyDto dto) {
		session.update("qnaReply.update", dto);
		
	}
	
	@Override
	public HyrQnaReplyDto getData(int num) {
		return session.selectOne("qnaReply.getData", num);
	}

	@Override
	public HyrQnaReplyDto getDataReply(int num) {
		return session.selectOne("qnaReply.getDataReply", num);
	}
}
