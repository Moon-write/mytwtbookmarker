package com.github.list.model.vo;

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
	private String userId;
	private String listName;
	private int listOpen;
}
