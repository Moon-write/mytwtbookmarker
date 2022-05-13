package com.github.user.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.user.model.dao.UserDao;
import com.github.user.model.vo.User;

@Service
public class UserService {

	@Autowired
	private UserDao dao;
	// (1) 메소드명이 user로 끝나고 (2) 매개변수가 user일 경우 (3) 매개변수 user의 비밀번호가 뭔가 있을 경우 암호화 실행

	public User selectOneUser(User user) {
		
		return dao.selectOneUser(user);
	}

	public int insertUser(User u) {
		
		return dao.insertUser(u);
	}

}
