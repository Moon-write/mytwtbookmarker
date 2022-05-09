package com.github.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.user.model.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	@RequestMapping(value="/joinStep1.do")
	public String joinStep() {
		return "user/joinStep1";
	}
}
