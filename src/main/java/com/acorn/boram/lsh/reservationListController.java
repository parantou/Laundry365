package com.acorn.boram.lsh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class reservationListController {

	@RequestMapping("/users/reservationList")
	public String reservationList() {
		return "users/reservationList";
	}
}
