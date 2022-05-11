package com.github.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.github.user.model.vo.User;

@Repository
public class UserDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public User selectOneUser(User user) {
		
		return sqlSession.selectOne("user.selectOneUser", user);
	}
}
