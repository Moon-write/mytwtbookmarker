package com.github.list.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ListDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
