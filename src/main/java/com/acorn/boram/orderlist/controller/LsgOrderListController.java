package com.acorn.boram.orderlist.controller;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.orderlist.dto.LsgOrderListDto;
import com.acorn.boram.orderlist.service.LsaOrderListService;
import com.acorn.boram.orderlist.service.LsgOrderListService;
import com.acorn.boram.users.dto.LsgUsersDto;
import com.acorn.boram.users.service.LsgUsersService;

@Controller
public class LsgOrderListController {
	
	@Autowired
	private LsaOrderListService ordersService;
	@Autowired
	private LsgOrderListService service;
	@Autowired
	private LsgUsersService userService;
	
	//매니저 여부에 따라 화면 이동 , 매니저인 경우 주문관리 화면으로 이동
	@RequestMapping("/mypage/order")
	public ModelAndView authSelectPage(HttpServletRequest request,ModelAndView mView
			,HttpSession session) {
		String isManager=session.getAttribute("manager").toString();
		if(isManager.equals("N")) {
			//관리자가 아닌경우
			ordersService.getOrderListData(mView,session);
			mView.setViewName("mypage/orderList/list_customer");
		}else {
			//관리자일 경우
			service.getOrderList(request,mView);
			mView.setViewName("mypage/admin/order");
		}
		return mView;
	}
	
	//매니저 여부에 따라 화면 이동 , 매니저인 경우 회원관리 화면으로 이동
	@RequestMapping("/mypage/user")
	public ModelAndView authSelectPage2(HttpServletRequest request,ModelAndView mView
			,HttpSession session) {
		String isManager=session.getAttribute("manager").toString();
		if(isManager.equals("N")) {
			//관리자가 아닌경우
			ordersService.getOrderListData(mView,session);
			mView.setViewName("mypage/orderList/customer3");
		}else {
			//관리자일 경우
			userService.getUserList(request,mView);
			mView.setViewName("mypage/admin/user");
		}
		return mView;
	}
	
	//(관리자)상세 페이지로 이동
	@RequestMapping("/mypage/admin_detail")
	public ModelAndView authAdminDetail(HttpServletRequest request
			, ModelAndView mView, LsgOrderListDto dto) {
		String isManager=request.getSession().getAttribute("manager").toString();
		if(isManager.equals("Y")) {
			service.getDataOrder(mView,dto);
			service.getListOrderItme(mView, dto);
			mView.setViewName("mypage/admin/detail");
		}else {
			mView.setViewName("redirect:/home.do");
		}
		return mView;
	}
	
	//(고객)상세 페이지로 이동
	@RequestMapping("/mypage/detail")
	public ModelAndView authUserDetail(HttpServletRequest request
			, ModelAndView mView, LsgOrderListDto dto) {
		String isManager=request.getSession().getAttribute("manager").toString();
		service.getDataOrder(mView,dto);
		service.getListOrderItme(mView, dto);
		mView.setViewName("mypage/orderList/detail");
		return mView;
	}
	
	//회원정보 삭제
	@RequestMapping("/mypage/admin_user_delete")
	@ResponseBody
	public Map<String,Object> authUserDelete(HttpServletRequest request, String[] users) {
		Map<String,Object> map=new HashMap<>();
		int count=userService.userDelete(users);
		if(count == 0) {
			map.put("isSuccess", false);
		}else {
			map.put("count",count);
			map.put("isSuccess", true);
		}
		return map;
	}
	
	//회원정보 수정
	@RequestMapping("/mypage/admin_user_update")
	@ResponseBody
	public Map<String,Object> authUserUpdate(HttpServletRequest request, LsgUsersDto dto) {
		Map<String,Object> map=new HashMap<>();
		int count=userService.userUpdate(dto);
		if(count == 0) {
			map.put("isSuccess", false);
		}else {
			map.put("isSuccess", true);
		}
		return map;
	}
	
	//주문정보_상태 수정
	@RequestMapping("/mypage/admin_order_update")
	@ResponseBody
	public Map<String,Object> authOrderUpdate(HttpServletRequest request, 
			String[] codes, String state) {
		Map<String,Object> map=new HashMap<>();
		int count=service.orderUpdate(codes,state);
		if(count == 0) {
			map.put("isSuccess", false);
		}else {
			map.put("count",count);
			map.put("isSuccess", true);
		}
		return map;
	}
	
	//주문정보_수거용 송장번호 수정
	@RequestMapping("/mypage/admin_insert_courier")
	@ResponseBody
	public Map<String,Object> authInsertCoruier(String[] codes, String courier) {
		Map<String,Object> map=new HashMap<>();
		int count=service.coruierUpdate(codes,courier);
		if(count == 0) {
			map.put("isSuccess", false);
		}else {
			map.put("count",count);
			map.put("isSuccess", true);
		}
		return map;
	}
	
	//주문정보_반환용 송장번호 수정
	@RequestMapping("/mypage/admin_insert_courier2")
	@ResponseBody
	public Map<String,Object> authInsertCoruier2(String[] codes, String courier) {
		Map<String,Object> map=new HashMap<>();
		int count=service.coruierUpdate2(codes,courier);
		if(count == 0) {
			map.put("isSuccess", false);
		}else {
			map.put("count",count);
			map.put("isSuccess", true);
		}
		return map;
	}
}
