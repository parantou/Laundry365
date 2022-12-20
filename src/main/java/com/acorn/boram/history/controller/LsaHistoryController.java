package com.acorn.boram.history.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LsaHistoryController {

	@RequestMapping("/corporation/history")
	public String historypage() {
		return "corporation/history";
	}
}
