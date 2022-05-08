package com.github.list.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.github.list.model.service.ListService;

@Controller
public class ListController {

	@Autowired
	private ListService service;
	
}
