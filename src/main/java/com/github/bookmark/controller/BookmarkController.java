package com.github.bookmark.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.bookmark.model.service.BookmarkService;
import com.github.bookmark.model.service.TweetService;

@Controller
public class BookmarkController {

	@Autowired
	private BookmarkService service;
	@Autowired
	private TweetService twtService;
	
	@ResponseBody
	@RequestMapping(value="/twt.do", produces="application/text; charset=utf8")
	public String twtMethod(String ids) {
		// ids에 여러개 트위터를 동시에 보내도 되긴하는데? 잘몰라서 그냥 하나씩만 옮겨보고 잘되면 여러개 옮기는걸로
		
		String result = "error";
		try {
			result = twtService.getTweets(ids);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
}
