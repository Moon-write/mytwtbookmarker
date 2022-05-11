package com.github.user.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.user.model.service.EmailService;
import com.github.user.model.service.UserService;
import com.github.user.model.vo.Email;
import com.github.user.model.vo.User;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	@Inject
	private EmailService emailService;
	
	@RequestMapping(value="/joinStep1.do")
	public String joinStep1() {
		return "user/joinStep1";
	}
	
	@RequestMapping(value="/joinStep2.do")
	public String joinStep2() {
		return "user/joinStep2";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkId.do")
	public String checkId(User user) {
		System.out.println(user.getUserId());
		User u = service.selectOneUser(user);
		
		if(u==null) {
			return "0";			
		}else {
			return "1";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/sendIdChkEmail.do")
	public String sendIdChkEmail(String receiver) {
		Email mail = new Email();
		mail.setReceiveMail(receiver);
		String verifyCode = emailService.sendMail(mail);
		
		return verifyCode ;
	}
}
