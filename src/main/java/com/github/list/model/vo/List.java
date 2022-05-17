package com.github.list.model.vo;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import lombok.Data;

import lombok.NoArgsConstructor;

import lombok.AllArgsConstructor;

@Component
@AllArgsConstructor
@NoArgsConstructor
@Data
public class List {
	private int listNo;
	private int userNo;
	private String listName;
	private int listOpen;
	private String listProfile;
	
	// 추가요소
	private ArrayList<String> listKeyword;
}
