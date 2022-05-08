package com.github.bookmark.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Component
public class Bookmark {
	private int markNo;
	private int userNO;
	private String markLink;
	private String markDate;
	private int listNo;
	private String markDetail;
	
}
