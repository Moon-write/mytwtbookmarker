package com.github.user.model.service;

import org.springframework.stereotype.Service;

import com.github.user.model.vo.Email;

@Service
public interface EmailService {
	public String sendMail(Email email);
}
