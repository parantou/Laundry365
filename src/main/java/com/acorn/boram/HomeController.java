package com.acorn.boram;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	@RequestMapping("/home2")
	public String home2() {
		return "home2";
	}
	
}
