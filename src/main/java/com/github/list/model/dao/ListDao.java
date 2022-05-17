package com.github.list.model.dao;

import java.util.ArrayList;
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

	public ArrayList<List> selectMyList(int userNo) {
		java.util.List<List> list = sqlSession.selectList("list.selectMyList", userNo);
		return (ArrayList<List>) list;
	}

	public ArrayList<String> selectListKeyword(int listNo) {
		java.util.List list = sqlSession.selectList("list.selectListKeyword", listNo);
		return (ArrayList) list;
	}

	public List selectOneList(int listNo) {
		List list = sqlSession.selectOne("list.selectOneList", listNo);
		return list;
	}
	
}
