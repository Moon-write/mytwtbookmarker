package com.github.bookmark.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.github.bookmark.model.service.BookmarkService;
import com.github.bookmark.model.service.TweetService;
import com.github.bookmark.model.vo.Bookmark;
import com.github.list.model.service.ListService;
import com.github.list.model.vo.List;
import com.github.user.model.vo.User;

@Controller
public class BookmarkController {

	@Autowired
	private BookmarkService service;
	@Autowired
	private TweetService twtService;
	@Autowired
	private ListService lService;
	
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
	
	@RequestMapping(value="/gotoNewB.do")
	public String gotoNewBookmark(@SessionAttribute(required=false) User loginUser, Model model ) {
		
		// 내가 소지한 리스트 목록 불러오기
		ArrayList<List> list = lService.selectMyList(loginUser.getUserNo());
		
		model.addAttribute("list", list);
		
		return "bookmark/insertBookmark";
	}
	
	@RequestMapping(value="/quickInsertBookmark.do")
	public String quickInsertBookmark(@SessionAttribute(required=false) User loginUser, Bookmark b) {
		b.setUserNo(loginUser.getUserNo());
		b.setMarkDetail("");
		int result = service.insertBookmark(b);
		
		return "redirect:/";
	}
}
