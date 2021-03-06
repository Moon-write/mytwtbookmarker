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
	
	// μΆκ°μμ
	private ArrayList<String> listKeyword;
}
