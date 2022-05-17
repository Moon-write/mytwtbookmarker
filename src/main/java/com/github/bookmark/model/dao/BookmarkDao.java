package com.github.bookmark.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.github.bookmark.model.vo.Bookmark;

@Repository
public class BookmarkDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Bookmark> selectBList(int listNo) {
		List<Bookmark> bList= sqlSession.selectList("bookmark.selectBList",listNo);
		return (ArrayList<Bookmark>) bList;
	}

	public ArrayList<String> selectBkeyword(int markNo) {
		List<String> bKeyword = sqlSession.selectList("bookmark.selectBKeyword", markNo);
		return (ArrayList<String>) bKeyword;
	}
}
