package com.github.user.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
	private int userNo;
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userProfile;
}
