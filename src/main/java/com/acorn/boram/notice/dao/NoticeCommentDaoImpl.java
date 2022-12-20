package com.acorn.boram.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.notice.dto.NoticeCommentDto;


@Repository
public class NoticeCommentDaoImpl implements NoticeCommentDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<NoticeCommentDto> getList(NoticeCommentDto dto) {
		
		return session.selectList("noticeComment.getList", dto);
	}

	@Override
	public void delete(int num) {
		session.update("noticeComment.delete", num);
	}

	@Override
	public void insert(NoticeCommentDto dto) {
        
		session.insert("noticeComment.insert", dto);
	}

	@Override
	public int getSequence() {
		
		return session.selectOne("noticeComment.getSequence");
	}

	@Override
	public void update(NoticeCommentDto dto) {
		session.update("noticeComment.update", dto);
	}

	@Override
	public NoticeCommentDto getData(int num) {
		
		return session.selectOne("noticeComment.getData", num);
	}

	@Override
	public int getCount(int ref_group) {
		
		return session.selectOne("noticeComment.getCount", ref_group);
	}

}
