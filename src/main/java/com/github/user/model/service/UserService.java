package com.github.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.user.model.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao dao;
}
