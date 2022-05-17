package com.github.list.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class ListFavorite {
	private int listNo;
	private int userNo;
	
	// 추가요소
	private List list;
}
