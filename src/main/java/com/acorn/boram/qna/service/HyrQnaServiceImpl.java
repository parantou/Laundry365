package com.acorn.boram.qna.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.qna.dao.HyrQnaDao;
import com.acorn.boram.qna.dao.HyrQnaReplyDao;
import com.acorn.boram.qna.dto.HyrQnaDto;
import com.acorn.boram.qna.dto.HyrQnaReplyDto;

@Service
public class HyrQnaServiceImpl implements HyrQnaService{
	
	@Autowired
	private HyrQnaDao qnaDao;
	@Autowired
	private HyrQnaReplyDao qnaReplyDao;
	
	@Override
	public void getList(HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=5;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
		
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum=request.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		HyrQnaDto dto=new HyrQnaDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		//글 목록 얻어오기
		List<HyrQnaDto> list=qnaDao.getList(dto);
		//전체글 갯수
		int totalRow=qnaDao.getCount(dto);
		
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		
		//전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum=totalPageCount; //보정해 준다.
		}
		//view page 에서 필요한 값을 request 에 담아준다.
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("list", list);
		request.setAttribute("totalRow", totalRow);
	}

	

	@Override
	public void updateContent(HyrQnaDto dto) {
		qnaDao.update(dto);
		
	}

	@Override
	public void getData(HttpServletRequest request) {
		//수정할 글번호
		int num=Integer.parseInt(request.getParameter("num"));
		//수정할 글의 정보 얻어와서 
		HyrQnaDto dto=qnaDao.getData(num);
		//request 에 담아준다.
		request.setAttribute("dto", dto);
		
	}
	
	@Override
	public void getDataReply(HttpServletRequest request) {
		//글번호
		int num=Integer.parseInt(request.getParameter("num"));
		//글의 답변 가져오기
		HyrQnaReplyDto dto=qnaReplyDao.getDataReply(num);
		//request 에 담아준다.
		request.setAttribute("dtoReply", dto);
		
	}

	/*
	 * @Override public void getDetail(HttpServletRequest request) { int
	 * num=Integer.parseInt(request.getParameter("num"));
	 * 
	 * HyrQnaDto dto=new HyrQnaDto(); dto.setNum(num);
	 * 
	 * request.setAttribute("dto", dto);
	 * 
	 * 
	 * }
	 */

	@Override
	public void saveReply(HttpServletRequest request) {
		int ref_num=Integer.parseInt(request.getParameter("ref_num"));
		//String writer=request.getParameter("writer");
		String content=request.getParameter("content");
		//session영역에 저장된 id로 부터 얻어내는 writer
		String writer=(String)request.getSession().getAttribute("id");
		int seq=qnaReplyDao.getSequence();
		//답글 정보 dto에 담기
		HyrQnaReplyDto dto=new HyrQnaReplyDto();
		dto.setRnum(seq);
		dto.setWriter(writer);
		dto.setContent(content);
		dto.setRef_num(ref_num);
		qnaReplyDao.insert(dto);
	}

	@Override
	public void deleteReply(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		qnaReplyDao.delete(num);
	}

	@Override
	public void updateReply(HyrQnaReplyDto dto) {
		qnaReplyDao.update(dto);
		
	}

	@Override
	public void saveContent(HyrQnaDto dto) {
		qnaDao.insert(dto);
		
	}

	@Override
	public void updateCheckReply(int num) {
		qnaDao.updateCheckReply(num);
		
	}



	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		qnaDao.delete(num);
		
	}
	
}
