package com.github.list.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.github.list.model.service.ListService;
import com.github.user.model.vo.User;

@Controller
public class ListController {

	@Autowired
	private ListService service;
	
	@RequestMapping(value="gotoList.do")
	public String gotoList() {
		return "list/gotoList";
	}
	
	@RequestMapping(value="gotoNewList.do")
	public String gotoNewList() {
		return "list/gotoNewList";
	}
	
}
