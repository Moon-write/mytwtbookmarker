package com.github.bookmark.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.bookmark.model.dao.BookmarkDao;

@Service
public class BookmarkService {

	@Autowired
	private BookmarkDao dao;
}
