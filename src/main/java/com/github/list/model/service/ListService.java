package com.github.list.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.list.model.dao.ListDao;
import com.github.list.model.vo.List;

@Service
public class ListService {

	@Autowired
	private ListDao dao;

	public int insertNewList(List list, String[] keywords) {
		int result = 0;
		
		int listNo = dao.insertNewList(list);
		
		if(listNo>0) {
			for(int i=0;i<keywords.length;i++) {				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("listNo", list.getListNo());
				map.put("keyword", keywords[i]);
				result = dao.insertListKeywords(map);
				if(result<0) {
					return -1;
				}
			}			
		}
		return result;
	}

	public ArrayList<List> selectMyList(int userNo) {
		ArrayList<List> list = dao.selectMyList(userNo);
		
		for(int i=0;i<list.size();i++) {
			ArrayList<String> keyword = dao.selectListKeyword(list.get(i).getListNo());
			list.get(i).setListKeyword(keyword);
		}
		return list;
	}

	public List selectOneList(int listNo) {
		List list= dao.selectOneList(listNo);
		
		ArrayList<String> keyword = dao.selectListKeyword(listNo);
		list.setListKeyword(keyword);
		return list;
	}

	public ArrayList<String> selectListKeyword(int listNo) {
		ArrayList<String> keyword = dao.selectListKeyword(listNo);
		return keyword;
	}

	public ArrayList<List> getLists(int userNo) {
		
		return dao.selectMyList(userNo);
	}
	
}
