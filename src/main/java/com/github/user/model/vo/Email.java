package com.github.user.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Component
public class Email {
	private String senderName;
	private String senderMail;
	private String receiveMail;
	private String subject;
	private String message;
}
