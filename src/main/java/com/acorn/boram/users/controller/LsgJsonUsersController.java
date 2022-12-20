package com.acorn.boram.users.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.boram.users.dto.LsgUsersDto;
import com.acorn.boram.users.service.LsgUsersService;


@Controller
public class LsgJsonUsersController {

	@Autowired
	private LsgUsersService service;
	
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String,Boolean> jsonCheckid(String inputId){
		Map<String,Boolean> map=new HashMap<>();
		map=service.checkId(inputId);
		return map;
	}
	
	@RequestMapping("/users/check_user")
	@ResponseBody
	public Map<String,LsgUsersDto> jsonCheckUser(LsgUsersDto dto){
		Map<String,LsgUsersDto> map=new HashMap<>();
		LsgUsersDto user=service.checkUser(dto);
		map.put("user",user);
		return map;
	}
	
	@RequestMapping("/users/update_pwd")
	@ResponseBody
	public Map<String,Boolean> ajaxUpdatePwd(LsgUsersDto dto){
		Map<String,Boolean> map=new HashMap<>();
		map.put("isSuccess", service.updatePwd(dto));
		return map;
	}
}
