package com.acorn.boram.orderlist.service;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.orderlist.dao.LsgOrderListDao;
import com.acorn.boram.orderlist.dto.LsgOrderListDto;

@Service
public class LsgOrderListServiceImpl implements LsgOrderListService {

	@Autowired
	private LsgOrderListDao dao;
		
	@Override
	public void getOrderList(HttpServletRequest request,ModelAndView mView) {
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
		
		/*
			[ 검색 키워드에 관련된 처리 ]
			-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.		
		*/
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		String state=request.getParameter("state");
		//만일 키워드가 넘어오지 않는다면
		if(keyword==null){ 
			//키워드와 검색 조건에 빈 문자열을 넣어준다. 
			//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서
			keyword=""; condition=""; 
		}

		if(state==null) {
			state="상태";
		}
		
		 
		
		//특수기호를 인코딩한 키워드를 미리 준비한다. 
		String encodedK=URLEncoder.encode(keyword);
			
		//FileDto 객체에 startRowNum 과 endRowNum 을 담는다.
		LsgOrderListDto dto=new LsgOrderListDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);

		//만일 검색 키워드가 넘어온다면 
		if(!keyword.equals("")){ //검색 조건이 무엇이냐에 따라 분기 하기
			if(condition.equals("code")){ 
				//주문번호 검색인 경우 
				dto.setCode(Integer.parseInt(keyword)); 
			}else if(condition.equals("orderer_name")){ 
				//id,이름 검색인 경우 
				dto.setOrderer(keyword); 
				dto.setName(keyword); 
			} // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다. 
		}
		if(!state.equals("상태")) {
			dto.setState(state);
		}
		
		//주문 목록 얻어오기 
		List<LsgOrderListDto> list=dao.getList(dto);
		//전체 row 의 갯수
		int totalRow=dao.getCount(dto);
		
		
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
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("condition", condition); 
		request.setAttribute("keyword", keyword); 
		request.setAttribute("state", state); 
		request.setAttribute("encodedK", encodedK);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalRow", totalRow);
		mView.addObject("list", list);
	}

	@Override
	public void getDataOrder(ModelAndView mView, LsgOrderListDto dto) {
		mView.addObject("order", dao.getData(dto));
	}

	public void getListOrderItme(ModelAndView mView, LsgOrderListDto dto) {
		mView.addObject("orderItems", dao.getListOrderItem(dto));
	}
	
	
	@Override
	public int orderUpdate(String[] codes, String state) {
		return dao.update(codes,state);
	}

	@Override
	public int coruierUpdate(String[] codes, String courier) {
		return dao.coruierUpdate(codes,courier);
	}
	
	@Override
	public int coruierUpdate2(String[] codes, String courier) {
		return dao.coruierUpdate2(codes,courier);
	}

}