package com.github.user.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping(value="/joinUser.do")
	public String joinUser(User u,MultipartFile[] upPic, HttpServletRequest request) {
		
		if(!upPic[0].isEmpty()) {
			// 올린프사가 있을때만 로직 실행
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/user/");
			
			MultipartFile file = upPic[0];
			String filename = file.getOriginalFilename();
			String onlyFilename = filename.substring(0,filename.lastIndexOf("."));
			String extention = filename.substring(filename.lastIndexOf("."));
			
			String filepath = null;
			int count = 0;
			
			while(true) {
				if(count==0) {
					filepath = onlyFilename+extention;
				}else {
					filepath = onlyFilename+"_"+count+extention;
				}
				// 중복검사
				File checkFile = new File(savePath+filepath);
				if(!checkFile.exists()) {
					break;
					// 파일이 존재 안해야 해당 파일명을 사용할 수 있다.
				}
				count++;
			}
			
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
				BufferedOutputStream bos =new BufferedOutputStream(fos);
				
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			u.setUserProfile(filepath);
			
		}
		
		int result = service.insertUser(u);
		if(result>0) {
			return "user/joinSuccess";			
		}else {
			return "user/joinFailed";
		}
	}	
	
	@RequestMapping(value="/login.do")
	public String login(User user, HttpSession session, Model model) {
		User u = service.selectOneUser(user);
		
		if(u==null) {
			model.addAttribute("msg",1);
			return "common/gotomain";
		}else {
			session.setAttribute("loginUser", u);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkId.do")
	public String checkId(User user) {
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
