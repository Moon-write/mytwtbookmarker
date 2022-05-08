package com.github.bookmark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.github.bookmark.model.service.BookmarkService;

@Controller
public class BookmarkController {

	@Autowired
	private BookmarkService service;
	
}
