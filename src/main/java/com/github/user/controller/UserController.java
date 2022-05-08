package com.github.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.github.user.model.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService service;
}
