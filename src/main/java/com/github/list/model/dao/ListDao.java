package com.github.list.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.github.list.model.vo.List;

@Repository
public class ListDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertNewList(List list) {
		
		return sqlSession.insert("list.insertNewList", list);
	}

	public int insertListKeywords(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("list.insertListKeyword", map);
	}
	
}
