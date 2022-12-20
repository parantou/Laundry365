package com.acorn.boram.users.service;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.orderlist.dto.LsgOrderListDto;
import com.acorn.boram.users.dao.LsgUsersDao;
import com.acorn.boram.users.dto.LsgUsersDto;

@Service
public class LsgUsersServiceImpl implements LsgUsersService {
	
	@Autowired
	private LsgUsersDao dao;
	
	@Override
	public Map<String,Boolean> checkId(String inputId) {
		Map<String,Boolean> map=new HashMap<>();
		map.put("isExist", dao.checkId(inputId));
		return map;
	}

	@Override
	public void addUser(LsgUsersDto dto) {
		//사용자가 입력한 비밀 번호를 읽어와서 
		String pwd=dto.getPwd();
		//관리자라도 함부러 셀렉트해서 볼 수 없게 암호화하는 것
		//암호화 한 후에 
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(pwd);
		//dto 에 다시 넣어준다.
		dto.setPwd(encodedPwd);
		
		dao.insertUser(dto);
	}
	
	@Override
	public boolean updatePwd(LsgUsersDto dto) {
		//사용자가 입력한 비밀 번호를 읽어와서 
		String pwd=dto.getPwd();
		//관리자라도 함부러 셀렉트해서 볼 수 없게 암호화하는 것
		//암호화 한 후에 
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(pwd);
		//dto 에 다시 넣어준다.
		dto.setPwd(encodedPwd);
		
		boolean isSuccess=dao.UpdateUser(dto);
		return isSuccess;
	}

	@Override
	public void isExistUser(HttpSession session, LsgUsersDto dto,
			ModelAndView mView, HttpServletResponse response,
			HttpServletRequest request) {
		//입력한 정보가 맞는여부
		boolean isValid=false;		
		
		//1. 로그인 폼에 입력한 아이디를 이용해서 해당 정보를 select 해 본다. 
		LsgUsersDto result=dao.getData(dto.getId());
		if(result != null) {//만일 존재하는 아이디 라면
			//비밀번호가 일치하는지 확인한다.
			String encodedPwd=result.getPwd(); //DB 에 저장된 암호화된 비밀번호 
			String inputPwd=dto.getPwd(); //로그인폼에 입력한 비밀번호
			//Bcrypt 클래스의 static 메소드를 이용해서 일치 여부를 얻어낸다.
			isValid=BCrypt.checkpw(inputPwd, encodedPwd);
		}else {
			mView.addObject("isExist", false);
		}
		
		if(isValid) {//만일 유효한 정보이면 
			//쿠키 가져와서 cookies에 담기
			Cookie[] cookies=request.getCookies();
			Map<String,String> cName=new HashMap<>();
			for(Cookie c : cookies){
				cName.put(c.getName(),c.getValue());
			} 
			
			//만약 아이디 저장여부가 true면
			if(dto.isSaveId()) {
				Cookie cookie=null;
				if(!cName.containsKey("saveId")){
					//쿠키에 저장
				    cookie = new Cookie("saveId", dto.getId()); // 쿠키 이름 지정하여 생성( key, value 개념)
				    cookie.setMaxAge(365*24*60*60); //쿠키 유효 기간: 1년으로 설정
				    cookie.setPath("users/login_form.do"); //접근경로
				    response.addCookie(cookie); //response에 Cookie 추가
				}else {
					if(!cName.get("saveId").equals(dto.getId())) {
						cookie = new Cookie("saveId", dto.getId());
					    cookie.setMaxAge(365*24*60*60); //쿠키 유효 기간: 1년으로 설정
					    cookie.setPath("users/login_form.do"); //접근경로
					    response.addCookie(cookie); //response에 Cookie 추가
					}
				}	
			}else {
				if(cName.containsKey("saveId")){
					//쿠키 삭제
				    Cookie cookie = new Cookie("saveId", null); // 삭제할 쿠키에 대한 값을 null로 지정
				    cookie.setMaxAge(0); // 유효시간을 0으로 설정해서 바로 만료시킨다.
				    response.addCookie(cookie); // 응답에 추가해서 없어지도록 함
				}	
			}
			//로그인 처리를 한다.
			session.setAttribute("id", dto.getId());
			//매니저 여부 담기
			session.setAttribute("manager", result.getManager());
		}
	}

	@Override
	public LsgUsersDto checkUser(LsgUsersDto dto) {
		LsgUsersDto user=dao.isExistUser(dto);
		return user;
	}

	@Override
	public void getUserList(HttpServletRequest request,ModelAndView mView) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=10;
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
		 String manager=request.getParameter("manager");
		 //만일 키워드가 넘어오지 않는다면 
		 if(keyword==null){
			 //키워드와 검색 조건에 빈 문자열을 넣어준다. 
			 //클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서
			 keyword=""; condition=""; 
		 }
		 if(manager==null || manager.equals("전체")) {
			 manager="all";
		 }	
		//특수기호를 인코딩한 키워드를 미리 준비한다. 
		String encodedK=URLEncoder.encode(keyword);
			
		//FileDto 객체에 startRowNum 과 endRowNum 을 담는다.
		LsgUsersDto dto=new LsgUsersDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//만일 검색 키워드가 넘어온다면 
		if(!keyword.equals("")){ 
			//검색 조건이 무엇이냐에 따라 분기 하기
			if(condition.equals("usdrId")){ 
				//아이디 검색인 경우
				dto.setId(keyword); 
			}else if(condition.equals("usdrName")){ 
				//이름 검색인 경우 
				dto.setName(keyword); 
			} // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다. }
		}	
		if(!manager.equals("all")) {
			dto.setManager(manager);
		}
	
		//고객 목록 얻어오기 
		List<LsgUsersDto> list=dao.getList(dto);

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
		request.setAttribute("manager", manager); 
		request.setAttribute("encodedK", encodedK);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalRow", totalRow);
		mView.addObject("userList", list);
	}

	//관리자 페이지에서 유저 삭제
	@Override
	public int userDelete(String[] users) {
		return dao.delete(users);
	}

	//관리자 페이지에서 유저 manager 변경
	@Override
	public int userUpdate(LsgUsersDto dto) {
		if(dto.getManager().equals("Y")) {
			dto.setManager("N");
		}else {
			dto.setManager("Y");
		}
		return dao.update(dto);
	}
	
	
}
