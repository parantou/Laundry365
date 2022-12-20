package com.acorn.boram.brand.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LsaBrandController {
	
	@RequestMapping("/corporation/brand")
	public String brandpage() {
		return "corporation/brand";
	}
}
