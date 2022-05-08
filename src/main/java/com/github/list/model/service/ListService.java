package com.github.list.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.list.model.dao.ListDao;

@Service
public class ListService {

	@Autowired
	private ListDao dao;
	
}
