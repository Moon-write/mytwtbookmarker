package com.github.bookmark.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookmarkDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
