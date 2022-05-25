package com.github.bookmark.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.bookmark.model.dao.BookmarkDao;
import com.github.bookmark.model.vo.Bookmark;

@Service
public class BookmarkService {

	@Autowired
	private BookmarkDao dao;

	public ArrayList<Bookmark> selectBList(int listNo) {
		ArrayList<Bookmark> bList = dao.selectBList(listNo);
		
		for(int i=0;i<bList.size();i++) {
			ArrayList<String> keyword = dao.selectBkeyword(bList.get(i).getMarkNo());
			
			bList.get(i).setKeyword(keyword);					
		}
		return bList;
	}

	public int insertBookmark(Bookmark b) {
		// TODO Auto-generated method stub
		return dao.insertBookmark(b);
	}
	
	
}
